(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Sdl3_types
module Pen : sig

val get_device_type : int -> pen_device_type_enum
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetPenDeviceType}SDL_GetPenDeviceType}: Get the device type of the given pen.

Many platforms do not supply this information, so an app must always be
prepared to get an SDL_PEN_DEVICE_TYPE_UNKNOWN result.


    @param instance_id the pen instance ID.

    @return the device type of the given pen, or SDL_PEN_DEVICE_TYPE_INVALID
on failure; call SDL_GetError() for more information.*)

end

