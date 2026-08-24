(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Sdl3_types
module Keyboard : sig

val has : unit -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_HasKeyboard}SDL_HasKeyboard}: Return whether a keyboard is currently connected.
*)

val gets : unit -> int list
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetKeyboards}SDL_GetKeyboards}: Get a list of currently connected keyboards.

Note that this will include any device or virtual driver that includes
keyboard functionality, including some mice, KVM switches, motherboard
power buttons, etc. You should wait for input from a device before you
consider it actively in use.


    @return a list of keyboards instance IDs, may be empty on failure;
call SDL_GetError() for more information. This should be freed
with SDL_free() when it is no longer needed.*)

val get_name_for_id : int -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetKeyboardNameForID}SDL_GetKeyboardNameForID}: Get the name of a keyboard.

This function returns "" if the keyboard doesn't have a name.


    @param instance_id the keyboard instance ID.

    @return the name of the selected keyboard or NULL on failure; call
SDL_GetError() for more information.*)

val get_focus : unit -> window result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetKeyboardFocus}SDL_GetKeyboardFocus}: Query the window which currently has keyboard focus.


    @return the window with keyboard focus.*)

val get_state : unit -> bool list
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetKeyboardState}SDL_GetKeyboardState}: Get a snapshot of the current state of the keyboard.

The pointer returned is a pointer to an internal SDL array. It will be
valid for the whole lifetime of the application and should not be freed by
the caller.

A array element with a value of true means that the key is pressed and a
value of false means that it is not. Indexes into this array are obtained
by using SDL_Scancode values.

Use SDL_PumpEvents() to update the state array.

This function gives you the current state after all events have been
processed, so if a key or button has been pressed and released before you
process events, then the pressed state will never show up in the
SDL_GetKeyboardState() calls.

Note: This function doesn't take into account whether shift has been
pressed or not.


    @return a list of key states.*)

val reset : unit -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_ResetKeyboard}SDL_ResetKeyboard}: Clear the state of the keyboard.

This function will generate key up events for all pressed keys.
*)

val has_screen_support : unit -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_HasScreenKeyboardSupport}SDL_HasScreenKeyboardSupport}: Check whether the platform has screen keyboard support.


    @return true if the platform has some screen keyboard support or false if
not.*)

val screen_shown : window -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_ScreenKeyboardShown}SDL_ScreenKeyboardShown}: Check whether the screen keyboard is shown for given window.


    @param window the window for which screen keyboard should be queried.

    @return true if screen keyboard is shown or false if not.*)

end

module Global : sig

val get_mod_state : unit -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetModState}SDL_GetModState}: Get the current key modifier state for the keyboard.


    @return an OR'd combination of the modifier keys for the keyboard.*)

val set_mod_state : int -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetModState}SDL_SetModState}: Set the current key modifier state for the keyboard.

The inverse of SDL_GetModState(), SDL_SetModState() allows you to impose
modifier key states on your application. Simply pass your desired modifier
states into[modstate] This value may be a bitwise, OR'd combination of
SDL_Keymod values.

This does not change the keyboard state, only the key modifier flags that
SDL reports.


    @param modstate the desired SDL_Keymod for the keyboard.
*)

val get_key_name : int -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetKeyName}SDL_GetKeyName}: Get a human-readable name for a key.

If the key doesn't have a name, this function returns an empty string ("").

Letters will be presented in their uppercase form, if applicable.


    @param key the desired SDL_Keycode to query.

    @return a UTF-8 encoded string of the key name.*)

val get_key_from_name : string -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetKeyFromName}SDL_GetKeyFromName}: Get a key code from a human-readable name.


    @param name the human-readable key name.

    @return key code, or[SDLK_UNKNOWN]if the name wasn't recognized; call
SDL_GetError() for more information.*)

val start_text_input : window -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_StartTextInput}SDL_StartTextInput}: Start accepting Unicode text input events in a window.

This function will enable text input (SDL_EVENT_TEXT_INPUT and
SDL_EVENT_TEXT_EDITING events) in the specified window. Please use this
function paired with SDL_StopTextInput().

Text input events are not received by default.

On some platforms using this function shows the screen keyboard and/or
activates an IME, which can prevent some key press events from being passed
through.


    @param window the window to enable text input.*)

val start_text_input_with_properties : window -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_StartTextInputWithProperties}SDL_StartTextInputWithProperties}: Start accepting Unicode text input events in a window, with properties
describing the input.

This function will enable text input (SDL_EVENT_TEXT_INPUT and
SDL_EVENT_TEXT_EDITING events) in the specified window. Please use this
function paired with SDL_StopTextInput().

Text input events are not received by default.

On some platforms using this function shows the screen keyboard and/or
activates an IME, which can prevent some key press events from being passed
through.

These are the supported properties:

-[SDL_PROP_TEXTINPUT_TYPE_NUMBER]- an SDL_TextInputType value that
  describes text being input, defaults to SDL_TEXTINPUT_TYPE_TEXT.
