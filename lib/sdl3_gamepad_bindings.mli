(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Sdl3_types
module Gamepad : sig

val add_mapping : string -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_AddGamepadMapping}SDL_AddGamepadMapping}: Add support for gamepads that SDL is unaware of or change the binding of an
existing gamepad.

The mapping string has the format "GUID,name,mapping", where GUID is the
string value from SDL_GUIDToString(), name is the human readable string for
the device and mappings are gamepad mappings to joystick ones. Under
Windows there is a reserved GUID of "xinput" that covers all XInput
devices. The mapping format for joystick is:

-[bX] a joystick button, index X
-[hX.Y] hat X with value Y
-[aX] axis X of the joystick

Buttons can be used as a gamepad axes and vice versa.

If a device with this GUID is already plugged in, SDL will generate an
SDL_EVENT_GAMEPAD_ADDED event.

This string shows an example of a valid mapping for a gamepad:

{[
"341a3608000000000000504944564944,Afterglow PS3 Controller,a:b1,b:b2,y:b3,x:b0,start:b9,guide:b12,back:b8,dpup:h0.1,dpleft:h0.8,dpdown:h0.4,dpright:h0.2,leftshoulder:b4,rightshoulder:b5,leftstick:b10,rightstick:b11,leftx:a0,lefty:a1,rightx:a2,righty:a3,lefttrigger:b6,righttrigger:b7"
]}


    @param mapping the mapping string.

    @return 1 if a new mapping is added, 0 if an existing mapping is updated,
-1 on failure; call SDL_GetError() for more information.*)

val add_mappings_from_io : io_stream -> bool -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_AddGamepadMappingsFromIO}SDL_AddGamepadMappingsFromIO}: Load a set of gamepad mappings from an SDL_IOStream.

You can call this function several times, if needed, to load different
database files.

If a new mapping is loaded for an already known gamepad GUID, the later
version will overwrite the one currently loaded.

Any new mappings for already plugged in controllers will generate
SDL_EVENT_GAMEPAD_ADDED events.

Mappings not belonging to the current platform or with no platform field
specified will be ignored (i.e. mappings for Linux will be ignored in
Windows, etc).

This function will load the text database entirely in memory before
processing it, so take this into consideration if you are in a memory
constrained environment.


    @param src the data stream for the mappings to be added.
    @param closeio if true, calls SDL_CloseIO() on[src]before returning, even
in the case of an error.

    @return the number of mappings added or -1 on failure; call SDL_GetError()
for more information.*)

val add_mappings_from_file : string -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_AddGamepadMappingsFromFile}SDL_AddGamepadMappingsFromFile}: Load a set of gamepad mappings from a file.

You can call this function several times, if needed, to load different
database files.

If a new mapping is loaded for an already known gamepad GUID, the later
version will overwrite the one currently loaded.

Any new mappings for already plugged in controllers will generate
SDL_EVENT_GAMEPAD_ADDED events.

Mappings not belonging to the current platform or with no platform field
specified will be ignored (i.e. mappings for Linux will be ignored in
Windows, etc).


    @param file the mappings file to load.

    @return the number of mappings added or -1 on failure; call SDL_GetError()
for more information.*)

val reload_mappings : unit -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_ReloadGamepadMappings}SDL_ReloadGamepadMappings}: Reinitialize the SDL mapping database to its initial state.

This will generate gamepad events as needed if device mappings change.
*)

val get_mappings : unit -> string list
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadMappings}SDL_GetGamepadMappings}: Get the current gamepad mappings.


    @return an array of the mapping strings, NULL-terminated, or NULL on
failure; call SDL_GetError() for more information. This is a
single allocation that should be freed with SDL_free() when it is
no longer needed.*)

val get_mapping : gamepad -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadMapping}SDL_GetGamepadMapping}: Get the current mapping of a gamepad.

Details about mappings are discussed with SDL_AddGamepadMapping().


    @param gamepad the gamepad you want to get the current mapping for.

    @return a string that has the gamepad's mapping or NULL if no mapping is
available; call SDL_GetError() for more information. This should
be freed with SDL_free() when it is no longer needed.*)

val set_mapping : int -> string -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetGamepadMapping}SDL_SetGamepadMapping}: Set the current mapping of a joystick or gamepad.

