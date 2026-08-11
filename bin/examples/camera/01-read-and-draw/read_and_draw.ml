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

let init () =
  Sdl.set_app_metadata
    "Example Camera Read and Draw" "1.0" "com.example.camera-read-and-draw" |> go;
  match Sdl.(init (init_video lor init_camera)) with
  | Error (`Msg e) ->
    print "Couldn't initialize SDL: %s" e;
    T.APP_FAILURE, None
  | Ok () ->
    match Sdl.Renderer.create_window_and "examples/camera/read-and-draw" 640 480
            Sdl.window_resizable with
    | Error (`Msg e) ->
      print "Couldn't create window/renderer: %s" e;
      T.APP_FAILURE, None
    | Ok (window, renderer) ->
      let state = { window; renderer; camera = None; texture = None } in

      (* We add some tests here that are not in the original SDL example *)
      let n = Sdl.Camera.get_num_drivers () in
      print "Number of camera drivers: %i" n;

      let name = Sdl.Camera.get_current_driver () in
      print "Current camera driver: '%s'" name;

      let cam_ids = Sdl.Camera.gets () in

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

let event _state e =
  match Sdl.Event.(get e typ) |> T.event_type_of_enum with
  | T.EVENT_QUIT -> T.APP_SUCCESS
  | T.EVENT_CAMERA_DEVICE_APPROVED -> print "Camera use approved by user!";
    T.APP_CONTINUE
  | T.EVENT_CAMERA_DEVICE_DENIED -> print "Camera use denied by user!";
    T.APP_CONTINUE
  | _ -> T.APP_CONTINUE

let iterate state =
  let renderer = state.renderer in
  let camera = Option.get state.camera in

  match Sdl.Camera.acquire_frame camera with
  | Error (`Msg e) ->
    print "Not available (%s)" e;
    Sdl.delay 100;
    T.APP_CONTINUE (* an error is normal here while the camera becomes ready *)
  | Ok (frame, ts) ->
    print "timestamp=%i" (Int64.to_int ts);
    let pixels = Sdl.Surface.(get frame pixels) in
    let pitch = Sdl.Surface.(get frame pitch) in
    let format = Sdl.Surface.(get frame format) in
    let tex = match state.texture with
      | None ->
        let w,h = Sdl.Surface.(get frame w), Sdl.Surface.(get frame h) in
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
    Sdl.Camera.release_frame camera frame;
    Sdl.Renderer.set_draw_color renderer 0x99 0x99 0x99 Sdl.alpha_opaque |> go;
    Sdl.Renderer.clear renderer |> go;
    Sdl.Renderer.render_texture renderer tex None None |> go;
    Sdl.Renderer.present renderer |> go;
    Sdl.delay 32;
    T.APP_CONTINUE

let quit state _ret =
  do_option state (fun state ->
      do_option state.camera (fun camera ->
          print_endline "Closing camera...";
          Sdl.Camera.close camera);
      do_option state.texture Sdl.Texture.destroy);
  T.APP_SUCCESS

let () =
  let app = Sdl.App.create ~init ~event ~iterate ~quit () in
  Sdl.App.run app
