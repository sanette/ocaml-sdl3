(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Sdl3_types
module Mutex : sig

val create : unit -> mutex result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateMutex}SDL_CreateMutex}: Create a new mutex.

All newly-created mutexes begin in the _unlocked_ state.

Calls to SDL_LockMutex() will not return while the mutex is locked by
another thread. See SDL_TryLockMutex() to attempt to lock without blocking.

SDL mutexes are reentrant.


    @return the initialized and unlocked mutex or [Error] on failure; call
SDL_GetError() for more information.*)

val lock : mutex -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_LockMutex}SDL_LockMutex}: Lock the mutex.

This will block until the mutex is available, which is to say it is in the
unlocked state and the OS has chosen the caller as the next thread to lock
it. Of all threads waiting to lock the mutex, only one may do so at a time.

It is legal for the owning thread to lock an already-locked mutex. It must
unlock it the same number of times before it is actually made available for
other threads in the system (this is known as a "recursive mutex").

This function does not fail; if mutex is NULL, it will return immediately
having locked nothing. If the mutex is valid, this function will always
block until it can lock the mutex, and return with it locked.


    @param mutex the mutex to lock.
*)

val try_lock : mutex -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_TryLockMutex}SDL_TryLockMutex}: Try to lock a mutex without blocking.

This works just like SDL_LockMutex(), but if the mutex is not available,
this function returns false immediately.

This technique is useful if you need exclusive access to a resource but
don't want to wait for it, and will return to it to try again later.

This function returns true if passed a NULL mutex.


    @param mutex the mutex to try to lock.*)

val unlock : mutex -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_UnlockMutex}SDL_UnlockMutex}: Unlock the mutex.

It is legal for the owning thread to lock an already-locked mutex. It must
unlock it the same number of times before it is actually made available for
other threads in the system (this is known as a "recursive mutex").

It is illegal to unlock a mutex that has not been locked by the current
thread, and doing so results in undefined behavior.


    @param mutex the mutex to unlock.
*)

val destroy : mutex -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_DestroyMutex}SDL_DestroyMutex}: Destroy a mutex created with SDL_CreateMutex().

This function must be called on any mutex that is no longer needed. Failure
to destroy a mutex will result in a system memory or resource leak. While
it is safe to destroy a mutex that is _unlocked_, it is not safe to attempt
to destroy a locked mutex, and may result in undefined behavior depending
on the platform.


    @param mutex the mutex to destroy.
*)

end

module RWLock : sig

val create : unit -> rw_lock result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateRWLock}SDL_CreateRWLock}: Create a new read/write lock.

A read/write lock is useful for situations where you have multiple threads
trying to access a resource that is rarely updated. All threads requesting
a read-only lock will be allowed to run in parallel; if a thread requests a
write lock, it will be provided exclusive access. This makes it safe for
multiple threads to use a resource at the same time if they promise not to
change it, and when it has to be changed, the rwlock will serve as a
gateway to make sure those changes can be made safely.

In the right situation, a rwlock can be more efficient than a mutex, which
only lets a single thread proceed at a time, even if it won't be modifying
the data.

All newly-created read/write locks begin in the _unlocked_ state.

Calls to SDL_LockRWLockForReading() and SDL_LockRWLockForWriting will not
return while the rwlock is locked _for writing_ by another thread. See
SDL_TryLockRWLockForReading() and SDL_TryLockRWLockForWriting() to attempt
to lock without blocking.

SDL read/write locks are only recursive for read-only locks! They are not
guaranteed to be fair, or provide access in a FIFO manner! They are not
guaranteed to favor writers. You may not lock a rwlock for both read-only
and write access at the same time from the same thread (so you can't
promote your read-only lock to a write lock without unlocking first).


    @return the initialized and unlocked read/write lock or [Error] on failure;
call SDL_GetError() for more information.*)

val lock_for_reading : rw_lock -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_LockRWLockForReading}SDL_LockRWLockForReading}: Lock the read/write lock for _read only_ operations.

This will block until the rwlock is available, which is to say it is not
locked for writing by any other thread. Of all threads waiting to lock the
rwlock, all may do so at the same time as long as they are requesting
read-only access; if a thread wants to lock for writing, only one may do so
at a time, and no other threads, read-only or not, may hold the lock at the
same time.

It is legal for the owning thread to lock an already-locked rwlock for
reading. It must unlock it the same number of times before it is actually
made available for other threads in the system (this is known as a
"recursive rwlock").

Note that locking for writing is not recursive (this is only available to
read-only locks).

