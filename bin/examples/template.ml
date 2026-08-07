(* ocaml-SLD3 template using callbacks *)

(* Adapted from examples/template.c from the SDL3 sources (public domain) *)

open Sdl3

let go = Result.get_ok

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
  match Sdl.(init init_video) with
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
let iterate state =
  ignore state.window; (* do something instead! *)
  ignore state.renderer; (* idem *)
  T.APP_CONTINUE (* carry on with the program! *)

(* This function runs once at shutdown. *)
let quit _state _ret =
  (* SDL will clean up the window/renderer for us. *)
  T.APP_SUCCESS (* we really want to exit *)

let () =
  let app = Sdl.App.create ~init ~event ~iterate ~quit () in
  Sdl.App.run app
(* If [quit] returns APP_SUCCESS, the program will exit here, nothing beyond
   this point will be executed. *)
