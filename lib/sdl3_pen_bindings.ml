(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Sdl3_types

let ff = Load.foreign

module PenDeviceType = struct
let get = ff "SDL_GetPenDeviceType"
  (pen_id @-> returning pen_device_type)
let get instance_id =
  get (Unsigned.UInt.of_int instance_id)

end

