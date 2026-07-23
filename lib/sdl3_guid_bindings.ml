(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Sdl3_types

let ff = Load.foreign

module GUID = struct
let to_string = ff "SDL_GUIDToString"
  (guid @-> string @-> int @-> returning void)

let string_to = ff "SDL_StringToGUID"
  (string @-> returning guid)

end

