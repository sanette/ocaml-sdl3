(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Sdl3_types
module Global : sig

val set_linux_thread_priority : int -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetLinuxThreadPriority}SDL_SetLinuxThreadPriority}: Sets the UNIX nice value for a thread.

This uses setpriority() if possible, and RealtimeKit if available.


    @param threadID the Unix thread ID to change priority of.
    @param priority the new, Unix-specific, priority value.*)

val set_linux_thread_priority_and_policy : int -> int -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetLinuxThreadPriorityAndPolicy}SDL_SetLinuxThreadPriorityAndPolicy}: Sets the priority (not nice level) and scheduling policy for a thread.

This uses setpriority() if possible, and RealtimeKit if available.


    @param threadID the Unix thread ID to change priority of.
    @param sdlPriority the new SDL_ThreadPriority value.
    @param schedPolicy the new scheduling policy (SCHED_FIFO, SCHED_RR,
SCHED_OTHER, etc...).*)

val is_tablet : unit -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_IsTablet}SDL_IsTablet}: Query if the current device is a tablet.

If SDL can't determine this, it will return false.


    @return true if the device is a tablet, false otherwise.*)

val is_tv : unit -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_IsTV}SDL_IsTV}: Query if the current device is a TV.

If SDL can't determine this, it will return false.


    @return true if the device is a TV, false otherwise.*)

val on_application_will_terminate : unit -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_OnApplicationWillTerminate}SDL_OnApplicationWillTerminate}: Let iOS apps with external event handling report
onApplicationWillTerminate.

This functions allows iOS apps that have their own event handling to hook
into SDL to generate SDL events. This maps directly to an iOS-specific
event, but since it doesn't do anything iOS-specific internally, it is
available on all platforms, in case it might be useful for some specific
paradigm. Most apps do not need to use this directly; SDL's internal event
code will handle all this for windows created by SDL_CreateWindow!
*)

val on_application_did_receive_memory_warning : unit -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_OnApplicationDidReceiveMemoryWarning}SDL_OnApplicationDidReceiveMemoryWarning}: Let iOS apps with external event handling report
onApplicationDidReceiveMemoryWarning.

This functions allows iOS apps that have their own event handling to hook
into SDL to generate SDL events. This maps directly to an iOS-specific
event, but since it doesn't do anything iOS-specific internally, it is
available on all platforms, in case it might be useful for some specific
paradigm. Most apps do not need to use this directly; SDL's internal event
code will handle all this for windows created by SDL_CreateWindow!
*)

val on_application_will_enter_background : unit -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_OnApplicationWillEnterBackground}SDL_OnApplicationWillEnterBackground}: Let iOS apps with external event handling report
onApplicationWillResignActive.

This functions allows iOS apps that have their own event handling to hook
into SDL to generate SDL events. This maps directly to an iOS-specific
event, but since it doesn't do anything iOS-specific internally, it is
available on all platforms, in case it might be useful for some specific
paradigm. Most apps do not need to use this directly; SDL's internal event
code will handle all this for windows created by SDL_CreateWindow!
*)

val on_application_did_enter_background : unit -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_OnApplicationDidEnterBackground}SDL_OnApplicationDidEnterBackground}: Let iOS apps with external event handling report
onApplicationDidEnterBackground.

This functions allows iOS apps that have their own event handling to hook
into SDL to generate SDL events. This maps directly to an iOS-specific
event, but since it doesn't do anything iOS-specific internally, it is
available on all platforms, in case it might be useful for some specific
paradigm. Most apps do not need to use this directly; SDL's internal event
code will handle all this for windows created by SDL_CreateWindow!
*)

val on_application_will_enter_foreground : unit -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_OnApplicationWillEnterForeground}SDL_OnApplicationWillEnterForeground}: Let iOS apps with external event handling report
onApplicationWillEnterForeground.

This functions allows iOS apps that have their own event handling to hook
into SDL to generate SDL events. This maps directly to an iOS-specific
event, but since it doesn't do anything iOS-specific internally, it is
available on all platforms, in case it might be useful for some specific
paradigm. Most apps do not need to use this directly; SDL's internal event
code will handle all this for windows created by SDL_CreateWindow!
*)

val on_application_did_enter_foreground : unit -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_OnApplicationDidEnterForeground}SDL_OnApplicationDidEnterForeground}: Let iOS apps with external event handling report
onApplicationDidBecomeActive.

This functions allows iOS apps that have their own event handling to hook
into SDL to generate SDL events. This maps directly to an iOS-specific
event, but since it doesn't do anything iOS-specific internally, it is
available on all platforms, in case it might be useful for some specific
paradigm. Most apps do not need to use this directly; SDL's internal event
code will handle all this for windows created by SDL_CreateWindow!
*)

end
include module type of Global

module Sandbox : sig

val get : unit -> sandbox_enum
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetSandbox}SDL_GetSandbox}: Get the application sandbox environment, if any.


    @return the application sandbox environment or SDL_SANDBOX_NONE if the
application is not running in a sandbox environment.*)

end

