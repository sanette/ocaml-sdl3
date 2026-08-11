(* ocaml-SDL3 example *)
(* Adapted from examples/renderer/10-geometry from the SDL3 sources (public domain) *)

open Sdl3

let go = Result.get_ok
let do_option o f = Option.iter f o

let set_point p (x0, y0) =
  T.FPoint.(set p x x0);
  T.FPoint.(set p y y0)

type state = {
  renderer : T.renderer;
  texture : T.texture option;
}

let window_width = 640
let window_height = 480

(* In this OCaml version we use the special ("monadic") "let*" construction in
   order to deal with SDL errors. It's just a matter of taste/style; the direct
   syntax (with traditional "matches"), used in other examples, may be easier to
   read and even easier to write. *)

(* For the init function, the "let*" operator has two additional arguments: the
   error message in case of failure, and the current app state (used to cleanup
   before quitting.) *)
let ( let* ) (o, errmsg, state) f =
  match o with
  | Error (`Msg e) -> Sdl.App.log "%s: %s" errmsg e;
    T.APP_FAILURE, state
  | Ok x -> f x

(* This function runs once at startup and returns a fresh application state. *)
let init () =
  (* Sdl.LogPriority.set_log_priorities Sdl.log_priority_invalid; *)
  Sdl.set_app_metadata
    "Example Renderer Geometry" "1.0" "com.example.renderer-geometry" |> go;

  let* () = Sdl.init Sdl.init_video, "Couldn't initialize SDL", None in
  let* (_window, renderer) = Sdl.Renderer.create_window_and "examples/renderer/geometry"
      window_width window_height Sdl.window_resizable, "Couldn't create window/renderer", None  in

  Sdl.Renderer.set_logical_presentation renderer window_width window_height
    Sdl.logical_presentation_letterbox |> go;
  Sdl.Renderer.set_v_sync renderer 1 |> go; (* not in the original SDL3 code but nice to your CPU! *)

  (* Textures are pixel data that we upload to the video hardware for fast
     drawing. Lots of 2D engines refer to these as "sprites." We'll do a static
     texture (upload once, draw many times) with data from a bitmap file. *)
  (* SDL_Surface is pixel data the CPU can access. SDL_Texture is pixel data the
     GPU can access. *)
  (* Load a .png into a surface, move it to a texture from there. *)
  let state = { renderer; texture = None } in
  let png_path = Filename.concat (Sdl.get_base_path ()) "sample.png" in
  let* surface = Sdl.load_png png_path,
                 "Couldn't load bitmap", Some state in
  let* texture = Sdl.Texture.create_from_surface renderer surface,
                 "Couldn't create static texture", Some state in
  let state = { state with texture = Some texture } in
  Sdl.Surface.destroy surface;
  T.APP_CONTINUE, Some state (* carry on with the program! *)

(* This function runs when a new event (mouse input, keypresses, etc) occurs. *)
let event _state e =
  let typ = Sdl.Event.(get e typ) in
  if typ = Sdl.event_quit
  then T.APP_SUCCESS (* end the program, reporting success to the OS. *)
  else T.APP_CONTINUE (* carry on with the program! *)

(* This function runs once per frame, and is the heart of the program. *)
let iterate state =
  let texture = Option.get state.texture in
  let now = Sdl.get_ticks () |> Int64.to_int in
  let direction = if (now mod 2000) >= 1000 then 1. else -. 1. in
  let scale = float (now mod 1000 - 500) /. 500. *. direction in
  let size = 200. +. (200. *. scale) in

  Sdl.Renderer.set_draw_color state.renderer 0 0 0 Sdl.alpha_opaque |> go;
  Sdl.Renderer.clear state.renderer |> go;

  let v0 = T.Vertex.create () in
  let position = T.Vertex.(get v0 position) in
  assert (T.FPoint.(get position x) = 0.);

  T.FPoint.(set position x (float window_width /. 2.));
  T.FPoint.(set position y ((float window_height -. size) /. 2.));

  let color = T.Vertex.(get v0 color) in
  T.FColor.(set color r 1.);
  T.FColor.(set color a 1.);

  let v1 = T.Vertex.create () in
  let position = T.Vertex.(get v1 position) in
  (* IMPORTANT: "position" is a field in the Vertex structure, it is
     automatically created in [v1]: one should not create and set a new
     "position", but only modify it in-place, to avoid memory leaks (the old
     "position" would not be freed). *)
  set_point position ((float window_width +. size) /. 2.,
                      (float window_height +. size) /. 2.);
  let color = T.Vertex.(get v1 color) in
  T.FColor.(set color g 1.);
  T.FColor.(set color a 1.);

  let v2 = T.Vertex.create () in
  let position = T.Vertex.(get v2 position) in
  set_point position ((float window_width -. size) /. 2.,
                      (float window_height +. size) /. 2.);
  let color = T.Vertex.(get v2 color) in
  T.FColor.(set color b 1.);
  T.FColor.(set color a 1.);

  let () = match Sdl.Renderer.render_geometry state.renderer None
          [v0;v1;v2] [] with
  | Error (`Msg e) -> Sdl.App.log "Cannot render geometry: %s" e; raise Exit
  | Ok () -> () in

  let v0 = T.Vertex.create () in
  let position = T.Vertex.(get v0 position) in
  set_point position (10., 10.);
  let color = T.Vertex.(get v0 color) in
  T.FColor.(List.iter (fun f -> set color f 1.) [r;g;b;a]);

  let v1 = T.Vertex.create () in
  let position = T.Vertex.(get v1 position) in
  set_point position (150., 10.);
  let tex_coord = T.Vertex.(get v1 tex_coord) in
  let color = T.Vertex.(get v1 color) in
  set_point tex_coord (1., 0.);
  T.FColor.(List.iter (fun f -> set color f 1.) [r;g;b;a]);

  let v2 = T.Vertex.create () in
  let position = T.Vertex.(get v2 position) in
  set_point position (10., 150.);
  let tex_coord = T.Vertex.(get v2 tex_coord) in
  set_point tex_coord (0., 1.);
  let color = T.Vertex.(get v2 color) in
  T.FColor.(List.iter (fun f -> set color f 1.) [r;g;b;a]);

  Sdl.Renderer.render_geometry state.renderer (Some texture) [v0;v1;v2] [] |> go;

  List.iter (fun v ->
      let position  = T.Vertex.(get v position) in
      let x0 = T.FPoint.(get position x) in
      T.FPoint.(set position x (x0 +. 450.))) [v0;v1;v2];

  let v3 = T.Vertex.create () in
  let position = T.Vertex.(get v3 position) in
  set_point position (600., 150.);
  let color = T.Vertex.(get v3 color) in
  T.FColor.(List.iter (fun f -> set color f 1.) [r;g;b;a]);
  let tex_coord = T.Vertex.(get v3 tex_coord) in
  set_point tex_coord (1., 1.);

  Sdl.Renderer.render_geometry state.renderer (Some texture) [v0;v1;v2;v3] [0;1;2;1;2;3] |> go;

  Sdl.Renderer.present state.renderer |> go;

  T.APP_CONTINUE (* carry on with the program! *)

(* This function runs once at shutdown. *)
let quit state _ret =
  do_option state (fun state ->
      do_option state.texture Sdl.Texture.destroy);
  T.APP_SUCCESS

let () =
  let app = Sdl.App.create ~init ~event ~iterate ~quit () in
  Sdl.App.run app
