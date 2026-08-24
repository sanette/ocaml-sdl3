(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Sdl3_types
module Sensor : sig

val gets : unit -> int list
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetSensors}SDL_GetSensors}: Get a list of currently connected sensors.


    @return a list of sensor instance IDs, may be empty on failure;
call SDL_GetError() for more information. This should be freed
with SDL_free() when it is no longer needed.*)

val get_name_for_id : int -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetSensorNameForID}SDL_GetSensorNameForID}: Get the implementation dependent name of a sensor.

This can be called before any sensors are opened.


    @param instance_id the sensor instance ID.

    @return the sensor name, or NULL if[instance_id]is not valid.*)

val get_type_for_id : int -> sensor_type_enum
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetSensorTypeForID}SDL_GetSensorTypeForID}: Get the type of a sensor.

This can be called before any sensors are opened.


    @param instance_id the sensor instance ID.

    @return the SDL_SensorType, or[SDL_SENSOR_INVALID]if[instance_id]is
not valid.*)

val get_non_portable_type_for_id : int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetSensorNonPortableTypeForID}SDL_GetSensorNonPortableTypeForID}: Get the platform dependent type of a sensor.

This can be called before any sensors are opened.


    @param instance_id the sensor instance ID.

    @return the sensor platform dependent type, or -1 if[instance_id]is not
valid.*)

val open_ : int -> sensor result
(** {{:https://wiki.libsdl.org/SDL3/SDL_OpenSensor}SDL_OpenSensor}: Open a sensor for use.


    @param instance_id the sensor instance ID.

    @return an SDL_Sensor object or [Error] on failure; call SDL_GetError() for
more information.*)

val get_from_id : int -> sensor result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetSensorFromID}SDL_GetSensorFromID}: Return the SDL_Sensor associated with an instance ID.


    @param instance_id the sensor instance ID.

    @return an SDL_Sensor object or [Error] on failure; call SDL_GetError() for
more information.*)

val get_properties : sensor -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetSensorProperties}SDL_GetSensorProperties}: Get the properties associated with a sensor.


    @param sensor the SDL_Sensor object.

    @return a valid property ID on success or 0 on failure; call
SDL_GetError() for more information.*)

val get_name : sensor -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetSensorName}SDL_GetSensorName}: Get the implementation dependent name of a sensor.


    @param sensor the SDL_Sensor object.

    @return the sensor name or NULL on failure; call SDL_GetError() for more
information.*)

val get_type : sensor -> sensor_type_enum
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetSensorType}SDL_GetSensorType}: Get the type of a sensor.


    @param sensor the SDL_Sensor object to inspect.

    @return the SDL_SensorType type, or[SDL_SENSOR_INVALID]if[sensor]is
NULL.*)

val get_non_portable_type : sensor -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetSensorNonPortableType}SDL_GetSensorNonPortableType}: Get the platform dependent type of a sensor.


    @param sensor the SDL_Sensor object to inspect.

    @return the sensor platform dependent type, or -1 if[sensor]is NULL.*)

val get_id : sensor -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetSensorID}SDL_GetSensorID}: Get the instance ID of a sensor.


    @param sensor the SDL_Sensor object to inspect.

    @return the sensor instance ID, or 0 on failure; call SDL_GetError() for
more information.*)

val get_data : sensor -> float Ctypes.ptr -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetSensorData}SDL_GetSensorData}: Get the current state of an opened sensor.

The number of values and interpretation of the data is sensor dependent.


    @param sensor the SDL_Sensor object to query.
    @param data a pointer filled with the current sensor state.
    @param num_values the number of values to write to data.*)

val close : sensor -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_CloseSensor}SDL_CloseSensor}: Close a sensor previously opened with SDL_OpenSensor().


    @param sensor the SDL_Sensor object to close.
*)

val updates : unit -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_UpdateSensors}SDL_UpdateSensors}: Update the current state of the open sensors.

This is called automatically by the event loop if sensor events are
enabled.

This needs to be called from the thread that initialized the sensor
subsystem.
*)

end

