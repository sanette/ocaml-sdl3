(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Sdl3_types
module Assertion : sig

val report : assert_data Ctypes.ptr -> string -> string -> int -> assert_state_enum
(** {{:https://wiki.libsdl.org/SDL3/SDL_ReportAssertion}SDL_ReportAssertion}: Never call this directly.

Use the SDL_assert macros instead.


    @param data assert data structure.
    @param func function name.
    @param file file name.
    @param line line number.

    @return assert state.*)

val set_handler : assertion_handler option -> data -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetAssertionHandler}SDL_SetAssertionHandler}: Set an application-defined assertion handler.

This function allows an application to show its own assertion UI and/or
force the response to an assertion failure. If the application doesn't
provide this, SDL will try to do the right thing, popping up a
system-specific GUI dialog, and probably minimizing any fullscreen windows.

This callback may fire from any thread, but it runs wrapped in a mutex, so
it will only fire from one thread at a time.

This callback is NOT reset to SDL's internal handler upon SDL_Quit()!


    @param handler the SDL_AssertionHandler function to call when an assertion
fails or [None] for the default handler.
    @param userdata a pointer that is passed to[handler]
*)

val get_default_handler : unit -> assertion_handler
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetDefaultAssertionHandler}SDL_GetDefaultAssertionHandler}: Get the default assertion handler.

This returns the function pointer that is called by default when an
assertion is triggered. This is an internal function provided by SDL, that
is used for assertions when SDL_SetAssertionHandler() hasn't been used to
provide a different function.


    @return the default SDL_AssertionHandler that is called when an assert
triggers.*)

val get_handler : data Ctypes.ptr -> assertion_handler
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetAssertionHandler}SDL_GetAssertionHandler}: Get the current assertion handler.

This returns the function pointer that is called when an assertion is
triggered. This is either the value last passed to
SDL_SetAssertionHandler(), or if no application-specified function is set,
is equivalent to calling SDL_GetDefaultAssertionHandler().

The parameter[puserdata]is a pointer to a void*, which will store the
"userdata" pointer that was passed to SDL_SetAssertionHandler(). This value
will always be NULL for the default handler. If you don't care about this
data, it is safe to pass a NULL pointer to this function to ignore it.


    @param puserdata pointer which is filled with the "userdata" pointer that
was passed to SDL_SetAssertionHandler().

    @return the SDL_AssertionHandler that is called when an assert triggers.*)

val get_report : unit -> assert_data Ctypes.ptr
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetAssertionReport}SDL_GetAssertionReport}: Get a list of all assertion failures.

This function gets all assertions triggered since the last call to
SDL_ResetAssertionReport(), or the start of the program.

The proper way to examine this data looks something like this:

{[
const SDL_AssertData *item = SDL_GetAssertionReport();
while (item) {
   printf("'%s', %s (%s:%d), triggered %u times, always ignore: %s.\\n",
          item->condition, item->function, item->filename,
          item->linenum, item->trigger_count,
          item->always_ignore ? "yes" : "no");
   item = item->next;
}
]}


    @return a list of all failed assertions or NULL if the list is empty. This
memory should not be modified or freed by the application. This
pointer remains valid until the next call to SDL_Quit() or
SDL_ResetAssertionReport().*)

val reset_report : unit -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_ResetAssertionReport}SDL_ResetAssertionReport}: Clear the list of all assertion failures.

This function will clear the list of all assertions triggered up to that
point. Immediately following this call, SDL_GetAssertionReport will return
no items. In addition, any previously-triggered assertions will be reset to
a trigger_count of zero, and their always_ignore state will be false.
*)

end

