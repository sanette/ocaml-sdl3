(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Helpers
open Sdl3_types

let ff = Load.foreign

module Global = struct
let get_sensors = ff "SDL_GetSensors"
  (ptr int @-> returning (ptr sensor_id))
(* Wrapper for returning uint list *)
let get_sensors () =
  let count = allocate int 0 in
  let p = get_sensors count in
  if is_null p then []
  else let n =  (!@ count) in
    Fun.protect ~finally:(fun () -> Sdl3_stdinc_bindings.free (to_voidp p))
      (fun () ->
        CArray.from_ptr p n
        |> CArray.to_list
        |> List.map Unsigned.UInt.to_int)

let get_sensor_name_for_id = ff "SDL_GetSensorNameForID"
  (sensor_id @-> returning string)
let get_sensor_name_for_id instance_id =
  get_sensor_name_for_id (Unsigned.UInt.of_int instance_id)

let get_sensor_non_portable_type_for_id = ff "SDL_GetSensorNonPortableTypeForID"
  (sensor_id @-> returning int)
let get_sensor_non_portable_type_for_id instance_id =
  get_sensor_non_portable_type_for_id (Unsigned.UInt.of_int instance_id)

let update_sensors = ff "SDL_UpdateSensors"
  (void @-> returning void)

end
include Global

module SensorType = struct
let get_for_id = ff "SDL_GetSensorTypeForID"
  (sensor_id @-> returning sensor_type)
let get_for_id instance_id =
  get_for_id (Unsigned.UInt.of_int instance_id)

end

module Sensor = struct
let open_ = ff "SDL_OpenSensor"
  (sensor_id @-> returning (some_to_ok sensor_opt))
let open_ instance_id =
  open_ (Unsigned.UInt.of_int instance_id)

let get_from_id = ff "SDL_GetSensorFromID"
  (sensor_id @-> returning (some_to_ok sensor_opt))
let get_from_id instance_id =
  get_from_id (Unsigned.UInt.of_int instance_id)

let get_properties = ff "SDL_GetSensorProperties"
  (sensor @-> returning properties_id)

let get_name = ff "SDL_GetSensorName"
  (sensor @-> returning string)

let get_type = ff "SDL_GetSensorType"
  (sensor @-> returning sensor_type)

let get_non_portable_type = ff "SDL_GetSensorNonPortableType"
  (sensor @-> returning int)

let get_id = ff "SDL_GetSensorID"
  (sensor @-> returning sensor_id)

let get_data = ff "SDL_GetSensorData"
  (sensor @-> ptr float @-> int @-> returning true_to_ok)

let close = ff "SDL_CloseSensor"
  (sensor @-> returning void)

end

