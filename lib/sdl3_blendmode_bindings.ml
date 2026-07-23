(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Sdl3_types

let ff = Load.foreign

module BlendFactor = struct
let compose_custom_blend_mode = ff "SDL_ComposeCustomBlendMode"
  (blend_factor @-> blend_factor @-> blend_operation @-> blend_factor @-> blend_factor @-> blend_operation @-> returning blend_mode)

end

