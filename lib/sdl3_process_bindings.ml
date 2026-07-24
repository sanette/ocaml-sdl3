(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Helpers
open Sdl3_types

let ff = Load.foreign

module Process = struct
let create = ff "SDL_CreateProcess"
  (ptr string @-> bool @-> returning (some_to_ok process_opt))

let create_with_properties = ff "SDL_CreateProcessWithProperties"
  (properties_id @-> returning (some_to_ok process_opt))
let create_with_properties props =
  create_with_properties (Unsigned.UInt.of_int props)

let get_properties = ff "SDL_GetProcessProperties"
  (process @-> returning properties_id)

let read = ff "SDL_ReadProcess"
  (process @-> ptr size_t @-> ptr int @-> returning (ptr void))
let read process datasize =
  let exitcode = allocate int 0 in
  let ret = read process datasize exitcode in
(ret, !@ exitcode)

let get_input = ff "SDL_GetProcessInput"
  (process @-> returning (some_to_ok io_stream_opt))

let get_output = ff "SDL_GetProcessOutput"
  (process @-> returning (some_to_ok io_stream_opt))

let kill = ff "SDL_KillProcess"
  (process @-> bool @-> returning true_to_ok)

let wait = ff "SDL_WaitProcess"
  (process @-> bool @-> ptr int @-> returning bool)
let wait process block =
  let exitcode = allocate int 0 in
  if wait process block exitcode then Ok (!@ exitcode) else error ()

let destroy = ff "SDL_DestroyProcess"
  (process @-> returning void)

end

