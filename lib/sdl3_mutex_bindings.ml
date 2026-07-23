(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Sdl3_types
open Helpers

let ff = Load.foreign

module Mutex = struct
let create = ff "SDL_CreateMutex"
  (void @-> returning (some_to_ok mutex_opt))

let lock = ff "SDL_LockMutex"
  (mutex @-> returning void)

let try_lock = ff "SDL_TryLockMutex"
  (mutex @-> returning true_to_ok)

let unlock = ff "SDL_UnlockMutex"
  (mutex @-> returning void)

let destroy = ff "SDL_DestroyMutex"
  (mutex @-> returning void)

end

module RWLock = struct
let create = ff "SDL_CreateRWLock"
  (void @-> returning (some_to_ok rw_lock_opt))

let lock_for_reading = ff "SDL_LockRWLockForReading"
  (rw_lock @-> returning void)

let lock_for_writing = ff "SDL_LockRWLockForWriting"
  (rw_lock @-> returning void)

let try_lock_for_reading = ff "SDL_TryLockRWLockForReading"
  (rw_lock @-> returning true_to_ok)

let try_lock_for_writing = ff "SDL_TryLockRWLockForWriting"
  (rw_lock @-> returning true_to_ok)

let unlock = ff "SDL_UnlockRWLock"
  (rw_lock @-> returning void)

let destroy = ff "SDL_DestroyRWLock"
  (rw_lock @-> returning void)

end

module Semaphore = struct
let create = ff "SDL_CreateSemaphore"
  (uint32 @-> returning (some_to_ok semaphore_opt))
let create initial_value =
  create (Unsigned.UInt.of_int initial_value)

let destroy = ff "SDL_DestroySemaphore"
  (semaphore @-> returning void)

let wait = ff "SDL_WaitSemaphore"
  (semaphore @-> returning void)

let try_wait = ff "SDL_TryWaitSemaphore"
  (semaphore @-> returning true_to_ok)

let wait_timeout = ff "SDL_WaitSemaphoreTimeout"
  (semaphore @-> sint32 @-> returning true_to_ok)

let signal = ff "SDL_SignalSemaphore"
  (semaphore @-> returning void)

let get_value = ff "SDL_GetSemaphoreValue"
  (semaphore @-> returning uint32)

end

module Condition = struct
let create = ff "SDL_CreateCondition"
  (void @-> returning (some_to_ok condition_opt))

let destroy = ff "SDL_DestroyCondition"
  (condition @-> returning void)

let signal = ff "SDL_SignalCondition"
  (condition @-> returning void)

let broadcast = ff "SDL_BroadcastCondition"
  (condition @-> returning void)

let wait = ff "SDL_WaitCondition"
  (condition @-> mutex @-> returning void)

let wait_timeout = ff "SDL_WaitConditionTimeout"
  (condition @-> mutex @-> sint32 @-> returning true_to_ok)

end

module InitState = struct
let should_init = ff "SDL_ShouldInit"
  (ptr init_state @-> returning true_to_ok)

let should_quit = ff "SDL_ShouldQuit"
  (ptr init_state @-> returning true_to_ok)

let set_initialized = ff "SDL_SetInitialized"
  (ptr init_state @-> bool @-> returning void)

include InitState

end

