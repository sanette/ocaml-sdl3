(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Sdl3_types
open Helpers

let ff = Load.foreign

module LogPriority = struct
let set_log_priorities = ff "SDL_SetLogPriorities"
  (log_priority @-> returning void)

let get = ff "SDL_GetLogPriority"
  (int @-> returning log_priority)

let set_prefix = ff "SDL_SetLogPriorityPrefix"
  (log_priority @-> string @-> returning true_to_ok)

end

module Global = struct
let set_log_priority = ff "SDL_SetLogPriority"
  (int @-> log_priority @-> returning void)

let reset_log_priorities = ff "SDL_ResetLogPriorities"
  (void @-> returning void)

let get_default_log_output_function = ff "SDL_GetDefaultLogOutputFunction"
  (void @-> returning log_output_function)

let get_log_output_function = ff "SDL_GetLogOutputFunction"
  (ptr log_output_function @-> ptr (ptr void) @-> returning void)

let set_log_output_function = ff "SDL_SetLogOutputFunction"
  (log_output_function @-> ptr void @-> returning void)

end
include Global

