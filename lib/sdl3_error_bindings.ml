(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes

let ff = Load.foreign

module Global = struct
let out_of_memory = ff "SDL_OutOfMemory"
  (void @-> returning bool)

end
include Global

module Error = struct
let get = ff "SDL_GetError"
  (void @-> returning string)

let clear = ff "SDL_ClearError"
  (void @-> returning bool)

end