Details about mappings are discussed with SDL_AddGamepadMapping().


    @param instance_id the joystick instance ID.
    @param mapping the mapping to use for this device, or NULL to clear the
mapping.*)

val has : unit -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_HasGamepad}SDL_HasGamepad}: Return whether a gamepad is currently connected.
*)

val gets : unit -> int list
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepads}SDL_GetGamepads}: Get a list of currently connected gamepads.


    @return a list of joystick instance IDs, may be empty on failure;
call SDL_GetError() for more information. This should be freed
with SDL_free() when it is no longer needed.*)

val is : int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_IsGamepad}SDL_IsGamepad}: Check if the given joystick is supported by the gamepad interface.


    @param instance_id the joystick instance ID.*)

val get_name_for_id : int -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadNameForID}SDL_GetGamepadNameForID}: Get the implementation dependent name of a gamepad.

This can be called before any gamepads are opened.


    @param instance_id the joystick instance ID.

    @return the name of the selected gamepad. If no name can be found, this
function returns NULL; call SDL_GetError() for more information.*)

val get_path_for_id : int -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadPathForID}SDL_GetGamepadPathForID}: Get the implementation dependent path of a gamepad.

This can be called before any gamepads are opened.


    @param instance_id the joystick instance ID.

    @return the path of the selected gamepad. If no path can be found, this
function returns NULL; call SDL_GetError() for more information.*)

val get_player_index_for_id : int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadPlayerIndexForID}SDL_GetGamepadPlayerIndexForID}: Get the player index of a gamepad.

This can be called before any gamepads are opened.


    @param instance_id the joystick instance ID.

    @return the player index of a gamepad, or -1 if it's not available.*)

val get_vendor_for_id : int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadVendorForID}SDL_GetGamepadVendorForID}: Get the USB vendor ID of a gamepad, if available.

This can be called before any gamepads are opened. If the vendor ID isn't
available this function returns 0.


    @param instance_id the joystick instance ID.

    @return the USB vendor ID of the selected gamepad. If called on an invalid
index, this function returns zero.*)

val get_product_for_id : int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadProductForID}SDL_GetGamepadProductForID}: Get the USB product ID of a gamepad, if available.

This can be called before any gamepads are opened. If the product ID isn't
available this function returns 0.


    @param instance_id the joystick instance ID.

    @return the USB product ID of the selected gamepad. If called on an
invalid index, this function returns zero.*)

val get_product_version_for_id : int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadProductVersionForID}SDL_GetGamepadProductVersionForID}: Get the product version of a gamepad, if available.

This can be called before any gamepads are opened. If the product version
isn't available this function returns 0.


    @param instance_id the joystick instance ID.

    @return the product version of the selected gamepad. If called on an
invalid index, this function returns zero.*)

val get_type_for_id : int -> gamepad_type_enum
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadTypeForID}SDL_GetGamepadTypeForID}: Get the type of a gamepad.

This can be called before any gamepads are opened.


    @param instance_id the joystick instance ID.

    @return the gamepad type.*)

val get_real_type_for_id : int -> gamepad_type_enum
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetRealGamepadTypeForID}SDL_GetRealGamepadTypeForID}: Get the type of a gamepad, ignoring any mapping override.

This can be called before any gamepads are opened.


    @param instance_id the joystick instance ID.

    @return the gamepad type.*)

val get_mapping_for_id : int -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadMappingForID}SDL_GetGamepadMappingForID}: Get the mapping of a gamepad.

This can be called before any gamepads are opened.


    @param instance_id the joystick instance ID.

    @return the mapping string. Returns NULL if no mapping is available. This
should be freed with SDL_free() when it is no longer needed.*)

val open_ : int -> gamepad result
(** {{:https://wiki.libsdl.org/SDL3/SDL_OpenGamepad}SDL_OpenGamepad}: Open a gamepad for use.


    @param instance_id the joystick instance ID.

    @return a gamepad identifier or [Error] if an error occurred; call
SDL_GetError() for more information.*)

val get_from_id : int -> gamepad result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadFromID}SDL_GetGamepadFromID}: Get the SDL_Gamepad associated with a joystick instance ID, if it has been
opened.


    @param instance_id the joystick instance ID of the gamepad.

    @return an SDL_Gamepad on success or [Error] on failure or if it hasn't been
opened yet; call SDL_GetError() for more information.*)

