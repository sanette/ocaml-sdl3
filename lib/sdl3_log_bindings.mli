(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Sdl3_types
module Log : sig

val set_priorities : log_priority_enum -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetLogPriorities}SDL_SetLogPriorities}: Set the priority of all log categories.


    @param priority the SDL_LogPriority to assign.
*)

val set_priority : int -> log_priority_enum -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetLogPriority}SDL_SetLogPriority}: Set the priority of a particular log category.


    @param category the category to assign a priority to.
    @param priority the SDL_LogPriority to assign.
*)

val get_priority : int -> log_priority_enum
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetLogPriority}SDL_GetLogPriority}: Get the priority of a particular log category.


    @param category the category to query.

    @return the SDL_LogPriority for the requested category.*)

val reset_priorities : unit -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_ResetLogPriorities}SDL_ResetLogPriorities}: Reset all priorities to default.

This is called by SDL_Quit().
*)

val set_priority_prefix : log_priority_enum -> string -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetLogPriorityPrefix}SDL_SetLogPriorityPrefix}: Set the text prepended to log messages of a given priority.

By default SDL_LOG_PRIORITY_INFO and below have no prefix, and
SDL_LOG_PRIORITY_WARN and higher have a prefix showing their priority, e.g.
"WARNING: ".

This function makes a copy of its string argument, **prefix**, so it is not
necessary to keep the value of **prefix** alive after the call returns.


    @param priority the SDL_LogPriority to modify.
    @param prefix the prefix to use for that log priority, or NULL to use no
prefix.*)

val get_default_output_function : unit -> log_output_function
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetDefaultLogOutputFunction}SDL_GetDefaultLogOutputFunction}: Get the default log output function.


    @return the default log output callback. It should be called with NULL for
the userdata argument.*)

val get_output_function : log_output_function Ctypes.ptr -> data Ctypes.ptr -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetLogOutputFunction}SDL_GetLogOutputFunction}: Get the current log output function.


    @param callback an SDL_LogOutputFunction filled in with the current log
callback.
    @param userdata a pointer filled in with the pointer that is passed to[callback]
*)

val set_output_function : log_output_function -> data -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetLogOutputFunction}SDL_SetLogOutputFunction}: Replace the default log output function with one of your own.


    @param callback an SDL_LogOutputFunction to call instead of the default.
    @param userdata a pointer that is passed to[callback]
*)

end

