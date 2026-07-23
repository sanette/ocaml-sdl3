(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Helpers
open Sdl3_types

let ff = Load.foreign

module Global = struct
let hid_init = ff "SDL_hid_init"
  (void @-> returning int)

let hid_exit = ff "SDL_hid_exit"
  (void @-> returning int)

let hid_device_change_count = ff "SDL_hid_device_change_count"
  (void @-> returning uint32)

let hid_ble_scan = ff "SDL_hid_ble_scan"
  (bool @-> returning void)

end
include Global

module Hid_device_info = struct
let hid_enumerate = ff "SDL_hid_enumerate"
  (ushort @-> ushort @-> returning (ptr hid_device_info))
let hid_enumerate vendor_id product_id =
  hid_enumerate (Unsigned.UShort.of_int vendor_id) (Unsigned.UShort.of_int product_id)

let hid_free_enumeration = ff "SDL_hid_free_enumeration"
  (ptr hid_device_info @-> returning void)

let hid_get_device_info = ff "SDL_hid_get_device_info"
  (hid_device @-> returning (ptr hid_device_info))

end

module Hid_device = struct
let hid_open = ff "SDL_hid_open"
  (ushort @-> ushort @-> ptr int32_t @-> returning (some_to_ok hid_device_opt))
let hid_open vendor_id product_id serial_number =
  hid_open (Unsigned.UShort.of_int vendor_id) (Unsigned.UShort.of_int product_id) serial_number

let hid_open_path = ff "SDL_hid_open_path"
  (string @-> returning (some_to_ok hid_device_opt))

let hid_get_properties = ff "SDL_hid_get_properties"
  (hid_device @-> returning properties_id)

let hid_write = ff "SDL_hid_write"
  (hid_device @-> ptr uchar @-> size_t @-> returning int)
let hid_write dev data length =
  hid_write dev data (Unsigned.Size_t.of_int length)

let hid_read_timeout = ff "SDL_hid_read_timeout"
  (hid_device @-> ptr uchar @-> size_t @-> int @-> returning int)
let hid_read_timeout dev data length milliseconds =
  hid_read_timeout dev data (Unsigned.Size_t.of_int length) milliseconds

let hid_read = ff "SDL_hid_read"
  (hid_device @-> ptr uchar @-> size_t @-> returning int)
let hid_read dev data length =
  hid_read dev data (Unsigned.Size_t.of_int length)

let hid_set_nonblocking = ff "SDL_hid_set_nonblocking"
  (hid_device @-> int @-> returning int)

let hid_send_feature_report = ff "SDL_hid_send_feature_report"
  (hid_device @-> ptr uchar @-> size_t @-> returning int)
let hid_send_feature_report dev data length =
  hid_send_feature_report dev data (Unsigned.Size_t.of_int length)

let hid_get_feature_report = ff "SDL_hid_get_feature_report"
  (hid_device @-> ptr uchar @-> size_t @-> returning int)
let hid_get_feature_report dev data length =
  hid_get_feature_report dev data (Unsigned.Size_t.of_int length)

let hid_get_input_report = ff "SDL_hid_get_input_report"
  (hid_device @-> ptr uchar @-> size_t @-> returning int)
let hid_get_input_report dev data length =
  hid_get_input_report dev data (Unsigned.Size_t.of_int length)

let hid_close = ff "SDL_hid_close"
  (hid_device @-> returning int)

let hid_get_manufacturer_string = ff "SDL_hid_get_manufacturer_string"
  (hid_device @-> ptr int32_t @-> size_t @-> returning int)
let hid_get_manufacturer_string dev string maxlen =
  hid_get_manufacturer_string dev string (Unsigned.Size_t.of_int maxlen)

let hid_get_product_string = ff "SDL_hid_get_product_string"
  (hid_device @-> ptr int32_t @-> size_t @-> returning int)
let hid_get_product_string dev string maxlen =
  hid_get_product_string dev string (Unsigned.Size_t.of_int maxlen)

let hid_get_serial_number_string = ff "SDL_hid_get_serial_number_string"
  (hid_device @-> ptr int32_t @-> size_t @-> returning int)
let hid_get_serial_number_string dev string maxlen =
  hid_get_serial_number_string dev string (Unsigned.Size_t.of_int maxlen)

let hid_get_indexed_string = ff "SDL_hid_get_indexed_string"
  (hid_device @-> int @-> ptr int32_t @-> size_t @-> returning int)
let hid_get_indexed_string dev string_index string maxlen =
  hid_get_indexed_string dev string_index string (Unsigned.Size_t.of_int maxlen)

let hid_get_report_descriptor = ff "SDL_hid_get_report_descriptor"
  (hid_device @-> ptr uchar @-> size_t @-> returning int)
let hid_get_report_descriptor dev buf buf_size =
  hid_get_report_descriptor dev buf (Unsigned.Size_t.of_int buf_size)

end

