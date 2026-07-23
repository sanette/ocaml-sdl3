(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Sdl3_types

let ff = Load.foreign

module Global = struct
let get_touch_devices = ff "SDL_GetTouchDevices"
  (ptr int @-> returning (ptr touch_id))
(* Wrapper for returning ulong list *)
let get_touch_devices () =
  let count = allocate int 0 in
  let p = get_touch_devices count in
  if is_null p then []
  else let n =  (!@ count) in
    Fun.protect ~finally:(fun () -> Sdl3_stdinc_bindings.free (to_voidp p))
      (fun () ->
        CArray.from_ptr p n
        |> CArray.to_list
        |> List.map Unsigned.ULong.to_int64)

let get_touch_device_name = ff "SDL_GetTouchDeviceName"
  (touch_id @-> returning string)
let get_touch_device_name touch_id =
  get_touch_device_name (Unsigned.ULong.of_int64 touch_id)

let get_touch_fingers = ff "SDL_GetTouchFingers"
  (touch_id @-> ptr int @-> returning (ptr (ptr finger)))
(* Wrapper for returning (ptr finger) list *)
let get_touch_fingers touch_id =
  let count = allocate int 0 in
  let p = get_touch_fingers touch_id count in
  if is_null p then []
  else let n =  (!@ count) in
    Fun.protect ~finally:(fun () -> Sdl3_stdinc_bindings.free (to_voidp p))
      (fun () ->
        CArray.from_ptr p n
        |> CArray.to_list)
let get_touch_fingers touch_id =
  get_touch_fingers (Unsigned.ULong.of_int64 touch_id)

end
include Global

module TouchDeviceType = struct
let get = ff "SDL_GetTouchDeviceType"
  (touch_id @-> returning touch_device_type)
let get touch_id =
  get (Unsigned.ULong.of_int64 touch_id)

end

