(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Sdl3_types
module Global : sig

val get_ticks : unit -> int64
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetTicks}SDL_GetTicks}: Get the number of milliseconds that have elapsed since the SDL library
initialization.


    @return an unsigned 64‑bit integer that represents the number of
milliseconds that have elapsed since the SDL library was
initialized (typically via a call to SDL_Init).*)

val get_ticks_ns : unit -> int64
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetTicksNS}SDL_GetTicksNS}: Get the number of nanoseconds since SDL library initialization.


    @return an unsigned 64-bit value representing the number of nanoseconds
since the SDL library initialized.*)

val get_performance_counter : unit -> int64
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetPerformanceCounter}SDL_GetPerformanceCounter}: Get the current value of the high resolution counter.

This function is typically used for profiling.

The counter values are only meaningful relative to each other. Differences
between values can be converted to times by using
SDL_GetPerformanceFrequency().


    @return the current counter value.*)

val get_performance_frequency : unit -> int64
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetPerformanceFrequency}SDL_GetPerformanceFrequency}: Get the count per second of the high resolution counter.


    @return a platform-specific count per second.*)

val delay : int -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_Delay}SDL_Delay}: Wait a specified number of milliseconds before returning.

This function waits a specified number of milliseconds before returning. It
waits at least the specified time, but possibly longer due to OS
scheduling.


    @param ms the number of milliseconds to delay.
*)

val delay_ns : int64 -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_DelayNS}SDL_DelayNS}: Wait a specified number of nanoseconds before returning.

This function waits a specified number of nanoseconds before returning. It
waits at least the specified time, but possibly longer due to OS
scheduling.


    @param ns the number of nanoseconds to delay.
*)

val delay_precise : int64 -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_DelayPrecise}SDL_DelayPrecise}: Wait a specified number of nanoseconds before returning.

This function waits a specified number of nanoseconds before returning. It
will attempt to wait as close to the requested time as possible, busy
waiting if necessary, but could return later due to OS scheduling.


    @param ns the number of nanoseconds to delay.
*)

end
include module type of Global

module Timer : sig

val add : int -> timer_callback -> data -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_AddTimer}SDL_AddTimer}: Call a callback function at a future time.

The callback function is passed the current timer interval and the user
supplied parameter from the SDL_AddTimer() call and should return the next
timer interval. If the value returned from the callback is 0, the timer is
canceled and will be removed.

The callback is run on a separate thread, and for short timeouts can
potentially be called before this function returns.

Timers take into account the amount of time it took to execute the
callback. For example, if the callback took 250 ms to execute and returned
1000 (ms), the timer would only wait another 750 ms before its next
iteration.

Timing may be inexact due to OS scheduling. Be sure to note the current
time with SDL_GetTicksNS() or SDL_GetPerformanceCounter() in case your
callback needs to adjust for variances.


    @param interval the timer delay, in milliseconds, passed to[callback]
    @param callback the SDL_TimerCallback function to call when the specified[interval]elapses.
    @param userdata a pointer that is passed to[callback]

    @return a timer ID or 0 on failure; call SDL_GetError() for more
information.*)

val add_ns : int64 -> ns_timer_callback -> data -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_AddTimerNS}SDL_AddTimerNS}: Call a callback function at a future time.

The callback function is passed the current timer interval and the user
supplied parameter from the SDL_AddTimerNS() call and should return the
next timer interval. If the value returned from the callback is 0, the
timer is canceled and will be removed.

The callback is run on a separate thread, and for short timeouts can
potentially be called before this function returns.

Timers take into account the amount of time it took to execute the
callback. For example, if the callback took 250 ns to execute and returned
1000 (ns), the timer would only wait another 750 ns before its next
iteration.

Timing may be inexact due to OS scheduling. Be sure to note the current
time with SDL_GetTicksNS() or SDL_GetPerformanceCounter() in case your
callback needs to adjust for variances.


    @param interval the timer delay, in nanoseconds, passed to[callback]
    @param callback the SDL_TimerCallback function to call when the specified[interval]elapses.
    @param userdata a pointer that is passed to[callback]

    @return a timer ID or 0 on failure; call SDL_GetError() for more
information.*)

val remove : int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_RemoveTimer}SDL_RemoveTimer}: Remove a timer created with SDL_AddTimer().


    @param id the ID of the timer to remove.*)

end

