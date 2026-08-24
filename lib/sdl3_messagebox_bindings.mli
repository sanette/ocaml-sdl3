(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Sdl3_types
module Global : sig

val show_message_box : message_box_data Ctypes.ptr -> int result
(** {{:https://wiki.libsdl.org/SDL3/SDL_ShowMessageBox}SDL_ShowMessageBox}: Create a modal message box.

If your needs aren't complex, it might be easier to use
SDL_ShowSimpleMessageBox.

This function should be called on the thread that created the parent
window, or on the main thread if the messagebox has no parent. It will
block execution of that thread until the user clicks a button or closes the
messagebox.

This function may be called at any time, even before SDL_Init(). This makes
it useful for reporting errors like a failure to create a renderer or
OpenGL context.

On X11, SDL rolls its own dialog box with X11 primitives instead of a
formal toolkit like GTK+ or Qt.

Note that if SDL_Init() would fail because there isn't any available video
target, this function is likely to fail for the same reasons. If this is a
concern, check the return value from this function and fall back to writing
to stderr if you can.


    @param messageboxdata the SDL_MessageBoxData structure with title, text and
other options.

    @return the pointer to which user id of hit button should be
copied.*)

val show_simple_message_box : int -> string -> string -> window option -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_ShowSimpleMessageBox}SDL_ShowSimpleMessageBox}: Display a simple modal message box.

If your needs aren't complex, this function is preferred over
SDL_ShowMessageBox.
[flags]may be any of the following:

-[SDL_MESSAGEBOX_ERROR] error dialog
-[SDL_MESSAGEBOX_WARNING] warning dialog
-[SDL_MESSAGEBOX_INFORMATION] informational dialog

This function should be called on the thread that created the parent
window, or on the main thread if the messagebox has no parent. It will
block execution of that thread until the user clicks a button or closes the
messagebox.

This function may be called at any time, even before SDL_Init(). This makes
it useful for reporting errors like a failure to create a renderer or
OpenGL context.

On X11, SDL rolls its own dialog box with X11 primitives instead of a
formal toolkit like GTK+ or Qt.

Note that if SDL_Init() would fail because there isn't any available video
target, this function is likely to fail for the same reasons. If this is a
concern, check the return value from this function and fall back to writing
to stderr if you can.


    @param flags an SDL_MessageBoxFlags value.
    @param title UTF-8 title text.
    @param message UTF-8 message text.
    @param window the parent window, or [None] for no parent.*)

end
include module type of Global

