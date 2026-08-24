(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

module Global : sig

val out_of_memory : unit -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_OutOfMemory}SDL_OutOfMemory}: Set an error indicating that memory allocation failed.

This function does not do any memory allocation.


    @return false.*)

end
include module type of Global

module Error : sig

val get : unit -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetError}SDL_GetError}: Retrieve a message about the last error that occurred on the current
thread.

It is possible for multiple errors to occur before calling SDL_GetError().
Only the last error is returned.

The message is only applicable when an SDL function has signaled an error.
You must check the return values of SDL function calls to determine when to
appropriately call SDL_GetError(). You should *not* use the results of
SDL_GetError() to decide if an error has occurred! Sometimes SDL will set
an error string even when reporting success.

SDL will *not* clear the error string for successful API calls. You *must*
check return values for failure cases before you can assume the error
string applies.

Error strings are set per-thread, so an error set in a different thread
will not interfere with the current thread's operation.

The returned value is a thread-local string which will remain valid until
the current thread's error string is changed. The caller should make a copy
if the value is needed after the next SDL API call.


    @return a message with information about the specific error that occurred,
or an empty string if there hasn't been an error message set since
the last call to SDL_ClearError().*)

val clear : unit -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_ClearError}SDL_ClearError}: Clear any previous error message for this thread.


    @return true.*)

end

