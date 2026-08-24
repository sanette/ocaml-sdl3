(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Sdl3_types
module Mouse : sig

val has : unit -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_HasMouse}SDL_HasMouse}: Return whether a mouse is currently connected.
*)

val get_name_for_id : int -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetMouseNameForID}SDL_GetMouseNameForID}: Get the name of a mouse.

This function returns "" if the mouse doesn't have a name.


    @param instance_id the mouse instance ID.

    @return the name of the selected mouse, or NULL on failure; call
SDL_GetError() for more information.*)

val get_focus : unit -> window result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetMouseFocus}SDL_GetMouseFocus}: Get the window which currently has mouse focus.


    @return the window with mouse focus.*)

val get_state : unit -> int * float * float
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetMouseState}SDL_GetMouseState}: Query SDL's cache for the synchronous mouse button state and the
window-relative SDL-cursor position.

This function returns the cached synchronous state as SDL understands it
from the last pump of the event queue.

To query the platform for immediate asynchronous state, use
SDL_GetGlobalMouseState.

Passing non-NULL pointers to[x]or[y]will write the destination with
respective x or y coordinates relative to the focused window.

In Relative Mode, the SDL-cursor's position usually contradicts the
platform-cursor's position as manually calculated from
SDL_GetGlobalMouseState() and SDL_GetWindowPosition.


    @return 3 values:
(
  + a 32-bit bitmask of the button state that can be bitwise-compared
against the SDL_BUTTON_MASK(X) macro.,
  + x : a pointer to receive the SDL-cursor's x-position from the focused
window's top left corner, can be NULL if unused.,
  + y : a pointer to receive the SDL-cursor's y-position from the focused
window's top left corner, can be NULL if unused.
)*)

val get_global_state : unit -> int * float * float
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGlobalMouseState}SDL_GetGlobalMouseState}: Query the platform for the asynchronous mouse button state and the
desktop-relative platform-cursor position.

This function immediately queries the platform for the most recent
asynchronous state, more costly than retrieving SDL's cached state in
SDL_GetMouseState().

Passing non-NULL pointers to[x]or[y]will write the destination with
respective x or y coordinates relative to the desktop.

In Relative Mode, the platform-cursor's position usually contradicts the
SDL-cursor's position as manually calculated from SDL_GetMouseState() and
SDL_GetWindowPosition.

This function can be useful if you need to track the mouse outside of a
specific window and SDL_CaptureMouse() doesn't fit your needs. For example,
it could be useful if you need to track the mouse while dragging a window,
where coordinates relative to a window might not be in sync at all times.


    @return 3 values:
(
  + a 32-bit bitmask of the button state that can be bitwise-compared
against the SDL_BUTTON_MASK(X) macro.,
  + x : a pointer to receive the platform-cursor's x-position from the
desktop's top left corner, can be NULL if unused.,
  + y : a pointer to receive the platform-cursor's y-position from the
desktop's top left corner, can be NULL if unused.
)*)

val get_relative_state : unit -> int * float * float
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetRelativeMouseState}SDL_GetRelativeMouseState}: Query SDL's cache for the synchronous mouse button state and accumulated
mouse delta since last call.

This function returns the cached synchronous state as SDL understands it
from the last pump of the event queue.

To query the platform for immediate asynchronous state, use
SDL_GetGlobalMouseState.

Passing non-NULL pointers to[x]or[y]will write the destination with
respective x or y deltas accumulated since the last call to this function
(or since event initialization).

This function is useful for reducing overhead by processing relative mouse
inputs in one go per-frame instead of individually per-event, at the
expense of losing the order between events within the frame (e.g. quickly
pressing and releasing a button within the same frame).


    @return 3 values:
(
  + a 32-bit bitmask of the button state that can be bitwise-compared
against the SDL_BUTTON_MASK(X) macro.,
  + x : a pointer to receive the x mouse delta accumulated since last
call, can be NULL if unused.,
  + y : a pointer to receive the y mouse delta accumulated since last
call, can be NULL if unused.
)*)

val warp_global : float -> float -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_WarpMouseGlobal}SDL_WarpMouseGlobal}: Move the mouse to the given position in global screen space.

This function generates a mouse motion event.

A failure of this function usually means that it is unsupported by a
platform.

Note that this function will appear to succeed, but not actually move the
mouse when used over Microsoft Remote Desktop.


    @param x the x coordinate.
    @param y the y coordinate.*)

val set_relative_transform : mouse_motion_transform_callback option -> data -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetRelativeMouseTransform}SDL_SetRelativeMouseTransform}: Set a user-defined function by which to transform relative mouse inputs.

This overrides the relative system scale and relative speed scale hints.
Should be called prior to enabling relative mouse mode, fails otherwise.


    @param callback a callback used to transform relative mouse motion, or [None]
