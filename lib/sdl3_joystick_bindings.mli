(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Sdl3_types
module Joystick : sig

val locks : unit -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_LockJoysticks}SDL_LockJoysticks}: Locking for atomic access to the joystick API.

The SDL joystick functions are thread-safe, however you can lock the
joysticks while processing to guarantee that the joystick list won't change
and joystick and gamepad events will not be delivered.
*)

val unlocks : unit -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_UnlockJoysticks}SDL_UnlockJoysticks}: Unlocking for atomic access to the joystick API.
*)

val has : unit -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_HasJoystick}SDL_HasJoystick}: Return whether a joystick is currently connected.
*)

val gets : unit -> int list
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetJoysticks}SDL_GetJoysticks}: Get a list of currently connected joysticks.


    @return a list of joystick instance IDs, may be empty on failure;
call SDL_GetError() for more information. This should be freed
with SDL_free() when it is no longer needed.*)

val get_name_for_id : int -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetJoystickNameForID}SDL_GetJoystickNameForID}: Get the implementation dependent name of a joystick.

This can be called before any joysticks are opened.


    @param instance_id the joystick instance ID.

    @return the name of the selected joystick. If no name can be found, this
function returns NULL; call SDL_GetError() for more information.*)

val get_path_for_id : int -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetJoystickPathForID}SDL_GetJoystickPathForID}: Get the implementation dependent path of a joystick.

This can be called before any joysticks are opened.


    @param instance_id the joystick instance ID.

    @return the path of the selected joystick. If no path can be found, this
function returns NULL; call SDL_GetError() for more information.*)

val get_player_index_for_id : int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetJoystickPlayerIndexForID}SDL_GetJoystickPlayerIndexForID}: Get the player index of a joystick.

This can be called before any joysticks are opened.


    @param instance_id the joystick instance ID.

    @return the player index of a joystick, or -1 if it's not available.*)

val get_guid_for_id : int -> guid
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetJoystickGUIDForID}SDL_GetJoystickGUIDForID}: Get the implementation-dependent GUID of a joystick.

This can be called before any joysticks are opened.


    @param instance_id the joystick instance ID.

    @return the GUID of the selected joystick. If called with an invalid
instance_id, this function returns a zero GUID.*)

val get_vendor_for_id : int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetJoystickVendorForID}SDL_GetJoystickVendorForID}: Get the USB vendor ID of a joystick, if available.

This can be called before any joysticks are opened. If the vendor ID isn't
available this function returns 0.


    @param instance_id the joystick instance ID.

    @return the USB vendor ID of the selected joystick. If called with an
invalid instance_id, this function returns 0.*)

val get_product_for_id : int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetJoystickProductForID}SDL_GetJoystickProductForID}: Get the USB product ID of a joystick, if available.

This can be called before any joysticks are opened. If the product ID isn't
available this function returns 0.


    @param instance_id the joystick instance ID.

    @return the USB product ID of the selected joystick. If called with an
invalid instance_id, this function returns 0.*)

val get_product_version_for_id : int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetJoystickProductVersionForID}SDL_GetJoystickProductVersionForID}: Get the product version of a joystick, if available.

This can be called before any joysticks are opened. If the product version
isn't available this function returns 0.


    @param instance_id the joystick instance ID.

    @return the product version of the selected joystick. If called with an
invalid instance_id, this function returns 0.*)

val get_type_for_id : int -> joystick_type_enum
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetJoystickTypeForID}SDL_GetJoystickTypeForID}: Get the type of a joystick, if available.

This can be called before any joysticks are opened.


    @param instance_id the joystick instance ID.

    @return the SDL_JoystickType of the selected joystick. If called with an
invalid instance_id, this function returns[SDL_JOYSTICK_TYPE_UNKNOWN]*)

