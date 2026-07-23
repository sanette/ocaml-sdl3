(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Sdl3_types
open Helpers

let ff = Load.foreign

module Global = struct
let set_linux_thread_priority = ff "SDL_SetLinuxThreadPriority"
  (sint64 @-> int @-> returning true_to_ok)
let set_linux_thread_priority thread_id priority =
  set_linux_thread_priority (Signed.Long.of_int thread_id) priority

let set_linux_thread_priority_and_policy = ff "SDL_SetLinuxThreadPriorityAndPolicy"
  (sint64 @-> int @-> int @-> returning true_to_ok)
let set_linux_thread_priority_and_policy thread_id sdl_priority sched_policy =
  set_linux_thread_priority_and_policy (Signed.Long.of_int thread_id) sdl_priority sched_policy

let is_tablet = ff "SDL_IsTablet"
  (void @-> returning bool)

let is_tv = ff "SDL_IsTV"
  (void @-> returning bool)

let on_application_will_terminate = ff "SDL_OnApplicationWillTerminate"
  (void @-> returning void)

let on_application_did_receive_memory_warning = ff "SDL_OnApplicationDidReceiveMemoryWarning"
  (void @-> returning void)

let on_application_will_enter_background = ff "SDL_OnApplicationWillEnterBackground"
  (void @-> returning void)

let on_application_did_enter_background = ff "SDL_OnApplicationDidEnterBackground"
  (void @-> returning void)

let on_application_will_enter_foreground = ff "SDL_OnApplicationWillEnterForeground"
  (void @-> returning void)

let on_application_did_enter_foreground = ff "SDL_OnApplicationDidEnterForeground"
  (void @-> returning void)

end
include Global

module Sandbox = struct
let get = ff "SDL_GetSandbox"
  (void @-> returning sandbox)

end

