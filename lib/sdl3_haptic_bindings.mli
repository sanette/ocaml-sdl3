(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Sdl3_types
module Haptic : sig

val gets : unit -> int list
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetHaptics}SDL_GetHaptics}: Get a list of currently connected haptic devices.


    @return a list of haptic device instance IDs or NULL on
failure; call SDL_GetError() for more information. This should be
freed with SDL_free() when it is no longer needed.*)

val get_name_for_id : int -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetHapticNameForID}SDL_GetHapticNameForID}: Get the implementation dependent name of a haptic device.

This can be called before any haptic devices are opened.


    @param instance_id the haptic device instance ID.

    @return the name of the selected haptic device. If no name can be found,
this function returns NULL; call SDL_GetError() for more
information.*)

val open_ : int -> haptic result
(** {{:https://wiki.libsdl.org/SDL3/SDL_OpenHaptic}SDL_OpenHaptic}: Open a haptic device for use.

The index passed as an argument refers to the N'th haptic device on this
system.

When opening a haptic device, its gain will be set to maximum and
autocenter will be disabled. To modify these values use SDL_SetHapticGain()
and SDL_SetHapticAutocenter().


    @param instance_id the haptic device instance ID.

    @return the device identifier or [Error] on failure; call SDL_GetError() for
more information.*)

val get_from_id : int -> haptic result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetHapticFromID}SDL_GetHapticFromID}: Get the SDL_Haptic associated with an instance ID, if it has been opened.


    @param instance_id the instance ID to get the SDL_Haptic for.

    @return an SDL_Haptic on success or [Error] on failure or if it hasn't been
opened yet; call SDL_GetError() for more information.*)

val get_id : haptic -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetHapticID}SDL_GetHapticID}: Get the instance ID of an opened haptic device.


    @param haptic the SDL_Haptic device to query.

    @return the instance ID of the specified haptic device on success or 0 on
failure; call SDL_GetError() for more information.*)

val get_name : haptic -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetHapticName}SDL_GetHapticName}: Get the implementation dependent name of a haptic device.


    @param haptic the SDL_Haptic obtained from SDL_OpenJoystick().

    @return the name of the selected haptic device. If no name can be found,
this function returns NULL; call SDL_GetError() for more
information.*)

val is_mouse : unit -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_IsMouseHaptic}SDL_IsMouseHaptic}: Query whether or not the current mouse has haptic capabilities.


    @return true if the mouse is haptic or false if it isn't.*)

val open_from_mouse : unit -> haptic result
(** {{:https://wiki.libsdl.org/SDL3/SDL_OpenHapticFromMouse}SDL_OpenHapticFromMouse}: Try to open a haptic device from the current mouse.


    @return the haptic device identifier or [Error] on failure; call
SDL_GetError() for more information.*)

val open_from_joystick : joystick -> haptic result
(** {{:https://wiki.libsdl.org/SDL3/SDL_OpenHapticFromJoystick}SDL_OpenHapticFromJoystick}: Open a haptic device for use from a joystick device.

You must still close the haptic device separately. It will not be closed
with the joystick.

When opened from a joystick you should first close the haptic device before
closing the joystick device. If not, on some implementations the haptic
device will also get unallocated and you'll be unable to use force feedback
on that device.


    @param joystick the SDL_Joystick to create a haptic device from.

    @return a valid haptic device identifier on success or [Error] on failure;
call SDL_GetError() for more information.*)

val close : haptic -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_CloseHaptic}SDL_CloseHaptic}: Close a haptic device previously opened with SDL_OpenHaptic().


    @param haptic the SDL_Haptic device to close.
*)

val get_max_effects : haptic -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetMaxHapticEffects}SDL_GetMaxHapticEffects}: Get the number of effects a haptic device can store.

On some platforms this isn't fully supported, and therefore is an
approximation. Always check to see if your created effect was actually
created and do not rely solely on SDL_GetMaxHapticEffects().


    @param haptic the SDL_Haptic device to query.

    @return the number of effects the haptic device can store or a negative
error code on failure; call SDL_GetError() for more information.*)

val get_max_effects_playing : haptic -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetMaxHapticEffectsPlaying}SDL_GetMaxHapticEffectsPlaying}: Get the number of effects a haptic device can play at the same time.

This is not supported on all platforms, but will always return a value.


    @param haptic the SDL_Haptic device to query maximum playing effects.

    @return the number of effects the haptic device can play at the same time
or -1 on failure; call SDL_GetError() for more information.*)

val get_features : haptic -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetHapticFeatures}SDL_GetHapticFeatures}: Get the haptic device's supported features in bitwise manner.


    @param haptic the SDL_Haptic device to query.

    @return a list of supported haptic features in bitwise manner (OR'd), or 0
on failure; call SDL_GetError() for more information.*)

val get_num_axes : haptic -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetNumHapticAxes}SDL_GetNumHapticAxes}: Get the number of haptic axes the device has.

The number of haptic axes might be useful if working with the
SDL_HapticDirection effect.


    @param haptic the SDL_Haptic device to query.

    @return the number of axes on success or -1 on failure; call
SDL_GetError() for more information.*)

val effect_supported : haptic -> haptic_effect Ctypes.ptr -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_HapticEffectSupported}SDL_HapticEffectSupported}: Check to see if an effect is supported by a haptic device.


    @param haptic the SDL_Haptic device to query.
    @param effect the desired effect to query.*)

