(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Sdl3_types

let ff = Load.foreign

module Assertion = struct
let report = ff "SDL_ReportAssertion"
  (ptr assert_data @-> string @-> string @-> int @-> returning assert_state)

let set_handler = ff "SDL_SetAssertionHandler"
  (assertion_handler_opt @-> ptr void @-> returning void)

let get_default_handler = ff "SDL_GetDefaultAssertionHandler"
  (void @-> returning assertion_handler)

let get_handler = ff "SDL_GetAssertionHandler"
  (ptr (ptr void) @-> returning assertion_handler)

let get_report = ff "SDL_GetAssertionReport"
  (void @-> returning (ptr assert_data))

let reset_report = ff "SDL_ResetAssertionReport"
  (void @-> returning void)

end

