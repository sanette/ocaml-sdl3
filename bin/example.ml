(** Simple SDL3 example *)
open Sdl3
open Printf
exception Quit

let print s = Printf.ksprintf print_endline s

let go = Result.get_ok
let ( ++ ) = Int64.logor

let create_with_fields create set list =
  let s = create () in
  List.iter (fun (field, value) -> set s field value) list;
  s

let create_frect = Sdl.FRect.(create_with_fields create Ctypes.setf)
let create_fpoint = Sdl.FPoint.(create_with_fields create Ctypes.setf)

let () =
  print "Initializing SDL3...";

  go (Sdl.init Sdl.init_video);

  let ww = ref 200 in
  let wh = ref 100 in
  let window = Sdl.Window.create "Hello SDL3" !ww !wh Sdl.(window_opengl ++ window_mouse_focus ++ window_resizable) |> go in
  let d = Sdl.Window.get_pixel_density window in
  let s = Sdl.Window.get_display_scale window in
  print "Pixel density: %f, scale: %f" d s;

  print "loading ball";
  let ball = go (Sdl.Surface.load_png "ball.png") in
  (* let rect = let open Rect.FRect in *)
  (*   let r = create () in *)
  (*   set r x 10.; *)
  (*   set r y 20.; *)
  (*   set r w 70.; *)
  (*   set r h 70.; *)
  (*   r in *)
  print "create rect";
  let rect = create_frect Sdl.FRect.[(x, 10.); (y, 20.); (w, 70.); (h, 70.)] in
  (* let rect = Ctypes.(!@ rect) in *)
  let center = create_fpoint Sdl.FPoint.[(x, 35.); (y, 35.)] in

  let renderer = Sdl.Renderer.create window "" |> go in
  print "Renderer created";
  go (Sdl.Renderer.set_v_sync renderer 1);
  go (Sdl.Renderer.set_draw_color renderer 56 123 12 255);
  go (Sdl.Renderer.render_clear renderer);
  let ball = go (Sdl.Texture.create_from_surface renderer ball) in
  (* Simple loop *)
  let e = Sdl.Event.create () in

  let resize () =
    let w, h = Sdl.Window.get_size window |> go in
    ww := w;
    wh := h in

  let msg = ref "" in
  let alpha = ref Sdl.alpha_opaque in
  let ymax () = float !wh -. 15. in
  let y = ref (ymax ()) in
  let point_list = ref [] in
  let rec loop i =
    if i < 10 * !ww then begin

      go (Sdl.Renderer.set_draw_color renderer 56 123 12 Sdl.alpha_opaque);
      go (Sdl.Renderer.render_clear renderer);

      let angle = float i (* +. (1. +. cos (1. +. float i /. 5.)) *) in
      Sdl.FRect.(Ctypes.setf rect x (float i /. 10.));
      Sdl.FRect.(Ctypes.setf rect y (float (!wh - 70) *.
                         (1. -. abs_float (sin (10. *. float i /. float !wh)))));
      go (Sdl.Renderer.render_texture_rotated renderer ball None (Some rect)
            angle (Some center) Sdl.flip_none);
      let rec event_loop () =
        let has_event = Sdl.Event.poll (Some e) in
        if has_event then begin
          let typ = Sdl.Event.(get e typ) in
          if typ = Sdl.event_quit then raise Quit;
          if typ = Sdl.event_window_resized then resize ();
          msg := (sprintf "Event 0x%x" typ);
          alpha := Sdl.alpha_opaque;
          y := ymax ();
          print_endline !msg;
          Sdl.flush_event Sdl.event_mouse_motion;
          event_loop ()
        end in
      event_loop ();

      go (Sdl.Renderer.set_draw_color renderer 0 0 0 !alpha);
      if !y > -. 20. then go (Sdl.Renderer.render_debug_text renderer 100. !y !msg);
      alpha := max (!alpha - 2) Sdl.alpha_transparent;
      y := !y -. 1.;

      go (Sdl.Renderer.set_draw_color renderer 255 25 255 255);
      let p = create_fpoint Sdl.FPoint.[(x, float i /. 10.); (y, float i /. 20.)] in
      point_list := p :: !point_list;
      (* for j = 1 to i do *)
      (*   go (Renderer.render_point renderer (float j /. 10.) (float j /. 20.)) *)
      (* done; *)
      go (Sdl.Renderer.render_points renderer !point_list);
      go (Sdl.Renderer.render_present renderer);
      (* Timer.delay 16 *)
      loop (i+1)
    end in
  let () = try loop 0
    with Quit -> () in
  print "Time=%i" (Sdl.get_current_time () |> go);
  Sdl.Renderer.destroy renderer
  ;

  Sdl.Window.destroy window;
  Sdl.quit ();
  print "Done!"