It is illegal to request a read-only lock from a thread that already holds
the write lock. Doing so results in undefined behavior. Unlock the write
lock before requesting a read-only lock. (But, of course, if you have the
write lock, you don't need further locks to read in any case.)

This function does not fail; if rwlock is NULL, it will return immediately
having locked nothing. If the rwlock is valid, this function will always
block until it can lock the mutex, and return with it locked.


    @param rwlock the read/write lock to lock.
*)

val lock_for_writing : rw_lock -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_LockRWLockForWriting}SDL_LockRWLockForWriting}: Lock the read/write lock for _write_ operations.

This will block until the rwlock is available, which is to say it is not
locked for reading or writing by any other thread. Only one thread may hold
the lock when it requests write access; all other threads, whether they
also want to write or only want read-only access, must wait until the
writer thread has released the lock.

It is illegal for the owning thread to lock an already-locked rwlock for
writing (read-only may be locked recursively, writing can not). Doing so
results in undefined behavior.

It is illegal to request a write lock from a thread that already holds a
read-only lock. Doing so results in undefined behavior. Unlock the
read-only lock before requesting a write lock.

This function does not fail; if rwlock is NULL, it will return immediately
having locked nothing. If the rwlock is valid, this function will always
block until it can lock the mutex, and return with it locked.


    @param rwlock the read/write lock to lock.
*)

val try_lock_for_reading : rw_lock -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_TryLockRWLockForReading}SDL_TryLockRWLockForReading}: Try to lock a read/write lock _for reading_ without blocking.

This works just like SDL_LockRWLockForReading(), but if the rwlock is not
available, then this function returns false immediately.

This technique is useful if you need access to a resource but don't want to
wait for it, and will return to it to try again later.

Trying to lock for read-only access can succeed if other threads are
holding read-only locks, as this won't prevent access.

This function returns true if passed a NULL rwlock.


    @param rwlock the rwlock to try to lock.*)

val try_lock_for_writing : rw_lock -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_TryLockRWLockForWriting}SDL_TryLockRWLockForWriting}: Try to lock a read/write lock _for writing_ without blocking.

This works just like SDL_LockRWLockForWriting(), but if the rwlock is not
available, then this function returns false immediately.

This technique is useful if you need exclusive access to a resource but
don't want to wait for it, and will return to it to try again later.

It is illegal for the owning thread to lock an already-locked rwlock for
writing (read-only may be locked recursively, writing can not). Doing so
results in undefined behavior.

It is illegal to request a write lock from a thread that already holds a
read-only lock. Doing so results in undefined behavior. Unlock the
read-only lock before requesting a write lock.

This function returns true if passed a NULL rwlock.


    @param rwlock the rwlock to try to lock.*)

val unlock : rw_lock -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_UnlockRWLock}SDL_UnlockRWLock}: Unlock the read/write lock.

Use this function to unlock the rwlock, whether it was locked for read-only
or write operations.

It is legal for the owning thread to lock an already-locked read-only lock.
It must unlock it the same number of times before it is actually made
available for other threads in the system (this is known as a "recursive
rwlock").

It is illegal to unlock a rwlock that has not been locked by the current
thread, and doing so results in undefined behavior.


    @param rwlock the rwlock to unlock.
*)

val destroy : rw_lock -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_DestroyRWLock}SDL_DestroyRWLock}: Destroy a read/write lock created with SDL_CreateRWLock().

This function must be called on any read/write lock that is no longer
needed. Failure to destroy a rwlock will result in a system memory or
resource leak. While it is safe to destroy a rwlock that is _unlocked_, it
is not safe to attempt to destroy a locked rwlock, and may result in
undefined behavior depending on the platform.


    @param rwlock the rwlock to destroy.
*)

end

module Semaphore : sig

val create : int -> semaphore result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateSemaphore}SDL_CreateSemaphore}: Create a semaphore.

This function creates a new semaphore and initializes it with the value[initial_value] Each wait operation on the semaphore will atomically
decrement the semaphore value and potentially block if the semaphore value
is 0. Each post operation will atomically increment the semaphore value and
wake waiting threads and allow them to retry the wait operation.


    @param initial_value the starting value of the semaphore.

    @return a new semaphore or [Error] on failure; call SDL_GetError() for more
information.*)

val destroy : semaphore -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_DestroySemaphore}SDL_DestroySemaphore}: Destroy a semaphore.

It is not safe to destroy a semaphore if there are threads currently
waiting on it.


    @param sem the semaphore to destroy.
*)

val wait : semaphore -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_WaitSemaphore}SDL_WaitSemaphore}: Wait until a semaphore has a positive value and then decrements it.

This function suspends the calling thread until the semaphore pointed to by[sem]has a positive value, and then atomically decrement the semaphore
value.

This function is the equivalent of calling SDL_WaitSemaphoreTimeout() with
a time length of -1.


    @param sem the semaphore wait on.
