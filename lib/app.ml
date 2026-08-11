(* The aim of this module is to mimick the SDL "callback method" for writing
   apps. The user just needs to write the four functions init, event, iterate
   and quit, then SDL takes care of the loops.

   See https://wiki.libsdl.org/SDL3/README-main-functions
   See the examples directory.

   The main difference with the original SDL implemenation is that the "quit"
   function does to automaticall exit the program. It's up to the programmer to
   examine the application_result (T.APP_FAILURE, T.APP_SUCCESS, or
   T.APP_CONTINUE) to decide what to do.

*)

module T = Sdl3_types
module Sdl = Sdl3_constants

(* ctypes cannot handle vari-adic arguments, so we borrow this tsdl trick which
   does the formatting on the ocaml side and sends to C only the final
   string. *)
let kpp k fmt =
  let k _fmt = k (Format.flush_str_formatter ()) in
  Format.kfprintf k Format.str_formatter fmt

let log =
  Load.foreign "SDL_Log" Ctypes.(string @-> string @-> returning void)

let log fmt =
  kpp (fun s -> ignore (log "%s" s)) fmt

let log_fun_t = Ctypes.(int @-> string @-> string @-> returning void)

let log_error =
  Load.foreign "SDL_LogError" log_fun_t
let log_error c fmt =
  kpp (fun s -> ignore (log_error c "%s" s)) fmt

let log_trace =
  Load.foreign "SDL_LogTrace" log_fun_t
let log_trace c fmt =
  kpp (fun s -> ignore (log_trace c "%s" s)) fmt

(* Non-error messages are logged withthe "Trace" priority, so they won't show up
   by default, unless you specify this: *)
(* let () =  Sdl3_log_bindings.LogPriority.set_log_priorities Sdl.log_priority_trace *)
(* or this: *)
let () = Sdl3_log_bindings.Log.set_priority
    Sdl.log_category_application Sdl.log_priority_trace

(* the 'a type is the application state, which is app dependent, typically a
   record/module with 'window' and 'renderer' *)
type 'a app =
  { init : unit -> T.app_result * ('a option);
    event : 'a -> T.event -> T.app_result;
    iterate : 'a -> T.app_result;
    quit : 'a option -> T.app_result -> T.app_result;
    max_events : int
  }

let logerr = log_error Sdl.log_category_application
let logtrace = log_trace Sdl.log_category_application

let event_loop state app =
  let e = Sdl3_events_bindings.Event.create () in
  let rec loop n =
    let has_event = Sdl3_events_bindings.Event.poll (Some e) in
    if has_event then begin
      if n >= 0 then match app.event state e with
        | T.APP_CONTINUE -> loop (n-1)
        | T.APP_FAILURE -> T.APP_FAILURE
        | T.APP_SUCCESS -> T.APP_SUCCESS
      else T.APP_CONTINUE
    end else T.APP_CONTINUE in
  loop app.max_events

let create ?(max_events=10) ~init ~event ~iterate ~quit () =
  { init; event; iterate; quit; max_events }

let quit app state ret =
  Sdl3_video_bindings.get_windows ()
  |> List.iter (fun window ->
      let () = match Sdl3_render_bindings.Renderer.get window with
        | Error (`Msg e) -> log "Cannot get window's renderer: %s." e
        | Ok renderer ->
          Sdl3_render_bindings.Renderer.destroy renderer;
          log "Renderer destroyed." in
      Sdl3_video_bindings.Window.destroy window;
      log "Window destroyed.");
  match app.quit state ret with
  | T.APP_SUCCESS -> begin
      Sdl3_init_bindings.quit ();
      match ret with
      | T.APP_FAILURE -> log "Application failure"; exit 1
      | T.APP_SUCCESS -> log "Application terminated successfully"; exit 0
      | T.APP_CONTINUE -> log "Application both terminates and wants to continue!"; exit 1
    end
  | _ -> ()

let run app =
  let ret, state = app.init () in
  match ret with
  | T.APP_FAILURE ->
    logerr "Event loop failure; quitting.\n";
    quit app state ret
  | T.APP_SUCCESS ->
    logtrace "Program ended successfully at init stage.\n";
    quit app state ret
  | T.APP_CONTINUE -> match state with
    | None ->
      logerr "No state was provided to continue; quitting.\n";
      quit app None ret
    | Some state as s ->
      let rec loop () =
        let ret = event_loop state app in
        match ret with
        | T.APP_FAILURE ->
          logerr "Event loop failure; quitting.\n";
          quit app s ret
        | T.APP_SUCCESS ->
          logtrace "Event requires program to end successfully; quitting.\n";
          quit app s ret
        | T.APP_CONTINUE ->
          match app.iterate state with
          | T.APP_CONTINUE -> loop ()
          | T.APP_SUCCESS as ret ->
            logtrace "Program ended successfully; quitting.\n";
            quit app s ret
          | T.APP_FAILURE as ret ->
            logerr "Iteration failure; quitting.\n";
            quit app s ret
      in
      loop ()
