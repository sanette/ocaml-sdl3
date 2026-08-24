(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Sdl3_types
module Properties : sig

val get_global : unit -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGlobalProperties}SDL_GetGlobalProperties}: Get the global SDL properties.


    @return a valid property ID on success or 0 on failure; call
SDL_GetError() for more information.*)

val create : unit -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateProperties}SDL_CreateProperties}: Create a group of properties.

All properties are automatically destroyed when SDL_Quit() is called.


    @return an ID for a new group of properties, or 0 on failure; call
SDL_GetError() for more information.*)

val copy : int -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CopyProperties}SDL_CopyProperties}: Copy a group of properties.

Copy all the properties from one group of properties to another, with the
exception of properties requiring cleanup (set using
SDL_SetPointerPropertyWithCleanup()), which will not be copied. Any
property that already exists on[dst]will be overwritten.


    @param src the properties to copy.
    @param dst the destination properties.*)

val lock : int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_LockProperties}SDL_LockProperties}: Lock a group of properties.

Obtain a multi-threaded lock for these properties. Other threads will wait
while trying to lock these properties until they are unlocked. Properties
must be unlocked before they are destroyed.

The lock is automatically taken when setting individual properties, this
function is only needed when you want to set several properties atomically
or want to guarantee that properties being queried aren't freed in another
thread.


    @param props the properties to lock.*)

val unlock : int -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_UnlockProperties}SDL_UnlockProperties}: Unlock a group of properties.


    @param props the properties to unlock.
*)

val get_property_type : int -> string -> property_type_enum
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetPropertyType}SDL_GetPropertyType}: Get the type of a property in a group of properties.


    @param props the properties to query.
    @param name the name of the property to query.

    @return the type of the property, or SDL_PROPERTY_TYPE_INVALID if it is
not set.*)

val enumerate : int -> enumerate_properties_callback -> data -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_EnumerateProperties}SDL_EnumerateProperties}: Enumerate the properties contained in a group of properties.

The callback function is called for each property in the group of
properties. The properties are locked during enumeration.


    @param props the properties to query.
    @param callback the function to call for each property.
    @param userdata a pointer that is passed to[callback]*)

val destroy : int -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_DestroyProperties}SDL_DestroyProperties}: Destroy a group of properties.

All properties are deleted and their cleanup functions will be called, if
any.


    @param props the properties to destroy.
*)

end

module Global : sig

val set_pointer_property_with_cleanup : int -> string -> data -> cleanup_property_callback option -> data -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetPointerPropertyWithCleanup}SDL_SetPointerPropertyWithCleanup}: Set a pointer property in a group of properties with a cleanup function
that is called when the property is deleted.

The cleanup function is also called if setting the property fails for any
reason.

For simply setting basic data types, like numbers, bools, or strings, use
SDL_SetNumberProperty, SDL_SetBooleanProperty, or SDL_SetStringProperty
instead, as those functions will handle cleanup on your behalf. This
function is only for more complex, custom data.


    @param props the properties to modify.
    @param name the name of the property to modify.
    @param value the new value of the property, or NULL to delete the property.
    @param cleanup the function to call when this property is deleted, or [None]
if no cleanup is necessary.
    @param userdata a pointer that is passed to the cleanup function.*)

val set_pointer_property : int -> string -> data -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetPointerProperty}SDL_SetPointerProperty}: Set a pointer property in a group of properties.


    @param props the properties to modify.
    @param name the name of the property to modify.
    @param value the new value of the property, or NULL to delete the property.*)

val set_string_property : int -> string -> string -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetStringProperty}SDL_SetStringProperty}: Set a string property in a group of properties.

This function makes a copy of the string; the caller does not have to
preserve the data after this call completes.


    @param props the properties to modify.
    @param name the name of the property to modify.
    @param value the new value of the property, or NULL to delete the property.*)

val set_number_property : int -> string -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetNumberProperty}SDL_SetNumberProperty}: Set an integer property in a group of properties.


    @param props the properties to modify.
    @param name the name of the property to modify.
    @param value the new value of the property.*)

val set_float_property : int -> string -> float -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetFloatProperty}SDL_SetFloatProperty}: Set a floating point property in a group of properties.


    @param props the properties to modify.
    @param name the name of the property to modify.
    @param value the new value of the property.*)

val set_boolean_property : int -> string -> bool -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetBooleanProperty}SDL_SetBooleanProperty}: Set a boolean property in a group of properties.


    @param props the properties to modify.
    @param name the name of the property to modify.
    @param value the new value of the property.*)

val has_property : int -> string -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_HasProperty}SDL_HasProperty}: Return whether a property exists in a group of properties.


    @param props the properties to query.
    @param name the name of the property to query.

    @return true if the property exists, or false if it doesn't.*)

val get_pointer_property : int -> string -> data -> data
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetPointerProperty}SDL_GetPointerProperty}: Get a pointer property from a group of properties.

By convention, the names of properties that SDL exposes on objects will
start with "SDL.", and properties that SDL uses internally will start with
"SDL.internal.". These should be considered read-only and should not be
modified by applications.


    @param props the properties to query.
    @param name the name of the property to query.
    @param default_value the default value of the property.

    @return the value of the property, or[default_value]if it is not set or
not a pointer property.*)

val get_string_property : int -> string -> string -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetStringProperty}SDL_GetStringProperty}: Get a string property from a group of properties.


    @param props the properties to query.
    @param name the name of the property to query.
    @param default_value the default value of the property.

    @return the value of the property, or[default_value]if it is not set or
not a string property.*)

val get_number_property : int -> string -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetNumberProperty}SDL_GetNumberProperty}: Get a number property from a group of properties.

You can use SDL_GetPropertyType() to query whether the property exists and
is a number property.


    @param props the properties to query.
    @param name the name of the property to query.
    @param default_value the default value of the property.

    @return the value of the property, or[default_value]if it is not set or
not a number property.*)

val get_float_property : int -> string -> float -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetFloatProperty}SDL_GetFloatProperty}: Get a floating point property from a group of properties.

You can use SDL_GetPropertyType() to query whether the property exists and
is a floating point property.


    @param props the properties to query.
    @param name the name of the property to query.
    @param default_value the default value of the property.

    @return the value of the property, or[default_value]if it is not set or
not a float property.*)

val get_boolean_property : int -> string -> bool -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetBooleanProperty}SDL_GetBooleanProperty}: Get a boolean property from a group of properties.

You can use SDL_GetPropertyType() to query whether the property exists and
is a boolean property.


    @param props the properties to query.
    @param name the name of the property to query.
    @param default_value the default value of the property.*)

val clear_property : int -> string -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_ClearProperty}SDL_ClearProperty}: Clear a property from a group of properties.


    @param props the properties to modify.
    @param name the name of the property to clear.*)

end
include module type of Global

