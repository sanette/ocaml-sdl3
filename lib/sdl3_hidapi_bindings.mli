(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Sdl3_types
module Global : sig

val hid_init : unit -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_hid_init}SDL_hid_init}: Initialize the HIDAPI library.

This function initializes the HIDAPI library. Calling it is not strictly
necessary, as it will be called automatically by SDL_hid_enumerate() and
any of the SDL_hid_open_*() functions if it is needed. This function should
be called at the beginning of execution however, if there is a chance of
HIDAPI handles being opened by different threads simultaneously.

Each call to this function should have a matching call to SDL_hid_exit()


    @return 0 on success or a negative error code on failure; call
SDL_GetError() for more information.*)

val hid_exit : unit -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_hid_exit}SDL_hid_exit}: Finalize the HIDAPI library.

This function frees all of the static data associated with HIDAPI. It
should be called at the end of execution to avoid memory leaks.


    @return 0 on success or a negative error code on failure; call
SDL_GetError() for more information.*)

val hid_device_change_count : unit -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_hid_device_change_count}SDL_hid_device_change_count}: Check to see if devices may have been added or removed.

Enumerating the HID devices is an expensive operation, so you can call this
to see if there have been any system device changes since the last call to
this function. A change in the counter returned doesn't necessarily mean
that anything has changed, but you can call SDL_hid_enumerate() to get an
updated device list.

Calling this function for the first time may cause a thread or other system
resource to be allocated to track device change notifications.


    @return a change counter that is incremented with each potential device
change, or 0 if device change detection isn't available.*)

val hid_enumerate : int -> int -> hid_device_info Ctypes.ptr
(** {{:https://wiki.libsdl.org/SDL3/SDL_hid_enumerate}SDL_hid_enumerate}: Enumerate the HID Devices.

This function returns a linked list of all the HID devices attached to the
system which match vendor_id and product_id. If[vendor_id]is set to 0
then any vendor matches. If[product_id]is set to 0 then any product
matches. If[vendor_id]and[product_id]are both set to 0, then all HID
devices will be returned.

By default SDL will only enumerate controllers, to reduce risk of hanging
or crashing on bad drivers, but SDL_HINT_HIDAPI_ENUMERATE_ONLY_CONTROLLERS
can be set to "0" to enumerate all HID devices.


    @param vendor_id the Vendor ID (VID) of the types of device to open, or 0
to match any vendor.
    @param product_id the Product ID (PID) of the types of device to open, or 0
to match any product.

    @return a pointer to a linked list of type SDL_hid_device_info, containing
information about the HID devices attached to the system, or NULL
in the case of failure. Free this linked list by calling
SDL_hid_free_enumeration().*)

val hid_free_enumeration : hid_device_info Ctypes.ptr -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_hid_free_enumeration}SDL_hid_free_enumeration}: Free an enumeration linked list.

This function frees a linked list created by SDL_hid_enumerate().


    @param devs pointer to a list of struct_device returned from
SDL_hid_enumerate().
*)

val hid_open : int -> int -> int32 Ctypes.ptr option -> hid_device result
(** {{:https://wiki.libsdl.org/SDL3/SDL_hid_open}SDL_hid_open}: Open a HID device using a Vendor ID (VID), Product ID (PID) and optionally
a serial number.

If[serial_number]is NULL, the first device with the specified VID and PID
is opened.


    @param vendor_id the Vendor ID (VID) of the device to open.
    @param product_id the Product ID (PID) of the device to open.
    @param serial_number the Serial Number of the device to open (Optionally
[None]).

    @return a SDL_hid_device object on success or [Error] on
failure; call SDL_GetError() for more information.*)

val hid_open_path : string -> hid_device result
(** {{:https://wiki.libsdl.org/SDL3/SDL_hid_open_path}SDL_hid_open_path}: Open a HID device by its path name.

The path name be determined by calling SDL_hid_enumerate(), or a
platform-specific path name can be used (eg: /dev/hidraw0 on Linux).


    @param path the path name of the device to open.

    @return a SDL_hid_device object on success or [Error] on
failure; call SDL_GetError() for more information.*)

val hid_get_properties : hid_device -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_hid_get_properties}SDL_hid_get_properties}: Get the properties associated with an SDL_hid_device.

The following read-only properties are provided by SDL:

-[SDL_PROP_HIDAPI_LIBUSB_DEVICE_HANDLE_POINTER] the libusb_device_handle
  associated with the device, if it was opened using libusb.


    @param dev a device handle returned from SDL_hid_open().

    @return a valid property ID on success or 0 on failure; call
SDL_GetError() for more information.*)

val hid_write : hid_device -> Unsigned.uchar Ctypes.ptr -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_hid_write}SDL_hid_write}: Write an Output report to a HID device.

