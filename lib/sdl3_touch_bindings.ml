(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Sdl3_types

let ff = Load.foreign

module Touch = struct
let get_devices = ff "SDL_GetTouchDevices"
  (ptr int @-> returning (ptr touch_id))
(* Wrapper for returning ulong list *)
let get_devices () =
  let count = allocate int 0 in
  let p = get_devices count in
  if is_null p then []
  else let n =  (!@ (count)) in
    Fun.protect ~finally:(fun () -> Sdl3_stdinc_bindings.free (to_voidp p))
      (fun () ->
        CArray.from_ptr p n
        |> CArray.to_list
        |> List.map Unsigned.ULong.to_int64)

let get_device_name = ff "SDL_GetTouchDeviceName"
  (touch_id @-> returning string)
let get_device_name touch_id =
  get_device_name (Unsigned.ULong.of_int64 touch_id)

let get_device_type = ff "SDL_GetTouchDeviceType"
  (touch_id @-> returning touch_device_type)
let get_device_type touch_id =
  get_device_type (Unsigned.ULong.of_int64 touch_id)

let get_fingers = ff "SDL_GetTouchFingers"
  (touch_id @-> ptr int @-> returning (ptr (ptr finger)))
(* Wrapper for returning (ptr finger) list *)
let get_fingers touch_id =
  let count = allocate int 0 in
  let p = get_fingers touch_id count in
  if is_null p then []
  else let n =  (!@ (count)) in
    Fun.protect ~finally:(fun () -> Sdl3_stdinc_bindings.free (to_voidp p))
      (fun () ->
        CArray.from_ptr p n
        |> CArray.to_list)
let get_fingers touch_id =
  get_fingers (Unsigned.ULong.of_int64 touch_id)

end

