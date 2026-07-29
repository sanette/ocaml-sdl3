(* ocaml-SDL3 example: *)
(* Open camera and display frames onscreen *)
(* Adapted from examples/camera/01-read-and-draw from the SDL3 sources (public
   domain) *)

open Sdl3

let go = Result.get_ok
let print s = Printf.ksprintf print_endline s
let do_option o f = Option.iter f o

type state = {
  window : T.window;
  renderer : T.renderer;
  camera : T.camera option;
  mutable texture : T.texture option
}

let event _state e =
  let typ = Sdl.Event.(get e typ) in
  if typ = Sdl.event_quit then T.APP_SUCCESS
  else if typ = Sdl.event_camera_device_approved
  then (print "Camera use approved by user!";
        T.APP_CONTINUE)
  else if typ = Sdl.event_camera_device_denied
  then (print "Camera use denied by user!";
        T.APP_CONTINUE)
  else T.APP_CONTINUE

let init () =
  match Sdl.(init (init_video lor init_camera)) with
  | Error (`Msg e) ->
    print "Couldn't initialize SDL: %s" e;
    T.APP_FAILURE, None
  | Ok () ->
    match Sdl.create_window_and_renderer "camera" 640 480
            Sdl.window_resizable with
    | Error (`Msg e) ->
      print "Couldn't create window/renderer: %s" e;
      T.APP_FAILURE, None
    | Ok (window, renderer) ->
      let state = { window; renderer; camera = None; texture = None } in

      let n = Sdl.get_num_camera_drivers () in
      print "Number of camera drivers: %i" n;

      let name = Sdl.get_current_camera_driver () in
      print "Current camera driver: '%s'" name;

      let cam_ids = Sdl.get_cameras () in

      print "Found cameras : [%s]"
        (List.map string_of_int cam_ids
         |> String.concat ", ");

      match cam_ids with
      | [] ->
        print_endline "No camera found. Exiting.";
        T.APP_FAILURE, Some state
      | id :: _ ->
        print "Opening camera...";
        match Sdl.Camera.open_ id None with
        | Error (`Msg e) -> print "Couldn't open camera: %s" e;
          T.APP_FAILURE, Some state
        | Ok camera ->
          T.APP_CONTINUE, Some {state with camera = Some camera}

let iterate state =
  let renderer = state.renderer in
  let camera = Option.get state.camera in

  match Sdl.Surface.acquire_camera_frame camera with
  | Error (`Msg e) ->
    print "Not available (%s)" e;
    Sdl.delay 100;
    T.APP_CONTINUE (* an error is normal here while the camera becomes ready *)
  | Ok (surf, ts) ->
    print "timestamp=%i" (Int64.to_int ts);
    let pixels = Sdl.Surface.(get surf pixels) in
    let pitch = Sdl.Surface.(get surf pitch) in
    let format = Sdl.Surface.(get surf format) in
    let tex = match state.texture with
      | None ->
        let w,h = Sdl.Surface.(get surf w), Sdl.Surface.(get surf h) in
        Sdl.Window.set_size state.window w h |> go;
        Sdl.Renderer.set_logical_presentation renderer w h
          Sdl.logical_presentation_letterbox |> go;
        print "Creating texture of size (%i,%i)" w h;
        let tex = Sdl.Texture.create renderer format
            Sdl.textureaccess_streaming w h |> go in
        state.texture <- Some tex; tex
      | Some tex -> tex
    in
    Sdl.Texture.update tex None pixels pitch |> go;
    Sdl.Camera.release_frame camera surf;
    Sdl.Renderer.set_draw_color renderer 0x99 0x99 0x99 Sdl.alpha_opaque |> go;
    Sdl.Renderer.render_clear renderer |> go;
    Sdl.Renderer.render_texture renderer tex None None |> go;
    Sdl.Renderer.render_present renderer |> go;
    Sdl.delay 32;
    T.APP_CONTINUE

let quit state ret =
  do_option state (fun state ->
      do_option state.camera (fun camera ->
          print_endline "Closing camera...";
          Sdl.Camera.close camera);
      do_option state.texture Sdl.Texture.destroy;
      Sdl.Renderer.destroy state.renderer;
      Sdl.Window.destroy state.window);
  Sdl.quit ();
  match ret with
  | T.APP_FAILURE -> Sdl.App.log "Application failure"; exit 1
  | T.APP_SUCCESS -> Sdl.App.log "Application terminated successfully"; exit 0
  | T.APP_CONTINUE -> Sdl.App.log "Application both terminates and wants to continue!"; exit 1

let () =
  let app = Sdl.App.create ~init ~event ~iterate ~quit () in
  Sdl.App.run app
