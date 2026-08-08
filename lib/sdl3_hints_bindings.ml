(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Sdl3_types
open Helpers

let ff = Load.foreign

module Global = struct
let set_hint_with_priority = ff "SDL_SetHintWithPriority"
  (string @-> string @-> hint_priority @-> returning true_to_ok)

let set_hint = ff "SDL_SetHint"
  (string @-> string @-> returning true_to_ok)

let reset_hint = ff "SDL_ResetHint"
  (string @-> returning true_to_ok)

let reset_hints = ff "SDL_ResetHints"
  (void @-> returning void)

let get_hint = ff "SDL_GetHint"
  (string @-> returning string)

let get_hint_boolean = ff "SDL_GetHintBoolean"
  (string @-> bool @-> returning true_to_ok)

let add_hint_callback = ff "SDL_AddHintCallback"
  (string @-> hint_callback @-> ptr void @-> returning true_to_ok)

let remove_hint_callback = ff "SDL_RemoveHintCallback"
  (string @-> hint_callback @-> ptr void @-> returning void)

end
include Global

