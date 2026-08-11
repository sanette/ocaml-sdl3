(* ocaml-SDL3 example --- DOES NOT WORK! Thread ownership issue.  *)
(* Adapted from examples/audio/simple-playback-callback from the SDL3 sources (public domain) *)

open Sdl3

let go = Result.get_ok
let do_option o f = Option.iter f o

type 'a state = {
  window : T.window;
  renderer : T.renderer;
  callback : 'a option; (* We need to save the callback somewhere to make sure
                           OCaml does not GC it. *)
  (* TODO write explicit callback types in the binding. Here:

 type audio_stream_callback = unit ptr -> audio_stream -> int -> int -> unit *)


}

(* This function will be called (usually in a background thread) when the audio stream is consuming data. *)
let feed_the_audio_stream_more =

  let current_sine_sample = ref 0 in
  let dim_samples = 128 in
  let samples = Bigarray.(Array1.create float32 c_layout dim_samples) in
  let freq = 440 in

  fun _userdata astream additional_amount _total_amount ->
    let additional_amount = additional_amount / Bigarray.(kind_size_in_bytes float32) in
    let rec loop aa =
      if aa > 0 then begin
        let total = min aa dim_samples in
        for i = 0 to total - 1 do
          let phase = float (!current_sine_sample * freq) /. 8000. in
          samples.{i} <- Sdl.sin (phase *. 2. *. Sdl.pi_f);
          incr current_sine_sample
        done;
        current_sine_sample := !current_sine_sample mod 8000;
        let data = Bigarray.Array1.sub samples 0 total in
        Sdl.AudioStream.put_data ~count:total astream data |> go;
        loop (aa - total)
      end
    in
    Sdl.App.log "Additional samples requested: %i" additional_amount;
    loop additional_amount


(* This function runs once at startup and returns a fresh application state. *)
let init () =
  (* let () =  Sdl.LogPriority.set_log_priorities Sdl.log_priority_trace in *)
  Sdl.set_app_metadata
    "Example Simple Audio Playback Callback" "1.0" "com.example.audio-simple-playback-callback" |> go;
  match Sdl.(init (init_video lor init_audio)) with
  | Error (`Msg e) -> Sdl.App.log "Couldn't initialize SDL: %s" e;
    T.APP_FAILURE, None
  | Ok () ->
    match Sdl.create_window_and_renderer "examples/audio/simple-playback-callback" 640 480
            Sdl.window_resizable with
    | Error (`Msg e) -> Sdl.App.log "Couldn't create window/renderer: %s" e;
      T.APP_FAILURE, None
    | Ok (window, renderer) ->
      let state = { window; renderer; callback = None } in
      Sdl.Renderer.set_logical_presentation renderer 640 480
        Sdl.logical_presentation_letterbox |> go;

      let spec = T.AudioSpec.create () in
      T.AudioSpec.(set spec channels 1);
      T.AudioSpec.(set spec format Sdl.audio_f32);
      T.AudioSpec.(set spec freq 8000);

      let callback = Some feed_the_audio_stream_more in
      let state = {state with callback} in
      match Sdl.AudioDevice.open_stream Sdl.audio_device_default_playback
              (Some spec) callback Ctypes.null with
      | Error (`Msg e) -> Sdl.App.log "Couldn't create audio stream: %s" e;
        T.APP_FAILURE, Some state
      | Ok stream ->
        Sdl.AudioStream.resume_device stream |> go;
        T.APP_CONTINUE, Some state (* carry on with the program! *)

(* This function runs when a new event (mouse input, keypresses, etc) occurs. *)
let event _state e =
  let typ = Sdl.Event.(get e typ) in
  if typ = Sdl.event_quit
  then T.APP_SUCCESS (* end the program, reporting success to the OS. *)
  else T.APP_CONTINUE (* carry on with the program! *)

(* This function runs once per frame, and is the heart of the program. *)
let iterate state =
  Sdl.Renderer.clear state.renderer |> go ;
  Sdl.Renderer.present state.renderer |> go;
  (* Thread.yield (); *)
  T.APP_CONTINUE (* carry on with the program! *)

(* This function runs once at shutdown. *)
let quit state ret =
  do_option state (fun state ->
      Sdl.Renderer.destroy state.renderer;
      Sdl.Window.destroy state.window;
      ignore (state.callback);
      (* do_option state.stream (fun stream -> *)
      (*     Sdl.AudioStream.pause_device stream |> go; *)
      (*     Sdl.AudioStream.destroy stream) *));

  Sdl.quit ();
  match ret with
  | T.APP_FAILURE -> Sdl.App.log "Application failure"; exit 1
  | T.APP_SUCCESS -> Sdl.App.log "Application terminated successfully"; exit 0
  | T.APP_CONTINUE -> Sdl.App.log "Application both terminates and wants to continue!"; exit 1

let () =
  let app = Sdl.App.create ~init ~event ~iterate ~quit () in
  Sdl.App.run app
