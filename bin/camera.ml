(* SLD3-ocaml example: *)
(* Open camera and display frames onscreen *)
(* Adapted from examples/camera/01-read-and-draw from the SDL3 sources (public
   domaine) *)

open Sdl3
exception Quit

let go = Result.get_ok
let print s = Printf.ksprintf print_endline s

let event_loop =
  let e = Event.create () in
  let rec event_loop () =
    let has_event = Event.poll (Some e) in
    if has_event then begin
      let typ = Event.(get e typ) in
      if typ = Sdl.event_quit then raise Quit;
      if typ = Sdl.event_camera_device_approved
      then print "Camera use approved by user!";
      if typ = Sdl.event_camera_device_denied
      then print "Camera use denied by user!";
      event_loop ()
    end in
  event_loop

let () =
  init (Sdl.(init_video lor init_camera)) |> go;

  let win, renderer = create_window_and_renderer "camera" 640 480 Sdl.window_resizable
    |> go in

  let n = get_num_camera_drivers () in
  print "Number of camera drivers: %i" n;

  let name = get_current_camera_driver () in
  print "Current camera driver: '%s'" name;

  let cam_ids = get_cameras () in

  print "Found cameras : [%s]"
    (List.map string_of_int cam_ids
     |> String.concat ", ");

  match cam_ids with
  | [] ->
    print_endline "No camera found. Exiting.";
    exit 1
  | id :: _ ->
    print "Opening camera...";
    let cam = Camera.open_ id None |> go in



    let rec loop tex n =
      if n >= 0 then begin
        event_loop ();
        match Surface.acquire_camera_frame cam with
        | Error (`Msg e) ->
          print "Not available (%s)" e;
          delay 100;
          loop tex (n-1)
        | Ok (surf, ts) ->
          print "timestamp=%i" (Int64.to_int ts);
          let pixels = Surface.(get surf pixels) in
          let pitch = Surface.(get surf pitch) in
          let format = Surface.(get surf format) in
          let tex = match tex with
            | None ->
              let w,h = Surface.(get surf w), Surface.(get surf h) in
              Window.set_size win w h |> go;
              print "Creating texture of size (%i,%i)" w h;
              Texture.create renderer format Sdl.textureaccess_streaming w h |> go
            | Some tex -> tex
          in
          Texture.update tex None pixels pitch |> go;
          Camera.release_frame cam surf;
          delay 32;
          Renderer.set_draw_color renderer 0x99 0x99 0x99 Sdl.alpha_opaque |> go;
          Renderer.render_clear renderer |> go;
          Renderer.render_texture renderer tex None None |> go;
          Renderer.render_present renderer |> go;
          loop (Some tex) (n-1)
      end in

    let () = try loop None 1000 with Quit -> () in
    print_endline "Closing camera...";
    Camera.close cam;
    quit ()
