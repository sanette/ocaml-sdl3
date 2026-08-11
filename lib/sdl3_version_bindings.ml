(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes

let ff = Load.foreign

module Version = struct
let get = ff "SDL_GetVersion"
  (void @-> returning int)

end

module Global = struct
let get_revision = ff "SDL_GetRevision"
  (void @-> returning string)

end
include Global

