(* SLD3-ocaml example: *)
(* Open camera and display frames onscreen *)
(* Adapted from examples/camera/01-read-and-draw from the SDL3 sources (public
   domain) *)

open Sdl3
exception Quit

let go = Result.get_ok
let print s = Printf.ksprintf print_endline s

let event_loop =
  let e = Sdl.Event.create () in
  let rec event_loop () =
    let has_event = Sdl.Event.poll (Some e) in
    if has_event then begin
      let typ = Sdl.Event.(get e typ) in
      if typ = Sdl.event_quit then raise Quit;
      if typ = Sdl.event_camera_device_approved
      then print "Camera use approved by user!";
      if typ = Sdl.event_camera_device_denied
      then print "Camera use denied by user!";
      event_loop ()
    end in
  event_loop

let () =
  Sdl.(init (init_video lor init_camera)) |> go;

  let win, renderer = Sdl.Renderer.create_window_and "camera" 640 480 Sdl.window_resizable
    |> go in

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
    exit 1
  | id :: _ ->
    print "Opening camera...";
    let cam = Sdl.Camera.open_ id None |> go in



    let rec loop tex n =
      if n >= 0 then begin
        event_loop ();
        match Sdl.Camera.acquire_frame cam with
        | Error (`Msg e) ->
          print "Not available (%s)" e;
          Sdl.delay 100;
          loop tex (n-1)
        | Ok (surf, ts) ->
          print "timestamp=%i" (Int64.to_int ts);
          let pixels = Sdl.Surface.(get surf pixels) in
          let pitch = Sdl.Surface.(get surf pitch) in
          let format = Sdl.Surface.(get surf format) in
          let tex = match tex with
            | None ->
              let w,h = Sdl.Surface.(get surf w), Sdl.Surface.(get surf h) in
              Sdl.Window.set_size win w h |> go;
              Sdl.Renderer.set_logical_presentation renderer w h
                Sdl.logical_presentation_letterbox |> go;
              print "Creating texture of size (%i,%i)" w h;
              Sdl.Texture.create renderer format Sdl.textureaccess_streaming w h |> go
            | Some tex -> tex
          in
          Sdl.Texture.update tex None pixels pitch |> go;
          Sdl.Camera.release_frame cam surf;
          Sdl.Renderer.set_draw_color renderer 0x99 0x99 0x99 Sdl.alpha_opaque |> go;
          Sdl.Renderer.clear renderer |> go;
          Sdl.Renderer.render_texture renderer tex None None |> go;
          Sdl.Renderer.present renderer |> go;
          Sdl.delay 32;
          loop (Some tex) (n-1)
      end in

    let () = try loop None 1000 with Quit -> () in
    print_endline "Closing camera...";
    Sdl.Camera.close cam;
    Sdl.quit ()