val open_ : int -> joystick result
(** {{:https://wiki.libsdl.org/SDL3/SDL_OpenJoystick}SDL_OpenJoystick}: Open a joystick for use.

The joystick subsystem must be initialized before a joystick can be opened
for use.


    @param instance_id the joystick instance ID.

    @return a joystick identifier or [Error] on failure; call SDL_GetError() for
more information.*)

val get_from_id : int -> joystick result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetJoystickFromID}SDL_GetJoystickFromID}: Get the SDL_Joystick associated with an instance ID, if it has been opened.


    @param instance_id the instance ID to get the SDL_Joystick for.

    @return an SDL_Joystick on success or [Error] on failure or if it hasn't been
opened yet; call SDL_GetError() for more information.*)

val get_from_player_index : int -> joystick result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetJoystickFromPlayerIndex}SDL_GetJoystickFromPlayerIndex}: Get the SDL_Joystick associated with a player index.


    @param player_index the player index to get the SDL_Joystick for.

    @return an SDL_Joystick on success or [Error] on failure; call SDL_GetError()
for more information.*)

val attach_virtual : virtual_joystick_desc Ctypes.ptr -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_AttachVirtualJoystick}SDL_AttachVirtualJoystick}: Attach a new virtual joystick.

Apps can create virtual joysticks, that exist without hardware directly
backing them, and have program-supplied inputs. Once attached, a virtual
joystick looks like any other joystick that SDL can access. These can be
used to make other things look like joysticks, or provide pre-recorded
input, etc.

Once attached, the app can send joystick inputs to the new virtual joystick
using SDL_SetJoystickVirtualAxis(), etc.

When no longer needed, the virtual joystick can be removed by calling
SDL_DetachVirtualJoystick().


    @param desc joystick description, initialized using SDL_INIT_INTERFACE().

    @return the joystick instance ID, or 0 on failure; call SDL_GetError() for
more information.*)

val detach_virtual : int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_DetachVirtualJoystick}SDL_DetachVirtualJoystick}: Detach a virtual joystick.


    @param instance_id the joystick instance ID, previously returned from
SDL_AttachVirtualJoystick().*)

val is_virtual : int -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_IsJoystickVirtual}SDL_IsJoystickVirtual}: Query whether or not a joystick is virtual.


    @param instance_id the joystick instance ID.

    @return true if the joystick is virtual, false otherwise.*)

val set_virtual_axis : joystick -> int -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetJoystickVirtualAxis}SDL_SetJoystickVirtualAxis}: Set the state of an axis on an opened virtual joystick.

Please note that values set here will not be applied until the next call to
SDL_UpdateJoysticks, which can either be called directly, or can be called
indirectly through various other SDL APIs, including, but not limited to
the following: SDL_PollEvent, SDL_PumpEvents, SDL_WaitEventTimeout,
SDL_WaitEvent.

Note that when sending trigger axes, you should scale the value to the full
range of Sint16. For example, a trigger at rest would have the value of[SDL_JOYSTICK_AXIS_MIN]


    @param joystick the virtual joystick on which to set state.
    @param axis the index of the axis on the virtual joystick to update.
    @param value the new value for the specified axis.*)

val set_virtual_ball : joystick -> int -> int -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetJoystickVirtualBall}SDL_SetJoystickVirtualBall}: Generate ball motion on an opened virtual joystick.

Please note that values set here will not be applied until the next call to
SDL_UpdateJoysticks, which can either be called directly, or can be called
indirectly through various other SDL APIs, including, but not limited to
the following: SDL_PollEvent, SDL_PumpEvents, SDL_WaitEventTimeout,
SDL_WaitEvent.


    @param joystick the virtual joystick on which to set state.
    @param ball the index of the ball on the virtual joystick to update.
    @param xrel the relative motion on the X axis.
    @param yrel the relative motion on the Y axis.*)

val set_virtual_button : joystick -> int -> bool -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetJoystickVirtualButton}SDL_SetJoystickVirtualButton}: Set the state of a button on an opened virtual joystick.

Please note that values set here will not be applied until the next call to
SDL_UpdateJoysticks, which can either be called directly, or can be called
indirectly through various other SDL APIs, including, but not limited to
the following: SDL_PollEvent, SDL_PumpEvents, SDL_WaitEventTimeout,
SDL_WaitEvent.


    @param joystick the virtual joystick on which to set state.
    @param button the index of the button on the virtual joystick to update.
    @param down true if the button is pressed, false otherwise.*)

