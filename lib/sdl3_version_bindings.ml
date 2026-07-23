(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes

let ff = Load.foreign

module Global = struct
let get_version = ff "SDL_GetVersion"
  (void @-> returning int)

let get_revision = ff "SDL_GetRevision"
  (void @-> returning string)

end
include Global

