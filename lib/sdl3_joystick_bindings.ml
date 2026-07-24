(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Helpers
open Sdl3_types

let ff = Load.foreign

module Global = struct
let lock_joysticks = ff "SDL_LockJoysticks"
  (void @-> returning void)

let unlock_joysticks = ff "SDL_UnlockJoysticks"
  (void @-> returning void)

let has_joystick = ff "SDL_HasJoystick"
  (void @-> returning bool)

let get_joysticks = ff "SDL_GetJoysticks"
  (ptr int @-> returning (ptr joystick_id))
(* Wrapper for returning uint list *)
let get_joysticks () =
  let count = allocate int 0 in
  let p = get_joysticks count in
  if is_null p then []
  else let n =  (!@ count) in
    Fun.protect ~finally:(fun () -> Sdl3_stdinc_bindings.free (to_voidp p))
      (fun () ->
        CArray.from_ptr p n
        |> CArray.to_list
        |> List.map Unsigned.UInt.to_int)

let get_joystick_name_for_id = ff "SDL_GetJoystickNameForID"
  (joystick_id @-> returning string)
let get_joystick_name_for_id instance_id =
  get_joystick_name_for_id (Unsigned.UInt.of_int instance_id)

let get_joystick_path_for_id = ff "SDL_GetJoystickPathForID"
  (joystick_id @-> returning string)
let get_joystick_path_for_id instance_id =
  get_joystick_path_for_id (Unsigned.UInt.of_int instance_id)

let get_joystick_player_index_for_id = ff "SDL_GetJoystickPlayerIndexForID"
  (joystick_id @-> returning int)
let get_joystick_player_index_for_id instance_id =
  get_joystick_player_index_for_id (Unsigned.UInt.of_int instance_id)

let get_joystick_vendor_for_id = ff "SDL_GetJoystickVendorForID"
  (joystick_id @-> returning uint16)
let get_joystick_vendor_for_id instance_id =
  get_joystick_vendor_for_id (Unsigned.UInt.of_int instance_id)

let get_joystick_product_for_id = ff "SDL_GetJoystickProductForID"
  (joystick_id @-> returning uint16)
let get_joystick_product_for_id instance_id =
  get_joystick_product_for_id (Unsigned.UInt.of_int instance_id)

let get_joystick_product_version_for_id = ff "SDL_GetJoystickProductVersionForID"
  (joystick_id @-> returning uint16)
let get_joystick_product_version_for_id instance_id =
  get_joystick_product_version_for_id (Unsigned.UInt.of_int instance_id)

let detach_virtual_joystick = ff "SDL_DetachVirtualJoystick"
  (joystick_id @-> returning true_to_ok)
let detach_virtual_joystick instance_id =
  detach_virtual_joystick (Unsigned.UInt.of_int instance_id)

let is_joystick_virtual = ff "SDL_IsJoystickVirtual"
  (joystick_id @-> returning bool)
let is_joystick_virtual instance_id =
  is_joystick_virtual (Unsigned.UInt.of_int instance_id)

let set_joystick_events_enabled = ff "SDL_SetJoystickEventsEnabled"
  (bool @-> returning void)

let joystick_events_enabled = ff "SDL_JoystickEventsEnabled"
  (void @-> returning bool)

let update_joysticks = ff "SDL_UpdateJoysticks"
  (void @-> returning void)

end
include Global

module GUID = struct
let get_joystick_for_id = ff "SDL_GetJoystickGUIDForID"
  (joystick_id @-> returning guid)
let get_joystick_for_id instance_id =
  get_joystick_for_id (Unsigned.UInt.of_int instance_id)

let get_joystick_info = ff "SDL_GetJoystickGUIDInfo"
  (guid @-> ptr uint16 @-> ptr uint16 @-> ptr uint16 @-> ptr uint16 @-> returning void)
let get_joystick_info guid =
  let vendor = allocate ushort (Unsigned.UShort.of_int 0) in
  let product = allocate ushort (Unsigned.UShort.of_int 0) in
  let version = allocate ushort (Unsigned.UShort.of_int 0) in
  let crc16 = allocate ushort (Unsigned.UShort.of_int 0) in
  get_joystick_info guid vendor product version crc16;
  (Unsigned.UShort.to_int (!@ vendor), Unsigned.UShort.to_int (!@ product), Unsigned.UShort.to_int (!@ version), Unsigned.UShort.to_int (!@ crc16))

end

module JoystickType = struct
let get_for_id = ff "SDL_GetJoystickTypeForID"
  (joystick_id @-> returning joystick_type)
let get_for_id instance_id =
  get_for_id (Unsigned.UInt.of_int instance_id)

end

module Joystick = struct
let open_ = ff "SDL_OpenJoystick"
  (joystick_id @-> returning (some_to_ok joystick_opt))
let open_ instance_id =
  open_ (Unsigned.UInt.of_int instance_id)

let get_from_id = ff "SDL_GetJoystickFromID"
  (joystick_id @-> returning (some_to_ok joystick_opt))
let get_from_id instance_id =
  get_from_id (Unsigned.UInt.of_int instance_id)

let get_from_player_index = ff "SDL_GetJoystickFromPlayerIndex"
  (int @-> returning (some_to_ok joystick_opt))

let set_virtual_axis = ff "SDL_SetJoystickVirtualAxis"
  (joystick @-> int @-> sint16 @-> returning true_to_ok)

let set_virtual_ball = ff "SDL_SetJoystickVirtualBall"
  (joystick @-> int @-> sint16 @-> sint16 @-> returning true_to_ok)

let set_virtual_button = ff "SDL_SetJoystickVirtualButton"
  (joystick @-> int @-> bool @-> returning true_to_ok)

let set_virtual_hat = ff "SDL_SetJoystickVirtualHat"
  (joystick @-> int @-> uint8 @-> returning true_to_ok)
let set_virtual_hat joystick hat value =
  set_virtual_hat joystick hat (Unsigned.UChar.of_int value)

let set_virtual_touchpad = ff "SDL_SetJoystickVirtualTouchpad"
  (joystick @-> int @-> int @-> bool @-> float @-> float @-> float @-> returning true_to_ok)

let send_virtual_sensor_data = ff "SDL_SendJoystickVirtualSensorData"
  (joystick @-> sensor_type @-> uint64 @-> ptr (const float) @-> int @-> returning true_to_ok)
let send_virtual_sensor_data joystick typ sensor_timestamp data num_values =
  send_virtual_sensor_data joystick typ (Unsigned.ULong.of_int64 sensor_timestamp) data num_values

let get_properties = ff "SDL_GetJoystickProperties"
  (joystick @-> returning properties_id)

let get_name = ff "SDL_GetJoystickName"
  (joystick @-> returning string)

let get_path = ff "SDL_GetJoystickPath"
  (joystick @-> returning string)

let get_player_index = ff "SDL_GetJoystickPlayerIndex"
  (joystick @-> returning int)

let set_player_index = ff "SDL_SetJoystickPlayerIndex"
  (joystick @-> int @-> returning true_to_ok)

let get_guid = ff "SDL_GetJoystickGUID"
  (joystick @-> returning guid)

let get_vendor = ff "SDL_GetJoystickVendor"
  (joystick @-> returning uint16)

let get_product = ff "SDL_GetJoystickProduct"
  (joystick @-> returning uint16)

let get_product_version = ff "SDL_GetJoystickProductVersion"
  (joystick @-> returning uint16)

let get_firmware_version = ff "SDL_GetJoystickFirmwareVersion"
  (joystick @-> returning uint16)

let get_serial = ff "SDL_GetJoystickSerial"
  (joystick @-> returning string)

let get_type = ff "SDL_GetJoystickType"
  (joystick @-> returning joystick_type)

let connected = ff "SDL_JoystickConnected"
  (joystick @-> returning true_to_ok)

let get_id = ff "SDL_GetJoystickID"
  (joystick @-> returning joystick_id)

let get_num_axes = ff "SDL_GetNumJoystickAxes"
  (joystick @-> returning int)

let get_num_balls = ff "SDL_GetNumJoystickBalls"
  (joystick @-> returning int)

let get_num_hats = ff "SDL_GetNumJoystickHats"
  (joystick @-> returning int)

let get_num_buttons = ff "SDL_GetNumJoystickButtons"
  (joystick @-> returning int)

let get_axis = ff "SDL_GetJoystickAxis"
  (joystick @-> int @-> returning sint16)

let get_axis_initial_state = ff "SDL_GetJoystickAxisInitialState"
  (joystick @-> int @-> ptr sint16 @-> returning true_to_ok)

let get_ball = ff "SDL_GetJoystickBall"
  (joystick @-> int @-> ptr int @-> ptr int @-> returning bool)
let get_ball joystick ball =
  let dx = allocate int 0 in
  let dy = allocate int 0 in
  if get_ball joystick ball dx dy then Ok (!@ dx, !@ dy) else error ()

let get_hat = ff "SDL_GetJoystickHat"
  (joystick @-> int @-> returning uint8)

let get_button = ff "SDL_GetJoystickButton"
  (joystick @-> int @-> returning true_to_ok)

let rumble = ff "SDL_RumbleJoystick"
  (joystick @-> uint16 @-> uint16 @-> uint32 @-> returning true_to_ok)
let rumble joystick low_frequency_rumble high_frequency_rumble duration_ms =
  rumble joystick (Unsigned.UShort.of_int low_frequency_rumble) (Unsigned.UShort.of_int high_frequency_rumble) (Unsigned.UInt.of_int duration_ms)

let rumble_triggers = ff "SDL_RumbleJoystickTriggers"
  (joystick @-> uint16 @-> uint16 @-> uint32 @-> returning true_to_ok)
let rumble_triggers joystick left_rumble right_rumble duration_ms =
  rumble_triggers joystick (Unsigned.UShort.of_int left_rumble) (Unsigned.UShort.of_int right_rumble) (Unsigned.UInt.of_int duration_ms)

let set_led = ff "SDL_SetJoystickLED"
  (joystick @-> uint8 @-> uint8 @-> uint8 @-> returning true_to_ok)
let set_led joystick red green blue =
  set_led joystick (Unsigned.UChar.of_int red) (Unsigned.UChar.of_int green) (Unsigned.UChar.of_int blue)

let send_effect = ff "SDL_SendJoystickEffect"
  (joystick @-> ptr void @-> int @-> returning true_to_ok)

let close = ff "SDL_CloseJoystick"
  (joystick @-> returning void)

let get_connection_state = ff "SDL_GetJoystickConnectionState"
  (joystick @-> returning joystick_connection_state)

let get_power_info = ff "SDL_GetJoystickPowerInfo"
  (joystick @-> ptr int @-> returning power_state)
let get_power_info joystick =
  let percent = allocate int 0 in
  let ret = get_power_info joystick percent in
(ret, !@ percent)

end

module VirtualJoystickDesc = struct
let attach_virtual_joystick = ff "SDL_AttachVirtualJoystick"
  (ptr virtual_joystick_desc @-> returning joystick_id)

include VirtualJoystickDesc

end

