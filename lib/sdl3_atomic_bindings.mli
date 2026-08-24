(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Sdl3_types
module Global : sig

val try_lock_spinlock : int Ctypes.ptr -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_TryLockSpinlock}SDL_TryLockSpinlock}: Try to lock a spin lock by setting it to a non-zero value.

{e {b Please note that spinlocks are dangerous if you don't know what you're
doing. Please be careful using any sort of spinlock!}}


    @param lock a pointer to a lock variable.*)

val lock_spinlock : int Ctypes.ptr -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_LockSpinlock}SDL_LockSpinlock}: Lock a spin lock by setting it to a non-zero value.

{e {b Please note that spinlocks are dangerous if you don't know what you're
doing. Please be careful using any sort of spinlock!}}


    @param lock a pointer to a lock variable.
*)

val unlock_spinlock : int Ctypes.ptr -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_UnlockSpinlock}SDL_UnlockSpinlock}: Unlock a spin lock by setting it to 0.

Always returns immediately.

{e {b Please note that spinlocks are dangerous if you don't know what you're
doing. Please be careful using any sort of spinlock!}}


    @param lock a pointer to a lock variable.
*)

val memory_barrier_release_function : unit -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_MemoryBarrierReleaseFunction}SDL_MemoryBarrierReleaseFunction}: Insert a memory release barrier (function version).

Please refer to SDL_MemoryBarrierRelease for details. This is a function
version, which might be useful if you need to use this functionality from a
scripting language, etc. Also, some of the macro versions call this
function behind the scenes, where more heavy lifting can happen inside of
SDL. Generally, though, an app written in C/C++/etc should use the macro
version, as it will be more efficient.
*)

val memory_barrier_acquire_function : unit -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_MemoryBarrierAcquireFunction}SDL_MemoryBarrierAcquireFunction}: Insert a memory acquire barrier (function version).

Please refer to SDL_MemoryBarrierRelease for details. This is a function
version, which might be useful if you need to use this functionality from a
scripting language, etc. Also, some of the macro versions call this
function behind the scenes, where more heavy lifting can happen inside of
SDL. Generally, though, an app written in C/C++/etc should use the macro
version, as it will be more efficient.
*)

end
include module type of Global

module AtomicInt : sig

val compare_and_swap : atomic_int -> int -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CompareAndSwapAtomicInt}SDL_CompareAndSwapAtomicInt}: Set an atomic variable to a new value if it is currently an old value.

{e {b Note: If you don't know what this function is for, you shouldn't use
it!}}


    @param a a pointer to an SDL_AtomicInt variable to be modified.
    @param oldval the old value.
    @param newval the new value.*)

val set : atomic_int -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetAtomicInt}SDL_SetAtomicInt}: Set an atomic variable to a value.

This function also acts as a full memory barrier.

{e {b Note: If you don't know what this function is for, you shouldn't use
it!}}


    @param a a pointer to an SDL_AtomicInt variable to be modified.
    @param v the desired value.

    @return the previous value of the atomic variable.*)

val get : atomic_int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetAtomicInt}SDL_GetAtomicInt}: Get the value of an atomic variable.

{e {b Note: If you don't know what this function is for, you shouldn't use
it!}}


    @param a a pointer to an SDL_AtomicInt variable.

    @return the current value of an atomic variable.*)

val add : atomic_int -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_AddAtomicInt}SDL_AddAtomicInt}: Add to an atomic variable.

This function also acts as a full memory barrier.

{e {b Note: If you don't know what this function is for, you shouldn't use
it!}}


    @param a a pointer to an SDL_AtomicInt variable to be modified.
    @param v the desired value to add.

    @return the previous value of the atomic variable.*)

include module type of AtomicInt

end

module AtomicU32 : sig

val compare_and_swap : atomic_u32 -> int -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CompareAndSwapAtomicU32}SDL_CompareAndSwapAtomicU32}: Set an atomic variable to a new value if it is currently an old value.

{e {b Note: If you don't know what this function is for, you shouldn't use
it!}}


    @param a a pointer to an SDL_AtomicU32 variable to be modified.
    @param oldval the old value.
    @param newval the new value.*)

val set : atomic_u32 -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetAtomicU32}SDL_SetAtomicU32}: Set an atomic variable to a value.

This function also acts as a full memory barrier.

{e {b Note: If you don't know what this function is for, you shouldn't use
it!}}


    @param a a pointer to an SDL_AtomicU32 variable to be modified.
    @param v the desired value.

    @return the previous value of the atomic variable.*)

val get : atomic_u32 -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetAtomicU32}SDL_GetAtomicU32}: Get the value of an atomic variable.

{e {b Note: If you don't know what this function is for, you shouldn't use
it!}}


    @param a a pointer to an SDL_AtomicU32 variable.

    @return the current value of an atomic variable.*)

val add : atomic_u32 -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_AddAtomicU32}SDL_AddAtomicU32}: Add to an atomic variable.

This function also acts as a full memory barrier.

{e {b Note: If you don't know what this function is for, you shouldn't use
it!}}


    @param a a pointer to an SDL_AtomicU32 variable to be modified.
    @param v the desired value to add or subtract.

    @return the previous value of the atomic variable.*)

include module type of AtomicU32

end

module Atomic : sig

val compare_and_swap_pointer : data Ctypes.ptr -> data -> data -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CompareAndSwapAtomicPointer}SDL_CompareAndSwapAtomicPointer}: Set a pointer to a new value if it is currently an old value.

{e {b Note: If you don't know what this function is for, you shouldn't use
it!}}


    @param a a pointer to a pointer.
    @param oldval the old pointer value.
    @param newval the new pointer value.*)

val set_pointer : data Ctypes.ptr -> data -> data
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetAtomicPointer}SDL_SetAtomicPointer}: Set a pointer to a value atomically.

{e {b Note: If you don't know what this function is for, you shouldn't use
it!}}


    @param a a pointer to a pointer.
    @param v the desired pointer value.

    @return the previous value of the pointer.*)

val get_pointer : data Ctypes.ptr -> data
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetAtomicPointer}SDL_GetAtomicPointer}: Get the value of a pointer atomically.

{e {b Note: If you don't know what this function is for, you shouldn't use
it!}}


    @param a a pointer to a pointer.

    @return the current value of a pointer.*)

end

