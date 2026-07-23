(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Helpers
open Sdl3_types

let ff = Load.foreign

module Global = struct
let get_num_camera_drivers = ff "SDL_GetNumCameraDrivers"
  (void @-> returning int)

let get_camera_driver = ff "SDL_GetCameraDriver"
  (int @-> returning string)

let get_current_camera_driver = ff "SDL_GetCurrentCameraDriver"
  (void @-> returning string)

let get_cameras = ff "SDL_GetCameras"
  (ptr int @-> returning (ptr camera_id))
(* Wrapper for returning uint list *)
let get_cameras () =
  let count = allocate int 0 in
  let p = get_cameras count in
  if is_null p then []
  else let n =  (!@ count) in
    Fun.protect ~finally:(fun () -> Sdl3_stdinc_bindings.free (to_voidp p))
      (fun () ->
        CArray.from_ptr p n
        |> CArray.to_list
        |> List.map Unsigned.UInt.to_int)

let get_camera_supported_formats = ff "SDL_GetCameraSupportedFormats"
  (camera_id @-> ptr int @-> returning (ptr camera_spec))
(* Wrapper for returning camera_spec list *)
let get_camera_supported_formats instance_id =
  let count = allocate int 0 in
  let p = get_camera_supported_formats instance_id count in
  if is_null p then []
  else let n =  (!@ count) in
    Fun.protect ~finally:(fun () -> Sdl3_stdinc_bindings.free (to_voidp p))
      (fun () ->
        CArray.from_ptr p n
        |> CArray.to_list)
let get_camera_supported_formats instance_id =
  get_camera_supported_formats (Unsigned.UInt.of_int instance_id)

let get_camera_name = ff "SDL_GetCameraName"
  (camera_id @-> returning string)
let get_camera_name instance_id =
  get_camera_name (Unsigned.UInt.of_int instance_id)

end
include Global

module CameraPosition = struct
let get = ff "SDL_GetCameraPosition"
  (camera_id @-> returning camera_position)
let get instance_id =
  get (Unsigned.UInt.of_int instance_id)

end

module Camera = struct
let open_ = ff "SDL_OpenCamera"
  (camera_id @-> camera_spec_opt @-> returning (some_to_ok camera_opt))
let open_ instance_id spec =
  open_ (Unsigned.UInt.of_int instance_id) spec

let get_permission_state = ff "SDL_GetCameraPermissionState"
  (camera @-> returning camera_permission_state)

let get_id = ff "SDL_GetCameraID"
  (camera @-> returning camera_id)

let get_properties = ff "SDL_GetCameraProperties"
  (camera @-> returning properties_id)

let get_format = ff "SDL_GetCameraFormat"
  (camera @-> camera_spec @-> returning true_to_ok)

let release_frame = ff "SDL_ReleaseCameraFrame"
  (camera @-> surface @-> returning void)

let close = ff "SDL_CloseCamera"
  (camera @-> returning void)

end

module Surface = struct
let acquire_camera_frame = ff "SDL_AcquireCameraFrame"
  (camera @-> ptr uint64 @-> returning (some_to_ok surface_opt))
let acquire_camera_frame camera =
  let timestamp_ns = allocate ulong (Unsigned.ULong.of_int 0) in
  match acquire_camera_frame camera timestamp_ns with
    | Ok ret -> Ok (ret, Unsigned.ULong.to_int64 (!@ timestamp_ns))
    | Error (`Msg e) -> Error (`Msg (e ^ "(acquire_camera_frame)"))

end

