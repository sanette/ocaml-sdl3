(* ocaml-SLD3 template using callbacks *)

(* Adapted from examples/template.c from the SDL3 sources (public domain) *)

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
    "Example HUMAN READABLE NAME" "1.0" "com.example.CATEGORY-NAME" |> go;
  match Sdl.init Sdl.init_video with
  | Error (`Msg e) -> Sdl.App.log "Couldn't initialize SDL: %s" e;
    T.APP_FAILURE, None
  | Ok () ->
    match Sdl.create_window_and_renderer "examples/CATEGORY/NAME" 640 480
            Sdl.window_resizable with
    | Error (`Msg e) -> Sdl.App.log "Couldn't create window/renderer: %s" e;
      T.APP_FAILURE, None
    | Ok (window, renderer) ->
      Sdl.Renderer.set_logical_presentation renderer 640 480
        Sdl.logical_presentation_letterbox |> go;

      let state = { window; renderer } in
      T.APP_CONTINUE, Some state (* carry on with the program! *)

(* This function runs when a new event (mouse input, keypresses, etc) occurs. *)
let event _state e =
  let typ = Sdl.Event.(get e typ) in
  if typ = Sdl.event_quit
  then T.APP_SUCCESS (* end the program, reporting success to the OS. *)
  else T.APP_CONTINUE (* carry on with the program! *)

(* This function runs once per frame, and is the heart of the program. *)
let iterate _state =
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