-[SDL_PROP_TEXTINPUT_CAPITALIZATION_NUMBER]- an SDL_Capitalization value
  that describes how text should be capitalized, defaults to
  SDL_CAPITALIZE_SENTENCES for normal text entry, SDL_CAPITALIZE_WORDS for
  SDL_TEXTINPUT_TYPE_TEXT_NAME, and SDL_CAPITALIZE_NONE for e-mail
  addresses, usernames, and passwords.
-[SDL_PROP_TEXTINPUT_AUTOCORRECT_BOOLEAN]- true to enable auto completion
  and auto correction, defaults to true.
-[SDL_PROP_TEXTINPUT_MULTILINE_BOOLEAN]- true if multiple lines of text
  are allowed. This defaults to true if SDL_HINT_RETURN_KEY_HIDES_IME is
  "0" or is not set, and defaults to false if SDL_HINT_RETURN_KEY_HIDES_IME
  is "1".

On Android you can directly specify the input type:

-[SDL_PROP_TEXTINPUT_ANDROID_INPUTTYPE_NUMBER]- the text input type to
  use, overriding other properties. This is documented at
  https://developer.android.com/reference/android/text/InputType


    @param window the window to enable text input.
    @param props the properties to use.*)

val text_input_active : window -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_TextInputActive}SDL_TextInputActive}: Check whether or not Unicode text input events are enabled for a window.


    @param window the window to check.*)

val stop_text_input : window -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_StopTextInput}SDL_StopTextInput}: Stop receiving any text input events in a window.

If SDL_StartTextInput() showed the screen keyboard, this function will hide
it.


    @param window the window to disable text input.*)

val clear_composition : window -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_ClearComposition}SDL_ClearComposition}: Dismiss the composition window/IME without disabling the subsystem.


    @param window the window to affect.*)

val set_text_input_area : window -> rect option -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetTextInputArea}SDL_SetTextInputArea}: Set the area used to type Unicode text input.

Native input methods may place a window with word suggestions near the
cursor, without covering the text being entered.


    @param window the window for which to set the text input area.
    @param rect the SDL_Rect representing the text input area, in window
coordinates, or [None] to clear it.
    @param cursor the offset of the current cursor location relative to[rect->x] in window coordinates.*)

val get_text_input_area : window -> rect option -> int result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetTextInputArea}SDL_GetTextInputArea}: Get the area used to type Unicode text input.

This returns the values previously set by SDL_SetTextInputArea().


    @param window the window for which to query the text input area.
    @param rect an SDL_Rect filled in with the text input area,
may be [None].

    @return the offset of the current cursor location
relative to[rect->x] may be [Error].*)

end
include module type of Global

module Scancode : sig

val get_key_from : scancode_enum -> int -> bool -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetKeyFromScancode}SDL_GetKeyFromScancode}: Get the key code corresponding to the given scancode according to the
current keyboard layout.

If you want to get the keycode as it would be delivered in key events,
including options specified in SDL_HINT_KEYCODE_OPTIONS, then you should
pass[key_event]as true. Otherwise this function simply translates the
scancode based on the given modifier state.


    @param scancode the desired SDL_Scancode to query.
    @param modstate the modifier state to use when translating the scancode to
a keycode.
    @param key_event true if the keycode will be used in key events.

    @return the SDL_Keycode that corresponds to the given SDL_Scancode.*)

val get_from_key : int -> Unsigned.ushort Ctypes.ptr option -> scancode_enum
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetScancodeFromKey}SDL_GetScancodeFromKey}: Get the scancode corresponding to the given key code according to the
current keyboard layout.

Note that there may be multiple scancode+modifier states that can generate
this keycode, this will just return the first one found.


    @param key the desired SDL_Keycode to query.
    @param modstate the modifier state that would be used when the
scancode generates this key, may be [None].

    @return the SDL_Scancode that corresponds to the given SDL_Keycode.*)

val set_name : scancode_enum -> string -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetScancodeName}SDL_SetScancodeName}: Set a human-readable name for a scancode.


    @param scancode the desired SDL_Scancode.
    @param name the name to use for the scancode, encoded as UTF-8. The string
is not copied, so the pointer given to this function must stay
valid while SDL is being used.*)

val get_name : scancode_enum -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetScancodeName}SDL_GetScancodeName}: Get a human-readable name for a scancode.

**Warning**: The returned name is by design not stable across platforms,
e.g. the name for[SDL_SCANCODE_LGUI]is "Left GUI" under Linux but "Left
Windows" under Microsoft Windows, and some scancodes like[SDL_SCANCODE_NONUSBACKSLASH]don't have any name at all. There are even
scancodes that share names, e.g.[SDL_SCANCODE_RETURN]and[SDL_SCANCODE_RETURN2](both called "Return"). This function is therefore
unsuitable for creating a stable cross-platform two-way mapping between
strings and scancodes.


    @param scancode the desired SDL_Scancode to query.

    @return a pointer to the name for the scancode. If the scancode doesn't
have a name this function returns an empty string ("").*)

val get_from_name : string -> scancode_enum
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetScancodeFromName}SDL_GetScancodeFromName}: Get a scancode from a human-readable name.


    @param name the human-readable scancode name.

    @return the SDL_Scancode, or[SDL_SCANCODE_UNKNOWN]if the name wasn't
recognized; call SDL_GetError() for more information.*)

end

