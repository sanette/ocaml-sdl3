(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Helpers
open Sdl3_types

let ff = Load.foreign

module Log = struct
let set_priorities = ff "SDL_SetLogPriorities"
  (log_priority @-> returning void)

let set_priority = ff "SDL_SetLogPriority"
  (int @-> log_priority @-> returning void)

let get_priority = ff "SDL_GetLogPriority"
  (int @-> returning log_priority)

let reset_priorities = ff "SDL_ResetLogPriorities"
  (void @-> returning void)

let set_priority_prefix = ff "SDL_SetLogPriorityPrefix"
  (log_priority @-> string @-> returning true_to_ok)

let get_default_output_function = ff "SDL_GetDefaultLogOutputFunction"
  (void @-> returning log_output_function)

let get_output_function = ff "SDL_GetLogOutputFunction"
  (ptr log_output_function @-> ptr (ptr void) @-> returning void)

let set_output_function = ff "SDL_SetLogOutputFunction"
  (log_output_function @-> ptr void @-> returning void)

end

