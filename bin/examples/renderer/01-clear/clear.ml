(* ocaml-SDL3 example *)
(* Adapted from examples/renderer/01-clear/clear.c from the SDL3 sources (public domain) *)

open Sdl3

let go = Result.get_ok
let do_option o f = Option.iter f o

type state = {
  (* Add here any global variable that you may need. Values not defined by the
     'init' function should be declared as Options. *)
  window : T.window;
  renderer : T.renderer;
}

(* This function runs once at startup and returns a fresh application state. *)
let init () =
  Sdl.set_app_metadata
    "Example Renderer Clear" "1.0" "com.example.renderer-clear" |> go;
  match Sdl.init Sdl.init_video with
  | Error (`Msg e) -> Sdl.App.log "Couldn't initialize SDL: %s" e;
    T.APP_FAILURE, None
  | Ok () ->
    match Sdl.create_window_and_renderer "examples/renderer/clear" 640 480
            Sdl.window_resizable with
    | Error (`Msg e) -> Sdl.App.log "Couldn't create window/renderer: %s" e;
      T.APP_FAILURE, None
    | Ok (window, renderer) ->
      Sdl.Renderer.set_logical_presentation renderer 640 480
        Sdl.logical_presentation_letterbox |> go;
      Sdl.Renderer.set_v_sync renderer 1 |> go; (* not in the original SDL3 code but nice to your CPU! *)

      let state = { window; renderer } in
      T.APP_CONTINUE, Some state (* carry on with the program! *)

(* This function runs when a new event (mouse input, keypresses, etc) occurs. *)
let event _state e =
  let typ = Sdl.Event.(get e typ) in
  if typ = Sdl.event_quit
  then T.APP_SUCCESS (* end the program, reporting success to the OS. *)
  else T.APP_CONTINUE (* carry on with the program! *)

(* This function runs once per frame, and is the heart of the program. *)
let iterate state =
  let now = Int64.to_float (Sdl.get_ticks ()) /. 1000. in
  let red = 0.5 +. 0.5 *. sin now in
  let green = 0.5 +. 0.5 *. sin (now +. Sdl.pi_d *. 2. /. 3.) in
  let blue = 0.5 +. 0.5 *. sin (now +. Sdl.pi_d *. 4. /. 3.) in
  Sdl.Renderer.set_draw_color_float state.renderer
    red green blue Sdl.alpha_opaque_float |> go;
  Sdl.Renderer.render_clear state.renderer |> go;
  Sdl.Renderer.render_present state.renderer |> go;
  T.APP_CONTINUE (* carry on with the program! *)

(* This function runs once at shutdown. *)
let quit state ret =
  do_option state (fun state ->
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
