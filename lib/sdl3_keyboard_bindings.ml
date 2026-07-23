(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Sdl3_types
open Helpers

let ff = Load.foreign

module Global = struct
let has_keyboard = ff "SDL_HasKeyboard"
  (void @-> returning bool)

let get_keyboards = ff "SDL_GetKeyboards"
  (ptr int @-> returning (ptr keyboard_id))
(* Wrapper for returning uint list *)
let get_keyboards () =
  let count = allocate int 0 in
  let p = get_keyboards count in
  if is_null p then []
  else let n =  (!@ count) in
    Fun.protect ~finally:(fun () -> Sdl3_stdinc_bindings.free (to_voidp p))
      (fun () ->
        CArray.from_ptr p n
        |> CArray.to_list
        |> List.map Unsigned.UInt.to_int)

let get_keyboard_name_for_id = ff "SDL_GetKeyboardNameForID"
  (keyboard_id @-> returning string)
let get_keyboard_name_for_id instance_id =
  get_keyboard_name_for_id (Unsigned.UInt.of_int instance_id)

let get_keyboard_state = ff "SDL_GetKeyboardState"
  (ptr int @-> returning (ptr bool))
let get_keyboard_state () =
  let numkeys = allocate int 0 in
  let ret = get_keyboard_state numkeys in
(ret, !@ numkeys)

let reset_keyboard = ff "SDL_ResetKeyboard"
  (void @-> returning void)

let get_mod_state = ff "SDL_GetModState"
  (void @-> returning keymod)

let set_mod_state = ff "SDL_SetModState"
  (keymod @-> returning void)
let set_mod_state modstate =
  set_mod_state (Unsigned.UShort.of_int modstate)

let get_key_name = ff "SDL_GetKeyName"
  (keycode @-> returning string)
let get_key_name key =
  get_key_name (Unsigned.UInt.of_int key)

let get_key_from_name = ff "SDL_GetKeyFromName"
  (string @-> returning keycode)

let has_screen_keyboard_support = ff "SDL_HasScreenKeyboardSupport"
  (void @-> returning bool)

end
include Global

module Window = struct
let get_keyboard_focus = ff "SDL_GetKeyboardFocus"
  (void @-> returning (some_to_ok window_opt))

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

let screen_keyboard_shown = ff "SDL_ScreenKeyboardShown"
  (window @-> returning true_to_ok)

end

module Scancode = struct
let get_key_from = ff "SDL_GetKeyFromScancode"
  (scancode @-> keymod @-> bool @-> returning keycode)
let get_key_from scancode modstate key_event =
  get_key_from scancode (Unsigned.UShort.of_int modstate) key_event

let get_from_key = ff "SDL_GetScancodeFromKey"
  (keycode @-> ptr keymod @-> returning scancode)
let get_from_key key modstate =
  get_from_key (Unsigned.UInt.of_int key) modstate

let set_name = ff "SDL_SetScancodeName"
  (scancode @-> string @-> returning true_to_ok)

let get_name = ff "SDL_GetScancodeName"
  (scancode @-> returning string)

let get_from_name = ff "SDL_GetScancodeFromName"
  (string @-> returning scancode)

end