val get_from_player_index : int -> gamepad result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadFromPlayerIndex}SDL_GetGamepadFromPlayerIndex}: Get the SDL_Gamepad associated with a player index.


    @param player_index the player index, which different from the instance ID.

    @return the SDL_Gamepad associated with a player index.*)

val get_properties : gamepad -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadProperties}SDL_GetGamepadProperties}: Get the properties associated with an opened gamepad.

These properties are shared with the underlying joystick object.

The following read-only properties are provided by SDL:

-[SDL_PROP_GAMEPAD_CAP_MONO_LED_BOOLEAN] true if this gamepad has an LED
  that has adjustable brightness
-[SDL_PROP_GAMEPAD_CAP_RGB_LED_BOOLEAN] true if this gamepad has an LED
  that has adjustable color
-[SDL_PROP_GAMEPAD_CAP_PLAYER_LED_BOOLEAN] true if this gamepad has a
  player LED
-[SDL_PROP_GAMEPAD_CAP_RUMBLE_BOOLEAN] true if this gamepad has
  left/right rumble
-[SDL_PROP_GAMEPAD_CAP_TRIGGER_RUMBLE_BOOLEAN] true if this gamepad has
  simple trigger rumble


    @param gamepad a gamepad identifier previously returned by
SDL_OpenGamepad().

    @return a valid property ID on success or 0 on failure; call
SDL_GetError() for more information.*)

val get_id : gamepad -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadID}SDL_GetGamepadID}: Get the instance ID of an opened gamepad.


    @param gamepad a gamepad identifier previously returned by
SDL_OpenGamepad().

    @return the instance ID of the specified gamepad on success or 0 on
failure; call SDL_GetError() for more information.*)

val get_name : gamepad -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadName}SDL_GetGamepadName}: Get the implementation-dependent name for an opened gamepad.


    @param gamepad a gamepad identifier previously returned by
SDL_OpenGamepad().

    @return the implementation dependent name for the gamepad, or NULL if
there is no name or the identifier passed is invalid.*)

val get_path : gamepad -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadPath}SDL_GetGamepadPath}: Get the implementation-dependent path for an opened gamepad.


    @param gamepad a gamepad identifier previously returned by
SDL_OpenGamepad().

    @return the implementation dependent path for the gamepad, or NULL if
there is no path or the identifier passed is invalid.*)

val get_type : gamepad -> gamepad_type_enum
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadType}SDL_GetGamepadType}: Get the type of an opened gamepad.


    @param gamepad the gamepad object to query.

    @return the gamepad type, or SDL_GAMEPAD_TYPE_UNKNOWN if it's not
available.*)

val get_real_type : gamepad -> gamepad_type_enum
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetRealGamepadType}SDL_GetRealGamepadType}: Get the type of an opened gamepad, ignoring any mapping override.


    @param gamepad the gamepad object to query.

    @return the gamepad type, or SDL_GAMEPAD_TYPE_UNKNOWN if it's not
available.*)

val get_player_index : gamepad -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadPlayerIndex}SDL_GetGamepadPlayerIndex}: Get the player index of an opened gamepad.

For XInput gamepads this returns the XInput user index.


    @param gamepad the gamepad object to query.

    @return the player index for gamepad, or -1 if it's not available.*)

val set_player_index : gamepad -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetGamepadPlayerIndex}SDL_SetGamepadPlayerIndex}: Set the player index of an opened gamepad.


    @param gamepad the gamepad object to adjust.
    @param player_index player index to assign to this gamepad, or -1 to clear
the player index and turn off player LEDs.*)

val get_vendor : gamepad -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadVendor}SDL_GetGamepadVendor}: Get the USB vendor ID of an opened gamepad, if available.

If the vendor ID isn't available this function returns 0.


    @param gamepad the gamepad object to query.

    @return the USB vendor ID, or zero if unavailable.*)

val get_product : gamepad -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadProduct}SDL_GetGamepadProduct}: Get the USB product ID of an opened gamepad, if available.

If the product ID isn't available this function returns 0.


    @param gamepad the gamepad object to query.

    @return the USB product ID, or zero if unavailable.*)

val get_product_version : gamepad -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadProductVersion}SDL_GetGamepadProductVersion}: Get the product version of an opened gamepad, if available.

If the product version isn't available this function returns 0.


    @param gamepad the gamepad object to query.

    @return the USB product version, or zero if unavailable.*)

