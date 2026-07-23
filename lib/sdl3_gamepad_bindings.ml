(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Helpers
open Sdl3_types

let ff = Load.foreign

module Global = struct
let add_gamepad_mapping = ff "SDL_AddGamepadMapping"
  (string @-> returning int)

let add_gamepad_mappings_from_file = ff "SDL_AddGamepadMappingsFromFile"
  (string @-> returning int)

let reload_gamepad_mappings = ff "SDL_ReloadGamepadMappings"
  (void @-> returning true_to_ok)

let get_gamepad_mappings = ff "SDL_GetGamepadMappings"
  (ptr int @-> returning (ptr string))
(* Wrapper for returning string list *)
let get_gamepad_mappings () =
  let count = allocate int 0 in
  let p = get_gamepad_mappings count in
  if is_null p then []
  else let n =  (!@ count) in
    Fun.protect ~finally:(fun () -> Sdl3_stdinc_bindings.free (to_voidp p))
      (fun () ->
        CArray.from_ptr p n
        |> CArray.to_list)

let set_gamepad_mapping = ff "SDL_SetGamepadMapping"
  (joystick_id @-> string @-> returning true_to_ok)
let set_gamepad_mapping instance_id mapping =
  set_gamepad_mapping (Unsigned.UInt.of_int instance_id) mapping

let has_gamepad = ff "SDL_HasGamepad"
  (void @-> returning bool)

let get_gamepads = ff "SDL_GetGamepads"
  (ptr int @-> returning (ptr joystick_id))
(* Wrapper for returning uint list *)
let get_gamepads () =
  let count = allocate int 0 in
  let p = get_gamepads count in
  if is_null p then []
  else let n =  (!@ count) in
    Fun.protect ~finally:(fun () -> Sdl3_stdinc_bindings.free (to_voidp p))
      (fun () ->
        CArray.from_ptr p n
        |> CArray.to_list
        |> List.map Unsigned.UInt.to_int)

let is_gamepad = ff "SDL_IsGamepad"
  (joystick_id @-> returning bool)
let is_gamepad instance_id =
  is_gamepad (Unsigned.UInt.of_int instance_id)

let get_gamepad_name_for_id = ff "SDL_GetGamepadNameForID"
  (joystick_id @-> returning string)
let get_gamepad_name_for_id instance_id =
  get_gamepad_name_for_id (Unsigned.UInt.of_int instance_id)

let get_gamepad_path_for_id = ff "SDL_GetGamepadPathForID"
  (joystick_id @-> returning string)
let get_gamepad_path_for_id instance_id =
  get_gamepad_path_for_id (Unsigned.UInt.of_int instance_id)

let get_gamepad_player_index_for_id = ff "SDL_GetGamepadPlayerIndexForID"
  (joystick_id @-> returning int)
let get_gamepad_player_index_for_id instance_id =
  get_gamepad_player_index_for_id (Unsigned.UInt.of_int instance_id)

let get_gamepad_vendor_for_id = ff "SDL_GetGamepadVendorForID"
  (joystick_id @-> returning uint16)
let get_gamepad_vendor_for_id instance_id =
  get_gamepad_vendor_for_id (Unsigned.UInt.of_int instance_id)

let get_gamepad_product_for_id = ff "SDL_GetGamepadProductForID"
  (joystick_id @-> returning uint16)
let get_gamepad_product_for_id instance_id =
  get_gamepad_product_for_id (Unsigned.UInt.of_int instance_id)

let get_gamepad_product_version_for_id = ff "SDL_GetGamepadProductVersionForID"
  (joystick_id @-> returning uint16)
let get_gamepad_product_version_for_id instance_id =
  get_gamepad_product_version_for_id (Unsigned.UInt.of_int instance_id)

let get_gamepad_mapping_for_id = ff "SDL_GetGamepadMappingForID"
  (joystick_id @-> returning string)
let get_gamepad_mapping_for_id instance_id =
  get_gamepad_mapping_for_id (Unsigned.UInt.of_int instance_id)

let set_gamepad_events_enabled = ff "SDL_SetGamepadEventsEnabled"
  (bool @-> returning void)

let gamepad_events_enabled = ff "SDL_GamepadEventsEnabled"
  (void @-> returning bool)

let update_gamepads = ff "SDL_UpdateGamepads"
  (void @-> returning void)

end
include Global

module IOStream = struct
let add_gamepad_mappings_from_io = ff "SDL_AddGamepadMappingsFromIO"
  (io_stream @-> bool @-> returning int)

end

module GUID = struct
let get_gamepad_mapping_for = ff "SDL_GetGamepadMappingForGUID"
  (guid @-> returning string)

let get_gamepad_for_id = ff "SDL_GetGamepadGUIDForID"
  (joystick_id @-> returning guid)
let get_gamepad_for_id instance_id =
  get_gamepad_for_id (Unsigned.UInt.of_int instance_id)

end

module Gamepad = struct
let get_mapping = ff "SDL_GetGamepadMapping"
  (gamepad @-> returning string)

let open_ = ff "SDL_OpenGamepad"
  (joystick_id @-> returning (some_to_ok gamepad_opt))
let open_ instance_id =
  open_ (Unsigned.UInt.of_int instance_id)

let get_from_id = ff "SDL_GetGamepadFromID"
  (joystick_id @-> returning (some_to_ok gamepad_opt))
let get_from_id instance_id =
  get_from_id (Unsigned.UInt.of_int instance_id)

let get_from_player_index = ff "SDL_GetGamepadFromPlayerIndex"
  (int @-> returning (some_to_ok gamepad_opt))

let get_properties = ff "SDL_GetGamepadProperties"
  (gamepad @-> returning properties_id)

let get_id = ff "SDL_GetGamepadID"
  (gamepad @-> returning joystick_id)

let get_name = ff "SDL_GetGamepadName"
  (gamepad @-> returning string)

let get_path = ff "SDL_GetGamepadPath"
  (gamepad @-> returning string)

let get_type = ff "SDL_GetGamepadType"
  (gamepad @-> returning gamepad_type)

let get_player_index = ff "SDL_GetGamepadPlayerIndex"
  (gamepad @-> returning int)

let set_player_index = ff "SDL_SetGamepadPlayerIndex"
  (gamepad @-> int @-> returning true_to_ok)

let get_vendor = ff "SDL_GetGamepadVendor"
  (gamepad @-> returning uint16)

let get_product = ff "SDL_GetGamepadProduct"
  (gamepad @-> returning uint16)

let get_product_version = ff "SDL_GetGamepadProductVersion"
  (gamepad @-> returning uint16)

let get_firmware_version = ff "SDL_GetGamepadFirmwareVersion"
  (gamepad @-> returning uint16)

let get_serial = ff "SDL_GetGamepadSerial"
  (gamepad @-> returning string)

let get_steam_handle = ff "SDL_GetGamepadSteamHandle"
  (gamepad @-> returning uint64)

let get_connection_state = ff "SDL_GetGamepadConnectionState"
  (gamepad @-> returning joystick_connection_state)

let get_power_info = ff "SDL_GetGamepadPowerInfo"
  (gamepad @-> ptr int @-> returning power_state)
let get_power_info gamepad =
  let percent = allocate int 0 in
  let ret = get_power_info gamepad percent in
(ret, !@ percent)

let connected = ff "SDL_GamepadConnected"
  (gamepad @-> returning true_to_ok)

let get_joystick = ff "SDL_GetGamepadJoystick"
  (gamepad @-> returning (some_to_ok joystick_opt))

let get_bindings = ff "SDL_GetGamepadBindings"
  (gamepad @-> ptr int @-> returning (ptr (ptr gamepad_binding)))
(* Wrapper for returning (ptr gamepad_binding) list *)
let get_bindings gamepad =
  let count = allocate int 0 in
  let p = get_bindings gamepad count in
  if is_null p then []
  else let n =  (!@ count) in
    Fun.protect ~finally:(fun () -> Sdl3_stdinc_bindings.free (to_voidp p))
      (fun () ->
        CArray.from_ptr p n
        |> CArray.to_list)

let has_axis = ff "SDL_GamepadHasAxis"
  (gamepad @-> gamepad_axis @-> returning bool)

let get_axis = ff "SDL_GetGamepadAxis"
  (gamepad @-> gamepad_axis @-> returning sint16)

let has_button = ff "SDL_GamepadHasButton"
  (gamepad @-> gamepad_button @-> returning bool)

let get_button = ff "SDL_GetGamepadButton"
  (gamepad @-> gamepad_button @-> returning true_to_ok)

let get_button_label = ff "SDL_GetGamepadButtonLabel"
  (gamepad @-> gamepad_button @-> returning gamepad_button_label)

let get_num_touchpads = ff "SDL_GetNumGamepadTouchpads"
  (gamepad @-> returning int)

let get_num_touchpad_fingers = ff "SDL_GetNumGamepadTouchpadFingers"
  (gamepad @-> int @-> returning int)

let get_touchpad_finger = ff "SDL_GetGamepadTouchpadFinger"
  (gamepad @-> int @-> int @-> ptr bool @-> ptr float @-> ptr float @-> ptr float @-> returning bool)
let get_touchpad_finger gamepad touchpad finger down =
  let x = allocate float 0. in
  let y = allocate float 0. in
  let pressure = allocate float 0. in
  if get_touchpad_finger gamepad touchpad finger down x y pressure then Ok (!@ x, !@ y, !@ pressure) else error ()

let has_sensor = ff "SDL_GamepadHasSensor"
  (gamepad @-> sensor_type @-> returning bool)

let set_sensor_enabled = ff "SDL_SetGamepadSensorEnabled"
  (gamepad @-> sensor_type @-> bool @-> returning bool)

let sensor_enabled = ff "SDL_GamepadSensorEnabled"
  (gamepad @-> sensor_type @-> returning bool)

let get_sensor_data_rate = ff "SDL_GetGamepadSensorDataRate"
  (gamepad @-> sensor_type @-> returning float)

let get_sensor_data = ff "SDL_GetGamepadSensorData"
  (gamepad @-> sensor_type @-> ptr float @-> int @-> returning true_to_ok)

let rumble = ff "SDL_RumbleGamepad"
  (gamepad @-> uint16 @-> uint16 @-> uint32 @-> returning true_to_ok)
let rumble gamepad low_frequency_rumble high_frequency_rumble duration_ms =
  rumble gamepad (Unsigned.UShort.of_int low_frequency_rumble) (Unsigned.UShort.of_int high_frequency_rumble) (Unsigned.UInt.of_int duration_ms)

let rumble_triggers = ff "SDL_RumbleGamepadTriggers"
  (gamepad @-> uint16 @-> uint16 @-> uint32 @-> returning true_to_ok)
let rumble_triggers gamepad left_rumble right_rumble duration_ms =
  rumble_triggers gamepad (Unsigned.UShort.of_int left_rumble) (Unsigned.UShort.of_int right_rumble) (Unsigned.UInt.of_int duration_ms)

let set_led = ff "SDL_SetGamepadLED"
  (gamepad @-> uint8 @-> uint8 @-> uint8 @-> returning true_to_ok)
let set_led gamepad red green blue =
  set_led gamepad (Unsigned.UChar.of_int red) (Unsigned.UChar.of_int green) (Unsigned.UChar.of_int blue)

let send_effect = ff "SDL_SendGamepadEffect"
  (gamepad @-> ptr void @-> int @-> returning true_to_ok)

let close = ff "SDL_CloseGamepad"
  (gamepad @-> returning void)

let get_apple_sf_symbols_name_for_button = ff "SDL_GetGamepadAppleSFSymbolsNameForButton"
  (gamepad @-> gamepad_button @-> returning string)

let get_apple_sf_symbols_name_for_axis = ff "SDL_GetGamepadAppleSFSymbolsNameForAxis"
  (gamepad @-> gamepad_axis @-> returning string)

end

module GamepadType = struct
let get_for_id = ff "SDL_GetGamepadTypeForID"
  (joystick_id @-> returning gamepad_type)
let get_for_id instance_id =
  get_for_id (Unsigned.UInt.of_int instance_id)

let get_real_for_id = ff "SDL_GetRealGamepadTypeForID"
  (joystick_id @-> returning gamepad_type)
let get_real_for_id instance_id =
  get_real_for_id (Unsigned.UInt.of_int instance_id)

let get_real = ff "SDL_GetRealGamepadType"
  (gamepad @-> returning gamepad_type)

let get_from_string = ff "SDL_GetGamepadTypeFromString"
  (string @-> returning gamepad_type)

let get_gamepad_string_for_type = ff "SDL_GetGamepadStringForType"
  (gamepad_type @-> returning string)

end

module GamepadAxis = struct
let get_from_string = ff "SDL_GetGamepadAxisFromString"
  (string @-> returning gamepad_axis)

let get_gamepad_string_for_axis = ff "SDL_GetGamepadStringForAxis"
  (gamepad_axis @-> returning string)

end

module GamepadButton = struct
let get_from_string = ff "SDL_GetGamepadButtonFromString"
  (string @-> returning gamepad_button)

let get_gamepad_string_for_button = ff "SDL_GetGamepadStringForButton"
  (gamepad_button @-> returning string)

end

module GamepadButtonLabel = struct
let get_for_type = ff "SDL_GetGamepadButtonLabelForType"
  (gamepad_type @-> gamepad_button @-> returning gamepad_button_label)

end

