(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Sdl3_types
open Helpers

let ff = Load.foreign

module Global = struct
let try_lock_spinlock = ff "SDL_TryLockSpinlock"
  (ptr spin_lock @-> returning true_to_ok)

let lock_spinlock = ff "SDL_LockSpinlock"
  (ptr spin_lock @-> returning void)

let unlock_spinlock = ff "SDL_UnlockSpinlock"
  (ptr spin_lock @-> returning void)

let memory_barrier_release_function = ff "SDL_MemoryBarrierReleaseFunction"
  (void @-> returning void)

let memory_barrier_acquire_function = ff "SDL_MemoryBarrierAcquireFunction"
  (void @-> returning void)

let compare_and_swap_atomic_pointer = ff "SDL_CompareAndSwapAtomicPointer"
  (ptr (ptr void) @-> ptr void @-> ptr void @-> returning true_to_ok)

let set_atomic_pointer = ff "SDL_SetAtomicPointer"
  (ptr (ptr void) @-> ptr void @-> returning (ptr void))

let get_atomic_pointer = ff "SDL_GetAtomicPointer"
  (ptr (ptr void) @-> returning (ptr void))

end
include Global

module AtomicInt = struct
let compare_and_swap = ff "SDL_CompareAndSwapAtomicInt"
  (ptr atomic_int @-> int @-> int @-> returning true_to_ok)

let set = ff "SDL_SetAtomicInt"
  (ptr atomic_int @-> int @-> returning int)

let get = ff "SDL_GetAtomicInt"
  (ptr atomic_int @-> returning int)

let add = ff "SDL_AddAtomicInt"
  (ptr atomic_int @-> int @-> returning int)

end

module AtomicU32 = struct
let compare_and_swap = ff "SDL_CompareAndSwapAtomicU32"
  (ptr atomic_u32 @-> uint32 @-> uint32 @-> returning true_to_ok)
let compare_and_swap a oldval newval =
  compare_and_swap a (Unsigned.UInt.of_int oldval) (Unsigned.UInt.of_int newval)

let set = ff "SDL_SetAtomicU32"
  (ptr atomic_u32 @-> uint32 @-> returning uint32)
let set a v =
  set a (Unsigned.UInt.of_int v)

let get = ff "SDL_GetAtomicU32"
  (ptr atomic_u32 @-> returning uint32)

let add = ff "SDL_AddAtomicU32"
  (ptr atomic_u32 @-> int @-> returning uint32)

include AtomicU32

end