The first byte of[data]must contain the Report ID. For devices which only
support a single report, this must be set to 0x0. The remaining bytes
contain the report data. Since the Report ID is mandatory, calls to
SDL_hid_write() will always contain one more byte than the report contains.
For example, if a hid report is 16 bytes long, 17 bytes must be passed to
SDL_hid_write(), the Report ID (or 0x0, for devices with a single report),
followed by the report data (16 bytes). In this example, the length passed
in would be 17.

SDL_hid_write() will send the data on the first OUT endpoint, if one
exists. If it does not, it will send the data through the Control Endpoint
(Endpoint 0).


    @param dev a device handle returned from SDL_hid_open().
    @param data the data to send, including the report number as the first
byte.
    @param length the length in bytes of the data to send.

    @return the actual number of bytes written and -1 on on failure; call
SDL_GetError() for more information.*)

val hid_read_timeout : hid_device -> Unsigned.uchar Ctypes.ptr -> int -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_hid_read_timeout}SDL_hid_read_timeout}: Read an Input report from a HID device with timeout.

Input reports are returned to the host through the INTERRUPT IN endpoint.
The first byte will contain the Report number if the device uses numbered
reports.


    @param dev a device handle returned from SDL_hid_open().
    @param data a buffer to put the read data into.
    @param length the number of bytes to read. For devices with multiple
reports, make sure to read an extra byte for the report
number.
    @param milliseconds timeout in milliseconds or -1 for blocking wait.

    @return the actual number of bytes read and -1 on on failure; call
SDL_GetError() for more information. If no packet was available to
be read within the timeout period, this function returns 0.*)

val hid_read : hid_device -> Unsigned.uchar Ctypes.ptr -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_hid_read}SDL_hid_read}: Read an Input report from a HID device.

Input reports are returned to the host through the INTERRUPT IN endpoint.
The first byte will contain the Report number if the device uses numbered
reports.


    @param dev a device handle returned from SDL_hid_open().
    @param data a buffer to put the read data into.
    @param length the number of bytes to read. For devices with multiple
reports, make sure to read an extra byte for the report
number.

    @return the actual number of bytes read and -1 on failure; call
SDL_GetError() for more information. If no packet was available to
be read and the handle is in non-blocking mode, this function
returns 0.*)

val hid_set_nonblocking : hid_device -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_hid_set_nonblocking}SDL_hid_set_nonblocking}: Set the device handle to be non-blocking.

In non-blocking mode calls to SDL_hid_read() will return immediately with a
value of 0 if there is no data to be read. In blocking mode, SDL_hid_read()
will wait (block) until there is data to read before returning.

Nonblocking can be turned on and off at any time.


    @param dev a device handle returned from SDL_hid_open().
    @param nonblock enable or not the nonblocking reads - 1 to enable
nonblocking - 0 to disable nonblocking.

    @return 0 on success or a negative error code on failure; call
SDL_GetError() for more information.*)

val hid_send_feature_report : hid_device -> Unsigned.uchar Ctypes.ptr -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_hid_send_feature_report}SDL_hid_send_feature_report}: Send a Feature report to the device.

Feature reports are sent over the Control endpoint as a Set_Report
transfer. The first byte of[data]must contain the Report ID. For devices
which only support a single report, this must be set to 0x0. The remaining
bytes contain the report data. Since the Report ID is mandatory, calls to
SDL_hid_send_feature_report() will always contain one more byte than the
report contains. For example, if a hid report is 16 bytes long, 17 bytes
must be passed to SDL_hid_send_feature_report(): the Report ID (or 0x0, for
devices which do not use numbered reports), followed by the report data (16
bytes). In this example, the length passed in would be 17.


    @param dev a device handle returned from SDL_hid_open().
    @param data the data to send, including the report number as the first
byte.
    @param length the length in bytes of the data to send, including the report
number.

    @return the actual number of bytes written and -1 on failure; call
SDL_GetError() for more information.*)

val hid_get_feature_report : hid_device -> Unsigned.uchar Ctypes.ptr -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_hid_get_feature_report}SDL_hid_get_feature_report}: Get a feature report from a HID device.

Set the first byte of[data]to the Report ID of the report to be read.
Make sure to allow space for this extra byte in[data] Upon return, the
first byte will still contain the Report ID, and the report data will start
in data\[1\].


    @param dev a device handle returned from SDL_hid_open().
    @param data a buffer to put the read data into, including the Report ID.