val set_virtual_hat : joystick -> int -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetJoystickVirtualHat}SDL_SetJoystickVirtualHat}: Set the state of a hat on an opened virtual joystick.

Please note that values set here will not be applied until the next call to
SDL_UpdateJoysticks, which can either be called directly, or can be called
indirectly through various other SDL APIs, including, but not limited to
the following: SDL_PollEvent, SDL_PumpEvents, SDL_WaitEventTimeout,
SDL_WaitEvent.


    @param joystick the virtual joystick on which to set state.
    @param hat the index of the hat on the virtual joystick to update.
    @param value the new value for the specified hat.*)

val set_virtual_touchpad : joystick -> int -> int -> bool -> float -> float -> float -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetJoystickVirtualTouchpad}SDL_SetJoystickVirtualTouchpad}: Set touchpad finger state on an opened virtual joystick.

Please note that values set here will not be applied until the next call to
SDL_UpdateJoysticks, which can either be called directly, or can be called
indirectly through various other SDL APIs, including, but not limited to
the following: SDL_PollEvent, SDL_PumpEvents, SDL_WaitEventTimeout,
SDL_WaitEvent.


    @param joystick the virtual joystick on which to set state.
    @param touchpad the index of the touchpad on the virtual joystick to
update.
    @param finger the index of the finger on the touchpad to set.
    @param down true if the finger is pressed, false if the finger is released.
    @param x the x coordinate of the finger on the touchpad, normalized 0 to 1,
with the origin in the upper left.
    @param y the y coordinate of the finger on the touchpad, normalized 0 to 1,
with the origin in the upper left.
    @param pressure the pressure of the finger.*)

val send_virtual_sensor_data : joystick -> sensor_type_enum -> int64 -> float Ctypes.ptr -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SendJoystickVirtualSensorData}SDL_SendJoystickVirtualSensorData}: Send a sensor update for an opened virtual joystick.

Please note that values set here will not be applied until the next call to
SDL_UpdateJoysticks, which can either be called directly, or can be called
indirectly through various other SDL APIs, including, but not limited to
the following: SDL_PollEvent, SDL_PumpEvents, SDL_WaitEventTimeout,
SDL_WaitEvent.


    @param joystick the virtual joystick on which to set state.
    @param type the type of the sensor on the virtual joystick to update.
    @param sensor_timestamp a 64-bit timestamp in nanoseconds associated with
the sensor reading.
    @param data the data associated with the sensor reading.
    @param num_values the number of values pointed to by[data]*)

val get_properties : joystick -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetJoystickProperties}SDL_GetJoystickProperties}: Get the properties associated with a joystick.

The following read-only properties are provided by SDL:

-[SDL_PROP_JOYSTICK_CAP_MONO_LED_BOOLEAN] true if this joystick has an
  LED that has adjustable brightness
-[SDL_PROP_JOYSTICK_CAP_RGB_LED_BOOLEAN] true if this joystick has an LED
  that has adjustable color
-[SDL_PROP_JOYSTICK_CAP_PLAYER_LED_BOOLEAN] true if this joystick has a
  player LED
-[SDL_PROP_JOYSTICK_CAP_RUMBLE_BOOLEAN] true if this joystick has
  left/right rumble
-[SDL_PROP_JOYSTICK_CAP_TRIGGER_RUMBLE_BOOLEAN] true if this joystick has
  simple trigger rumble


    @param joystick the SDL_Joystick obtained from SDL_OpenJoystick().

    @return a valid property ID on success or 0 on failure; call
SDL_GetError() for more information.*)

val get_name : joystick -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetJoystickName}SDL_GetJoystickName}: Get the implementation dependent name of a joystick.


    @param joystick the SDL_Joystick obtained from SDL_OpenJoystick().

    @return the name of the selected joystick. If no name can be found, this
function returns NULL; call SDL_GetError() for more information.*)

