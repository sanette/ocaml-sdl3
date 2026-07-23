(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Sdl3_types
open Helpers

let ff = Load.foreign

module Global = struct
let init = ff "SDL_Init"
  (init_flags @-> returning true_to_ok)
let init flags =
  init (Unsigned.UInt.of_int flags)

let init_sub_system = ff "SDL_InitSubSystem"
  (init_flags @-> returning true_to_ok)
let init_sub_system flags =
  init_sub_system (Unsigned.UInt.of_int flags)

let quit_sub_system = ff "SDL_QuitSubSystem"
  (init_flags @-> returning void)
let quit_sub_system flags =
  quit_sub_system (Unsigned.UInt.of_int flags)

let was_init = ff "SDL_WasInit"
  (init_flags @-> returning init_flags)
let was_init flags =
  was_init (Unsigned.UInt.of_int flags)

let quit = ff "SDL_Quit"
  (void @-> returning void)

let is_main_thread = ff "SDL_IsMainThread"
  (void @-> returning bool)

let run_on_main_thread = ff "SDL_RunOnMainThread"
  (main_thread_callback @-> ptr void @-> bool @-> returning true_to_ok)

let set_app_metadata = ff "SDL_SetAppMetadata"
  (string @-> string @-> string @-> returning true_to_ok)

let set_app_metadata_property = ff "SDL_SetAppMetadataProperty"
  (string @-> string @-> returning true_to_ok)

let get_app_metadata_property = ff "SDL_GetAppMetadataProperty"
  (string @-> returning string)

end
include Global

