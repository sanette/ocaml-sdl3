(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Sdl3_types
module Thread : sig

val create_runtime : thread_function -> string -> data -> function_pointer option -> function_pointer option -> thread result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateThreadRuntime}SDL_CreateThreadRuntime}: The actual entry point for SDL_CreateThread.


    @param fn the SDL_ThreadFunction function to call in the new thread
    @param name the name of the thread
    @param data a pointer that is passed to `fn`
    @param pfnBeginThread the C runtime's _beginthreadex (or whatnot). Can be [None].
    @param pfnEndThread the C runtime's _endthreadex (or whatnot). Can be [None].

    @return an opaque pointer to the new thread object on success, [Error] if the
new thread could not be created; call SDL_GetError() for more
information.*)

val create_with_properties_runtime : int -> function_pointer option -> function_pointer option -> thread result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateThreadWithPropertiesRuntime}SDL_CreateThreadWithPropertiesRuntime}: The actual entry point for SDL_CreateThreadWithProperties.


    @param props the properties to use
    @param pfnBeginThread the C runtime's _beginthreadex (or whatnot). Can be [None].
    @param pfnEndThread the C runtime's _endthreadex (or whatnot). Can be [None].

    @return an opaque pointer to the new thread object on success, [Error] if the
new thread could not be created; call SDL_GetError() for more
information.*)

val get_name : thread -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetThreadName}SDL_GetThreadName}: Get the thread name as it was specified in SDL_CreateThread().


    @param thread the thread to query.

    @return a pointer to a UTF-8 string that names the specified thread, or
NULL if it doesn't have a name.*)

val get_current_id : unit -> int64
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetCurrentThreadID}SDL_GetCurrentThreadID}: Get the thread identifier for the current thread.

This thread identifier is as reported by the underlying operating system.
If SDL is running on a platform that does not support threads the return
value will always be zero.

This function also returns a valid thread ID when called from the main
thread.


    @return the ID of the current thread.*)

val get_id : thread -> int64
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetThreadID}SDL_GetThreadID}: Get the thread identifier for the specified thread.

This thread identifier is as reported by the underlying operating system.
If SDL is running on a platform that does not support threads the return
value will always be zero.


    @param thread the thread to query.

    @return the ID of the specified thread, or the ID of the current thread if[thread]is NULL.*)

val set_current_priority : thread_priority_enum -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetCurrentThreadPriority}SDL_SetCurrentThreadPriority}: Set the priority for the current thread.

Note that some platforms will not let you alter the priority (or at least,
promote the thread to a higher priority) at all, and some require you to be
an administrator account. Be prepared for this to fail.


    @param priority the SDL_ThreadPriority to set.*)

val wait : thread -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_WaitThread}SDL_WaitThread}: Wait for a thread to finish.

Threads that haven't been detached will remain until this function cleans
them up. Not doing so is a resource leak.

Once a thread has been cleaned up through this function, the SDL_Thread
that references it becomes invalid and should not be referenced again. As
such, only one thread may call SDL_WaitThread() on another.

The return code from the thread function is placed in the area pointed to
by[status] if[status]is not NULL.

You may not wait on a thread that has been used in a call to
SDL_DetachThread(). Use either that function or this one, but not both, or
behavior is undefined.

It is safe to pass a NULL thread to this function; it is a no-op.

Note that the thread pointer is freed by this function and is not valid
afterward.


    @param thread the SDL_Thread pointer that was returned from the
SDL_CreateThread() call that started this thread.*)

val get_state : thread -> thread_state_enum
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetThreadState}SDL_GetThreadState}: Get the current state of a thread.


    @param thread the thread to query.

    @return the current state of a thread, or SDL_THREAD_UNKNOWN if the thread
isn't valid.*)

val detach : thread -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_DetachThread}SDL_DetachThread}: Let a thread clean up on exit without intervention.

A thread may be "detached" to signify that it should not remain until
another thread has called SDL_WaitThread() on it. Detaching a thread is
useful for long-running threads that nothing needs to synchronize with or
further manage. When a detached thread is done, it simply goes away.

There is no way to recover the return code of a detached thread. If you
need this, don't detach the thread and instead use SDL_WaitThread().

Once a thread is detached, you should usually assume the SDL_Thread isn't
safe to reference again, as it will become invalid immediately upon the
detached thread's exit, instead of remaining until someone has called
SDL_WaitThread() to finally clean it up. As such, don't detach the same
thread more than once.

If a thread has already exited when passed to SDL_DetachThread(), it will
stop waiting for a call to SDL_WaitThread() and clean up immediately. It is
not safe to detach a thread that might be used with SDL_WaitThread().

You may not call SDL_WaitThread() on a thread that has been detached. Use
either that function or this one, but not both, or behavior is undefined.

It is safe to pass NULL to this function; it is a no-op.


    @param thread the SDL_Thread pointer that was returned from the
SDL_CreateThread() call that started this thread.
*)

(* Additional manual code: *)

val create_linux : thread_function -> string -> thread result

end

module Global : sig

val get_tls : tlsid Ctypes.ptr option -> data
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetTLS}SDL_GetTLS}: Get the current thread's value associated with a thread local storage ID.


    @param id the thread local storage ID, may not be [None].

    @return the value associated with the ID for the current thread or NULL if
no value has been set; call SDL_GetError() for more information.*)

val set_tls : tlsid Ctypes.ptr option -> data -> tls_destructor_callback option -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetTLS}SDL_SetTLS}: Set the current thread's value associated with a thread local storage ID.

If the thread local storage ID is not initialized (the value is 0), a new
ID will be created in a thread-safe way, so all calls using a pointer to
the same ID will refer to the same local storage.

Note that replacing a value from a previous call to this function on the
same thread does _not_ call the previous value's destructor!
[destructor]can be NULL; it is assumed that[value]does not need to be
cleaned up if so.


    @param id the thread local storage ID, may not be [None].
    @param value the value to associate with the ID for the current thread.
    @param destructor a function called when the thread exits, to free the
value, may be [None].*)

val cleanup_tls : unit -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_CleanupTLS}SDL_CleanupTLS}: Cleanup all TLS data for this thread.

If you are creating your threads outside of SDL and then calling SDL
functions, you should call this function before your thread exits, to
properly clean up SDL memory.
*)

end
include module type of Global