val get_path : joystick -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetJoystickPath}SDL_GetJoystickPath}: Get the implementation dependent path of a joystick.


    @param joystick the SDL_Joystick obtained from SDL_OpenJoystick().

    @return the path of the selected joystick. If no path can be found, this
function returns NULL; call SDL_GetError() for more information.*)

val get_player_index : joystick -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetJoystickPlayerIndex}SDL_GetJoystickPlayerIndex}: Get the player index of an opened joystick.

For XInput controllers this returns the XInput user index. Many joysticks
will not be able to supply this information.


    @param joystick the SDL_Joystick obtained from SDL_OpenJoystick().

    @return the player index, or -1 if it's not available.*)

val set_player_index : joystick -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetJoystickPlayerIndex}SDL_SetJoystickPlayerIndex}: Set the player index of an opened joystick.


    @param joystick the SDL_Joystick obtained from SDL_OpenJoystick().
    @param player_index player index to assign to this joystick, or -1 to clear
the player index and turn off player LEDs.*)

val get_guid : joystick -> guid
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetJoystickGUID}SDL_GetJoystickGUID}: Get the implementation-dependent GUID for the joystick.

This function requires an open joystick.


    @param joystick the SDL_Joystick obtained from SDL_OpenJoystick().

    @return the GUID of the given joystick. If called on an invalid index,
this function returns a zero GUID; call SDL_GetError() for more
information.*)

val get_vendor : joystick -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetJoystickVendor}SDL_GetJoystickVendor}: Get the USB vendor ID of an opened joystick, if available.

If the vendor ID isn't available this function returns 0.


    @param joystick the SDL_Joystick obtained from SDL_OpenJoystick().

    @return the USB vendor ID of the selected joystick, or 0 if unavailable.*)

val get_product : joystick -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetJoystickProduct}SDL_GetJoystickProduct}: Get the USB product ID of an opened joystick, if available.

If the product ID isn't available this function returns 0.


    @param joystick the SDL_Joystick obtained from SDL_OpenJoystick().

    @return the USB product ID of the selected joystick, or 0 if unavailable.*)

val get_product_version : joystick -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetJoystickProductVersion}SDL_GetJoystickProductVersion}: Get the product version of an opened joystick, if available.

If the product version isn't available this function returns 0.


    @param joystick the SDL_Joystick obtained from SDL_OpenJoystick().

    @return the product version of the selected joystick, or 0 if unavailable.*)

val get_firmware_version : joystick -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetJoystickFirmwareVersion}SDL_GetJoystickFirmwareVersion}: Get the firmware version of an opened joystick, if available.

If the firmware version isn't available this function returns 0.


    @param joystick the SDL_Joystick obtained from SDL_OpenJoystick().

    @return the firmware version of the selected joystick, or 0 if
unavailable.*)

val get_serial : joystick -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetJoystickSerial}SDL_GetJoystickSerial}: Get the serial number of an opened joystick, if available.

Returns the serial number of the joystick, or NULL if it is not available.


    @param joystick the SDL_Joystick obtained from SDL_OpenJoystick().

    @return the serial number of the selected joystick, or NULL if
unavailable.*)

val get_type : joystick -> joystick_type_enum
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetJoystickType}SDL_GetJoystickType}: Get the type of an opened joystick.


    @param joystick the SDL_Joystick obtained from SDL_OpenJoystick().

    @return the SDL_JoystickType of the selected joystick.*)

val connected : joystick -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_JoystickConnected}SDL_JoystickConnected}: Get the status of a specified joystick.


    @param joystick the joystick to query.*)

val get_id : joystick -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetJoystickID}SDL_GetJoystickID}: Get the instance ID of an opened joystick.


    @param joystick an SDL_Joystick structure containing joystick information.

    @return the instance ID of the specified joystick on success or 0 on
failure; call SDL_GetError() for more information.*)

val get_num_axes : joystick -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetNumJoystickAxes}SDL_GetNumJoystickAxes}: Get the number of general axis controls on a joystick.

Often, the directional pad on a game controller will either look like 4
separate buttons or a POV hat, and not axes, but all of this is up to the
device and platform.


    @param joystick an SDL_Joystick structure containing joystick information.

    @return the number of axis controls/number of axes on success or -1 on