val get_firmware_version : gamepad -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadFirmwareVersion}SDL_GetGamepadFirmwareVersion}: Get the firmware version of an opened gamepad, if available.

If the firmware version isn't available this function returns 0.


    @param gamepad the gamepad object to query.

    @return the gamepad firmware version, or zero if unavailable.*)

val get_serial : gamepad -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadSerial}SDL_GetGamepadSerial}: Get the serial number of an opened gamepad, if available.

Returns the serial number of the gamepad, or NULL if it is not available.


    @param gamepad the gamepad object to query.

    @return the serial number, or NULL if unavailable.*)

val get_steam_handle : gamepad -> int64
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadSteamHandle}SDL_GetGamepadSteamHandle}: Get the Steam Input handle of an opened gamepad, if available.

Returns an InputHandle_t for the gamepad that can be used with Steam Input
API: https://partner.steamgames.com/doc/api/ISteamInput


    @param gamepad the gamepad object to query.

    @return the gamepad handle, or 0 if unavailable.*)

val get_connection_state : gamepad -> joystick_connection_state_enum
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadConnectionState}SDL_GetGamepadConnectionState}: Get the connection state of a gamepad.


    @param gamepad the gamepad object to query.

    @return the connection state on success or[SDL_JOYSTICK_CONNECTION_INVALID]on failure; call SDL_GetError()
for more information.*)

val get_power_info : gamepad -> power_state_enum * int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadPowerInfo}SDL_GetGamepadPowerInfo}: Get the battery state of a gamepad.

You should never take a battery status as absolute truth. Batteries
(especially failing batteries) are delicate hardware, and the values
reported here are best estimates based on what that hardware reports. It's
not uncommon for older batteries to lose stored power much faster than it
reports, or completely drain when reporting it has 20 percent left, etc.


    @param gamepad the gamepad object to query.

    @return a pointer filled in with the percentage of battery life
left, between 0 and 100, or NULL to ignore. This will be
filled in with -1 we can't determine a value or there is no
battery.*)

val connected : gamepad -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GamepadConnected}SDL_GamepadConnected}: Check if a gamepad has been opened and is currently connected.


    @param gamepad a gamepad identifier previously returned by
SDL_OpenGamepad().*)

val get_joystick : gamepad -> joystick result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadJoystick}SDL_GetGamepadJoystick}: Get the underlying joystick from a gamepad.

This function will give you a SDL_Joystick object, which allows you to use
the SDL_Joystick functions with a SDL_Gamepad object. This would be useful
for getting a joystick's position at any given time, even if it hasn't
moved (moving it would produce an event, which would have the axis' value).

The pointer returned is owned by the SDL_Gamepad. You should not call
SDL_CloseJoystick() on it, for example, since doing so will likely cause
SDL to crash.


    @param gamepad the gamepad object that you want to get a joystick from.

    @return an SDL_Joystick object, or [Error] on failure; call SDL_GetError()
for more information.*)

val set_events_enabled : bool -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetGamepadEventsEnabled}SDL_SetGamepadEventsEnabled}: Set the state of gamepad event processing.

If gamepad events are disabled, you must call SDL_UpdateGamepads() yourself
and check the state of the gamepad when you want gamepad information.


    @param enabled whether to process gamepad events or not.
*)

val events_enabled : unit -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_GamepadEventsEnabled}SDL_GamepadEventsEnabled}: Query the state of gamepad event processing.

If gamepad events are disabled, you must call SDL_UpdateGamepads() yourself
and check the state of the gamepad when you want gamepad information.


    @return true if gamepad events are being processed, false otherwise.*)

val get_bindings : gamepad -> (gamepad_binding Ctypes.ptr) list
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadBindings}SDL_GetGamepadBindings}: Get the SDL joystick layer bindings for a gamepad.


    @param gamepad a gamepad.

    @return a list of pointers to bindings or NULL on
failure; call SDL_GetError() for more information. This is a
single allocation that should be freed with SDL_free() when it is
no longer needed.*)

val updates : unit -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_UpdateGamepads}SDL_UpdateGamepads}: Manually pump gamepad updates if not using the loop.

This function is called automatically by the event loop if events are
enabled. Under such circumstances, it will not be necessary to call this
function.
*)

