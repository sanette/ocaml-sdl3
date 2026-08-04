(* ocaml-SDL3 example *)
(* Adapted from examples/audio/04-multiple-streams from the SDL3 sources (public domain) *)

open Sdl3
open Printf

let go = Result.get_ok
let do_option o f = Option.iter f o

type wave_data = Bigarray.((int, int8_unsigned_elt, c_layout) Array1.t)
type sound = {
  stream : T.audio_stream;
  wav_data : wave_data
}

type state = {
  window : T.window;
  renderer : T.renderer;
  sounds : sound array
}

let init_sound audio_device fname =
  let wav_path = Printf.sprintf "%s%s" (Sdl.get_base_path ()) fname in
  match Sdl.load_wav wav_path with
  | Error (`Msg e) -> Error (`Msg (sprintf "Couldn't load .wav file: %s\n" e))
  | Ok (spec, wav_data) ->
    match Sdl.AudioStream.create (Some spec) None with
    | Error (`Msg e) -> Error (`Msg (sprintf "Couldn't create audio stream: %s\n" e))
    | Ok stream ->
      match Sdl.bind_audio_stream audio_device stream with
      | Error (`Msg e) ->
        Error (`Msg (sprintf "Failed to bind '%s' stream to device: %s" fname e))
      | Ok () -> Ok {stream; wav_data}

(* This function runs once at startup and returns a fresh application state. *)
let init () =
  Sdl.set_app_metadata
    "Example Audio Multiple Streams" "1.0" "com.example.audio-multiple-streams" |> go;
  match Sdl.(init (init_video lor init_audio)) with
  | Error (`Msg e) -> Sdl.App.log "Couldn't initialize SDL: %s" e;
    T.APP_FAILURE, None
  | Ok () ->
    match Sdl.create_window_and_renderer "examples/audio/multiple-streams" 640 480
            Sdl.window_resizable with
    | Error (`Msg e) -> Sdl.App.log "Couldn't create window/renderer: %s" e;
      T.APP_FAILURE, None
    | Ok (window, renderer) ->
      let state = { window; renderer; sounds = [||] } in
      Sdl.Renderer.set_logical_presentation renderer 640 480
        Sdl.logical_presentation_letterbox |> go;

      let audio_device = Sdl.open_audio_device Sdl.audio_device_default_playback None in
      if audio_device = 0 then begin
        Sdl.App.log "Couldn't open audio device: %s" (Categories.Error.get_error ());
        T.APP_FAILURE, Some state
      end else match init_sound audio_device "sample.wav" with
        | Error _ -> T.APP_FAILURE, Some state
        | Ok sound0 ->
          match init_sound audio_device "sword.wav" with
          | Error _ -> T.APP_FAILURE, Some state
          | Ok sound1 ->
            let sounds = [| sound0; sound1 |] in
            let state = { state with sounds } in
            T.APP_CONTINUE, Some state (* carry on with the program! *)

(* This function runs when a new event (mouse input, keypresses, etc) occurs. *)
let event _state e =
  let typ = Sdl.Event.(get e typ) in
  if typ = Sdl.event_quit
  then T.APP_SUCCESS (* end the program, reporting success to the OS. *)
  else T.APP_CONTINUE (* carry on with the program! *)

(* This function runs once per frame, and is the heart of the program. *)
let iterate state =

  Array.iter (fun sound ->
      if Sdl.AudioStream.get_queued sound.stream <
         Bigarray.Array1.size_in_bytes sound.wav_data
      then Sdl.AudioStream.put_data sound.stream sound.wav_data |> go
    ) state.sounds;

  Sdl.Renderer.set_draw_color state.renderer 0 0 0 255 |> go;
  Sdl.Renderer.render_clear state.renderer |> go ;
  Sdl.Renderer.render_present state.renderer |> go;

  T.APP_CONTINUE (* carry on with the program! *)

(* This function runs once at shutdown. *)
let quit state ret =
  do_option state (fun state ->
      Sdl.Renderer.destroy state.renderer;
      Sdl.Window.destroy state.window;
      Array.iter (fun sound -> Sdl.AudioStream.destroy sound.stream) state.sounds);
  Sdl.quit ();
  match ret with
  | T.APP_FAILURE -> Sdl.App.log "Application failure"; exit 1
  | T.APP_SUCCESS -> Sdl.App.log "Application terminated successfully"; exit 0
  | T.APP_CONTINUE -> Sdl.App.log "Application both terminates and wants to continue!"; exit 1

let () =
  let app = Sdl.App.create ~init ~event ~iterate ~quit () in
  Sdl.App.run app
