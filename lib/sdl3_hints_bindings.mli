(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Sdl3_types
module Hint : sig

val set_with_priority : string -> string -> hint_priority_enum -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetHintWithPriority}SDL_SetHintWithPriority}: Set a hint with a specific priority.

The priority controls the behavior when setting a hint that already has a
value. Hints will replace existing hints of their priority and lower.
Environment variables are considered to have override priority.


    @param name the hint to set.
    @param value the value of the hint variable.
    @param priority the SDL_HintPriority level for the hint.*)

val set : string -> string -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetHint}SDL_SetHint}: Set a hint with normal priority.

Hints will not be set if there is an existing override hint or environment
variable that takes precedence. You can use SDL_SetHintWithPriority() to
set the hint with override priority instead.


    @param name the hint to set.
    @param value the value of the hint variable.*)

val reset : string -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_ResetHint}SDL_ResetHint}: Reset a hint to the default value.

This will reset a hint to the value of the environment variable, or NULL if
the environment isn't set. Callbacks will be called normally with this
change.


    @param name the hint to set.*)

val resets : unit -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_ResetHints}SDL_ResetHints}: Reset all hints to the default values.

This will reset all hints to the value of the associated environment
variable, or NULL if the environment isn't set. Callbacks will be called
normally with this change.
*)

val get : string -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetHint}SDL_GetHint}: Get the value of a hint.


    @param name the hint to query.

    @return the string value of a hint or NULL if the hint isn't set.*)

val get_boolean : string -> bool -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetHintBoolean}SDL_GetHintBoolean}: Get the boolean value of a hint variable.


    @param name the name of the hint to get the boolean value from.
    @param default_value the value to return if the hint does not exist.*)

val add_callback : string -> hint_callback -> data -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_AddHintCallback}SDL_AddHintCallback}: Add a function to watch a particular hint.

The callback function is called _during_ this function, to provide it an
initial value, and again each time the hint's value changes.


    @param name the hint to watch.
    @param callback An SDL_HintCallback function that will be called when the
hint value changes.
    @param userdata a pointer to pass to the callback function.*)

val remove_callback : string -> hint_callback -> data -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_RemoveHintCallback}SDL_RemoveHintCallback}: Remove a function watching a particular hint.


    @param name the hint being watched.
    @param callback an SDL_HintCallback function that will be called when the
hint value changes.
    @param userdata a pointer being passed to the callback function.
*)

end

