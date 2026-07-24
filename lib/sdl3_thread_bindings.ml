(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Helpers
open Sdl3_types

let ff = Load.foreign

module Thread = struct
let create_runtime = ff "SDL_CreateThreadRuntime"
  (thread_function @-> string @-> ptr void @-> function_pointer @-> function_pointer @-> returning (some_to_ok thread_opt))

let create_with_properties_runtime = ff "SDL_CreateThreadWithPropertiesRuntime"
  (properties_id @-> function_pointer @-> function_pointer @-> returning (some_to_ok thread_opt))
let create_with_properties_runtime props pfn_begin_thread pfn_end_thread =
  create_with_properties_runtime (Unsigned.UInt.of_int props) pfn_begin_thread pfn_end_thread

let get_name = ff "SDL_GetThreadName"
  (thread @-> returning string)

let get_id = ff "SDL_GetThreadID"
  (thread @-> returning thread_id)

let wait = ff "SDL_WaitThread"
  (thread @-> ptr int @-> returning void)
let wait thread =
  let status = allocate int 0 in
  wait thread status;
  (!@ status)

let get_state = ff "SDL_GetThreadState"
  (thread @-> returning thread_state)

let detach = ff "SDL_DetachThread"
  (thread @-> returning void)

end

module Global = struct
let get_current_thread_id = ff "SDL_GetCurrentThreadID"
  (void @-> returning thread_id)

let cleanup_tls = ff "SDL_CleanupTLS"
  (void @-> returning void)

end
include Global

module ThreadPriority = struct
let set_current = ff "SDL_SetCurrentThreadPriority"
  (thread_priority @-> returning true_to_ok)

end

module AtomicInt = struct
let get_tls = ff "SDL_GetTLS"
  (ptr tlsid @-> returning (ptr void))

let set_tls = ff "SDL_SetTLS"
  (ptr tlsid @-> ptr void @-> tls_destructor_callback @-> returning true_to_ok)

end

