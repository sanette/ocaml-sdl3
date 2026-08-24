(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Sdl3_types
module Clipboard : sig

val set_text : string -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetClipboardText}SDL_SetClipboardText}: Put UTF-8 text into the clipboard.


    @param text the text to store in the clipboard.*)

val get_text : unit -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetClipboardText}SDL_GetClipboardText}: Get UTF-8 text from the clipboard.

This function returns an empty string if there is not enough memory left
for a copy of the clipboard's content.


    @return the clipboard text on success or an empty string on failure; call
SDL_GetError() for more information. This should be freed with
SDL_free() when it is no longer needed.*)

val has_text : unit -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_HasClipboardText}SDL_HasClipboardText}: Query whether the clipboard exists and contains a non-empty text string.


    @return true if the clipboard has text, or false if it does not.*)

val set_data : clipboard_data_callback -> clipboard_cleanup_callback -> data -> string list -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetClipboardData}SDL_SetClipboardData}: Offer clipboard data to the OS.

Tell the operating system that the application is offering clipboard data
for each of the provided mime-types. Once another application requests the
data the callback function will be called, allowing it to generate and
respond with the data for the requested mime-type.

The size of text data does not include any terminator, and the text does
not need to be null-terminated (e.g., you can directly copy a portion of a
document).


    @param callback a function pointer to the function that provides the
clipboard data.
    @param cleanup a function pointer to the function that cleans up the
clipboard data.
    @param userdata an opaque pointer that will be forwarded to the callbacks.
    @param mime_types a list of mime-types that are being offered. SDL copies
the given list.*)

val clear_data : unit -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_ClearClipboardData}SDL_ClearClipboardData}: Clear the clipboard data.
*)

val get_data : string -> Unsigned.size_t Ctypes.ptr -> data
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetClipboardData}SDL_GetClipboardData}: Get the data from the clipboard for a given mime type.

The size of text data does not include the terminator, but the text is
guaranteed to be null-terminated.


    @param mime_type the mime type to read from the clipboard.
    @param size a pointer filled in with the length of the returned data.

    @return the retrieved data buffer or NULL on failure; call SDL_GetError()
for more information. This should be freed with SDL_free() when it
is no longer needed.*)

val has_data : string -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_HasClipboardData}SDL_HasClipboardData}: Query whether there is data in the clipboard for the provided mime type.


    @param mime_type the mime type to check for data.

    @return true if data exists in the clipboard for the provided mime type,
false if it does not.*)

val get_mime_types : unit -> string list
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetClipboardMimeTypes}SDL_GetClipboardMimeTypes}: Retrieve the list of mime types available in the clipboard.


    @return a null-terminated array of strings with mime types, or NULL on
failure; call SDL_GetError() for more information. This should be
freed with SDL_free() when it is no longer needed.*)

end

module Global : sig

val set_primary_selection_text : string -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetPrimarySelectionText}SDL_SetPrimarySelectionText}: Put UTF-8 text into the primary selection.


    @param text the text to store in the primary selection.*)

val get_primary_selection_text : unit -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetPrimarySelectionText}SDL_GetPrimarySelectionText}: Get UTF-8 text from the primary selection.

This function returns an empty string if there is not enough memory left
for a copy of the primary selection's content.


    @return the primary selection text on success or an empty string on
failure; call SDL_GetError() for more information. This should be
freed with SDL_free() when it is no longer needed.*)

val has_primary_selection_text : unit -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_HasPrimarySelectionText}SDL_HasPrimarySelectionText}: Query whether the primary selection exists and contains a non-empty text
string.


    @return true if the primary selection has text, or false if it does not.*)

end
include module type of Global