val create_effect : haptic -> haptic_effect Ctypes.ptr -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateHapticEffect}SDL_CreateHapticEffect}: Create a new haptic effect on a specified device.


    @param haptic an SDL_Haptic device to create the effect on.
    @param effect an SDL_HapticEffect structure containing the properties of
the effect to create.

    @return the ID of the effect on success or -1 on failure; call
SDL_GetError() for more information.*)

val update_effect : haptic -> int -> haptic_effect Ctypes.ptr -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_UpdateHapticEffect}SDL_UpdateHapticEffect}: Update the properties of an effect.

Can be used dynamically, although behavior when dynamically changing
direction may be strange. Specifically the effect may re-upload itself and
start playing from the start. You also cannot change the type either when
running SDL_UpdateHapticEffect().


    @param haptic the SDL_Haptic device that has the effect.
    @param effect the identifier of the effect to update.
    @param data an SDL_HapticEffect structure containing the new effect
properties to use.*)

val run_effect : haptic -> int -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_RunHapticEffect}SDL_RunHapticEffect}: Run the haptic effect on its associated haptic device.

To repeat the effect over and over indefinitely, set[iterations]to[SDL_HAPTIC_INFINITY] (Repeats the envelope - attack and fade.) To make
one instance of the effect last indefinitely (so the effect does not fade),
set the effect's[length]in its structure/union to[SDL_HAPTIC_INFINITY]instead.


    @param haptic the SDL_Haptic device to run the effect on.
    @param effect the ID of the haptic effect to run.
    @param iterations the number of iterations to run the effect; use[SDL_HAPTIC_INFINITY]to repeat forever.*)

val stop_effect : haptic -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_StopHapticEffect}SDL_StopHapticEffect}: Stop the haptic effect on its associated haptic device.


    @param haptic the SDL_Haptic device to stop the effect on.
    @param effect the ID of the haptic effect to stop.*)

val destroy_effect : haptic -> int -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_DestroyHapticEffect}SDL_DestroyHapticEffect}: Destroy a haptic effect on the device.

This will stop the effect if it's running. Effects are automatically
destroyed when the device is closed.


    @param haptic the SDL_Haptic device to destroy the effect on.
    @param effect the ID of the haptic effect to destroy.
*)

val get_effect_status : haptic -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetHapticEffectStatus}SDL_GetHapticEffectStatus}: Get the status of the current effect on the specified haptic device.

Device must support the SDL_HAPTIC_STATUS feature.


    @param haptic the SDL_Haptic device to query for the effect status on.
    @param effect the ID of the haptic effect to query its status.*)

val set_gain : haptic -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetHapticGain}SDL_SetHapticGain}: Set the global gain of the specified haptic device.

Device must support the SDL_HAPTIC_GAIN feature.

The user may specify the maximum gain by setting the environment variable[SDL_HAPTIC_GAIN_MAX]which should be between 0 and 100. All calls to
SDL_SetHapticGain() will scale linearly using[SDL_HAPTIC_GAIN_MAX]as the
maximum.


    @param haptic the SDL_Haptic device to set the gain on.
    @param gain value to set the gain to, should be between 0 and 100 (0 -
100).*)

val set_autocenter : haptic -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetHapticAutocenter}SDL_SetHapticAutocenter}: Set the global autocenter of the device.

Autocenter should be between 0 and 100. Setting it to 0 will disable
autocentering.

Device must support the SDL_HAPTIC_AUTOCENTER feature.


    @param haptic the SDL_Haptic device to set autocentering on.
    @param autocenter value to set autocenter to (0-100).*)

val pause : haptic -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_PauseHaptic}SDL_PauseHaptic}: Pause a haptic device.

Device must support the[SDL_HAPTIC_PAUSE]feature. Call SDL_ResumeHaptic()
to resume playback.

Do not modify the effects nor add new ones while the device is paused. That
can cause all sorts of weird errors.


    @param haptic the SDL_Haptic device to pause.*)

val resume : haptic -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_ResumeHaptic}SDL_ResumeHaptic}: Resume a haptic device.

Call to unpause after SDL_PauseHaptic().


    @param haptic the SDL_Haptic device to unpause.*)

val stop_effects : haptic -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_StopHapticEffects}SDL_StopHapticEffects}: Stop all the currently playing effects on a haptic device.


    @param haptic the SDL_Haptic device to stop.*)

val rumble_supported : haptic -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_HapticRumbleSupported}SDL_HapticRumbleSupported}: Check whether rumble is supported on a haptic device.


    @param haptic haptic device to check for rumble support.*)

val init_rumble : haptic -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_InitHapticRumble}SDL_InitHapticRumble}: Initialize a haptic device for simple rumble playback.


    @param haptic the haptic device to initialize for simple rumble playback.*)

val play_rumble : haptic -> float -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_PlayHapticRumble}SDL_PlayHapticRumble}: Run a simple rumble effect on a haptic device.


    @param haptic the haptic device to play the rumble effect on.
    @param strength strength of the rumble to play as a 0-1 float value.
    @param length length of the rumble to play in milliseconds.*)

val stop_rumble : haptic -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_StopHapticRumble}SDL_StopHapticRumble}: Stop the simple rumble on a haptic device.


    @param haptic the haptic device to stop the rumble effect on.*)

end

module Joystick : sig

val is_haptic : joystick -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_IsJoystickHaptic}SDL_IsJoystickHaptic}: Query if a joystick has haptic features.


    @param joystick the SDL_Joystick to test for haptic capabilities.

    @return true if the joystick is haptic or false if it isn't.*)

end