Set the first byte of[data]to the Report ID of the report to
be read, or set it to zero if your device does not use numbered
reports.
    @param length the number of bytes to read, including an extra byte for the
report ID. The buffer can be longer than the actual report.

    @return the number of bytes read plus one for the report ID (which is
still in the first byte), or -1 on on failure; call SDL_GetError()
for more information.*)

val hid_get_input_report : hid_device -> Unsigned.uchar Ctypes.ptr -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_hid_get_input_report}SDL_hid_get_input_report}: Get an input report from a HID device.

Set the first byte of[data]to the Report ID of the report to be read.
Make sure to allow space for this extra byte in[data] Upon return, the
first byte will still contain the Report ID, and the report data will start
in data\[1\].


    @param dev a device handle returned from SDL_hid_open().
    @param data a buffer to put the read data into, including the Report ID.
Set the first byte of[data]to the Report ID of the report to
be read, or set it to zero if your device does not use numbered
reports.
    @param length the number of bytes to read, including an extra byte for the
report ID. The buffer can be longer than the actual report.

    @return the number of bytes read plus one for the report ID (which is
still in the first byte), or -1 on on failure; call SDL_GetError()
for more information.*)

val hid_close : hid_device -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_hid_close}SDL_hid_close}: Close a HID device.


    @param dev a device handle returned from SDL_hid_open().

    @return 0 on success or a negative error code on failure; call
SDL_GetError() for more information.*)

val hid_get_manufacturer_string : hid_device -> int32 Ctypes.ptr -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_hid_get_manufacturer_string}SDL_hid_get_manufacturer_string}: Get The Manufacturer String from a HID device.


    @param dev a device handle returned from SDL_hid_open().
    @param string a wide string buffer to put the data into.
    @param maxlen the length of the buffer in multiples of wchar_t.

    @return 0 on success or a negative error code on failure; call
SDL_GetError() for more information.*)

val hid_get_product_string : hid_device -> int32 Ctypes.ptr -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_hid_get_product_string}SDL_hid_get_product_string}: Get The Product String from a HID device.


    @param dev a device handle returned from SDL_hid_open().
    @param string a wide string buffer to put the data into.
    @param maxlen the length of the buffer in multiples of wchar_t.

    @return 0 on success or a negative error code on failure; call
SDL_GetError() for more information.*)

val hid_get_serial_number_string : hid_device -> int32 Ctypes.ptr -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_hid_get_serial_number_string}SDL_hid_get_serial_number_string}: Get The Serial Number String from a HID device.


    @param dev a device handle returned from SDL_hid_open().
    @param string a wide string buffer to put the data into.
    @param maxlen the length of the buffer in multiples of wchar_t.

    @return 0 on success or a negative error code on failure; call
SDL_GetError() for more information.*)

val hid_get_indexed_string : hid_device -> int -> int32 Ctypes.ptr -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_hid_get_indexed_string}SDL_hid_get_indexed_string}: Get a string from a HID device, based on its string index.


    @param dev a device handle returned from SDL_hid_open().
    @param string_index the index of the string to get.
    @param string a wide string buffer to put the data into.
    @param maxlen the length of the buffer in multiples of wchar_t.

    @return 0 on success or a negative error code on failure; call
SDL_GetError() for more information.*)

val hid_get_device_info : hid_device -> hid_device_info Ctypes.ptr
(** {{:https://wiki.libsdl.org/SDL3/SDL_hid_get_device_info}SDL_hid_get_device_info}: Get the device info from a HID device.


    @param dev a device handle returned from SDL_hid_open().

    @return a pointer to the SDL_hid_device_info for this hid_device or NULL
on failure; call SDL_GetError() for more information. This struct
is valid until the device is closed with SDL_hid_close().*)

val hid_get_report_descriptor : hid_device -> Unsigned.uchar Ctypes.ptr -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_hid_get_report_descriptor}SDL_hid_get_report_descriptor}: Get a report descriptor from a HID device.

User has to provide a preallocated buffer where descriptor will be copied
to. The recommended size for a preallocated buffer is 4096 bytes.


    @param dev a device handle returned from SDL_hid_open().
    @param buf the buffer to copy descriptor into.
    @param buf_size the size of the buffer in bytes.

    @return the number of bytes actually copied or -1 on failure; call
SDL_GetError() for more information.*)

val hid_ble_scan : bool -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_hid_ble_scan}SDL_hid_ble_scan}: Start or stop a BLE scan on iOS and tvOS to pair Steam Controllers.


    @param active true to start the scan, false to stop the scan.
*)

end
include module type of Global

