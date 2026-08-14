(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Helpers
open Sdl3_types

let ff = Load.foreign

module Hint = struct
let set_with_priority = ff "SDL_SetHintWithPriority"
  (string @-> string @-> hint_priority @-> returning true_to_ok)

let set = ff "SDL_SetHint"
  (string @-> string @-> returning true_to_ok)

let reset = ff "SDL_ResetHint"
  (string @-> returning true_to_ok)

let resets = ff "SDL_ResetHints"
  (void @-> returning void)

let get = ff "SDL_GetHint"
  (string @-> returning string)

let get_boolean = ff "SDL_GetHintBoolean"
  (string @-> bool @-> returning true_to_ok)

let add_callback = ff "SDL_AddHintCallback"
  (string @-> hint_callback @-> ptr void @-> returning true_to_ok)

let remove_callback = ff "SDL_RemoveHintCallback"
  (string @-> hint_callback @-> ptr void @-> returning void)

end

