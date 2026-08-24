(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Sdl3_types
module Dialog : sig

val show_open_file : dialog_file_callback -> data -> window option -> dialog_file_filter option -> int -> string -> bool -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_ShowOpenFileDialog}SDL_ShowOpenFileDialog}: Displays a dialog that lets the user select a file on their filesystem.

This is an asynchronous function; it will return immediately, and the
result will be passed to the callback.

The callback will be invoked with a null-terminated list of files the user
chose. The list will be empty if the user canceled the dialog, and it will
be NULL if an error occurred.

Note that the callback may be called from a different thread than the one
the function was invoked on.

Depending on the platform, the user may be allowed to input paths that
don't yet exist.

On Linux, dialogs may require XDG Portals, which requires DBus, which
requires an event-handling loop. Apps that do not use SDL to handle events
should add a call to SDL_PumpEvents in their main loop.


    @param callback a function pointer to be invoked when the user selects a
file and accepts, or cancels the dialog, or an error
occurs.
    @param userdata an optional pointer to pass extra data to the callback when
it will be invoked.
    @param window the window that the dialog should be modal for, may be [None].
Not all platforms support this option.
    @param filters a list of filters, may be [None]. See the
\[SDL_DialogFileFilter]](SDL_DialogFileFilter#code-examples)
documentation for examples\]. Not all platforms support this
option, and platforms that do support it may allow the user
to ignore the filters. If non-[None], it must remain valid at
least until the callback is invoked.
    @param nfilters the number of filters. Ignored if filters is NULL.
    @param default_location the default folder or file to start the dialog at,
may be NULL. Not all platforms support this option.
    @param allow_many if non-zero, the user will be allowed to select multiple
entries. Not all platforms support this option.
*)

val show_save_file : dialog_file_callback -> data -> window option -> dialog_file_filter option -> int -> string -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_ShowSaveFileDialog}SDL_ShowSaveFileDialog}: Displays a dialog that lets the user choose a new or existing file on their
filesystem.

This is an asynchronous function; it will return immediately, and the
result will be passed to the callback.

The callback will be invoked with a null-terminated list of files the user
chose. The list will be empty if the user canceled the dialog, and it will
be NULL if an error occurred.

Note that the callback may be called from a different thread than the one
the function was invoked on.

The chosen file may or may not already exist.

On Linux, dialogs may require XDG Portals, which requires DBus, which
requires an event-handling loop. Apps that do not use SDL to handle events
should add a call to SDL_PumpEvents in their main loop.


    @param callback a function pointer to be invoked when the user selects a
file and accepts, or cancels the dialog, or an error
occurs.
    @param userdata an optional pointer to pass extra data to the callback when
it will be invoked.
    @param window the window that the dialog should be modal for, may be [None].
Not all platforms support this option.
    @param filters a list of filters, may be [None]. Not all platforms support
this option, and platforms that do support it may allow the
user to ignore the filters. If non-[None], it must remain
valid at least until the callback is invoked.
    @param nfilters the number of filters. Ignored if filters is NULL.
    @param default_location the default folder or file to start the dialog at,
may be NULL. Not all platforms support this option.
*)

val show_open_folder : dialog_file_callback -> data -> window option -> string -> bool -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_ShowOpenFolderDialog}SDL_ShowOpenFolderDialog}: Displays a dialog that lets the user select a folder on their filesystem.

This is an asynchronous function; it will return immediately, and the
result will be passed to the callback.

The callback will be invoked with a null-terminated list of files the user
chose. The list will be empty if the user canceled the dialog, and it will
be NULL if an error occurred.

Note that the callback may be called from a different thread than the one
the function was invoked on.

Depending on the platform, the user may be allowed to input paths that
don't yet exist.

On Linux, dialogs may require XDG Portals, which requires DBus, which
requires an event-handling loop. Apps that do not use SDL to handle events
should add a call to SDL_PumpEvents in their main loop.


    @param callback a function pointer to be invoked when the user selects a
file and accepts, or cancels the dialog, or an error
occurs.
    @param userdata an optional pointer to pass extra data to the callback when
it will be invoked.
    @param window the window that the dialog should be modal for, may be [None].
Not all platforms support this option.
    @param default_location the default folder or file to start the dialog at,
may be NULL. Not all platforms support this option.
    @param allow_many if non-zero, the user will be allowed to select multiple
entries. Not all platforms support this option.
*)

val show_file_with_properties : file_dialog_type_enum -> dialog_file_callback -> data -> int -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_ShowFileDialogWithProperties}SDL_ShowFileDialogWithProperties}: Create and launch a file dialog with the specified properties.

These are the supported properties:

-[SDL_PROP_FILE_DIALOG_FILTERS_POINTER] a pointer to a list of
  SDL_DialogFileFilter structs, which will be used as filters for
  file-based selections. Ignored if the dialog is an "Open Folder" dialog.
  If non-NULL, the array of filters must remain valid at least until the
  callback is invoked.
-[SDL_PROP_FILE_DIALOG_NFILTERS_NUMBER] the number of filters in the
  array of filters, if it exists.
-[SDL_PROP_FILE_DIALOG_WINDOW_POINTER] the window that the dialog should
  be modal for.
-[SDL_PROP_FILE_DIALOG_LOCATION_STRING] the default folder or file to
  start the dialog at.
-[SDL_PROP_FILE_DIALOG_MANY_BOOLEAN] true to allow the user to select
  more than one entry.
-[SDL_PROP_FILE_DIALOG_TITLE_STRING] the title for the dialog.
-[SDL_PROP_FILE_DIALOG_ACCEPT_STRING] the label that the accept button
  should have.
-[SDL_PROP_FILE_DIALOG_CANCEL_STRING] the label that the cancel button
  should have.

Note that each platform may or may not support any of the properties.


    @param type the type of file dialog.
    @param callback a function pointer to be invoked when the user selects a
file and accepts, or cancels the dialog, or an error
occurs.
    @param userdata an optional pointer to pass extra data to the callback when
it will be invoked.
    @param props the properties to use.
*)

end

