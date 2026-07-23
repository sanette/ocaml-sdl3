(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Sdl3_types

let ff = Load.foreign

module PowerState = struct
let get_power_info = ff "SDL_GetPowerInfo"
  (ptr int @-> ptr int @-> returning power_state)
let get_power_info () =
  let seconds = allocate int 0 in
  let percent = allocate int 0 in
  let ret = get_power_info seconds percent in
(ret, !@ seconds, !@ percent)

end

