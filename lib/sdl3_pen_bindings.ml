(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Sdl3_types

let ff = Load.foreign

module Pen = struct
let get_device_type = ff "SDL_GetPenDeviceType"
  (pen_id @-> returning pen_device_type)
let get_device_type instance_id =
  get_device_type (Unsigned.UInt.of_int instance_id)

end

