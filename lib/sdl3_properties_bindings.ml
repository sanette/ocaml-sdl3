(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Sdl3_types
open Helpers

let ff = Load.foreign

module Global = struct
let get_global_properties = ff "SDL_GetGlobalProperties"
  (void @-> returning properties_id)

let create_properties = ff "SDL_CreateProperties"
  (void @-> returning properties_id)

let copy_properties = ff "SDL_CopyProperties"
  (properties_id @-> properties_id @-> returning true_to_ok)
let copy_properties src dst =
  copy_properties (Unsigned.UInt.of_int src) (Unsigned.UInt.of_int dst)

let lock_properties = ff "SDL_LockProperties"
  (properties_id @-> returning true_to_ok)
let lock_properties props =
  lock_properties (Unsigned.UInt.of_int props)

let unlock_properties = ff "SDL_UnlockProperties"
  (properties_id @-> returning void)
let unlock_properties props =
  unlock_properties (Unsigned.UInt.of_int props)

let set_pointer_property_with_cleanup = ff "SDL_SetPointerPropertyWithCleanup"
  (properties_id @-> string @-> ptr void @-> cleanup_property_callback @-> ptr void @-> returning true_to_ok)
let set_pointer_property_with_cleanup props name value cleanup userdata =
  set_pointer_property_with_cleanup (Unsigned.UInt.of_int props) name value cleanup userdata

let set_pointer_property = ff "SDL_SetPointerProperty"
  (properties_id @-> string @-> ptr void @-> returning true_to_ok)
let set_pointer_property props name value =
  set_pointer_property (Unsigned.UInt.of_int props) name value

let set_string_property = ff "SDL_SetStringProperty"
  (properties_id @-> string @-> string @-> returning true_to_ok)
let set_string_property props name value =
  set_string_property (Unsigned.UInt.of_int props) name value

let set_number_property = ff "SDL_SetNumberProperty"
  (properties_id @-> string @-> sint64 @-> returning true_to_ok)
let set_number_property props name value =
  set_number_property (Unsigned.UInt.of_int props) name (Signed.Long.of_int value)

let set_float_property = ff "SDL_SetFloatProperty"
  (properties_id @-> string @-> float @-> returning true_to_ok)
let set_float_property props name value =
  set_float_property (Unsigned.UInt.of_int props) name value

let set_boolean_property = ff "SDL_SetBooleanProperty"
  (properties_id @-> string @-> bool @-> returning true_to_ok)
let set_boolean_property props name value =
  set_boolean_property (Unsigned.UInt.of_int props) name value

let has_property = ff "SDL_HasProperty"
  (properties_id @-> string @-> returning bool)
let has_property props name =
  has_property (Unsigned.UInt.of_int props) name

let get_pointer_property = ff "SDL_GetPointerProperty"
  (properties_id @-> string @-> ptr void @-> returning (ptr void))
let get_pointer_property props name default_value =
  get_pointer_property (Unsigned.UInt.of_int props) name default_value

let get_string_property = ff "SDL_GetStringProperty"
  (properties_id @-> string @-> string @-> returning string)
let get_string_property props name default_value =
  get_string_property (Unsigned.UInt.of_int props) name default_value

let get_number_property = ff "SDL_GetNumberProperty"
  (properties_id @-> string @-> sint64 @-> returning sint64)
let get_number_property props name default_value =
  get_number_property (Unsigned.UInt.of_int props) name (Signed.Long.of_int default_value)

let get_float_property = ff "SDL_GetFloatProperty"
  (properties_id @-> string @-> float @-> returning float)
let get_float_property props name default_value =
  get_float_property (Unsigned.UInt.of_int props) name default_value

let get_boolean_property = ff "SDL_GetBooleanProperty"
  (properties_id @-> string @-> bool @-> returning true_to_ok)
let get_boolean_property props name default_value =
  get_boolean_property (Unsigned.UInt.of_int props) name default_value

let clear_property = ff "SDL_ClearProperty"
  (properties_id @-> string @-> returning true_to_ok)
let clear_property props name =
  clear_property (Unsigned.UInt.of_int props) name

let enumerate_properties = ff "SDL_EnumerateProperties"
  (properties_id @-> enumerate_properties_callback @-> ptr void @-> returning true_to_ok)
let enumerate_properties props callback userdata =
  enumerate_properties (Unsigned.UInt.of_int props) callback userdata

let destroy_properties = ff "SDL_DestroyProperties"
  (properties_id @-> returning void)
let destroy_properties props =
  destroy_properties (Unsigned.UInt.of_int props)

end
include Global

module PropertyType = struct
let get = ff "SDL_GetPropertyType"
  (properties_id @-> string @-> returning property_type)
let get props name =
  get (Unsigned.UInt.of_int props) name

end

