(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Sdl3_types
open Helpers

let ff = Load.foreign

module Global = struct
let get_ticks = ff "SDL_GetTicks"
  (void @-> returning uint64)

let get_ticks_ns = ff "SDL_GetTicksNS"
  (void @-> returning uint64)

let get_performance_counter = ff "SDL_GetPerformanceCounter"
  (void @-> returning uint64)

let get_performance_frequency = ff "SDL_GetPerformanceFrequency"
  (void @-> returning uint64)

let delay = ff "SDL_Delay"
  (uint32 @-> returning void)
let delay ms =
  delay (Unsigned.UInt.of_int ms)

let delay_ns = ff "SDL_DelayNS"
  (uint64 @-> returning void)
let delay_ns ns =
  delay_ns (Unsigned.ULong.of_int64 ns)

let delay_precise = ff "SDL_DelayPrecise"
  (uint64 @-> returning void)
let delay_precise ns =
  delay_precise (Unsigned.ULong.of_int64 ns)

let add_timer = ff "SDL_AddTimer"
  (uint32 @-> timer_callback @-> ptr void @-> returning timer_id)
let add_timer interval callback userdata =
  add_timer (Unsigned.UInt.of_int interval) callback userdata

let add_timer_ns = ff "SDL_AddTimerNS"
  (uint64 @-> ns_timer_callback @-> ptr void @-> returning timer_id)
let add_timer_ns interval callback userdata =
  add_timer_ns (Unsigned.ULong.of_int64 interval) callback userdata

let remove_timer = ff "SDL_RemoveTimer"
  (timer_id @-> returning true_to_ok)
let remove_timer id =
  remove_timer (Unsigned.UInt.of_int id)

end
include Global