val get_type_from_string : string -> gamepad_type_enum
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadTypeFromString}SDL_GetGamepadTypeFromString}: Convert a string into SDL_GamepadType enum.

This function is called internally to translate SDL_Gamepad mapping strings
for the underlying joystick device into the consistent SDL_Gamepad mapping.
You do not normally need to call this function unless you are parsing
SDL_Gamepad mappings in your own code.


    @param str string representing a SDL_GamepadType type.

    @return the SDL_GamepadType enum corresponding to the input string, or[SDL_GAMEPAD_TYPE_UNKNOWN]if no match was found.*)

val get_string_for_type : gamepad_type_enum -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadStringForType}SDL_GetGamepadStringForType}: Convert from an SDL_GamepadType enum to a string.


    @param type an enum value for a given SDL_GamepadType.

    @return a string for the given type, or NULL if an invalid type is
specified. The string returned is of the format used by
SDL_Gamepad mapping strings.*)

val get_axis_from_string : string -> gamepad_axis_enum
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadAxisFromString}SDL_GetGamepadAxisFromString}: Convert a string into SDL_GamepadAxis enum.

This function is called internally to translate SDL_Gamepad mapping strings
for the underlying joystick device into the consistent SDL_Gamepad mapping.
You do not normally need to call this function unless you are parsing
SDL_Gamepad mappings in your own code.

Note specially that "righttrigger" and "lefttrigger" map to[SDL_GAMEPAD_AXIS_RIGHT_TRIGGER]and[SDL_GAMEPAD_AXIS_LEFT_TRIGGER]
respectively.


    @param str string representing a SDL_Gamepad axis.

    @return the SDL_GamepadAxis enum corresponding to the input string, or[SDL_GAMEPAD_AXIS_INVALID]if no match was found.*)

val get_string_for_axis : gamepad_axis_enum -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadStringForAxis}SDL_GetGamepadStringForAxis}: Convert from an SDL_GamepadAxis enum to a string.


    @param axis an enum value for a given SDL_GamepadAxis.

    @return a string for the given axis, or NULL if an invalid axis is
specified. The string returned is of the format used by
SDL_Gamepad mapping strings.*)

val has_axis : gamepad -> gamepad_axis_enum -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_GamepadHasAxis}SDL_GamepadHasAxis}: Query whether a gamepad has a given axis.

This merely reports whether the gamepad's mapping defined this axis, as
that is all the information SDL has about the physical device.


    @param gamepad a gamepad.
    @param axis an axis enum value (an SDL_GamepadAxis value).

    @return true if the gamepad has this axis, false otherwise.*)

val get_axis : gamepad -> gamepad_axis_enum -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadAxis}SDL_GetGamepadAxis}: Get the current state of an axis control on a gamepad.

The axis indices start at index 0.

For thumbsticks, the state is a value ranging from -32768 (up/left) to
32767 (down/right).

Triggers range from 0 when released to 32767 when fully pressed, and never
return a negative value. Note that this differs from the value reported by
the lower-level SDL_GetJoystickAxis(), which normally uses the full range.

Note that for invalid gamepads or axes, this will return 0. Zero is also a
valid value in normal operation; usually it means a centered axis.


    @param gamepad a gamepad.
    @param axis an axis index (one of the SDL_GamepadAxis values).

    @return axis state.*)

val get_button_from_string : string -> gamepad_button_enum
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadButtonFromString}SDL_GetGamepadButtonFromString}: Convert a string into an SDL_GamepadButton enum.

This function is called internally to translate SDL_Gamepad mapping strings
for the underlying joystick device into the consistent SDL_Gamepad mapping.
You do not normally need to call this function unless you are parsing
SDL_Gamepad mappings in your own code.


    @param str string representing a SDL_Gamepad button.

    @return the SDL_GamepadButton enum corresponding to the input string, or[SDL_GAMEPAD_BUTTON_INVALID]if no match was found.*)

val get_string_for_button : gamepad_button_enum -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadStringForButton}SDL_GetGamepadStringForButton}: Convert from an SDL_GamepadButton enum to a string.


    @param button an enum value for a given SDL_GamepadButton.

    @return a string for the given button, or NULL if an invalid button is
specified. The string returned is of the format used by
SDL_Gamepad mapping strings.*)

val has_button : gamepad -> gamepad_button_enum -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_GamepadHasButton}SDL_GamepadHasButton}: Query whether a gamepad has a given button.

