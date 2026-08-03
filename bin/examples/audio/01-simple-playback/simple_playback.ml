(* ocaml-SDL3 example *)
(* Adapted from examples/audio/simple-playback from the SDL3 sources (public domain) *)

open Sdl3

let go = Result.get_ok
let do_option o f = Option.iter f o

type state = {
  window : T.window;
  renderer : T.renderer;
  stream : T.audio_stream option;
  mutable current_sine_sample : int
}

(* This function runs once at startup and returns a fresh application state. *)
let init () =
  Sdl.set_app_metadata
    "Example Audio Simple Playback" "1.0" "com.example.audio-simple-playback" |> go;
  match Sdl.(init (init_video lor init_audio)) with
  | Error (`Msg e) -> Sdl.App.log "Couldn't initialize SDL: %s" e;
    T.APP_FAILURE, None
  | Ok () ->
    match Sdl.create_window_and_renderer "examples/audio/simple-playback" 640 480
            Sdl.window_resizable with
    | Error (`Msg e) -> Sdl.App.log "Couldn't create window/renderer: %s" e;
      T.APP_FAILURE, None
    | Ok (window, renderer) ->
      let state = { window; renderer; stream = None; current_sine_sample=0 } in
      Sdl.Renderer.set_logical_presentation renderer 640 480
        Sdl.logical_presentation_letterbox |> go;

      let spec = Sdl.AudioSpec.create () in
      Sdl.AudioSpec.(set spec channels 1);
      Sdl.AudioSpec.(set spec format Sdl.audio_f32);
      Sdl.AudioSpec.(set spec freq 8000);

      match Sdl.AudioStream.open_audio_device_stream Sdl.audio_device_default_playback
              (Some spec) None with
      | Error (`Msg e) -> Sdl.App.log "Couldn't create audio stream: %s" e;
        T.APP_FAILURE, Some state
      | Ok stream ->
        Sdl.AudioStream.resume_device stream |> go;
        let state = {state with stream = Some stream } in
        T.APP_CONTINUE, Some state (* carry on with the program! *)

(* This function runs when a new event (mouse input, keypresses, etc) occurs. *)
let event _state e =
  let typ = Sdl.Event.(get e typ) in
  if typ = Sdl.event_quit
  then T.APP_SUCCESS (* end the program, reporting success to the OS. *)
  else T.APP_CONTINUE (* carry on with the program! *)

(* This function runs once per frame, and is the heart of the program. *)
let iterate state =
  let stream = Option.get state.stream in
  let minimum_audio = 8000 * (Bigarray.(kind_size_in_bytes float32)) / 2 in
  if Sdl.AudioStream.get_queued stream < minimum_audio
  then let samples = Bigarray.(Array1.create float32 c_layout 512) in
    for i = 0 to Bigarray.Array1.dim samples - 1 do
      let freq = 440 in
      let phase = float (state.current_sine_sample * freq) /. 8000. in
      samples.{i} <- Sdl.sinf (phase *. 2. *. Sdl.pi_f);
      state.current_sine_sample <- state.current_sine_sample + 1
    done;
    state.current_sine_sample <- state.current_sine_sample mod 8000;
    Sdl.AudioStream.put_data_f stream samples |> go;

    Sdl.Renderer.render_clear state.renderer |> go ;
    Sdl.Renderer.render_present state.renderer |> go
  else ();

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
