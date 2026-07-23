(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Helpers

let ff = Load.foreign

module Global = struct
let open_url = ff "SDL_OpenURL"
  (string @-> returning true_to_ok)

end
include Global