This merely reports whether the gamepad's mapping defined this button, as
that is all the information SDL has about the physical device.


    @param gamepad a gamepad.
    @param button a button enum value (an SDL_GamepadButton value).

    @return true if the gamepad has this button, false otherwise.*)

val get_button : gamepad -> gamepad_button_enum -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadButton}SDL_GetGamepadButton}: Get the current state of a button on a gamepad.


    @param gamepad a gamepad.
    @param button a button index (one of the SDL_GamepadButton values).*)

val get_button_label_for_type : gamepad_type_enum -> gamepad_button_enum -> gamepad_button_label_enum
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadButtonLabelForType}SDL_GetGamepadButtonLabelForType}: Get the label of a button on a gamepad.


    @param type the type of gamepad to check.
    @param button a button index (one of the SDL_GamepadButton values).

    @return the SDL_GamepadButtonLabel enum corresponding to the button label.*)

val get_button_label : gamepad -> gamepad_button_enum -> gamepad_button_label_enum
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadButtonLabel}SDL_GetGamepadButtonLabel}: Get the label of a button on a gamepad.


    @param gamepad a gamepad.
    @param button a button index (one of the SDL_GamepadButton values).

    @return the SDL_GamepadButtonLabel enum corresponding to the button label.*)

val get_num_touchpads : gamepad -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetNumGamepadTouchpads}SDL_GetNumGamepadTouchpads}: Get the number of touchpads on a gamepad.


    @param gamepad a gamepad.

    @return number of touchpads.*)

val get_num_touchpad_fingers : gamepad -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetNumGamepadTouchpadFingers}SDL_GetNumGamepadTouchpadFingers}: Get the number of supported simultaneous fingers on a touchpad on a game
gamepad.


    @param gamepad a gamepad.
    @param touchpad a touchpad.

    @return number of supported simultaneous fingers.*)

val get_touchpad_finger : gamepad -> int -> int -> bool Ctypes.ptr option -> (float * float * float) result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadTouchpadFinger}SDL_GetGamepadTouchpadFinger}: Get the current state of a finger on a touchpad on a gamepad.


    @param gamepad a gamepad.
    @param touchpad a touchpad.
    @param finger a finger.
    @param down a pointer filled with true if the finger is down, false
otherwise, may be [None].

    @return 3 values:
(
  + x : a pointer filled with the x position, normalized 0 to 1, with the
origin in the upper left, may be [Error].,
  + y : a pointer filled with the y position, normalized 0 to 1, with the
origin in the upper left, may be [Error].,
  + pressure : a pointer filled with pressure value, may be [Error].
)*)

val has_sensor : gamepad -> sensor_type_enum -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_GamepadHasSensor}SDL_GamepadHasSensor}: Return whether a gamepad has a particular sensor.


    @param gamepad the gamepad to query.
    @param type the type of sensor to query.

    @return true if the sensor exists, false otherwise.*)

val set_sensor_enabled : gamepad -> sensor_type_enum -> bool -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetGamepadSensorEnabled}SDL_SetGamepadSensorEnabled}: Set whether data reporting for a gamepad sensor is enabled.


    @param gamepad the gamepad to update.
    @param type the type of sensor to enable/disable.
    @param enabled whether data reporting should be enabled.

    @return true on success or false on failure; call SDL_GetError() for more
information.*)

val sensor_enabled : gamepad -> sensor_type_enum -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_GamepadSensorEnabled}SDL_GamepadSensorEnabled}: Query whether sensor data reporting is enabled for a gamepad.


    @param gamepad the gamepad to query.
    @param type the type of sensor to query.

    @return true if the sensor is enabled, false otherwise.*)

val get_sensor_data_rate : gamepad -> sensor_type_enum -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadSensorDataRate}SDL_GetGamepadSensorDataRate}: Get the data rate (number of events per second) of a gamepad sensor.


    @param gamepad the gamepad to query.
    @param type the type of sensor to query.

    @return the data rate, or 0.0f if the data rate is not available.*)

val get_sensor_data : gamepad -> sensor_type_enum -> float Ctypes.ptr -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadSensorData}SDL_GetGamepadSensorData}: Get the current state of a gamepad sensor.

The number of values and interpretation of the data is sensor dependent.
See the remarks in SDL_SensorType for details for each type of sensor.


    @param gamepad the gamepad to query.
    @param type the type of sensor to query.
    @param data a pointer filled with the current sensor state.
    @param num_values the number of values to write to data.*)

