(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes

let ff = Load.foreign

module Global = struct
let get_platform = ff "SDL_GetPlatform"
  (void @-> returning string)

end
include Global

