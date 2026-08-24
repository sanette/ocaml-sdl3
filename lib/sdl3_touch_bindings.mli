(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Sdl3_types
module Touch : sig

val get_devices : unit -> int64 list
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetTouchDevices}SDL_GetTouchDevices}: Get a list of registered touch devices.

On some platforms SDL first sees the touch device if it was actually used.
Therefore the returned list might be empty, although devices are available.
After using all devices at least once the number will be correct.


    @return a list of touch device IDs, may be empty on failure; call
SDL_GetError() for more information. This should be freed with
SDL_free() when it is no longer needed.*)

val get_device_name : int64 -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetTouchDeviceName}SDL_GetTouchDeviceName}: Get the touch device name as reported from the driver.


    @param touchID the touch device instance ID.

    @return touch device name, or NULL on failure; call SDL_GetError() for
more information.*)

val get_device_type : int64 -> touch_device_type_enum
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetTouchDeviceType}SDL_GetTouchDeviceType}: Get the type of the given touch device.


    @param touchID the ID of a touch device.

    @return touch device type.*)

val get_fingers : int64 -> (finger Ctypes.ptr) list
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetTouchFingers}SDL_GetTouchFingers}: Get a list of active fingers for a given touch device.


    @param touchID the ID of a touch device.

    @return a list of SDL_Finger pointers, may be empty on failure;
call SDL_GetError() for more information. This is a single
allocation that should be freed with SDL_free() when it is no
longer needed.*)

end

