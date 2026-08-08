(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Sdl3_types
open Helpers

let ff = Load.foreign

module SharedObject = struct
let load_object = ff "SDL_LoadObject"
  (string @-> returning (some_to_ok shared_object_opt))

let load_function = ff "SDL_LoadFunction"
  (shared_object @-> string @-> returning function_pointer)

let unload_object = ff "SDL_UnloadObject"
  (shared_object @-> returning void)

end