for default behavior.
    @param userdata a pointer that will be passed to[callback]*)

val capture : bool -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CaptureMouse}SDL_CaptureMouse}: Capture the mouse and to track input outside an SDL window.

Capturing enables your app to obtain mouse events globally, instead of just
within your window. Not all video targets support this function. When
capturing is enabled, the current window will get all mouse events, but
unlike relative mode, no change is made to the cursor and it is not
restrained to your window.

This function may also deny mouse input to other windows--both those in
your application and others on the system--so you should use this function
sparingly, and in small bursts. For example, you might want to track the
mouse while the user is dragging something, until the user releases a mouse
button. It is not recommended that you capture the mouse for long periods
of time, such as the entire time your app is running. For that, you should
probably use SDL_SetWindowRelativeMouseMode() or SDL_SetWindowMouseGrab(),
depending on your goals.

While captured, mouse events still report coordinates relative to the
current (foreground) window, but those coordinates may be outside the
bounds of the window (including negative values). Capturing is only allowed
for the foreground window. If the window loses focus while capturing, the
capture will be disabled automatically.

While capturing is enabled, the current window will have the[SDL_WINDOW_MOUSE_CAPTURE]flag set.

Please note that SDL will attempt to "auto capture" the mouse while the
user is pressing a button; this is to try and make mouse behavior more
consistent between platforms, and deal with the common case of a user
dragging the mouse outside of the window. This means that if you are
calling SDL_CaptureMouse() only to deal with this situation, you do not
have to (although it is safe to do so). If this causes problems for your
app, you can disable auto capture by setting the[SDL_HINT_MOUSE_AUTO_CAPTURE]hint to zero.


    @param enabled true to enable capturing, false to disable.*)

end

module Global : sig

val get_mice : unit -> int list
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetMice}SDL_GetMice}: Get a list of currently connected mice.

Note that this will include any device or virtual driver that includes
mouse functionality, including some game controllers, KVM switches, etc.
You should wait for input from a device before you consider it actively in
use.


    @return a list of mouse instance IDs, may be empty on failure;
call SDL_GetError() for more information. This should be freed
with SDL_free() when it is no longer needed.*)

val show_cursor : unit -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_ShowCursor}SDL_ShowCursor}: Show the cursor.
*)

val hide_cursor : unit -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_HideCursor}SDL_HideCursor}: Hide the cursor.
*)

val cursor_visible : unit -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CursorVisible}SDL_CursorVisible}: Return whether the cursor is currently being shown.
*)

end
include module type of Global

module Window : sig

val warp_mouse_in : window option -> float -> float -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_WarpMouseInWindow}SDL_WarpMouseInWindow}: Move the mouse cursor to the given position within the window.

This function generates a mouse motion event if relative mode is not
enabled. If relative mode is enabled, you can force mouse events for the
warp by setting the SDL_HINT_MOUSE_RELATIVE_WARP_MOTION hint.

Note that this function will appear to succeed, but not actually move the
mouse when used over Microsoft Remote Desktop.


    @param window the window to move the mouse into, or [None] for the current
mouse focus.
    @param x the x coordinate within the window.
    @param y the y coordinate within the window.
*)

val set_relative_mouse_mode : window -> bool -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetWindowRelativeMouseMode}SDL_SetWindowRelativeMouseMode}: Set relative mouse mode for a window.

While the window has focus and relative mouse mode is enabled, the cursor
is hidden, the mouse position is constrained to the window, and SDL will
report continuous relative mouse motion even if the mouse is at the edge of
the window.

If you'd like to keep the mouse position fixed while in relative mode you
can use SDL_SetWindowMouseRect(). If you'd like the cursor to be at a
specific location when relative mode ends, you should use
SDL_WarpMouseInWindow() before disabling relative mode.

This function will flush any pending mouse motion for this window.


    @param window the window to change.
    @param enabled true to enable relative mode, false to disable.*)

val get_relative_mouse_mode : window -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetWindowRelativeMouseMode}SDL_GetWindowRelativeMouseMode}: Query whether relative mouse mode is enabled for a window.


    @param window the window to query.*)

end

module Cursor : sig

val create : Unsigned.uchar Ctypes.ptr -> Unsigned.uchar Ctypes.ptr -> int -> int -> int -> int -> cursor result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateCursor}SDL_CreateCursor}: Create a cursor using the specified bitmap data and mask (in MSB format).
[mask]has to be in MSB (Most Significant Bit) format.

The cursor width [w] must be a multiple of 8 bits.

The cursor is created in black and white according to the following:

- data=0, mask=1: white
- data=1, mask=1: black
- data=0, mask=0: transparent
- data=1, mask=0: inverted color if possible, black if not.

Cursors created with this function must be freed with SDL_DestroyCursor().