val rumble : gamepad -> int -> int -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_RumbleGamepad}SDL_RumbleGamepad}: Start a rumble effect on a gamepad.

Each call to this function cancels any previous rumble effect, and calling
it with 0 intensity stops any rumbling.

This function requires you to process SDL events or call
SDL_UpdateJoysticks() to update rumble state.


    @param gamepad the gamepad to vibrate.
    @param low_frequency_rumble the intensity of the low frequency (left)
rumble motor, from 0 to 0xFFFF.
    @param high_frequency_rumble the intensity of the high frequency (right)
rumble motor, from 0 to 0xFFFF.
    @param duration_ms the duration of the rumble effect, in milliseconds.*)

val rumble_triggers : gamepad -> int -> int -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_RumbleGamepadTriggers}SDL_RumbleGamepadTriggers}: Start a rumble effect in the gamepad's triggers.

Each call to this function cancels any previous trigger rumble effect, and
calling it with 0 intensity stops any rumbling.

Note that this is rumbling of the _triggers_ and not the gamepad as a
whole. This is currently only supported on Xbox One gamepads. If you want
the (more common) whole-gamepad rumble, use SDL_RumbleGamepad() instead.

This function requires you to process SDL events or call
SDL_UpdateJoysticks() to update rumble state.


    @param gamepad the gamepad to vibrate.
    @param left_rumble the intensity of the left trigger rumble motor, from 0
to 0xFFFF.
    @param right_rumble the intensity of the right trigger rumble motor, from 0
to 0xFFFF.
    @param duration_ms the duration of the rumble effect, in milliseconds.*)

val set_led : gamepad -> int -> int -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetGamepadLED}SDL_SetGamepadLED}: Update a gamepad's LED color.

An example of a joystick LED is the light on the back of a PlayStation 4's
DualShock 4 controller.

For gamepads with a single color LED, the maximum of the RGB values will be
used as the LED brightness.


    @param gamepad the gamepad to update.
    @param red the intensity of the red LED.
    @param green the intensity of the green LED.
    @param blue the intensity of the blue LED.*)

val send_effect : gamepad -> data -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SendGamepadEffect}SDL_SendGamepadEffect}: Send a gamepad specific effect packet.


    @param gamepad the gamepad to affect.
    @param data the data to send to the gamepad.
    @param size the size of the data to send to the gamepad.*)

val close : gamepad -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_CloseGamepad}SDL_CloseGamepad}: Close a gamepad previously opened with SDL_OpenGamepad().


    @param gamepad a gamepad identifier previously returned by
SDL_OpenGamepad().
*)

val get_apple_sf_symbols_name_for_button : gamepad -> gamepad_button_enum -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadAppleSFSymbolsNameForButton}SDL_GetGamepadAppleSFSymbolsNameForButton}: Return the sfSymbolsName for a given button on a gamepad on Apple
platforms.


    @param gamepad the gamepad to query.
    @param button a button on the gamepad.

    @return the sfSymbolsName or NULL if the name can't be found.*)

val get_apple_sf_symbols_name_for_axis : gamepad -> gamepad_axis_enum -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadAppleSFSymbolsNameForAxis}SDL_GetGamepadAppleSFSymbolsNameForAxis}: Return the sfSymbolsName for a given axis on a gamepad on Apple platforms.


    @param gamepad the gamepad to query.
    @param axis an axis on the gamepad.

    @return the sfSymbolsName or NULL if the name can't be found.*)

end

module GUID : sig

val get_gamepad_mapping_for : guid -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadMappingForGUID}SDL_GetGamepadMappingForGUID}: Get the gamepad mapping string for a given GUID.


    @param guid a structure containing the GUID for which a mapping is desired.

    @return a mapping string or NULL on failure; call SDL_GetError() for more
information. This should be freed with SDL_free() when it is no
longer needed.*)

val get_gamepad_for_id : int -> guid
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGamepadGUIDForID}SDL_GetGamepadGUIDForID}: Get the implementation-dependent GUID of a gamepad.

This can be called before any gamepads are opened.


    @param instance_id the joystick instance ID.

    @return the GUID of the selected gamepad. If called on an invalid index,
this function returns a zero GUID.*)

end

