(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Helpers
open Sdl3_types

let ff = Load.foreign

module Keyboard = struct
let has = ff "SDL_HasKeyboard"
  (void @-> returning true_to_ok)

let gets = ff "SDL_GetKeyboards"
  (ptr int @-> returning (ptr keyboard_id))
(* Wrapper for returning uint list *)
let gets () =
  let count = allocate int 0 in
  let p = gets count in
  if is_null p then []
  else let n =  (!@ (count)) in
    Fun.protect ~finally:(fun () -> Sdl3_stdinc_bindings.free (to_voidp p))
      (fun () ->
        CArray.from_ptr p n
        |> CArray.to_list
        |> List.map Unsigned.UInt.to_int)

let get_name_for_id = ff "SDL_GetKeyboardNameForID"
  (keyboard_id @-> returning string)
let get_name_for_id instance_id =
  get_name_for_id (Unsigned.UInt.of_int instance_id)

let get_focus = ff "SDL_GetKeyboardFocus"
  (void @-> returning (some_to_ok window_opt))

let get_state = ff "SDL_GetKeyboardState"
  (ptr int @-> returning (ptr bool))
(* Wrapper for returning bool list *)
let get_state () =
  let numkeys = allocate int 0 in
  let p = get_state numkeys in
  if is_null p then []
  else let n =  (!@ (numkeys)) in
    Fun.protect ~finally:(fun () -> Sdl3_stdinc_bindings.free (to_voidp p))
      (fun () ->
        CArray.from_ptr p n
        |> CArray.to_list)

let reset = ff "SDL_ResetKeyboard"
  (void @-> returning void)

let has_screen_support = ff "SDL_HasScreenKeyboardSupport"
  (void @-> returning bool)

let screen_shown = ff "SDL_ScreenKeyboardShown"
  (window @-> returning bool)

end

module Global = struct
let get_mod_state = ff "SDL_GetModState"
  (void @-> returning int_as_ushort)

let set_mod_state = ff "SDL_SetModState"
  (keymod @-> returning void)
let set_mod_state modstate =
  set_mod_state (Unsigned.UShort.of_int modstate)

let get_key_name = ff "SDL_GetKeyName"
  (keycode @-> returning string)
let get_key_name key =
  get_key_name (Unsigned.UInt.of_int key)

let get_key_from_name = ff "SDL_GetKeyFromName"
  (string @-> returning int_as_uint)

let start_text_input = ff "SDL_StartTextInput"
  (window @-> returning true_to_ok)

let start_text_input_with_properties = ff "SDL_StartTextInputWithProperties"
  (window @-> properties_id @-> returning true_to_ok)
let start_text_input_with_properties window props =
  start_text_input_with_properties window (Unsigned.UInt.of_int props)

let text_input_active = ff "SDL_TextInputActive"
  (window @-> returning true_to_ok)

let stop_text_input = ff "SDL_StopTextInput"
  (window @-> returning true_to_ok)

let clear_composition = ff "SDL_ClearComposition"
  (window @-> returning true_to_ok)

let set_text_input_area = ff "SDL_SetTextInputArea"
  (window @-> rect_opt @-> int @-> returning true_to_ok)

let get_text_input_area = ff "SDL_GetTextInputArea"
  (window @-> rect_opt @-> ptr int @-> returning bool)
let get_text_input_area window rect =
  let cursor = allocate int 0 in
  if get_text_input_area window rect cursor then Ok (!@ cursor) else error ()

end
include Global

module Scancode = struct
let get_key_from = ff "SDL_GetKeyFromScancode"
  (scancode @-> keymod @-> bool @-> returning int_as_uint)
let get_key_from scancode modstate key_event =
  get_key_from scancode (Unsigned.UShort.of_int modstate) key_event

let get_from_key = ff "SDL_GetScancodeFromKey"
  (keycode @-> ptr_opt keymod @-> returning scancode)
let get_from_key key modstate =
  get_from_key (Unsigned.UInt.of_int key) modstate

let set_name = ff "SDL_SetScancodeName"
  (scancode @-> string @-> returning true_to_ok)

let get_name = ff "SDL_GetScancodeName"
  (scancode @-> returning string)

let get_from_name = ff "SDL_GetScancodeFromName"
  (string @-> returning scancode)

end

