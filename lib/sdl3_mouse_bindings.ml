(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Helpers
open Sdl3_types

let ff = Load.foreign

module Global = struct
let has_mouse = ff "SDL_HasMouse"
  (void @-> returning bool)

let get_mice = ff "SDL_GetMice"
  (ptr int @-> returning (ptr mouse_id))
(* Wrapper for returning uint list *)
let get_mice () =
  let count = allocate int 0 in
  let p = get_mice count in
  if is_null p then []
  else let n =  (!@ count) in
    Fun.protect ~finally:(fun () -> Sdl3_stdinc_bindings.free (to_voidp p))
      (fun () ->
        CArray.from_ptr p n
        |> CArray.to_list
        |> List.map Unsigned.UInt.to_int)

let get_mouse_name_for_id = ff "SDL_GetMouseNameForID"
  (mouse_id @-> returning string)
let get_mouse_name_for_id instance_id =
  get_mouse_name_for_id (Unsigned.UInt.of_int instance_id)

let get_mouse_state = ff "SDL_GetMouseState"
  (ptr float @-> ptr float @-> returning mouse_button_flags)
let get_mouse_state () =
  let x = allocate float 0. in
  let y = allocate float 0. in
  let ret = get_mouse_state x y in
(ret, !@ x, !@ y)

let get_global_mouse_state = ff "SDL_GetGlobalMouseState"
  (ptr float @-> ptr float @-> returning mouse_button_flags)
let get_global_mouse_state () =
  let x = allocate float 0. in
  let y = allocate float 0. in
  let ret = get_global_mouse_state x y in
(ret, !@ x, !@ y)

let get_relative_mouse_state = ff "SDL_GetRelativeMouseState"
  (ptr float @-> ptr float @-> returning mouse_button_flags)
let get_relative_mouse_state () =
  let x = allocate float 0. in
  let y = allocate float 0. in
  let ret = get_relative_mouse_state x y in
(ret, !@ x, !@ y)

let warp_mouse_global = ff "SDL_WarpMouseGlobal"
  (float @-> float @-> returning true_to_ok)

let set_relative_mouse_transform = ff "SDL_SetRelativeMouseTransform"
  (mouse_motion_transform_callback @-> ptr void @-> returning true_to_ok)

let capture_mouse = ff "SDL_CaptureMouse"
  (bool @-> returning true_to_ok)

let show_cursor = ff "SDL_ShowCursor"
  (void @-> returning true_to_ok)

let hide_cursor = ff "SDL_HideCursor"
  (void @-> returning true_to_ok)

let cursor_visible = ff "SDL_CursorVisible"
  (void @-> returning true_to_ok)

end
include Global

module Window = struct
let get_mouse_focus = ff "SDL_GetMouseFocus"
  (void @-> returning (some_to_ok window_opt))

let warp_mouse_in = ff "SDL_WarpMouseInWindow"
  (window_opt @-> float @-> float @-> returning void)

let set_relative_mouse_mode = ff "SDL_SetWindowRelativeMouseMode"
  (window @-> bool @-> returning true_to_ok)

let get_relative_mouse_mode = ff "SDL_GetWindowRelativeMouseMode"
  (window @-> returning true_to_ok)

end

module Cursor = struct
let create = ff "SDL_CreateCursor"
  (ptr uint8 @-> ptr uint8 @-> int @-> int @-> int @-> int @-> returning (some_to_ok cursor_opt))

let create_color = ff "SDL_CreateColorCursor"
  (surface @-> int @-> int @-> returning (some_to_ok cursor_opt))

let create_animated = ff "SDL_CreateAnimatedCursor"
  (ptr cursor_frame_info @-> int @-> int @-> int @-> returning (some_to_ok cursor_opt))

let set = ff "SDL_SetCursor"
  (cursor @-> returning true_to_ok)

let get = ff "SDL_GetCursor"
  (void @-> returning (some_to_ok cursor_opt))

let get_default = ff "SDL_GetDefaultCursor"
  (void @-> returning (some_to_ok cursor_opt))

let destroy = ff "SDL_DestroyCursor"
  (cursor @-> returning void)

end

module SystemCursor = struct
let create = ff "SDL_CreateSystemCursor"
  (system_cursor @-> returning (some_to_ok cursor_opt))

end