*)

val try_wait : semaphore -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_TryWaitSemaphore}SDL_TryWaitSemaphore}: See if a semaphore has a positive value and decrement it if it does.

This function checks to see if the semaphore pointed to by[sem]has a
positive value and atomically decrements the semaphore value if it does. If
the semaphore doesn't have a positive value, the function immediately
returns false.


    @param sem the semaphore to wait on.*)

val wait_timeout : semaphore -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_WaitSemaphoreTimeout}SDL_WaitSemaphoreTimeout}: Wait until a semaphore has a positive value and then decrements it.

This function suspends the calling thread until either the semaphore
pointed to by[sem]has a positive value or the specified time has elapsed.
If the call is successful it will atomically decrement the semaphore value.


    @param sem the semaphore to wait on.
    @param timeoutMS the length of the timeout, in milliseconds, or -1 to wait
indefinitely.*)

val signal : semaphore -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_SignalSemaphore}SDL_SignalSemaphore}: Atomically increment a semaphore's value and wake waiting threads.


    @param sem the semaphore to increment.
*)

val get_value : semaphore -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetSemaphoreValue}SDL_GetSemaphoreValue}: Get the current value of a semaphore.


    @param sem the semaphore to query.

    @return the current value of the semaphore.*)

end

module Condition : sig

val create : unit -> condition result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateCondition}SDL_CreateCondition}: Create a condition variable.


    @return a new condition variable or [Error] on failure; call SDL_GetError()
for more information.*)

val destroy : condition -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_DestroyCondition}SDL_DestroyCondition}: Destroy a condition variable.


    @param cond the condition variable to destroy.
*)

val signal : condition -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_SignalCondition}SDL_SignalCondition}: Restart one of the threads that are waiting on the condition variable.


    @param cond the condition variable to signal.
*)

val broadcast : condition -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_BroadcastCondition}SDL_BroadcastCondition}: Restart all threads that are waiting on the condition variable.


    @param cond the condition variable to signal.
*)

val wait : condition -> mutex -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_WaitCondition}SDL_WaitCondition}: Wait until a condition variable is signaled.

This function unlocks the specified[mutex]and waits for another thread to
call SDL_SignalCondition() or SDL_BroadcastCondition() on the condition
variable[cond] Once the condition variable is signaled, the mutex is
re-locked and the function returns.

The mutex must be locked before calling this function. Locking the mutex
recursively (more than once) is not supported and leads to undefined
behavior.

This function is the equivalent of calling SDL_WaitConditionTimeout() with
a time length of -1.


    @param cond the condition variable to wait on.
    @param mutex the mutex used to coordinate thread access.
*)

val wait_timeout : condition -> mutex -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_WaitConditionTimeout}SDL_WaitConditionTimeout}: Wait until a condition variable is signaled or a certain time has passed.

This function unlocks the specified[mutex]and waits for another thread to
call SDL_SignalCondition() or SDL_BroadcastCondition() on the condition
variable[cond] or for the specified time to elapse. Once the condition
variable is signaled or the time elapsed, the mutex is re-locked and the
function returns.

The mutex must be locked before calling this function. Locking the mutex
recursively (more than once) is not supported and leads to undefined
behavior.


    @param cond the condition variable to wait on.
    @param mutex the mutex used to coordinate thread access.
    @param timeoutMS the maximum time to wait, in milliseconds, or -1 to wait
indefinitely.*)

end

module Global : sig

val should_init : init_state Ctypes.ptr -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_ShouldInit}SDL_ShouldInit}: Return whether initialization should be done.

This function checks the passed in state and if initialization should be
done, sets the status to[SDL_INIT_STATUS_INITIALIZING]and returns true.
If another thread is already modifying this state, it will wait until
that's done before returning.

If this function returns true, the calling code must call
SDL_SetInitialized() to complete the initialization.


    @param state the initialization state to check.*)

val should_quit : init_state Ctypes.ptr -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_ShouldQuit}SDL_ShouldQuit}: Return whether cleanup should be done.

This function checks the passed in state and if cleanup should be done,
sets the status to[SDL_INIT_STATUS_UNINITIALIZING]and returns true.

If this function returns true, the calling code must call
SDL_SetInitialized() to complete the cleanup.


    @param state the initialization state to check.*)

val set_initialized : init_state Ctypes.ptr -> bool -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetInitialized}SDL_SetInitialized}: Finish an initialization state transition.

This function sets the status of the passed in state to[SDL_INIT_STATUS_INITIALIZED]or[SDL_INIT_STATUS_UNINITIALIZED]and allows
any threads waiting for the status to proceed.


    @param state the initialization state to check.
    @param initialized the new initialization state.
*)

end
include module type of Global

