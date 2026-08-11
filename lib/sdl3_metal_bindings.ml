(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Sdl3_types

let ff = Load.foreign

module Metal = struct
let _create_view = ff "SDL_Metal_CreateView"
  (window @-> returning metal_view)

let _destroy_view = ff "SDL_Metal_DestroyView"
  (metal_view @-> returning void)

let _get_layer = ff "SDL_Metal_GetLayer"
  (metal_view @-> returning (ptr void))

end

