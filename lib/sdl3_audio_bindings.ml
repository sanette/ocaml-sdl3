(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Helpers
open Sdl3_types

let ff = Load.foreign

module Global = struct
let get_num_audio_drivers = ff "SDL_GetNumAudioDrivers"
  (void @-> returning int)

let get_audio_driver = ff "SDL_GetAudioDriver"
  (int @-> returning string)

let get_current_audio_driver = ff "SDL_GetCurrentAudioDriver"
  (void @-> returning string)

let get_audio_playback_devices = ff "SDL_GetAudioPlaybackDevices"
  (ptr int @-> returning (ptr audio_device_id))
(* Wrapper for returning uint list *)
let get_audio_playback_devices () =
  let count = allocate int 0 in
  let p = get_audio_playback_devices count in
  if is_null p then []
  else let n =  (!@ count) in
    Fun.protect ~finally:(fun () -> Sdl3_stdinc_bindings.free (to_voidp p))
      (fun () ->
        CArray.from_ptr p n
        |> CArray.to_list
        |> List.map Unsigned.UInt.to_int)

let get_audio_recording_devices = ff "SDL_GetAudioRecordingDevices"
  (ptr int @-> returning (ptr audio_device_id))
(* Wrapper for returning uint list *)
let get_audio_recording_devices () =
  let count = allocate int 0 in
  let p = get_audio_recording_devices count in
  if is_null p then []
  else let n =  (!@ count) in
    Fun.protect ~finally:(fun () -> Sdl3_stdinc_bindings.free (to_voidp p))
      (fun () ->
        CArray.from_ptr p n
        |> CArray.to_list
        |> List.map Unsigned.UInt.to_int)

let get_audio_device_name = ff "SDL_GetAudioDeviceName"
  (audio_device_id @-> returning string)
let get_audio_device_name devid =
  get_audio_device_name (Unsigned.UInt.of_int devid)

let get_audio_device_format = ff "SDL_GetAudioDeviceFormat"
  (audio_device_id @-> ptr audio_spec @-> ptr int @-> returning bool)
let get_audio_device_format devid spec =
  let sample_frames = allocate int 0 in
  if get_audio_device_format (Unsigned.UInt.of_int devid) spec sample_frames then Ok (!@ sample_frames) else error ()

let get_audio_device_channel_map = ff "SDL_GetAudioDeviceChannelMap"
  (audio_device_id @-> ptr int @-> returning (ptr int))
(* Wrapper for returning int list *)
let get_audio_device_channel_map devid =
  let count = allocate int 0 in
  let p = get_audio_device_channel_map devid count in
  if is_null p then []
  else let n =  (!@ count) in
    Fun.protect ~finally:(fun () -> Sdl3_stdinc_bindings.free (to_voidp p))
      (fun () ->
        CArray.from_ptr p n
        |> CArray.to_list)
let get_audio_device_channel_map devid =
  get_audio_device_channel_map (Unsigned.UInt.of_int devid)

let open_audio_device = ff "SDL_OpenAudioDevice"
  (audio_device_id @-> ptr audio_spec @-> returning audio_device_id)
let open_audio_device devid spec =
  open_audio_device (Unsigned.UInt.of_int devid) spec

let is_audio_device_physical = ff "SDL_IsAudioDevicePhysical"
  (audio_device_id @-> returning bool)
let is_audio_device_physical devid =
  is_audio_device_physical (Unsigned.UInt.of_int devid)

let is_audio_device_playback = ff "SDL_IsAudioDevicePlayback"
  (audio_device_id @-> returning bool)
let is_audio_device_playback devid =
  is_audio_device_playback (Unsigned.UInt.of_int devid)

let pause_audio_device = ff "SDL_PauseAudioDevice"
  (audio_device_id @-> returning true_to_ok)
let pause_audio_device devid =
  pause_audio_device (Unsigned.UInt.of_int devid)

let resume_audio_device = ff "SDL_ResumeAudioDevice"
  (audio_device_id @-> returning true_to_ok)
let resume_audio_device devid =
  resume_audio_device (Unsigned.UInt.of_int devid)

let audio_device_paused = ff "SDL_AudioDevicePaused"
  (audio_device_id @-> returning true_to_ok)
let audio_device_paused devid =
  audio_device_paused (Unsigned.UInt.of_int devid)

let get_audio_device_gain = ff "SDL_GetAudioDeviceGain"
  (audio_device_id @-> returning float)
let get_audio_device_gain devid =
  get_audio_device_gain (Unsigned.UInt.of_int devid)

let set_audio_device_gain = ff "SDL_SetAudioDeviceGain"
  (audio_device_id @-> float @-> returning true_to_ok)
let set_audio_device_gain devid gain =
  set_audio_device_gain (Unsigned.UInt.of_int devid) gain

let close_audio_device = ff "SDL_CloseAudioDevice"
  (audio_device_id @-> returning void)
let close_audio_device devid =
  close_audio_device (Unsigned.UInt.of_int devid)

let bind_audio_streams = ff "SDL_BindAudioStreams"
  (audio_device_id @-> ptr audio_stream @-> int @-> returning true_to_ok)
let bind_audio_streams devid streams =
  let streams, num_streams = carray_of_list audio_stream streams in
  bind_audio_streams (Unsigned.UInt.of_int devid) streams num_streams

let bind_audio_stream = ff "SDL_BindAudioStream"
  (audio_device_id @-> audio_stream @-> returning true_to_ok)
let bind_audio_stream devid stream =
  bind_audio_stream (Unsigned.UInt.of_int devid) stream

let unbind_audio_streams = ff "SDL_UnbindAudioStreams"
  (ptr audio_stream @-> int @-> returning void)
let unbind_audio_streams streams =
  let streams, num_streams = carray_of_list audio_stream streams in
  unbind_audio_streams streams num_streams

let set_audio_postmix_callback = ff "SDL_SetAudioPostmixCallback"
  (audio_device_id @-> audio_postmix_callback @-> ptr void @-> returning true_to_ok)
let set_audio_postmix_callback devid callback userdata =
  set_audio_postmix_callback (Unsigned.UInt.of_int devid) callback userdata

let load_wav = ff "SDL_LoadWAV"
  (string @-> ptr audio_spec @-> ptr (ptr uint8) @-> ptr uint32 @-> returning true_to_ok)

let mix_audio = ff "SDL_MixAudio"
  (ptr uint8 @-> ptr uint8 @-> audio_format @-> uint32 @-> float @-> returning true_to_ok)
let mix_audio dst src format len volume =
  mix_audio dst src format (Unsigned.UInt.of_int len) volume

end
include Global

module AudioStream = struct
let unbind = ff "SDL_UnbindAudioStream"
  (audio_stream_opt @-> returning void)

let get_device = ff "SDL_GetAudioStreamDevice"
  (audio_stream @-> returning audio_device_id)

let create = ff "SDL_CreateAudioStream"
  (ptr audio_spec @-> ptr audio_spec @-> returning (some_to_ok audio_stream_opt))

let get_properties = ff "SDL_GetAudioStreamProperties"
  (audio_stream @-> returning properties_id)

let get_format = ff "SDL_GetAudioStreamFormat"
  (audio_stream @-> ptr audio_spec @-> ptr audio_spec @-> returning true_to_ok)

let set_format = ff "SDL_SetAudioStreamFormat"
  (audio_stream @-> ptr audio_spec @-> ptr audio_spec @-> returning true_to_ok)

let get_frequency_ratio = ff "SDL_GetAudioStreamFrequencyRatio"
  (audio_stream @-> returning float)

let set_frequency_ratio = ff "SDL_SetAudioStreamFrequencyRatio"
  (audio_stream @-> float @-> returning true_to_ok)

let get_gain = ff "SDL_GetAudioStreamGain"
  (audio_stream @-> returning float)

let set_gain = ff "SDL_SetAudioStreamGain"
  (audio_stream @-> float @-> returning true_to_ok)

let get_input_channel_map = ff "SDL_GetAudioStreamInputChannelMap"
  (audio_stream @-> ptr int @-> returning (ptr int))
(* Wrapper for returning int list *)
let get_input_channel_map stream =
  let count = allocate int 0 in
  let p = get_input_channel_map stream count in
  if is_null p then []
  else let n =  (!@ count) in
    Fun.protect ~finally:(fun () -> Sdl3_stdinc_bindings.free (to_voidp p))
      (fun () ->
        CArray.from_ptr p n
        |> CArray.to_list)

let get_output_channel_map = ff "SDL_GetAudioStreamOutputChannelMap"
  (audio_stream @-> ptr int @-> returning (ptr int))
(* Wrapper for returning int list *)
let get_output_channel_map stream =
  let count = allocate int 0 in
  let p = get_output_channel_map stream count in
  if is_null p then []
  else let n =  (!@ count) in
    Fun.protect ~finally:(fun () -> Sdl3_stdinc_bindings.free (to_voidp p))
      (fun () ->
        CArray.from_ptr p n
        |> CArray.to_list)

let set_input_channel_map = ff "SDL_SetAudioStreamInputChannelMap"
  (audio_stream @-> ptr (const int) @-> int @-> returning true_to_ok)

let set_output_channel_map = ff "SDL_SetAudioStreamOutputChannelMap"
  (audio_stream @-> ptr (const int) @-> int @-> returning true_to_ok)

let put_data = ff "SDL_PutAudioStreamData"
  (audio_stream @-> ptr void @-> int @-> returning true_to_ok)

let put_data_no_copy = ff "SDL_PutAudioStreamDataNoCopy"
  (audio_stream @-> ptr void @-> int @-> audio_stream_data_complete_callback @-> ptr void @-> returning true_to_ok)

let put_planar_data = ff "SDL_PutAudioStreamPlanarData"
  (audio_stream @-> ptr (ptr void) @-> int @-> int @-> returning true_to_ok)

let get_data = ff "SDL_GetAudioStreamData"
  (audio_stream @-> ptr void @-> int @-> returning int)

let get_available = ff "SDL_GetAudioStreamAvailable"
  (audio_stream @-> returning int)

let get_queued = ff "SDL_GetAudioStreamQueued"
  (audio_stream @-> returning int)

let flush = ff "SDL_FlushAudioStream"
  (audio_stream @-> returning true_to_ok)

let clear = ff "SDL_ClearAudioStream"
  (audio_stream @-> returning true_to_ok)

let pause_device = ff "SDL_PauseAudioStreamDevice"
  (audio_stream @-> returning true_to_ok)

let resume_device = ff "SDL_ResumeAudioStreamDevice"
  (audio_stream @-> returning true_to_ok)

let device_paused = ff "SDL_AudioStreamDevicePaused"
  (audio_stream @-> returning true_to_ok)

let lock = ff "SDL_LockAudioStream"
  (audio_stream @-> returning true_to_ok)

let unlock = ff "SDL_UnlockAudioStream"
  (audio_stream @-> returning true_to_ok)

let set_get_callback = ff "SDL_SetAudioStreamGetCallback"
  (audio_stream @-> audio_stream_callback @-> ptr void @-> returning true_to_ok)

let set_put_callback = ff "SDL_SetAudioStreamPutCallback"
  (audio_stream @-> audio_stream_callback @-> ptr void @-> returning true_to_ok)

let destroy = ff "SDL_DestroyAudioStream"
  (audio_stream @-> returning void)

let open_audio_device_stream = ff "SDL_OpenAudioDeviceStream"
  (audio_device_id @-> ptr audio_spec @-> audio_stream_callback @-> ptr void @-> returning (some_to_ok audio_stream_opt))
let open_audio_device_stream devid spec callback userdata =
  open_audio_device_stream (Unsigned.UInt.of_int devid) spec callback userdata

end

module IOStream = struct
let load_wav_io = ff "SDL_LoadWAV_IO"
  (io_stream @-> bool @-> ptr audio_spec @-> ptr (ptr uint8) @-> ptr uint32 @-> returning true_to_ok)

end

module AudioSpec = struct
let convert_audio_samples = ff "SDL_ConvertAudioSamples"
  (ptr audio_spec @-> ptr uint8 @-> int @-> ptr audio_spec @-> ptr (ptr uint8) @-> ptr int @-> returning bool)
let convert_audio_samples src_spec src_data src_len dst_spec dst_data =
  let dst_len = allocate int 0 in
  if convert_audio_samples src_spec src_data src_len dst_spec dst_data dst_len then Ok (!@ dst_len) else error ()

include AudioSpec

end

module AudioFormat = struct
let get_name = ff "SDL_GetAudioFormatName"
  (audio_format @-> returning string)

let get_silence_value_for_format = ff "SDL_GetSilenceValueForFormat"
  (audio_format @-> returning int)

end