If you want to have a color cursor, or create your cursor from an
SDL_Surface, you should use SDL_CreateColorCursor(). Alternately, you can
hide the cursor and draw your own as part of your game's rendering, but it
will be bound to the framerate.

Also, SDL_CreateSystemCursor() is available, which provides several
readily-available system cursors to pick from.


    @param data the color value for each pixel of the cursor.
    @param mask the mask value for each pixel of the cursor.
    @param w the width of the cursor.
    @param h the height of the cursor.
    @param hot_x the x-axis offset from the left of the cursor image to the
mouse x position, in the range of 0 to[w]- 1.
    @param hot_y the y-axis offset from the top of the cursor image to the
mouse y position, in the range of 0 to[h]- 1.

    @return a new cursor with the specified parameters on success or [Error] on
failure; call SDL_GetError() for more information.*)

val create_color : surface -> int -> int -> cursor result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateColorCursor}SDL_CreateColorCursor}: Create a color cursor.

If this function is passed a surface with alternate representations added
with SDL_AddSurfaceAlternateImage(), the surface will be interpreted as the
content to be used for 100% display scale, and the alternate
representations will be used for high DPI situations if
SDL_HINT_MOUSE_DPI_SCALE_CURSORS is enabled. For example, if the original
surface is 32x32, then on a 2x macOS display or 200% display scale on
Windows, a 64x64 version of the image will be used, if available. If a
matching version of the image isn't available, the closest larger size
image will be downscaled to the appropriate size and be used instead, if
available. Otherwise, the closest smaller image will be upscaled and be
used instead.


    @param surface an SDL_Surface structure representing the cursor image.
    @param hot_x the x position of the cursor hot spot.
    @param hot_y the y position of the cursor hot spot.

    @return the new cursor on success or [Error] on failure; call SDL_GetError()
for more information.*)

val create_animated : cursor_frame_info Ctypes.ptr -> int -> int -> int -> cursor result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateAnimatedCursor}SDL_CreateAnimatedCursor}: Create an animated color cursor.

Animated cursors are composed of a sequential array of frames, specified as
surfaces and durations in an array of SDL_CursorFrameInfo structs. The hot
spot coordinates are universal to all frames, and all frames must have the
same dimensions.

Frame durations are specified in milliseconds. A duration of 0 implies an
infinite frame time, and the animation will stop on that frame. To create a
one-shot animation, set the duration of the last frame in the sequence to
0.

If this function is passed surfaces with alternate representations added
with SDL_AddSurfaceAlternateImage(), the surfaces will be interpreted as
the content to be used for 100% display scale, and the alternate
representations will be used for high DPI situations. For example, if the
original surfaces are 32x32, then on a 2x macOS display or 200% display
scale on Windows, a 64x64 version of the image will be used, if available.
If a matching version of the image isn't available, the closest larger size
image will be downscaled to the appropriate size and be used instead, if
available. Otherwise, the closest smaller image will be upscaled and be
used instead.

If the underlying platform does not support animated cursors, this function
will fall back to creating a static color cursor using the first frame in
the sequence.


    @param frames an array of cursor images composing the animation.
    @param frame_count the number of frames in the sequence.
    @param hot_x the x position of the cursor hot spot.
    @param hot_y the y position of the cursor hot spot.

    @return the new cursor on success or [Error] on failure; call SDL_GetError()
for more information.*)

val set : cursor -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetCursor}SDL_SetCursor}: Set the active cursor.

This function sets the currently active cursor to the specified one. If the
cursor is currently visible, the change will be immediately represented on
the display. SDL_SetCursor(NULL) can be used to force cursor redraw, if
this is desired for any reason.


    @param cursor a cursor to make active.*)

val get : unit -> cursor result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetCursor}SDL_GetCursor}: Get the active cursor.

This function returns a pointer to the current cursor which is owned by the
library. It is not necessary to free the cursor with SDL_DestroyCursor().


    @return the active cursor or [Error] if there is no mouse.*)

val get_default : unit -> cursor result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetDefaultCursor}SDL_GetDefaultCursor}: Get the default cursor.

You do not have to call SDL_DestroyCursor() on the return value, but it is
safe to do so.


    @return the default cursor on success or [Error] on failure; call
SDL_GetError() for more information.*)

val destroy : cursor -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_DestroyCursor}SDL_DestroyCursor}: Free a previously-created cursor.

Use this function to free cursor resources created with SDL_CreateCursor(),
SDL_CreateColorCursor() or SDL_CreateSystemCursor().


    @param cursor the cursor to free.
*)

end

module SystemCursor : sig

val create : system_cursor_enum -> cursor result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateSystemCursor}SDL_CreateSystemCursor}: Create a system cursor.


    @param id an SDL_SystemCursor enum value.

    @return a cursor on success or [Error] on failure; call SDL_GetError() for
more information.*)

end

