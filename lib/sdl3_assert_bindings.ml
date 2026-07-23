(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Sdl3_types

let ff = Load.foreign

module AssertState = struct
let report_assertion = ff "SDL_ReportAssertion"
  (ptr assert_data @-> string @-> string @-> int @-> returning assert_state)

end

module Global = struct
let set_assertion_handler = ff "SDL_SetAssertionHandler"
  (assertion_handler @-> ptr void @-> returning void)

let get_default_assertion_handler = ff "SDL_GetDefaultAssertionHandler"
  (void @-> returning assertion_handler)

let get_assertion_handler = ff "SDL_GetAssertionHandler"
  (ptr (ptr void) @-> returning assertion_handler)

let reset_assertion_report = ff "SDL_ResetAssertionReport"
  (void @-> returning void)

end
include Global

module AssertData = struct
let get_assertion_report = ff "SDL_GetAssertionReport"
  (void @-> returning (ptr assert_data))

include AssertData

end

