(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Sdl3_types
open Helpers

let ff = Load.foreign

module Global = struct
let get_haptics = ff "SDL_GetHaptics"
  (ptr int @-> returning (ptr haptic_id))
(* Wrapper for returning uint list *)
let get_haptics () =
  let count = allocate int 0 in
  let p = get_haptics count in
  if is_null p then []
  else let n =  (!@ count) in
    Fun.protect ~finally:(fun () -> Sdl3_stdinc_bindings.free (to_voidp p))
      (fun () ->
        CArray.from_ptr p n
        |> CArray.to_list
        |> List.map Unsigned.UInt.to_int)

let get_haptic_name_for_id = ff "SDL_GetHapticNameForID"
  (haptic_id @-> returning string)
let get_haptic_name_for_id instance_id =
  get_haptic_name_for_id (Unsigned.UInt.of_int instance_id)

let is_mouse_haptic = ff "SDL_IsMouseHaptic"
  (void @-> returning bool)

end
include Global

module Haptic = struct
let open_ = ff "SDL_OpenHaptic"
  (haptic_id @-> returning (some_to_ok haptic_opt))
let open_ instance_id =
  open_ (Unsigned.UInt.of_int instance_id)

let get_from_id = ff "SDL_GetHapticFromID"
  (haptic_id @-> returning (some_to_ok haptic_opt))
let get_from_id instance_id =
  get_from_id (Unsigned.UInt.of_int instance_id)

let get_id = ff "SDL_GetHapticID"
  (haptic @-> returning haptic_id)

let get_name = ff "SDL_GetHapticName"
  (haptic @-> returning string)

let open_from_mouse = ff "SDL_OpenHapticFromMouse"
  (void @-> returning (some_to_ok haptic_opt))

let open_from_joystick = ff "SDL_OpenHapticFromJoystick"
  (joystick @-> returning (some_to_ok haptic_opt))

let close = ff "SDL_CloseHaptic"
  (haptic @-> returning void)

let get_max_effects = ff "SDL_GetMaxHapticEffects"
  (haptic @-> returning int)

let get_max_effects_playing = ff "SDL_GetMaxHapticEffectsPlaying"
  (haptic @-> returning int)

let get_features = ff "SDL_GetHapticFeatures"
  (haptic @-> returning uint32)

let get_num_axes = ff "SDL_GetNumHapticAxes"
  (haptic @-> returning int)

let effect_supported = ff "SDL_HapticEffectSupported"
  (haptic @-> ptr haptic_effect @-> returning true_to_ok)

let create_effect = ff "SDL_CreateHapticEffect"
  (haptic @-> ptr haptic_effect @-> returning haptic_effect_id)

let update_effect = ff "SDL_UpdateHapticEffect"
  (haptic @-> haptic_effect_id @-> ptr haptic_effect @-> returning true_to_ok)

let run_effect = ff "SDL_RunHapticEffect"
  (haptic @-> haptic_effect_id @-> uint32 @-> returning true_to_ok)
let run_effect haptic effect_ iterations =
  run_effect haptic effect_ (Unsigned.UInt.of_int iterations)

let stop_effect = ff "SDL_StopHapticEffect"
  (haptic @-> haptic_effect_id @-> returning true_to_ok)

let destroy_effect = ff "SDL_DestroyHapticEffect"
  (haptic @-> haptic_effect_id @-> returning void)

let get_effect_status = ff "SDL_GetHapticEffectStatus"
  (haptic @-> haptic_effect_id @-> returning true_to_ok)

let set_gain = ff "SDL_SetHapticGain"
  (haptic @-> int @-> returning true_to_ok)

let set_autocenter = ff "SDL_SetHapticAutocenter"
  (haptic @-> int @-> returning true_to_ok)

let pause = ff "SDL_PauseHaptic"
  (haptic @-> returning true_to_ok)

let resume = ff "SDL_ResumeHaptic"
  (haptic @-> returning true_to_ok)

let stop_effects = ff "SDL_StopHapticEffects"
  (haptic @-> returning true_to_ok)

let rumble_supported = ff "SDL_HapticRumbleSupported"
  (haptic @-> returning true_to_ok)

let init_rumble = ff "SDL_InitHapticRumble"
  (haptic @-> returning true_to_ok)

let play_rumble = ff "SDL_PlayHapticRumble"
  (haptic @-> float @-> uint32 @-> returning true_to_ok)
let play_rumble haptic strength length =
  play_rumble haptic strength (Unsigned.UInt.of_int length)

let stop_rumble = ff "SDL_StopHapticRumble"
  (haptic @-> returning true_to_ok)

end

module Joystick = struct
let is_haptic = ff "SDL_IsJoystickHaptic"
  (joystick @-> returning bool)

end