failure; call SDL_GetError() for more information.*)

val get_num_balls : joystick -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetNumJoystickBalls}SDL_GetNumJoystickBalls}: Get the number of trackballs on a joystick.

Joystick trackballs have only relative motion events associated with them
and their state cannot be polled.

Most joysticks do not have trackballs.


    @param joystick an SDL_Joystick structure containing joystick information.

    @return the number of trackballs on success or -1 on failure; call
SDL_GetError() for more information.*)

val get_num_hats : joystick -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetNumJoystickHats}SDL_GetNumJoystickHats}: Get the number of POV hats on a joystick.


    @param joystick an SDL_Joystick structure containing joystick information.

    @return the number of POV hats on success or -1 on failure; call
SDL_GetError() for more information.*)

val get_num_buttons : joystick -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetNumJoystickButtons}SDL_GetNumJoystickButtons}: Get the number of buttons on a joystick.


    @param joystick an SDL_Joystick structure containing joystick information.

    @return the number of buttons on success or -1 on failure; call
SDL_GetError() for more information.*)

val set_events_enabled : bool -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetJoystickEventsEnabled}SDL_SetJoystickEventsEnabled}: Set the state of joystick event processing.

If joystick events are disabled, you must call SDL_UpdateJoysticks()
yourself and check the state of the joystick when you want joystick
information.


    @param enabled whether to process joystick events or not.
*)

val events_enabled : unit -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_JoystickEventsEnabled}SDL_JoystickEventsEnabled}: Query the state of joystick event processing.

If joystick events are disabled, you must call SDL_UpdateJoysticks()
yourself and check the state of the joystick when you want joystick
information.


    @return true if joystick events are being processed, false otherwise.*)

val updates : unit -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_UpdateJoysticks}SDL_UpdateJoysticks}: Update the current state of the open joysticks.

This is called automatically by the event loop if any joystick events are
enabled.
*)

val get_axis : joystick -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetJoystickAxis}SDL_GetJoystickAxis}: Get the current state of an axis control on a joystick.

SDL makes no promises about what part of the joystick any given axis refers
to. Your game should have some sort of configuration UI to let users
specify what each axis should be bound to. Alternately, SDL's higher-level
Game Controller API makes a great effort to apply order to this lower-level
interface, so you know that a specific axis is the "left thumb stick," etc.

The value returned by SDL_GetJoystickAxis() is a signed integer (-32768 to
32767) representing the current position of the axis. It may be necessary
to impose certain tolerances on these values to account for jitter.


    @param joystick an SDL_Joystick structure containing joystick information.
    @param axis the axis to query; the axis indices start at index 0.

    @return a 16-bit signed integer representing the current position of the
axis or 0 on failure; call SDL_GetError() for more information.*)

val get_axis_initial_state : joystick -> int -> int Ctypes.ptr -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetJoystickAxisInitialState}SDL_GetJoystickAxisInitialState}: Get the initial state of an axis control on a joystick.

The state is a value ranging from -32768 to 32767.

The axis indices start at index 0.


    @param joystick an SDL_Joystick structure containing joystick information.
    @param axis the axis to query; the axis indices start at index 0.
    @param state upon return, the initial value is supplied here.*)

val get_ball : joystick -> int -> (int * int) result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetJoystickBall}SDL_GetJoystickBall}: Get the ball axis change since the last poll.

Trackballs can only return relative motion since the last call to
SDL_GetJoystickBall(), these motion deltas are placed into[dx]and[dy]

Most joysticks do not have trackballs.


    @param joystick the SDL_Joystick to query.
    @param ball the ball index to query; ball indices start at index 0.

    @return 2 values:
(
  + dx : stores the difference in the x axis position since the last poll.,
  + dy : stores the difference in the y axis position since the last poll.
)*)

val get_hat : joystick -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetJoystickHat}SDL_GetJoystickHat}: Get the current state of a POV hat on a joystick.

The returned value will be one of the[SDL_HAT_*]values.


    @param joystick an SDL_Joystick structure containing joystick information.
    @param hat the hat index to get the state from; indices start at index 0.

    @return the current hat position.*)

val get_button : joystick -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetJoystickButton}SDL_GetJoystickButton}: Get the current state of a button on a joystick.


    @param joystick an SDL_Joystick structure containing joystick information.
    @param button the button index to get the state from; indices start at
index 0.*)

val rumble : joystick -> int -> int -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_RumbleJoystick}SDL_RumbleJoystick}: Start a rumble effect.

Each call to this function cancels any previous rumble effect, and calling
it with 0 intensity stops any rumbling.

This function requires you to process SDL events or call
SDL_UpdateJoysticks() to update rumble state.


    @param joystick the joystick to vibrate.
    @param low_frequency_rumble the intensity of the low frequency (left)
rumble motor, from 0 to 0xFFFF.
    @param high_frequency_rumble the intensity of the high frequency (right)
rumble motor, from 0 to 0xFFFF.
    @param duration_ms the duration of the rumble effect, in milliseconds.*)

val rumble_triggers : joystick -> int -> int -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_RumbleJoystickTriggers}SDL_RumbleJoystickTriggers}: Start a rumble effect in the joystick's triggers.

Each call to this function cancels any previous trigger rumble effect, and
calling it with 0 intensity stops any rumbling.

Note that this is rumbling of the _triggers_ and not the game controller as
a whole. This is currently only supported on Xbox One controllers. If you
want the (more common) whole-controller rumble, use SDL_RumbleJoystick()
instead.

This function requires you to process SDL events or call
SDL_UpdateJoysticks() to update rumble state.


    @param joystick the joystick to vibrate.
    @param left_rumble the intensity of the left trigger rumble motor, from 0
to 0xFFFF.
    @param right_rumble the intensity of the right trigger rumble motor, from 0
to 0xFFFF.
    @param duration_ms the duration of the rumble effect, in milliseconds.*)

val set_led : joystick -> int -> int -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetJoystickLED}SDL_SetJoystickLED}: Update a joystick's LED color.

An example of a joystick LED is the light on the back of a PlayStation 4's
DualShock 4 controller.

For joysticks with a single color LED, the maximum of the RGB values will
be used as the LED brightness.


    @param joystick the joystick to update.
    @param red the intensity of the red LED.
    @param green the intensity of the green LED.
    @param blue the intensity of the blue LED.*)

val send_effect : joystick -> data -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SendJoystickEffect}SDL_SendJoystickEffect}: Send a joystick specific effect packet.


    @param joystick the joystick to affect.
    @param data the data to send to the joystick.
    @param size the size of the data to send to the joystick.*)

val close : joystick -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_CloseJoystick}SDL_CloseJoystick}: Close a joystick previously opened with SDL_OpenJoystick().


    @param joystick the joystick device to close.
*)

val get_connection_state : joystick -> joystick_connection_state_enum
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetJoystickConnectionState}SDL_GetJoystickConnectionState}: Get the connection state of a joystick.


    @param joystick the joystick to query.

    @return the connection state on success or[SDL_JOYSTICK_CONNECTION_INVALID]on failure; call SDL_GetError()
for more information.*)

val get_power_info : joystick -> power_state_enum * int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetJoystickPowerInfo}SDL_GetJoystickPowerInfo}: Get the battery state of a joystick.

You should never take a battery status as absolute truth. Batteries
(especially failing batteries) are delicate hardware, and the values
reported here are best estimates based on what that hardware reports. It's
not uncommon for older batteries to lose stored power much faster than it
reports, or completely drain when reporting it has 20 percent left, etc.


    @param joystick the joystick to query.

    @return a pointer filled in with the percentage of battery life
left, between 0 and 100, or NULL to ignore. This will be
filled in with -1 we can't determine a value or there is no
battery.*)

end

module GUID : sig

val get_joystick_info : guid -> int * int * int * int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetJoystickGUIDInfo}SDL_GetJoystickGUIDInfo}: Get the device information encoded in a SDL_GUID structure.


    @param guid the SDL_GUID you wish to get info about.*)

end

