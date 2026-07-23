(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Foreign
open Sdl3_constants

let int_as_uint =
  view ~read:Unsigned.UInt.to_int ~write:Unsigned.UInt.of_int uint
let sint8 = schar (* prim *)
let uint8 = uchar (* prim *)
let sint16 = short (* prim *)
let uint16 = ushort (* prim *)
let sint32 = int (* prim *)
let uint32 = uint (* prim *)
let sint64 = long (* prim *)
let uint64 = ulong (* prim *)
let time = long (* prim *)
module Alignment_test = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_alignment_test"
  let a = field t "a" uint8
  let b = field t "b" (ptr void)
  let () = seal t
end
type alignment_test = Alignment_test.t
let alignment_test = Alignment_test.t


type dummy_enum =
  | DUMMY_ENUM_VALUE

type dummy_enum_enum = int
let dummy_enum = int

let dummy_enum_to_enum : dummy_enum -> dummy_enum_enum = function
  | DUMMY_ENUM_VALUE -> dummy_enum_value

let malloc_func = funptr (ulong @-> returning (ptr void))
let calloc_func = funptr (ulong @-> ulong @-> returning (ptr void))
let realloc_func = funptr (ptr void @-> ulong @-> returning (ptr void))
let free_func = funptr (ptr void @-> returning void)

(* No definition (opaque struct) *)
type environment = unit ptr
let environment : environment typ = ptr void
let environment_opt : environment option typ = ptr_opt void

let compare_callback = funptr (ptr void @-> ptr void @-> returning int)
let compare_callback_r = funptr (ptr void @-> ptr void @-> ptr void @-> returning int)

(* No definition (opaque struct) *)
type iconv_data_t = unit ptr
let iconv_data_t : iconv_data_t typ = ptr void
let iconv_data_t_opt : iconv_data_t option typ = ptr_opt void

let iconv_t = iconv_data_t
let function_pointer = funptr (void @-> returning void)
type assert_state =
  | ASSERTION_RETRY
  | ASSERTION_BREAK
  | ASSERTION_ABORT
  | ASSERTION_IGNORE
  | ASSERTION_ALWAYS_IGNORE

type assert_state_enum = int
let assert_state = int

let assert_state_to_enum : assert_state -> assert_state_enum = function
  | ASSERTION_RETRY -> assertion_retry
  | ASSERTION_BREAK -> assertion_break
  | ASSERTION_ABORT -> assertion_abort
  | ASSERTION_IGNORE -> assertion_ignore
  | ASSERTION_ALWAYS_IGNORE -> assertion_always_ignore

module AssertData = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_AssertData"
  let always_ignore = field t "always_ignore" bool
  let trigger_count = field t "trigger_count" int_as_uint
  let condition = field t "condition" string
  let filename = field t "filename" string
  let linenum = field t "linenum" int
  let func = field t "function" string
  let next = field t "next" (ptr t)
  let () = seal t
end
type assert_data = AssertData.t
let assert_data = AssertData.t


let assertion_handler = funptr (ptr assert_data @-> ptr void @-> returning assert_state)

(* No definition (opaque struct) *)
type async_io = unit ptr
let async_io : async_io typ = ptr void
let async_io_opt : async_io option typ = ptr_opt void

type async_io_task_type =
  | ASYNCIO_TASK_READ
  | ASYNCIO_TASK_WRITE
  | ASYNCIO_TASK_CLOSE

type async_io_task_type_enum = int
let async_io_task_type = int

let async_io_task_type_to_enum : async_io_task_type -> async_io_task_type_enum = function
  | ASYNCIO_TASK_READ -> asyncio_task_read
  | ASYNCIO_TASK_WRITE -> asyncio_task_write
  | ASYNCIO_TASK_CLOSE -> asyncio_task_close

type async_io_result =
  | ASYNCIO_COMPLETE
  | ASYNCIO_FAILURE
  | ASYNCIO_CANCELED

type async_io_result_enum = int
let async_io_result = int

let async_io_result_to_enum : async_io_result -> async_io_result_enum = function
  | ASYNCIO_COMPLETE -> asyncio_complete
  | ASYNCIO_FAILURE -> asyncio_failure
  | ASYNCIO_CANCELED -> asyncio_canceled

module AsyncIOOutcome = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_AsyncIOOutcome"
  let asyncio = field t "asyncio" async_io
  let typ = field t "type" async_io_task_type
  let result = field t "result" async_io_result
  let buffer = field t "buffer" (ptr void)
  let offset = field t "offset" uint64
  let bytes_requested = field t "bytes_requested" uint64
  let bytes_transferred = field t "bytes_transferred" uint64
  let userdata = field t "userdata" (ptr void)
  let () = seal t
end
type async_io_outcome = AsyncIOOutcome.t
let async_io_outcome = AsyncIOOutcome.t



(* No definition (opaque struct) *)
type async_io_queue = unit ptr
let async_io_queue : async_io_queue typ = ptr void
let async_io_queue_opt : async_io_queue option typ = ptr_opt void

let spin_lock = int (* prim *)
module AtomicInt = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_AtomicInt"
  let value = field t "value" int
  let () = seal t
end
type atomic_int = AtomicInt.t
let atomic_int = AtomicInt.t


module AtomicU32 = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_AtomicU32"
  let value = field t "value" int_as_uint
  let () = seal t
end
type atomic_u32 = AtomicU32.t
let atomic_u32 = AtomicU32.t


let properties_id = uint (* prim *)
type property_type =
  | PROPERTY_TYPE_INVALID
  | PROPERTY_TYPE_POINTER
  | PROPERTY_TYPE_STRING
  | PROPERTY_TYPE_NUMBER
  | PROPERTY_TYPE_FLOAT
  | PROPERTY_TYPE_BOOLEAN

type property_type_enum = int
let property_type = int

let property_type_to_enum : property_type -> property_type_enum = function
  | PROPERTY_TYPE_INVALID -> property_type_invalid
  | PROPERTY_TYPE_POINTER -> property_type_pointer
  | PROPERTY_TYPE_STRING -> property_type_string
  | PROPERTY_TYPE_NUMBER -> property_type_number
  | PROPERTY_TYPE_FLOAT -> property_type_float
  | PROPERTY_TYPE_BOOLEAN -> property_type_boolean

let cleanup_property_callback = funptr (ptr void @-> ptr void @-> returning void)
let enumerate_properties_callback = funptr (ptr void @-> uint @-> string @-> returning void)

(* No definition (opaque struct) *)
type thread = unit ptr
let thread : thread typ = ptr void
let thread_opt : thread option typ = ptr_opt void

let thread_id = ulong (* prim *)
let tlsid = atomic_int
type thread_priority =
  | THREAD_PRIORITY_LOW
  | THREAD_PRIORITY_NORMAL
  | THREAD_PRIORITY_HIGH
  | THREAD_PRIORITY_TIME_CRITICAL

type thread_priority_enum = int
let thread_priority = int

let thread_priority_to_enum : thread_priority -> thread_priority_enum = function
  | THREAD_PRIORITY_LOW -> thread_priority_low
  | THREAD_PRIORITY_NORMAL -> thread_priority_normal
  | THREAD_PRIORITY_HIGH -> thread_priority_high
  | THREAD_PRIORITY_TIME_CRITICAL -> thread_priority_time_critical

type thread_state =
  | THREAD_UNKNOWN
  | THREAD_ALIVE
  | THREAD_DETACHED
  | THREAD_COMPLETE

type thread_state_enum = int
let thread_state = int

let thread_state_to_enum : thread_state -> thread_state_enum = function
  | THREAD_UNKNOWN -> thread_unknown
  | THREAD_ALIVE -> thread_alive
  | THREAD_DETACHED -> thread_detached
  | THREAD_COMPLETE -> thread_complete

let thread_function = funptr (ptr void @-> returning int)
let tls_destructor_callback = funptr (ptr void @-> returning void)

(* No definition (opaque struct) *)
type mutex = unit ptr
let mutex : mutex typ = ptr void
let mutex_opt : mutex option typ = ptr_opt void


(* No definition (opaque struct) *)
type rw_lock = unit ptr
let rw_lock : rw_lock typ = ptr void
let rw_lock_opt : rw_lock option typ = ptr_opt void


(* No definition (opaque struct) *)
type semaphore = unit ptr
let semaphore : semaphore typ = ptr void
let semaphore_opt : semaphore option typ = ptr_opt void


(* No definition (opaque struct) *)
type condition = unit ptr
let condition : condition typ = ptr void
let condition_opt : condition option typ = ptr_opt void

type init_status =
  | INIT_STATUS_UNINITIALIZED
  | INIT_STATUS_INITIALIZING
  | INIT_STATUS_INITIALIZED
  | INIT_STATUS_UNINITIALIZING

type init_status_enum = int
let init_status = int

let init_status_to_enum : init_status -> init_status_enum = function
  | INIT_STATUS_UNINITIALIZED -> init_status_uninitialized
  | INIT_STATUS_INITIALIZING -> init_status_initializing
  | INIT_STATUS_INITIALIZED -> init_status_initialized
  | INIT_STATUS_UNINITIALIZING -> init_status_uninitializing

module InitState = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_InitState"
  let status = field t "status" atomic_int
  let thread = field t "thread" thread_id
  let reserved = field t "reserved" (ptr void)
  let () = seal t
end
type init_state = InitState.t
let init_state = InitState.t


type io_status =
  | IO_STATUS_READY
  | IO_STATUS_ERROR
  | IO_STATUS_EOF
  | IO_STATUS_NOT_READY
  | IO_STATUS_READONLY
  | IO_STATUS_WRITEONLY

type io_status_enum = int
let io_status = int

let io_status_to_enum : io_status -> io_status_enum = function
  | IO_STATUS_READY -> io_status_ready
  | IO_STATUS_ERROR -> io_status_error
  | IO_STATUS_EOF -> io_status_eof
  | IO_STATUS_NOT_READY -> io_status_not_ready
  | IO_STATUS_READONLY -> io_status_readonly
  | IO_STATUS_WRITEONLY -> io_status_writeonly

type io_whence =
  | IO_SEEK_SET
  | IO_SEEK_CUR
  | IO_SEEK_END

type io_whence_enum = int
let io_whence = int

let io_whence_to_enum : io_whence -> io_whence_enum = function
  | IO_SEEK_SET -> io_seek_set
  | IO_SEEK_CUR -> io_seek_cur
  | IO_SEEK_END -> io_seek_end

module IOStreamInterface = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_IOStreamInterface"
  let version = field t "version" int_as_uint
  let size = field t "size" (funptr (ptr void @-> returning sint64))
  let seek = field t "seek" (funptr (ptr void @-> sint64 @-> io_whence @-> returning sint64))
  let read = field t "read" (funptr (ptr void @-> ptr void @-> size_t @-> ptr io_status @-> returning size_t))
  let write = field t "write" (funptr (ptr void @-> ptr void @-> size_t @-> ptr io_status @-> returning size_t))
  let flush = field t "flush" (funptr (ptr void @-> ptr io_status @-> returning bool))
  let close = field t "close" (funptr (ptr void @-> returning bool))
  let () = seal t
end
type io_stream_interface = IOStreamInterface.t
let io_stream_interface = IOStreamInterface.t



(* No definition (opaque struct) *)
type io_stream = unit ptr
let io_stream : io_stream typ = ptr void
let io_stream_opt : io_stream option typ = ptr_opt void

type audio_format =
  | AUDIO_UNKNOWN
  | AUDIO_U8
  | AUDIO_S8
  | AUDIO_S16LE
  | AUDIO_S16BE
  | AUDIO_S32LE
  | AUDIO_S32BE
  | AUDIO_F32LE
  | AUDIO_F32BE
  | AUDIO_S16
  | AUDIO_S32
  | AUDIO_F32

type audio_format_enum = int
let audio_format = int

let audio_format_to_enum : audio_format -> audio_format_enum = function
  | AUDIO_UNKNOWN -> audio_unknown
  | AUDIO_U8 -> audio_u8
  | AUDIO_S8 -> audio_s8
  | AUDIO_S16LE -> audio_s16_le
  | AUDIO_S16BE -> audio_s16_be
  | AUDIO_S32LE -> audio_s32_le
  | AUDIO_S32BE -> audio_s32_be
  | AUDIO_F32LE -> audio_f32_le
  | AUDIO_F32BE -> audio_f32_be
  | AUDIO_S16 -> audio_s16
  | AUDIO_S32 -> audio_s32
  | AUDIO_F32 -> audio_f32

let audio_device_id = uint (* prim *)
module AudioSpec = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_AudioSpec"
  let format = field t "format" audio_format
  let channels = field t "channels" int
  let freq = field t "freq" int
  let () = seal t
end
type audio_spec = AudioSpec.t
let audio_spec = AudioSpec.t



(* No definition (opaque struct) *)
type audio_stream = unit ptr
let audio_stream : audio_stream typ = ptr void
let audio_stream_opt : audio_stream option typ = ptr_opt void

let audio_stream_data_complete_callback = funptr (ptr void @-> ptr void @-> int @-> returning void)
let audio_stream_callback = funptr (ptr void @-> audio_stream @-> int @-> int @-> returning void)
let audio_postmix_callback = funptr (ptr void @-> ptr audio_spec @-> ptr float @-> int @-> returning void)
let blend_mode = uint (* prim *)
type blend_operation =
  | BLENDOPERATION_ADD
  | BLENDOPERATION_SUBTRACT
  | BLENDOPERATION_REV_SUBTRACT
  | BLENDOPERATION_MINIMUM
  | BLENDOPERATION_MAXIMUM

type blend_operation_enum = int
let blend_operation = int

let blend_operation_to_enum : blend_operation -> blend_operation_enum = function
  | BLENDOPERATION_ADD -> blendoperation_add
  | BLENDOPERATION_SUBTRACT -> blendoperation_subtract
  | BLENDOPERATION_REV_SUBTRACT -> blendoperation_rev_subtract
  | BLENDOPERATION_MINIMUM -> blendoperation_minimum
  | BLENDOPERATION_MAXIMUM -> blendoperation_maximum

type blend_factor =
  | BLENDFACTOR_ZERO
  | BLENDFACTOR_ONE
  | BLENDFACTOR_SRC_COLOR
  | BLENDFACTOR_ONE_MINUS_SRC_COLOR
  | BLENDFACTOR_SRC_ALPHA
  | BLENDFACTOR_ONE_MINUS_SRC_ALPHA
  | BLENDFACTOR_DST_COLOR
  | BLENDFACTOR_ONE_MINUS_DST_COLOR
  | BLENDFACTOR_DST_ALPHA
  | BLENDFACTOR_ONE_MINUS_DST_ALPHA

type blend_factor_enum = int
let blend_factor = int

let blend_factor_to_enum : blend_factor -> blend_factor_enum = function
  | BLENDFACTOR_ZERO -> blendfactor_zero
  | BLENDFACTOR_ONE -> blendfactor_one
  | BLENDFACTOR_SRC_COLOR -> blendfactor_src_color
  | BLENDFACTOR_ONE_MINUS_SRC_COLOR -> blendfactor_one_minus_src_color
  | BLENDFACTOR_SRC_ALPHA -> blendfactor_src_alpha
  | BLENDFACTOR_ONE_MINUS_SRC_ALPHA -> blendfactor_one_minus_src_alpha
  | BLENDFACTOR_DST_COLOR -> blendfactor_dst_color
  | BLENDFACTOR_ONE_MINUS_DST_COLOR -> blendfactor_one_minus_dst_color
  | BLENDFACTOR_DST_ALPHA -> blendfactor_dst_alpha
  | BLENDFACTOR_ONE_MINUS_DST_ALPHA -> blendfactor_one_minus_dst_alpha

type pixel_type =
  | PIXELTYPE_UNKNOWN
  | PIXELTYPE_INDEX1
  | PIXELTYPE_INDEX4
  | PIXELTYPE_INDEX8
  | PIXELTYPE_PACKED8
  | PIXELTYPE_PACKED16
  | PIXELTYPE_PACKED32
  | PIXELTYPE_ARRAYU8
  | PIXELTYPE_ARRAYU16
  | PIXELTYPE_ARRAYU32
  | PIXELTYPE_ARRAYF16
  | PIXELTYPE_ARRAYF32
  | PIXELTYPE_INDEX2

type pixel_type_enum = int
let pixel_type = int

let pixel_type_to_enum : pixel_type -> pixel_type_enum = function
  | PIXELTYPE_UNKNOWN -> pixeltype_unknown
  | PIXELTYPE_INDEX1 -> pixeltype_index1
  | PIXELTYPE_INDEX4 -> pixeltype_index4
  | PIXELTYPE_INDEX8 -> pixeltype_index8
  | PIXELTYPE_PACKED8 -> pixeltype_packed8
  | PIXELTYPE_PACKED16 -> pixeltype_packed16
  | PIXELTYPE_PACKED32 -> pixeltype_packed32
  | PIXELTYPE_ARRAYU8 -> pixeltype_arrayu8
  | PIXELTYPE_ARRAYU16 -> pixeltype_arrayu16
  | PIXELTYPE_ARRAYU32 -> pixeltype_arrayu32
  | PIXELTYPE_ARRAYF16 -> pixeltype_arrayf16
  | PIXELTYPE_ARRAYF32 -> pixeltype_arrayf32
  | PIXELTYPE_INDEX2 -> pixeltype_index2

type bitmap_order =
  | BITMAPORDER_NONE
  | BITMAPORDER_4321
  | BITMAPORDER_1234

type bitmap_order_enum = int
let bitmap_order = int

let bitmap_order_to_enum : bitmap_order -> bitmap_order_enum = function
  | BITMAPORDER_NONE -> bitmaporder_none
  | BITMAPORDER_4321 -> bitmaporder_4321
  | BITMAPORDER_1234 -> bitmaporder_1234

type packed_order =
  | PACKEDORDER_NONE
  | PACKEDORDER_XRGB
  | PACKEDORDER_RGBX
  | PACKEDORDER_ARGB
  | PACKEDORDER_RGBA
  | PACKEDORDER_XBGR
  | PACKEDORDER_BGRX
  | PACKEDORDER_ABGR
  | PACKEDORDER_BGRA

type packed_order_enum = int
let packed_order = int

let packed_order_to_enum : packed_order -> packed_order_enum = function
  | PACKEDORDER_NONE -> packedorder_none
  | PACKEDORDER_XRGB -> packedorder_xrgb
  | PACKEDORDER_RGBX -> packedorder_rgbx
  | PACKEDORDER_ARGB -> packedorder_argb
  | PACKEDORDER_RGBA -> packedorder_rgba
  | PACKEDORDER_XBGR -> packedorder_xbgr
  | PACKEDORDER_BGRX -> packedorder_bgrx
  | PACKEDORDER_ABGR -> packedorder_abgr
  | PACKEDORDER_BGRA -> packedorder_bgra

type array_order =
  | ARRAYORDER_NONE
  | ARRAYORDER_RGB
  | ARRAYORDER_RGBA
  | ARRAYORDER_ARGB
  | ARRAYORDER_BGR
  | ARRAYORDER_BGRA
  | ARRAYORDER_ABGR

type array_order_enum = int
let array_order = int

let array_order_to_enum : array_order -> array_order_enum = function
  | ARRAYORDER_NONE -> arrayorder_none
  | ARRAYORDER_RGB -> arrayorder_rgb
  | ARRAYORDER_RGBA -> arrayorder_rgba
  | ARRAYORDER_ARGB -> arrayorder_argb
  | ARRAYORDER_BGR -> arrayorder_bgr
  | ARRAYORDER_BGRA -> arrayorder_bgra
  | ARRAYORDER_ABGR -> arrayorder_abgr

type packed_layout =
  | PACKEDLAYOUT_NONE
  | PACKEDLAYOUT_332
  | PACKEDLAYOUT_4444
  | PACKEDLAYOUT_1555
  | PACKEDLAYOUT_5551
  | PACKEDLAYOUT_565
  | PACKEDLAYOUT_8888
  | PACKEDLAYOUT_2101010
  | PACKEDLAYOUT_1010102

type packed_layout_enum = int
let packed_layout = int

let packed_layout_to_enum : packed_layout -> packed_layout_enum = function
  | PACKEDLAYOUT_NONE -> packedlayout_none
  | PACKEDLAYOUT_332 -> packedlayout_332
  | PACKEDLAYOUT_4444 -> packedlayout_4444
  | PACKEDLAYOUT_1555 -> packedlayout_1555
  | PACKEDLAYOUT_5551 -> packedlayout_5551
  | PACKEDLAYOUT_565 -> packedlayout_565
  | PACKEDLAYOUT_8888 -> packedlayout_8888
  | PACKEDLAYOUT_2101010 -> packedlayout_2101010
  | PACKEDLAYOUT_1010102 -> packedlayout_1010102

type pixel_format =
  | PIXELFORMAT_UNKNOWN
  | PIXELFORMAT_INDEX1LSB
  | PIXELFORMAT_INDEX1MSB
  | PIXELFORMAT_INDEX2LSB
  | PIXELFORMAT_INDEX2MSB
  | PIXELFORMAT_INDEX4LSB
  | PIXELFORMAT_INDEX4MSB
  | PIXELFORMAT_INDEX8
  | PIXELFORMAT_RGB332
  | PIXELFORMAT_XRGB4444
  | PIXELFORMAT_XBGR4444
  | PIXELFORMAT_XRGB1555
  | PIXELFORMAT_XBGR1555
  | PIXELFORMAT_ARGB4444
  | PIXELFORMAT_RGBA4444
  | PIXELFORMAT_ABGR4444
  | PIXELFORMAT_BGRA4444
  | PIXELFORMAT_ARGB1555
  | PIXELFORMAT_RGBA5551
  | PIXELFORMAT_ABGR1555
  | PIXELFORMAT_BGRA5551
  | PIXELFORMAT_RGB565
  | PIXELFORMAT_BGR565
  | PIXELFORMAT_RGB24
  | PIXELFORMAT_BGR24
  | PIXELFORMAT_XRGB8888
  | PIXELFORMAT_RGBX8888
  | PIXELFORMAT_XBGR8888
  | PIXELFORMAT_BGRX8888
  | PIXELFORMAT_ARGB8888
  | PIXELFORMAT_RGBA8888
  | PIXELFORMAT_ABGR8888
  | PIXELFORMAT_BGRA8888
  | PIXELFORMAT_XRGB2101010
  | PIXELFORMAT_XBGR2101010
  | PIXELFORMAT_ARGB2101010
  | PIXELFORMAT_ABGR2101010
  | PIXELFORMAT_RGB48
  | PIXELFORMAT_BGR48
  | PIXELFORMAT_RGBA64
  | PIXELFORMAT_ARGB64
  | PIXELFORMAT_BGRA64
  | PIXELFORMAT_ABGR64
  | PIXELFORMAT_RGB48_FLOAT
  | PIXELFORMAT_BGR48_FLOAT
  | PIXELFORMAT_RGBA64_FLOAT
  | PIXELFORMAT_ARGB64_FLOAT
  | PIXELFORMAT_BGRA64_FLOAT
  | PIXELFORMAT_ABGR64_FLOAT
  | PIXELFORMAT_RGB96_FLOAT
  | PIXELFORMAT_BGR96_FLOAT
  | PIXELFORMAT_RGBA128_FLOAT
  | PIXELFORMAT_ARGB128_FLOAT
  | PIXELFORMAT_BGRA128_FLOAT
  | PIXELFORMAT_ABGR128_FLOAT
  | PIXELFORMAT_YV12
  | PIXELFORMAT_IYUV
  | PIXELFORMAT_YUY2
  | PIXELFORMAT_UYVY
  | PIXELFORMAT_YVYU
  | PIXELFORMAT_NV12
  | PIXELFORMAT_NV21
  | PIXELFORMAT_P010
  | PIXELFORMAT_EXTERNAL_OES
  | PIXELFORMAT_MJPG
  | PIXELFORMAT_RGBA32
  | PIXELFORMAT_ARGB32
  | PIXELFORMAT_BGRA32
  | PIXELFORMAT_ABGR32
  | PIXELFORMAT_RGBX32
  | PIXELFORMAT_XRGB32
  | PIXELFORMAT_BGRX32
  | PIXELFORMAT_XBGR32

type pixel_format_enum = int
let pixel_format = int

let pixel_format_to_enum : pixel_format -> pixel_format_enum = function
  | PIXELFORMAT_UNKNOWN -> pixelformat_unknown
  | PIXELFORMAT_INDEX1LSB -> pixelformat_index1_lsb
  | PIXELFORMAT_INDEX1MSB -> pixelformat_index1_msb
  | PIXELFORMAT_INDEX2LSB -> pixelformat_index2_lsb
  | PIXELFORMAT_INDEX2MSB -> pixelformat_index2_msb
  | PIXELFORMAT_INDEX4LSB -> pixelformat_index4_lsb
  | PIXELFORMAT_INDEX4MSB -> pixelformat_index4_msb
  | PIXELFORMAT_INDEX8 -> pixelformat_index8
  | PIXELFORMAT_RGB332 -> pixelformat_rgb332
  | PIXELFORMAT_XRGB4444 -> pixelformat_xrgb4444
  | PIXELFORMAT_XBGR4444 -> pixelformat_xbgr4444
  | PIXELFORMAT_XRGB1555 -> pixelformat_xrgb1555
  | PIXELFORMAT_XBGR1555 -> pixelformat_xbgr1555
  | PIXELFORMAT_ARGB4444 -> pixelformat_argb4444
  | PIXELFORMAT_RGBA4444 -> pixelformat_rgba4444
  | PIXELFORMAT_ABGR4444 -> pixelformat_abgr4444
  | PIXELFORMAT_BGRA4444 -> pixelformat_bgra4444
  | PIXELFORMAT_ARGB1555 -> pixelformat_argb1555
  | PIXELFORMAT_RGBA5551 -> pixelformat_rgba5551
  | PIXELFORMAT_ABGR1555 -> pixelformat_abgr1555
  | PIXELFORMAT_BGRA5551 -> pixelformat_bgra5551
  | PIXELFORMAT_RGB565 -> pixelformat_rgb565
  | PIXELFORMAT_BGR565 -> pixelformat_bgr565
  | PIXELFORMAT_RGB24 -> pixelformat_rgb24
  | PIXELFORMAT_BGR24 -> pixelformat_bgr24
  | PIXELFORMAT_XRGB8888 -> pixelformat_xrgb8888
  | PIXELFORMAT_RGBX8888 -> pixelformat_rgbx8888
  | PIXELFORMAT_XBGR8888 -> pixelformat_xbgr8888
  | PIXELFORMAT_BGRX8888 -> pixelformat_bgrx8888
  | PIXELFORMAT_ARGB8888 -> pixelformat_argb8888
  | PIXELFORMAT_RGBA8888 -> pixelformat_rgba8888
  | PIXELFORMAT_ABGR8888 -> pixelformat_abgr8888
  | PIXELFORMAT_BGRA8888 -> pixelformat_bgra8888
  | PIXELFORMAT_XRGB2101010 -> pixelformat_xrgb2101010
  | PIXELFORMAT_XBGR2101010 -> pixelformat_xbgr2101010
  | PIXELFORMAT_ARGB2101010 -> pixelformat_argb2101010
  | PIXELFORMAT_ABGR2101010 -> pixelformat_abgr2101010
  | PIXELFORMAT_RGB48 -> pixelformat_rgb48
  | PIXELFORMAT_BGR48 -> pixelformat_bgr48
  | PIXELFORMAT_RGBA64 -> pixelformat_rgba64
  | PIXELFORMAT_ARGB64 -> pixelformat_argb64
  | PIXELFORMAT_BGRA64 -> pixelformat_bgra64
  | PIXELFORMAT_ABGR64 -> pixelformat_abgr64
  | PIXELFORMAT_RGB48_FLOAT -> pixelformat_rgb48_float
  | PIXELFORMAT_BGR48_FLOAT -> pixelformat_bgr48_float
  | PIXELFORMAT_RGBA64_FLOAT -> pixelformat_rgba64_float
  | PIXELFORMAT_ARGB64_FLOAT -> pixelformat_argb64_float
  | PIXELFORMAT_BGRA64_FLOAT -> pixelformat_bgra64_float
  | PIXELFORMAT_ABGR64_FLOAT -> pixelformat_abgr64_float
  | PIXELFORMAT_RGB96_FLOAT -> pixelformat_rgb96_float
  | PIXELFORMAT_BGR96_FLOAT -> pixelformat_bgr96_float
  | PIXELFORMAT_RGBA128_FLOAT -> pixelformat_rgba128_float
  | PIXELFORMAT_ARGB128_FLOAT -> pixelformat_argb128_float
  | PIXELFORMAT_BGRA128_FLOAT -> pixelformat_bgra128_float
  | PIXELFORMAT_ABGR128_FLOAT -> pixelformat_abgr128_float
  | PIXELFORMAT_YV12 -> pixelformat_yv12
  | PIXELFORMAT_IYUV -> pixelformat_iyuv
  | PIXELFORMAT_YUY2 -> pixelformat_yuy2
  | PIXELFORMAT_UYVY -> pixelformat_uyvy
  | PIXELFORMAT_YVYU -> pixelformat_yvyu
  | PIXELFORMAT_NV12 -> pixelformat_nv12
  | PIXELFORMAT_NV21 -> pixelformat_nv21
  | PIXELFORMAT_P010 -> pixelformat_p010
  | PIXELFORMAT_EXTERNAL_OES -> pixelformat_external_oes
  | PIXELFORMAT_MJPG -> pixelformat_mjpg
  | PIXELFORMAT_RGBA32 -> pixelformat_rgba32
  | PIXELFORMAT_ARGB32 -> pixelformat_argb32
  | PIXELFORMAT_BGRA32 -> pixelformat_bgra32
  | PIXELFORMAT_ABGR32 -> pixelformat_abgr32
  | PIXELFORMAT_RGBX32 -> pixelformat_rgbx32
  | PIXELFORMAT_XRGB32 -> pixelformat_xrgb32
  | PIXELFORMAT_BGRX32 -> pixelformat_bgrx32
  | PIXELFORMAT_XBGR32 -> pixelformat_xbgr32

type color_type =
  | COLOR_TYPE_UNKNOWN
  | COLOR_TYPE_RGB
  | COLOR_TYPE_YCBCR

type color_type_enum = int
let color_type = int

let color_type_to_enum : color_type -> color_type_enum = function
  | COLOR_TYPE_UNKNOWN -> color_type_unknown
  | COLOR_TYPE_RGB -> color_type_rgb
  | COLOR_TYPE_YCBCR -> color_type_ycbcr

type color_range =
  | COLOR_RANGE_UNKNOWN
  | COLOR_RANGE_LIMITED
  | COLOR_RANGE_FULL

type color_range_enum = int
let color_range = int

let color_range_to_enum : color_range -> color_range_enum = function
  | COLOR_RANGE_UNKNOWN -> color_range_unknown
  | COLOR_RANGE_LIMITED -> color_range_limited
  | COLOR_RANGE_FULL -> color_range_full

type color_primaries =
  | COLOR_PRIMARIES_UNKNOWN
  | COLOR_PRIMARIES_BT709
  | COLOR_PRIMARIES_UNSPECIFIED
  | COLOR_PRIMARIES_BT470M
  | COLOR_PRIMARIES_BT470BG
  | COLOR_PRIMARIES_BT601
  | COLOR_PRIMARIES_SMPTE240
  | COLOR_PRIMARIES_GENERIC_FILM
  | COLOR_PRIMARIES_BT2020
  | COLOR_PRIMARIES_XYZ
  | COLOR_PRIMARIES_SMPTE431
  | COLOR_PRIMARIES_SMPTE432
  | COLOR_PRIMARIES_EBU3213
  | COLOR_PRIMARIES_CUSTOM

type color_primaries_enum = int
let color_primaries = int

let color_primaries_to_enum : color_primaries -> color_primaries_enum = function
  | COLOR_PRIMARIES_UNKNOWN -> color_primaries_unknown
  | COLOR_PRIMARIES_BT709 -> color_primaries_bt709
  | COLOR_PRIMARIES_UNSPECIFIED -> color_primaries_unspecified
  | COLOR_PRIMARIES_BT470M -> color_primaries_bt470_m
  | COLOR_PRIMARIES_BT470BG -> color_primaries_bt470_bg
  | COLOR_PRIMARIES_BT601 -> color_primaries_bt601
  | COLOR_PRIMARIES_SMPTE240 -> color_primaries_smpte240
  | COLOR_PRIMARIES_GENERIC_FILM -> color_primaries_generic_film
  | COLOR_PRIMARIES_BT2020 -> color_primaries_bt2020
  | COLOR_PRIMARIES_XYZ -> color_primaries_xyz
  | COLOR_PRIMARIES_SMPTE431 -> color_primaries_smpte431
  | COLOR_PRIMARIES_SMPTE432 -> color_primaries_smpte432
  | COLOR_PRIMARIES_EBU3213 -> color_primaries_ebu3213
  | COLOR_PRIMARIES_CUSTOM -> color_primaries_custom

type transfer_characteristics =
  | TRANSFER_CHARACTERISTICS_UNKNOWN
  | TRANSFER_CHARACTERISTICS_BT709
  | TRANSFER_CHARACTERISTICS_UNSPECIFIED
  | TRANSFER_CHARACTERISTICS_GAMMA22
  | TRANSFER_CHARACTERISTICS_GAMMA28
  | TRANSFER_CHARACTERISTICS_BT601
  | TRANSFER_CHARACTERISTICS_SMPTE240
  | TRANSFER_CHARACTERISTICS_LINEAR
  | TRANSFER_CHARACTERISTICS_LOG100
  | TRANSFER_CHARACTERISTICS_LOG100_SQRT10
  | TRANSFER_CHARACTERISTICS_IEC61966
  | TRANSFER_CHARACTERISTICS_BT1361
  | TRANSFER_CHARACTERISTICS_SRGB
  | TRANSFER_CHARACTERISTICS_BT2020_10BIT
  | TRANSFER_CHARACTERISTICS_BT2020_12BIT
  | TRANSFER_CHARACTERISTICS_PQ
  | TRANSFER_CHARACTERISTICS_SMPTE428
  | TRANSFER_CHARACTERISTICS_HLG
  | TRANSFER_CHARACTERISTICS_CUSTOM

type transfer_characteristics_enum = int
let transfer_characteristics = int

let transfer_characteristics_to_enum : transfer_characteristics -> transfer_characteristics_enum = function
  | TRANSFER_CHARACTERISTICS_UNKNOWN -> transfer_characteristics_unknown
  | TRANSFER_CHARACTERISTICS_BT709 -> transfer_characteristics_bt709
  | TRANSFER_CHARACTERISTICS_UNSPECIFIED -> transfer_characteristics_unspecified
  | TRANSFER_CHARACTERISTICS_GAMMA22 -> transfer_characteristics_gamma22
  | TRANSFER_CHARACTERISTICS_GAMMA28 -> transfer_characteristics_gamma28
  | TRANSFER_CHARACTERISTICS_BT601 -> transfer_characteristics_bt601
  | TRANSFER_CHARACTERISTICS_SMPTE240 -> transfer_characteristics_smpte240
  | TRANSFER_CHARACTERISTICS_LINEAR -> transfer_characteristics_linear
  | TRANSFER_CHARACTERISTICS_LOG100 -> transfer_characteristics_log100
  | TRANSFER_CHARACTERISTICS_LOG100_SQRT10 -> transfer_characteristics_log100_sqrt10
  | TRANSFER_CHARACTERISTICS_IEC61966 -> transfer_characteristics_iec61966
  | TRANSFER_CHARACTERISTICS_BT1361 -> transfer_characteristics_bt1361
  | TRANSFER_CHARACTERISTICS_SRGB -> transfer_characteristics_srgb
  | TRANSFER_CHARACTERISTICS_BT2020_10BIT -> transfer_characteristics_bt2020_10_bit
  | TRANSFER_CHARACTERISTICS_BT2020_12BIT -> transfer_characteristics_bt2020_12_bit
  | TRANSFER_CHARACTERISTICS_PQ -> transfer_characteristics_pq
  | TRANSFER_CHARACTERISTICS_SMPTE428 -> transfer_characteristics_smpte428
  | TRANSFER_CHARACTERISTICS_HLG -> transfer_characteristics_hlg
  | TRANSFER_CHARACTERISTICS_CUSTOM -> transfer_characteristics_custom

type matrix_coefficients =
  | MATRIX_COEFFICIENTS_IDENTITY
  | MATRIX_COEFFICIENTS_BT709
  | MATRIX_COEFFICIENTS_UNSPECIFIED
  | MATRIX_COEFFICIENTS_FCC
  | MATRIX_COEFFICIENTS_BT470BG
  | MATRIX_COEFFICIENTS_BT601
  | MATRIX_COEFFICIENTS_SMPTE240
  | MATRIX_COEFFICIENTS_YCGCO
  | MATRIX_COEFFICIENTS_BT2020_NCL
  | MATRIX_COEFFICIENTS_BT2020_CL
  | MATRIX_COEFFICIENTS_SMPTE2085
  | MATRIX_COEFFICIENTS_CHROMA_DERIVED_NCL
  | MATRIX_COEFFICIENTS_CHROMA_DERIVED_CL
  | MATRIX_COEFFICIENTS_ICTCP
  | MATRIX_COEFFICIENTS_CUSTOM

type matrix_coefficients_enum = int
let matrix_coefficients = int

let matrix_coefficients_to_enum : matrix_coefficients -> matrix_coefficients_enum = function
  | MATRIX_COEFFICIENTS_IDENTITY -> matrix_coefficients_identity
  | MATRIX_COEFFICIENTS_BT709 -> matrix_coefficients_bt709
  | MATRIX_COEFFICIENTS_UNSPECIFIED -> matrix_coefficients_unspecified
  | MATRIX_COEFFICIENTS_FCC -> matrix_coefficients_fcc
  | MATRIX_COEFFICIENTS_BT470BG -> matrix_coefficients_bt470_bg
  | MATRIX_COEFFICIENTS_BT601 -> matrix_coefficients_bt601
  | MATRIX_COEFFICIENTS_SMPTE240 -> matrix_coefficients_smpte240
  | MATRIX_COEFFICIENTS_YCGCO -> matrix_coefficients_ycgco
  | MATRIX_COEFFICIENTS_BT2020_NCL -> matrix_coefficients_bt2020_ncl
  | MATRIX_COEFFICIENTS_BT2020_CL -> matrix_coefficients_bt2020_cl
  | MATRIX_COEFFICIENTS_SMPTE2085 -> matrix_coefficients_smpte2085
  | MATRIX_COEFFICIENTS_CHROMA_DERIVED_NCL -> matrix_coefficients_chroma_derived_ncl
  | MATRIX_COEFFICIENTS_CHROMA_DERIVED_CL -> matrix_coefficients_chroma_derived_cl
  | MATRIX_COEFFICIENTS_ICTCP -> matrix_coefficients_ictcp
  | MATRIX_COEFFICIENTS_CUSTOM -> matrix_coefficients_custom

type chroma_location =
  | CHROMA_LOCATION_NONE
  | CHROMA_LOCATION_LEFT
  | CHROMA_LOCATION_CENTER
  | CHROMA_LOCATION_TOPLEFT

type chroma_location_enum = int
let chroma_location = int

let chroma_location_to_enum : chroma_location -> chroma_location_enum = function
  | CHROMA_LOCATION_NONE -> chroma_location_none
  | CHROMA_LOCATION_LEFT -> chroma_location_left
  | CHROMA_LOCATION_CENTER -> chroma_location_center
  | CHROMA_LOCATION_TOPLEFT -> chroma_location_topleft

type colorspace =
  | COLORSPACE_UNKNOWN
  | COLORSPACE_SRGB
  | COLORSPACE_SRGB_LINEAR
  | COLORSPACE_HDR10
  | COLORSPACE_JPEG
  | COLORSPACE_BT601_LIMITED
  | COLORSPACE_BT601_FULL
  | COLORSPACE_BT709_LIMITED
  | COLORSPACE_BT709_FULL
  | COLORSPACE_BT2020_LIMITED
  | COLORSPACE_BT2020_FULL
  | COLORSPACE_RGB_DEFAULT
  | COLORSPACE_YUV_DEFAULT

type colorspace_enum = int
let colorspace = int

let colorspace_to_enum : colorspace -> colorspace_enum = function
  | COLORSPACE_UNKNOWN -> colorspace_unknown
  | COLORSPACE_SRGB -> colorspace_srgb
  | COLORSPACE_SRGB_LINEAR -> colorspace_srgb_linear
  | COLORSPACE_HDR10 -> colorspace_hdr10
  | COLORSPACE_JPEG -> colorspace_jpeg
  | COLORSPACE_BT601_LIMITED -> colorspace_bt601_limited
  | COLORSPACE_BT601_FULL -> colorspace_bt601_full
  | COLORSPACE_BT709_LIMITED -> colorspace_bt709_limited
  | COLORSPACE_BT709_FULL -> colorspace_bt709_full
  | COLORSPACE_BT2020_LIMITED -> colorspace_bt2020_limited
  | COLORSPACE_BT2020_FULL -> colorspace_bt2020_full
  | COLORSPACE_RGB_DEFAULT -> colorspace_rgb_default
  | COLORSPACE_YUV_DEFAULT -> colorspace_yuv_default

module Color = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_Color"
  let r = field t "r" uint8
  let g = field t "g" uint8
  let b = field t "b" uint8
  let a = field t "a" uint8
  let () = seal t
  let create () = make t
end
type color = Color.t
let color = Color.t


module FColor = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_FColor"
  let r = field t "r" float
  let g = field t "g" float
  let b = field t "b" float
  let a = field t "a" float
  let () = seal t
end
type f_color = FColor.t
let f_color = FColor.t


module Palette = struct
  type _t_raw
  type t_raw = _t_raw structure
  let t : t_raw typ = structure "SDL_Palette"
  let ncolors = field t "ncolors" int
  let colors = field t "colors" (ptr color)
  let version = field t "version" int_as_uint
  let refcount = field t "refcount" int
  let () = seal t
  let t_raw = t
  type t = t_raw ptr
  let t : t typ = ptr t_raw
  let t_opt : t option typ = ptr_opt t_raw
  let get (e : t) field = getf {structured = e} field
  let set (e : t) field v = setf {structured = e} field v
end
type palette = Palette.t
let palette = Palette.t
let palette_opt = Palette.t_opt
let palette_raw = Palette.t_raw


module PixelFormatDetails = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_PixelFormatDetails"
  let format = field t "format" pixel_format
  let bits_per_pixel = field t "bits_per_pixel" uint8
  let bytes_per_pixel = field t "bytes_per_pixel" uint8
  let padding = field t "padding" (array 2 uint8)
  let rmask = field t "Rmask" int_as_uint
  let gmask = field t "Gmask" int_as_uint
  let bmask = field t "Bmask" int_as_uint
  let amask = field t "Amask" int_as_uint
  let rbits = field t "Rbits" uint8
  let gbits = field t "Gbits" uint8
  let bbits = field t "Bbits" uint8
  let abits = field t "Abits" uint8
  let rshift = field t "Rshift" uint8
  let gshift = field t "Gshift" uint8
  let bshift = field t "Bshift" uint8
  let ashift = field t "Ashift" uint8
  let () = seal t
end
type pixel_format_details = PixelFormatDetails.t
let pixel_format_details = PixelFormatDetails.t


module Point = struct
  type _t_raw
  type t_raw = _t_raw structure
  let t : t_raw typ = structure "SDL_Point"
  let x = field t "x" int
  let y = field t "y" int
  let () = seal t
  let t_raw = t
  type t = t_raw ptr
  let t : t typ = ptr t_raw
  let t_opt : t option typ = ptr_opt t_raw
  let get (e : t) field = getf {structured = e} field
  let set (e : t) field v = setf {structured = e} field v
  let create () : t = allocate_n t_raw ~count:1
end
type point = Point.t
let point = Point.t
let point_opt = Point.t_opt
let point_raw = Point.t_raw


module FPoint = struct
  type _t_raw
  type t_raw = _t_raw structure
  let t : t_raw typ = structure "SDL_FPoint"
  let x = field t "x" float
  let y = field t "y" float
  let () = seal t
  let t_raw = t
  type t = t_raw ptr
  let t : t typ = ptr t_raw
  let t_opt : t option typ = ptr_opt t_raw
  let get (e : t) field = getf {structured = e} field
  let set (e : t) field v = setf {structured = e} field v
  let create () : t = allocate_n t_raw ~count:1
end
type f_point = FPoint.t
let f_point = FPoint.t
let f_point_opt = FPoint.t_opt
let f_point_raw = FPoint.t_raw


module Rect = struct
  type _t_raw
  type t_raw = _t_raw structure
  let t : t_raw typ = structure "SDL_Rect"
  let x = field t "x" int
  let y = field t "y" int
  let w = field t "w" int
  let h = field t "h" int
  let () = seal t
  let t_raw = t
  type t = t_raw ptr
  let t : t typ = ptr t_raw
  let t_opt : t option typ = ptr_opt t_raw
  let get (e : t) field = getf {structured = e} field
  let set (e : t) field v = setf {structured = e} field v
  let create () : t = allocate_n t_raw ~count:1
end
type rect = Rect.t
let rect = Rect.t
let rect_opt = Rect.t_opt
let rect_raw = Rect.t_raw


module FRect = struct
  type _t_raw
  type t_raw = _t_raw structure
  let t : t_raw typ = structure "SDL_FRect"
  let x = field t "x" float
  let y = field t "y" float
  let w = field t "w" float
  let h = field t "h" float
  let () = seal t
  let t_raw = t
  type t = t_raw ptr
  let t : t typ = ptr t_raw
  let t_opt : t option typ = ptr_opt t_raw
  let get (e : t) field = getf {structured = e} field
  let set (e : t) field v = setf {structured = e} field v
  let create () : t = allocate_n t_raw ~count:1
end
type f_rect = FRect.t
let f_rect = FRect.t
let f_rect_opt = FRect.t_opt
let f_rect_raw = FRect.t_raw


let surface_flags = uint (* prim *)
type scale_mode =
  | SCALEMODE_INVALID
  | SCALEMODE_NEAREST
  | SCALEMODE_LINEAR
  | SCALEMODE_PIXELART

type scale_mode_enum = int
let scale_mode = int

let scale_mode_to_enum : scale_mode -> scale_mode_enum = function
  | SCALEMODE_INVALID -> scalemode_invalid
  | SCALEMODE_NEAREST -> scalemode_nearest
  | SCALEMODE_LINEAR -> scalemode_linear
  | SCALEMODE_PIXELART -> scalemode_pixelart

type flip_mode =
  | FLIP_NONE
  | FLIP_HORIZONTAL
  | FLIP_VERTICAL
  | FLIP_HORIZONTAL_AND_VERTICAL

type flip_mode_enum = int
let flip_mode = int

let flip_mode_to_enum : flip_mode -> flip_mode_enum = function
  | FLIP_NONE -> flip_none
  | FLIP_HORIZONTAL -> flip_horizontal
  | FLIP_VERTICAL -> flip_vertical
  | FLIP_HORIZONTAL_AND_VERTICAL -> flip_horizontal_and_vertical

module Surface = struct
  type _t_raw
  type t_raw = _t_raw structure
  let t : t_raw typ = structure "SDL_Surface"
  let flags = field t "flags" surface_flags
  let format = field t "format" pixel_format
  let w = field t "w" int
  let h = field t "h" int
  let pitch = field t "pitch" int
  let pixels = field t "pixels" (ptr void)
  let refcount = field t "refcount" int
  let reserved = field t "reserved" (ptr void)
  let () = seal t
  let t_raw = t
  type t = t_raw ptr
  let t : t typ = ptr t_raw
  let t_opt : t option typ = ptr_opt t_raw
  let get (e : t) field = getf {structured = e} field
  let set (e : t) field v = setf {structured = e} field v
end
type surface = Surface.t
let surface = Surface.t
let surface_opt = Surface.t_opt
let surface_raw = Surface.t_raw


let camera_id = uint (* prim *)

(* No definition (opaque struct) *)
type camera = unit ptr
let camera : camera typ = ptr void
let camera_opt : camera option typ = ptr_opt void

module CameraSpec = struct
  type _t_raw
  type t_raw = _t_raw structure
  let t : t_raw typ = structure "SDL_CameraSpec"
  let format = field t "format" pixel_format
  let colorspace = field t "colorspace" colorspace
  let width = field t "width" int
  let height = field t "height" int
  let framerate_numerator = field t "framerate_numerator" int
  let framerate_denominator = field t "framerate_denominator" int
  let () = seal t
  let t_raw = t
  type t = t_raw ptr
  let t : t typ = ptr t_raw
  let t_opt : t option typ = ptr_opt t_raw
  let get (e : t) field = getf {structured = e} field
  let set (e : t) field v = setf {structured = e} field v
end
type camera_spec = CameraSpec.t
let camera_spec = CameraSpec.t
let camera_spec_opt = CameraSpec.t_opt
let camera_spec_raw = CameraSpec.t_raw


type camera_position =
  | CAMERA_POSITION_UNKNOWN
  | CAMERA_POSITION_FRONT_FACING
  | CAMERA_POSITION_BACK_FACING

type camera_position_enum = int
let camera_position = int

let camera_position_to_enum : camera_position -> camera_position_enum = function
  | CAMERA_POSITION_UNKNOWN -> camera_position_unknown
  | CAMERA_POSITION_FRONT_FACING -> camera_position_front_facing
  | CAMERA_POSITION_BACK_FACING -> camera_position_back_facing

type camera_permission_state =
  | CAMERA_PERMISSION_STATE_DENIED
  | CAMERA_PERMISSION_STATE_PENDING
  | CAMERA_PERMISSION_STATE_APPROVED

type camera_permission_state_enum = int
let camera_permission_state = int

let camera_permission_state_to_enum : camera_permission_state -> camera_permission_state_enum = function
  | CAMERA_PERMISSION_STATE_DENIED -> camera_permission_state_denied
  | CAMERA_PERMISSION_STATE_PENDING -> camera_permission_state_pending
  | CAMERA_PERMISSION_STATE_APPROVED -> camera_permission_state_approved

let clipboard_data_callback = funptr (ptr void @-> string @-> ptr ulong @-> returning (ptr void))
let clipboard_cleanup_callback = funptr (ptr void @-> returning void)
let display_id = uint (* prim *)
let window_id = uint (* prim *)
type system_theme =
  | SYSTEM_THEME_UNKNOWN
  | SYSTEM_THEME_LIGHT
  | SYSTEM_THEME_DARK

type system_theme_enum = int
let system_theme = int

let system_theme_to_enum : system_theme -> system_theme_enum = function
  | SYSTEM_THEME_UNKNOWN -> system_theme_unknown
  | SYSTEM_THEME_LIGHT -> system_theme_light
  | SYSTEM_THEME_DARK -> system_theme_dark


(* No definition (opaque struct) *)
type display_mode_data = unit ptr
let display_mode_data : display_mode_data typ = ptr void
let display_mode_data_opt : display_mode_data option typ = ptr_opt void

module DisplayMode = struct
  type _t_raw
  type t_raw = _t_raw structure
  let t : t_raw typ = structure "SDL_DisplayMode"
  let display_id = field t "displayID" display_id
  let format = field t "format" pixel_format
  let w = field t "w" int
  let h = field t "h" int
  let pixel_density = field t "pixel_density" float
  let refresh_rate = field t "refresh_rate" float
  let refresh_rate_numerator = field t "refresh_rate_numerator" int
  let refresh_rate_denominator = field t "refresh_rate_denominator" int
  let internal = field t "internal" display_mode_data
  let () = seal t
  let t_raw = t
  type t = t_raw ptr
  let t : t typ = ptr t_raw
  let t_opt : t option typ = ptr_opt t_raw
  let get (e : t) field = getf {structured = e} field
  let set (e : t) field v = setf {structured = e} field v
  let create () : t = allocate_n t_raw ~count:1
end
type display_mode = DisplayMode.t
let display_mode = DisplayMode.t
let display_mode_opt = DisplayMode.t_opt
let display_mode_raw = DisplayMode.t_raw


type display_orientation =
  | ORIENTATION_UNKNOWN
  | ORIENTATION_LANDSCAPE
  | ORIENTATION_LANDSCAPE_FLIPPED
  | ORIENTATION_PORTRAIT
  | ORIENTATION_PORTRAIT_FLIPPED

type display_orientation_enum = int
let display_orientation = int

let display_orientation_to_enum : display_orientation -> display_orientation_enum = function
  | ORIENTATION_UNKNOWN -> orientation_unknown
  | ORIENTATION_LANDSCAPE -> orientation_landscape
  | ORIENTATION_LANDSCAPE_FLIPPED -> orientation_landscape_flipped
  | ORIENTATION_PORTRAIT -> orientation_portrait
  | ORIENTATION_PORTRAIT_FLIPPED -> orientation_portrait_flipped


(* No definition (opaque struct) *)
type window = unit ptr
let window : window typ = ptr void
let window_opt : window option typ = ptr_opt void

let window_flags = ulong (* prim *)
type flash_operation =
  | FLASH_CANCEL
  | FLASH_BRIEFLY
  | FLASH_UNTIL_FOCUSED

type flash_operation_enum = int
let flash_operation = int

let flash_operation_to_enum : flash_operation -> flash_operation_enum = function
  | FLASH_CANCEL -> flash_cancel
  | FLASH_BRIEFLY -> flash_briefly
  | FLASH_UNTIL_FOCUSED -> flash_until_focused

type progress_state =
  | PROGRESS_STATE_INVALID
  | PROGRESS_STATE_NONE
  | PROGRESS_STATE_INDETERMINATE
  | PROGRESS_STATE_NORMAL
  | PROGRESS_STATE_PAUSED
  | PROGRESS_STATE_ERROR

type progress_state_enum = int
let progress_state = int

let progress_state_to_enum : progress_state -> progress_state_enum = function
  | PROGRESS_STATE_INVALID -> progress_state_invalid
  | PROGRESS_STATE_NONE -> progress_state_none
  | PROGRESS_STATE_INDETERMINATE -> progress_state_indeterminate
  | PROGRESS_STATE_NORMAL -> progress_state_normal
  | PROGRESS_STATE_PAUSED -> progress_state_paused
  | PROGRESS_STATE_ERROR -> progress_state_error


(* No definition (opaque struct) *)
type gl_context_state = unit ptr
let gl_context_state : gl_context_state typ = ptr void
let gl_context_state_opt : gl_context_state option typ = ptr_opt void

let gl_context = gl_context_state
let egl_display = ptr void
let egl_config = ptr void
let egl_surface = ptr void
let egl_attrib = long (* prim *)
let eg_lint = int (* prim *)
let egl_attrib_array_callback = funptr (ptr void @-> returning (ptr long))
let egl_int_array_callback = funptr (ptr void @-> ptr void @-> ptr void @-> returning (ptr int))
type gl_attr =
  | GL_RED_SIZE
  | GL_GREEN_SIZE
  | GL_BLUE_SIZE
  | GL_ALPHA_SIZE
  | GL_BUFFER_SIZE
  | GL_DOUBLEBUFFER
  | GL_DEPTH_SIZE
  | GL_STENCIL_SIZE
  | GL_ACCUM_RED_SIZE
  | GL_ACCUM_GREEN_SIZE
  | GL_ACCUM_BLUE_SIZE
  | GL_ACCUM_ALPHA_SIZE
  | GL_STEREO
  | GL_MULTISAMPLEBUFFERS
  | GL_MULTISAMPLESAMPLES
  | GL_ACCELERATED_VISUAL
  | GL_RETAINED_BACKING
  | GL_CONTEXT_MAJOR_VERSION
  | GL_CONTEXT_MINOR_VERSION
  | GL_CONTEXT_FLAGS
  | GL_CONTEXT_PROFILE_MASK
  | GL_SHARE_WITH_CURRENT_CONTEXT
  | GL_FRAMEBUFFER_SRGB_CAPABLE
  | GL_CONTEXT_RELEASE_BEHAVIOR
  | GL_CONTEXT_RESET_NOTIFICATION
  | GL_CONTEXT_NO_ERROR
  | GL_FLOATBUFFERS
  | GL_EGL_PLATFORM

type gl_attr_enum = int
let gl_attr = int

let gl_attr_to_enum : gl_attr -> gl_attr_enum = function
  | GL_RED_SIZE -> gl_red_size
  | GL_GREEN_SIZE -> gl_green_size
  | GL_BLUE_SIZE -> gl_blue_size
  | GL_ALPHA_SIZE -> gl_alpha_size
  | GL_BUFFER_SIZE -> gl_buffer_size
  | GL_DOUBLEBUFFER -> gl_doublebuffer
  | GL_DEPTH_SIZE -> gl_depth_size
  | GL_STENCIL_SIZE -> gl_stencil_size
  | GL_ACCUM_RED_SIZE -> gl_accum_red_size
  | GL_ACCUM_GREEN_SIZE -> gl_accum_green_size
  | GL_ACCUM_BLUE_SIZE -> gl_accum_blue_size
  | GL_ACCUM_ALPHA_SIZE -> gl_accum_alpha_size
  | GL_STEREO -> gl_stereo
  | GL_MULTISAMPLEBUFFERS -> gl_multisamplebuffers
  | GL_MULTISAMPLESAMPLES -> gl_multisamplesamples
  | GL_ACCELERATED_VISUAL -> gl_accelerated_visual
  | GL_RETAINED_BACKING -> gl_retained_backing
  | GL_CONTEXT_MAJOR_VERSION -> gl_context_major_version
  | GL_CONTEXT_MINOR_VERSION -> gl_context_minor_version
  | GL_CONTEXT_FLAGS -> gl_context_flags
  | GL_CONTEXT_PROFILE_MASK -> gl_context_profile_mask
  | GL_SHARE_WITH_CURRENT_CONTEXT -> gl_share_with_current_context
  | GL_FRAMEBUFFER_SRGB_CAPABLE -> gl_framebuffer_srgb_capable
  | GL_CONTEXT_RELEASE_BEHAVIOR -> gl_context_release_behavior
  | GL_CONTEXT_RESET_NOTIFICATION -> gl_context_reset_notification
  | GL_CONTEXT_NO_ERROR -> gl_context_no_error
  | GL_FLOATBUFFERS -> gl_floatbuffers
  | GL_EGL_PLATFORM -> gl_egl_platform

let gl_profile = uint (* prim *)
let gl_context_flag = uint (* prim *)
let gl_context_release_flag = uint (* prim *)
let gl_context_reset_notification = uint (* prim *)
type hit_test_result =
  | HITTEST_NORMAL
  | HITTEST_DRAGGABLE
  | HITTEST_RESIZE_TOPLEFT
  | HITTEST_RESIZE_TOP
  | HITTEST_RESIZE_TOPRIGHT
  | HITTEST_RESIZE_RIGHT
  | HITTEST_RESIZE_BOTTOMRIGHT
  | HITTEST_RESIZE_BOTTOM
  | HITTEST_RESIZE_BOTTOMLEFT
  | HITTEST_RESIZE_LEFT

type hit_test_result_enum = int
let hit_test_result = int

let hit_test_result_to_enum : hit_test_result -> hit_test_result_enum = function
  | HITTEST_NORMAL -> hittest_normal
  | HITTEST_DRAGGABLE -> hittest_draggable
  | HITTEST_RESIZE_TOPLEFT -> hittest_resize_topleft
  | HITTEST_RESIZE_TOP -> hittest_resize_top
  | HITTEST_RESIZE_TOPRIGHT -> hittest_resize_topright
  | HITTEST_RESIZE_RIGHT -> hittest_resize_right
  | HITTEST_RESIZE_BOTTOMRIGHT -> hittest_resize_bottomright
  | HITTEST_RESIZE_BOTTOM -> hittest_resize_bottom
  | HITTEST_RESIZE_BOTTOMLEFT -> hittest_resize_bottomleft
  | HITTEST_RESIZE_LEFT -> hittest_resize_left

let hit_test = funptr (window @-> point @-> ptr void @-> returning hit_test_result)
module DialogFileFilter = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_DialogFileFilter"
  let name = field t "name" string
  let pattern = field t "pattern" string
  let () = seal t
end
type dialog_file_filter = DialogFileFilter.t
let dialog_file_filter = DialogFileFilter.t


let dialog_file_callback = funptr (ptr void @-> ptr string @-> int @-> returning void)
type file_dialog_type =
  | FILEDIALOG_OPENFILE
  | FILEDIALOG_SAVEFILE
  | FILEDIALOG_OPENFOLDER

type file_dialog_type_enum = int
let file_dialog_type = int

let file_dialog_type_to_enum : file_dialog_type -> file_dialog_type_enum = function
  | FILEDIALOG_OPENFILE -> filedialog_openfile
  | FILEDIALOG_SAVEFILE -> filedialog_savefile
  | FILEDIALOG_OPENFOLDER -> filedialog_openfolder

module GUID = struct
  type _t_raw
  type t_raw = _t_raw structure
  let t : t_raw typ = structure "SDL_GUID"
  let data = field t "data" (array 16 uint8)
  let () = seal t
  let t_raw = t
  type t = t_raw ptr
  let t : t typ = ptr t_raw
  let t_opt : t option typ = ptr_opt t_raw
  let get (e : t) field = getf {structured = e} field
  let set (e : t) field v = setf {structured = e} field v
end
type guid = GUID.t
let guid = GUID.t
let guid_opt = GUID.t_opt
let guid_raw = GUID.t_raw


type power_state =
  | POWERSTATE_ERROR
  | POWERSTATE_UNKNOWN
  | POWERSTATE_ON_BATTERY
  | POWERSTATE_NO_BATTERY
  | POWERSTATE_CHARGING
  | POWERSTATE_CHARGED

type power_state_enum = int
let power_state = int

let power_state_to_enum : power_state -> power_state_enum = function
  | POWERSTATE_ERROR -> powerstate_error
  | POWERSTATE_UNKNOWN -> powerstate_unknown
  | POWERSTATE_ON_BATTERY -> powerstate_on_battery
  | POWERSTATE_NO_BATTERY -> powerstate_no_battery
  | POWERSTATE_CHARGING -> powerstate_charging
  | POWERSTATE_CHARGED -> powerstate_charged


(* No definition (opaque struct) *)
type sensor = unit ptr
let sensor : sensor typ = ptr void
let sensor_opt : sensor option typ = ptr_opt void

let sensor_id = uint (* prim *)
type sensor_type =
  | SENSOR_INVALID
  | SENSOR_UNKNOWN
  | SENSOR_ACCEL
  | SENSOR_GYRO
  | SENSOR_ACCEL_L
  | SENSOR_GYRO_L
  | SENSOR_ACCEL_R
  | SENSOR_GYRO_R
  | SENSOR_COUNT

type sensor_type_enum = int
let sensor_type = int

let sensor_type_to_enum : sensor_type -> sensor_type_enum = function
  | SENSOR_INVALID -> sensor_invalid
  | SENSOR_UNKNOWN -> sensor_unknown
  | SENSOR_ACCEL -> sensor_accel
  | SENSOR_GYRO -> sensor_gyro
  | SENSOR_ACCEL_L -> sensor_accel_l
  | SENSOR_GYRO_L -> sensor_gyro_l
  | SENSOR_ACCEL_R -> sensor_accel_r
  | SENSOR_GYRO_R -> sensor_gyro_r
  | SENSOR_COUNT -> sensor_count


(* No definition (opaque struct) *)
type joystick = unit ptr
let joystick : joystick typ = ptr void
let joystick_opt : joystick option typ = ptr_opt void

let joystick_id = uint (* prim *)
type joystick_type =
  | JOYSTICK_TYPE_UNKNOWN
  | JOYSTICK_TYPE_GAMEPAD
  | JOYSTICK_TYPE_WHEEL
  | JOYSTICK_TYPE_ARCADE_STICK
  | JOYSTICK_TYPE_FLIGHT_STICK
  | JOYSTICK_TYPE_DANCE_PAD
  | JOYSTICK_TYPE_GUITAR
  | JOYSTICK_TYPE_DRUM_KIT
  | JOYSTICK_TYPE_ARCADE_PAD
  | JOYSTICK_TYPE_THROTTLE
  | JOYSTICK_TYPE_COUNT

type joystick_type_enum = int
let joystick_type = int

let joystick_type_to_enum : joystick_type -> joystick_type_enum = function
  | JOYSTICK_TYPE_UNKNOWN -> joystick_type_unknown
  | JOYSTICK_TYPE_GAMEPAD -> joystick_type_gamepad
  | JOYSTICK_TYPE_WHEEL -> joystick_type_wheel
  | JOYSTICK_TYPE_ARCADE_STICK -> joystick_type_arcade_stick
  | JOYSTICK_TYPE_FLIGHT_STICK -> joystick_type_flight_stick
  | JOYSTICK_TYPE_DANCE_PAD -> joystick_type_dance_pad
  | JOYSTICK_TYPE_GUITAR -> joystick_type_guitar
  | JOYSTICK_TYPE_DRUM_KIT -> joystick_type_drum_kit
  | JOYSTICK_TYPE_ARCADE_PAD -> joystick_type_arcade_pad
  | JOYSTICK_TYPE_THROTTLE -> joystick_type_throttle
  | JOYSTICK_TYPE_COUNT -> joystick_type_count

type joystick_connection_state =
  | JOYSTICK_CONNECTION_INVALID
  | JOYSTICK_CONNECTION_UNKNOWN
  | JOYSTICK_CONNECTION_WIRED
  | JOYSTICK_CONNECTION_WIRELESS

type joystick_connection_state_enum = int
let joystick_connection_state = int

let joystick_connection_state_to_enum : joystick_connection_state -> joystick_connection_state_enum = function
  | JOYSTICK_CONNECTION_INVALID -> joystick_connection_invalid
  | JOYSTICK_CONNECTION_UNKNOWN -> joystick_connection_unknown
  | JOYSTICK_CONNECTION_WIRED -> joystick_connection_wired
  | JOYSTICK_CONNECTION_WIRELESS -> joystick_connection_wireless

module VirtualJoystickTouchpadDesc = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_VirtualJoystickTouchpadDesc"
  let nfingers = field t "nfingers" uint16
  let padding = field t "padding" (array 3 uint16)
  let () = seal t
end
type virtual_joystick_touchpad_desc = VirtualJoystickTouchpadDesc.t
let virtual_joystick_touchpad_desc = VirtualJoystickTouchpadDesc.t


module VirtualJoystickSensorDesc = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_VirtualJoystickSensorDesc"
  let typ = field t "type" sensor_type
  let rate = field t "rate" float
  let () = seal t
end
type virtual_joystick_sensor_desc = VirtualJoystickSensorDesc.t
let virtual_joystick_sensor_desc = VirtualJoystickSensorDesc.t


module VirtualJoystickDesc = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_VirtualJoystickDesc"
  let version = field t "version" int_as_uint
  let typ = field t "type" uint16
  let padding = field t "padding" uint16
  let vendor_id = field t "vendor_id" uint16
  let product_id = field t "product_id" uint16
  let naxes = field t "naxes" uint16
  let nbuttons = field t "nbuttons" uint16
  let nballs = field t "nballs" uint16
  let nhats = field t "nhats" uint16
  let ntouchpads = field t "ntouchpads" uint16
  let nsensors = field t "nsensors" uint16
  let padding2 = field t "padding2" (array 2 uint16)
  let button_mask = field t "button_mask" int_as_uint
  let axis_mask = field t "axis_mask" int_as_uint
  let name = field t "name" string
  let touchpads = field t "touchpads" (ptr virtual_joystick_touchpad_desc)
  let sensors = field t "sensors" (ptr virtual_joystick_sensor_desc)
  let userdata = field t "userdata" (ptr void)
  let update = field t "Update" (funptr (ptr void @-> returning void))
  let set_player_index = field t "SetPlayerIndex" (funptr (ptr void @-> int @-> returning void))
  let rumble = field t "Rumble" (funptr (ptr void @-> uint16 @-> uint16 @-> returning bool))
  let rumble_triggers = field t "RumbleTriggers" (funptr (ptr void @-> uint16 @-> uint16 @-> returning bool))
  let set_led = field t "SetLED" (funptr (ptr void @-> uint8 @-> uint8 @-> uint8 @-> returning bool))
  let send_effect = field t "SendEffect" (funptr (ptr void @-> ptr void @-> int @-> returning bool))
  let set_sensors_enabled = field t "SetSensorsEnabled" (funptr (ptr void @-> bool @-> returning bool))
  let cleanup = field t "Cleanup" (funptr (ptr void @-> returning void))
  let () = seal t
end
type virtual_joystick_desc = VirtualJoystickDesc.t
let virtual_joystick_desc = VirtualJoystickDesc.t



(* No definition (opaque struct) *)
type gamepad = unit ptr
let gamepad : gamepad typ = ptr void
let gamepad_opt : gamepad option typ = ptr_opt void

type gamepad_type =
  | GAMEPAD_TYPE_UNKNOWN
  | GAMEPAD_TYPE_STANDARD
  | GAMEPAD_TYPE_XBOX360
  | GAMEPAD_TYPE_XBOXONE
  | GAMEPAD_TYPE_PS3
  | GAMEPAD_TYPE_PS4
  | GAMEPAD_TYPE_PS5
  | GAMEPAD_TYPE_NINTENDO_SWITCH_PRO
  | GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_LEFT
  | GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT
  | GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_PAIR
  | GAMEPAD_TYPE_GAMECUBE
  | GAMEPAD_TYPE_COUNT

type gamepad_type_enum = int
let gamepad_type = int

let gamepad_type_to_enum : gamepad_type -> gamepad_type_enum = function
  | GAMEPAD_TYPE_UNKNOWN -> gamepad_type_unknown
  | GAMEPAD_TYPE_STANDARD -> gamepad_type_standard
  | GAMEPAD_TYPE_XBOX360 -> gamepad_type_xbox360
  | GAMEPAD_TYPE_XBOXONE -> gamepad_type_xboxone
  | GAMEPAD_TYPE_PS3 -> gamepad_type_ps3
  | GAMEPAD_TYPE_PS4 -> gamepad_type_ps4
  | GAMEPAD_TYPE_PS5 -> gamepad_type_ps5
  | GAMEPAD_TYPE_NINTENDO_SWITCH_PRO -> gamepad_type_nintendo_switch_pro
  | GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_LEFT -> gamepad_type_nintendo_switch_joycon_left
  | GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT -> gamepad_type_nintendo_switch_joycon_right
  | GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_PAIR -> gamepad_type_nintendo_switch_joycon_pair
  | GAMEPAD_TYPE_GAMECUBE -> gamepad_type_gamecube
  | GAMEPAD_TYPE_COUNT -> gamepad_type_count

type gamepad_button =
  | GAMEPAD_BUTTON_INVALID
  | GAMEPAD_BUTTON_SOUTH
  | GAMEPAD_BUTTON_EAST
  | GAMEPAD_BUTTON_WEST
  | GAMEPAD_BUTTON_NORTH
  | GAMEPAD_BUTTON_BACK
  | GAMEPAD_BUTTON_GUIDE
  | GAMEPAD_BUTTON_START
  | GAMEPAD_BUTTON_LEFT_STICK
  | GAMEPAD_BUTTON_RIGHT_STICK
  | GAMEPAD_BUTTON_LEFT_SHOULDER
  | GAMEPAD_BUTTON_RIGHT_SHOULDER
  | GAMEPAD_BUTTON_DPAD_UP
  | GAMEPAD_BUTTON_DPAD_DOWN
  | GAMEPAD_BUTTON_DPAD_LEFT
  | GAMEPAD_BUTTON_DPAD_RIGHT
  | GAMEPAD_BUTTON_MISC1
  | GAMEPAD_BUTTON_RIGHT_PADDLE1
  | GAMEPAD_BUTTON_LEFT_PADDLE1
  | GAMEPAD_BUTTON_RIGHT_PADDLE2
  | GAMEPAD_BUTTON_LEFT_PADDLE2
  | GAMEPAD_BUTTON_TOUCHPAD
  | GAMEPAD_BUTTON_MISC2
  | GAMEPAD_BUTTON_MISC3
  | GAMEPAD_BUTTON_MISC4
  | GAMEPAD_BUTTON_MISC5
  | GAMEPAD_BUTTON_MISC6
  | GAMEPAD_BUTTON_COUNT

type gamepad_button_enum = int
let gamepad_button = int

let gamepad_button_to_enum : gamepad_button -> gamepad_button_enum = function
  | GAMEPAD_BUTTON_INVALID -> gamepad_button_invalid
  | GAMEPAD_BUTTON_SOUTH -> gamepad_button_south
  | GAMEPAD_BUTTON_EAST -> gamepad_button_east
  | GAMEPAD_BUTTON_WEST -> gamepad_button_west
  | GAMEPAD_BUTTON_NORTH -> gamepad_button_north
  | GAMEPAD_BUTTON_BACK -> gamepad_button_back
  | GAMEPAD_BUTTON_GUIDE -> gamepad_button_guide
  | GAMEPAD_BUTTON_START -> gamepad_button_start
  | GAMEPAD_BUTTON_LEFT_STICK -> gamepad_button_left_stick
  | GAMEPAD_BUTTON_RIGHT_STICK -> gamepad_button_right_stick
  | GAMEPAD_BUTTON_LEFT_SHOULDER -> gamepad_button_left_shoulder
  | GAMEPAD_BUTTON_RIGHT_SHOULDER -> gamepad_button_right_shoulder
  | GAMEPAD_BUTTON_DPAD_UP -> gamepad_button_dpad_up
  | GAMEPAD_BUTTON_DPAD_DOWN -> gamepad_button_dpad_down
  | GAMEPAD_BUTTON_DPAD_LEFT -> gamepad_button_dpad_left
  | GAMEPAD_BUTTON_DPAD_RIGHT -> gamepad_button_dpad_right
  | GAMEPAD_BUTTON_MISC1 -> gamepad_button_misc1
  | GAMEPAD_BUTTON_RIGHT_PADDLE1 -> gamepad_button_right_paddle1
  | GAMEPAD_BUTTON_LEFT_PADDLE1 -> gamepad_button_left_paddle1
  | GAMEPAD_BUTTON_RIGHT_PADDLE2 -> gamepad_button_right_paddle2
  | GAMEPAD_BUTTON_LEFT_PADDLE2 -> gamepad_button_left_paddle2
  | GAMEPAD_BUTTON_TOUCHPAD -> gamepad_button_touchpad
  | GAMEPAD_BUTTON_MISC2 -> gamepad_button_misc2
  | GAMEPAD_BUTTON_MISC3 -> gamepad_button_misc3
  | GAMEPAD_BUTTON_MISC4 -> gamepad_button_misc4
  | GAMEPAD_BUTTON_MISC5 -> gamepad_button_misc5
  | GAMEPAD_BUTTON_MISC6 -> gamepad_button_misc6
  | GAMEPAD_BUTTON_COUNT -> gamepad_button_count

type gamepad_button_label =
  | GAMEPAD_BUTTON_LABEL_UNKNOWN
  | GAMEPAD_BUTTON_LABEL_A
  | GAMEPAD_BUTTON_LABEL_B
  | GAMEPAD_BUTTON_LABEL_X
  | GAMEPAD_BUTTON_LABEL_Y
  | GAMEPAD_BUTTON_LABEL_CROSS
  | GAMEPAD_BUTTON_LABEL_CIRCLE
  | GAMEPAD_BUTTON_LABEL_SQUARE
  | GAMEPAD_BUTTON_LABEL_TRIANGLE

type gamepad_button_label_enum = int
let gamepad_button_label = int

let gamepad_button_label_to_enum : gamepad_button_label -> gamepad_button_label_enum = function
  | GAMEPAD_BUTTON_LABEL_UNKNOWN -> gamepad_button_label_unknown
  | GAMEPAD_BUTTON_LABEL_A -> gamepad_button_label_a
  | GAMEPAD_BUTTON_LABEL_B -> gamepad_button_label_b
  | GAMEPAD_BUTTON_LABEL_X -> gamepad_button_label_x
  | GAMEPAD_BUTTON_LABEL_Y -> gamepad_button_label_y
  | GAMEPAD_BUTTON_LABEL_CROSS -> gamepad_button_label_cross
  | GAMEPAD_BUTTON_LABEL_CIRCLE -> gamepad_button_label_circle
  | GAMEPAD_BUTTON_LABEL_SQUARE -> gamepad_button_label_square
  | GAMEPAD_BUTTON_LABEL_TRIANGLE -> gamepad_button_label_triangle

type gamepad_axis =
  | GAMEPAD_AXIS_INVALID
  | GAMEPAD_AXIS_LEFTX
  | GAMEPAD_AXIS_LEFTY
  | GAMEPAD_AXIS_RIGHTX
  | GAMEPAD_AXIS_RIGHTY
  | GAMEPAD_AXIS_LEFT_TRIGGER
  | GAMEPAD_AXIS_RIGHT_TRIGGER
  | GAMEPAD_AXIS_COUNT

type gamepad_axis_enum = int
let gamepad_axis = int

let gamepad_axis_to_enum : gamepad_axis -> gamepad_axis_enum = function
  | GAMEPAD_AXIS_INVALID -> gamepad_axis_invalid
  | GAMEPAD_AXIS_LEFTX -> gamepad_axis_leftx
  | GAMEPAD_AXIS_LEFTY -> gamepad_axis_lefty
  | GAMEPAD_AXIS_RIGHTX -> gamepad_axis_rightx
  | GAMEPAD_AXIS_RIGHTY -> gamepad_axis_righty
  | GAMEPAD_AXIS_LEFT_TRIGGER -> gamepad_axis_left_trigger
  | GAMEPAD_AXIS_RIGHT_TRIGGER -> gamepad_axis_right_trigger
  | GAMEPAD_AXIS_COUNT -> gamepad_axis_count

type gamepad_binding_type =
  | GAMEPAD_BINDTYPE_NONE
  | GAMEPAD_BINDTYPE_BUTTON
  | GAMEPAD_BINDTYPE_AXIS
  | GAMEPAD_BINDTYPE_HAT

type gamepad_binding_type_enum = int
let gamepad_binding_type = int

let gamepad_binding_type_to_enum : gamepad_binding_type -> gamepad_binding_type_enum = function
  | GAMEPAD_BINDTYPE_NONE -> gamepad_bindtype_none
  | GAMEPAD_BINDTYPE_BUTTON -> gamepad_bindtype_button
  | GAMEPAD_BINDTYPE_AXIS -> gamepad_bindtype_axis
  | GAMEPAD_BINDTYPE_HAT -> gamepad_bindtype_hat

module GamepadBinding = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GamepadBinding"
  let input_type = field t "input_type" gamepad_binding_type
module Gamepad_binding_input = struct (* union 'gamepad_binding_input' *)
  type _t
  type t = _t union
  let t : t typ = union "gamepad_binding_input"
  let button = field t "button" int
module Gamepad_binding_input_axis = struct
  type _t
  type t = _t structure
  let t : t typ = structure "gamepad_binding_input_axis"
  let axis = field t "axis" int
  let axis_min = field t "axis_min" int
  let axis_max = field t "axis_max" int
  let () = seal t
end
type gamepad_binding_input_axis = Gamepad_binding_input_axis.t
let gamepad_binding_input_axis = Gamepad_binding_input_axis.t


  let axis = field t "axis" gamepad_binding_input_axis
module Gamepad_binding_input_hat = struct
  type _t
  type t = _t structure
  let t : t typ = structure "gamepad_binding_input_hat"
  let hat = field t "hat" int
  let hat_mask = field t "hat_mask" int
  let () = seal t
end
type gamepad_binding_input_hat = Gamepad_binding_input_hat.t
let gamepad_binding_input_hat = Gamepad_binding_input_hat.t


  let hat = field t "hat" gamepad_binding_input_hat
  let () = seal t
end
type gamepad_binding_input = Gamepad_binding_input.t
let gamepad_binding_input = Gamepad_binding_input.t


  let input = field t "input" gamepad_binding_input
  let output_type = field t "output_type" gamepad_binding_type
module Gamepad_binding_output = struct (* union 'gamepad_binding_output' *)
  type _t
  type t = _t union
  let t : t typ = union "gamepad_binding_output"
  let button = field t "button" gamepad_button
module Gamepad_binding_output_axis = struct
  type _t
  type t = _t structure
  let t : t typ = structure "gamepad_binding_output_axis"
  let axis = field t "axis" gamepad_axis
  let axis_min = field t "axis_min" int
  let axis_max = field t "axis_max" int
  let () = seal t
end
type gamepad_binding_output_axis = Gamepad_binding_output_axis.t
let gamepad_binding_output_axis = Gamepad_binding_output_axis.t


  let axis = field t "axis" gamepad_binding_output_axis
  let () = seal t
end
type gamepad_binding_output = Gamepad_binding_output.t
let gamepad_binding_output = Gamepad_binding_output.t


  let output = field t "output" gamepad_binding_output
  let () = seal t
end
type gamepad_binding = GamepadBinding.t
let gamepad_binding = GamepadBinding.t


type scancode =
  | SCANCODE_UNKNOWN
  | SCANCODE_A
  | SCANCODE_B
  | SCANCODE_C
  | SCANCODE_D
  | SCANCODE_E
  | SCANCODE_F
  | SCANCODE_G
  | SCANCODE_H
  | SCANCODE_I
  | SCANCODE_J
  | SCANCODE_K
  | SCANCODE_L
  | SCANCODE_M
  | SCANCODE_N
  | SCANCODE_O
  | SCANCODE_P
  | SCANCODE_Q
  | SCANCODE_R
  | SCANCODE_S
  | SCANCODE_T
  | SCANCODE_U
  | SCANCODE_V
  | SCANCODE_W
  | SCANCODE_X
  | SCANCODE_Y
  | SCANCODE_Z
  | SCANCODE_1
  | SCANCODE_2
  | SCANCODE_3
  | SCANCODE_4
  | SCANCODE_5
  | SCANCODE_6
  | SCANCODE_7
  | SCANCODE_8
  | SCANCODE_9
  | SCANCODE_0
  | SCANCODE_RETURN
  | SCANCODE_ESCAPE
  | SCANCODE_BACKSPACE
  | SCANCODE_TAB
  | SCANCODE_SPACE
  | SCANCODE_MINUS
  | SCANCODE_EQUALS
  | SCANCODE_LEFTBRACKET
  | SCANCODE_RIGHTBRACKET
  | SCANCODE_BACKSLASH
  | SCANCODE_NONUSHASH
  | SCANCODE_SEMICOLON
  | SCANCODE_APOSTROPHE
  | SCANCODE_GRAVE
  | SCANCODE_COMMA
  | SCANCODE_PERIOD
  | SCANCODE_SLASH
  | SCANCODE_CAPSLOCK
  | SCANCODE_F1
  | SCANCODE_F2
  | SCANCODE_F3
  | SCANCODE_F4
  | SCANCODE_F5
  | SCANCODE_F6
  | SCANCODE_F7
  | SCANCODE_F8
  | SCANCODE_F9
  | SCANCODE_F10
  | SCANCODE_F11
  | SCANCODE_F12
  | SCANCODE_PRINTSCREEN
  | SCANCODE_SCROLLLOCK
  | SCANCODE_PAUSE
  | SCANCODE_INSERT
  | SCANCODE_HOME
  | SCANCODE_PAGEUP
  | SCANCODE_DELETE
  | SCANCODE_END
  | SCANCODE_PAGEDOWN
  | SCANCODE_RIGHT
  | SCANCODE_LEFT
  | SCANCODE_DOWN
  | SCANCODE_UP
  | SCANCODE_NUMLOCKCLEAR
  | SCANCODE_KP_DIVIDE
  | SCANCODE_KP_MULTIPLY
  | SCANCODE_KP_MINUS
  | SCANCODE_KP_PLUS
  | SCANCODE_KP_ENTER
  | SCANCODE_KP_1
  | SCANCODE_KP_2
  | SCANCODE_KP_3
  | SCANCODE_KP_4
  | SCANCODE_KP_5
  | SCANCODE_KP_6
  | SCANCODE_KP_7
  | SCANCODE_KP_8
  | SCANCODE_KP_9
  | SCANCODE_KP_0
  | SCANCODE_KP_PERIOD
  | SCANCODE_NONUSBACKSLASH
  | SCANCODE_APPLICATION
  | SCANCODE_POWER
  | SCANCODE_KP_EQUALS
  | SCANCODE_F13
  | SCANCODE_F14
  | SCANCODE_F15
  | SCANCODE_F16
  | SCANCODE_F17
  | SCANCODE_F18
  | SCANCODE_F19
  | SCANCODE_F20
  | SCANCODE_F21
  | SCANCODE_F22
  | SCANCODE_F23
  | SCANCODE_F24
  | SCANCODE_EXECUTE
  | SCANCODE_HELP
  | SCANCODE_MENU
  | SCANCODE_SELECT
  | SCANCODE_STOP
  | SCANCODE_AGAIN
  | SCANCODE_UNDO
  | SCANCODE_CUT
  | SCANCODE_COPY
  | SCANCODE_PASTE
  | SCANCODE_FIND
  | SCANCODE_MUTE
  | SCANCODE_VOLUMEUP
  | SCANCODE_VOLUMEDOWN
  | SCANCODE_KP_COMMA
  | SCANCODE_KP_EQUALSAS400
  | SCANCODE_INTERNATIONAL1
  | SCANCODE_INTERNATIONAL2
  | SCANCODE_INTERNATIONAL3
  | SCANCODE_INTERNATIONAL4
  | SCANCODE_INTERNATIONAL5
  | SCANCODE_INTERNATIONAL6
  | SCANCODE_INTERNATIONAL7
  | SCANCODE_INTERNATIONAL8
  | SCANCODE_INTERNATIONAL9
  | SCANCODE_LANG1
  | SCANCODE_LANG2
  | SCANCODE_LANG3
  | SCANCODE_LANG4
  | SCANCODE_LANG5
  | SCANCODE_LANG6
  | SCANCODE_LANG7
  | SCANCODE_LANG8
  | SCANCODE_LANG9
  | SCANCODE_ALTERASE
  | SCANCODE_SYSREQ
  | SCANCODE_CANCEL
  | SCANCODE_CLEAR
  | SCANCODE_PRIOR
  | SCANCODE_RETURN2
  | SCANCODE_SEPARATOR
  | SCANCODE_OUT
  | SCANCODE_OPER
  | SCANCODE_CLEARAGAIN
  | SCANCODE_CRSEL
  | SCANCODE_EXSEL
  | SCANCODE_KP_00
  | SCANCODE_KP_000
  | SCANCODE_THOUSANDSSEPARATOR
  | SCANCODE_DECIMALSEPARATOR
  | SCANCODE_CURRENCYUNIT
  | SCANCODE_CURRENCYSUBUNIT
  | SCANCODE_KP_LEFTPAREN
  | SCANCODE_KP_RIGHTPAREN
  | SCANCODE_KP_LEFTBRACE
  | SCANCODE_KP_RIGHTBRACE
  | SCANCODE_KP_TAB
  | SCANCODE_KP_BACKSPACE
  | SCANCODE_KP_A
  | SCANCODE_KP_B
  | SCANCODE_KP_C
  | SCANCODE_KP_D
  | SCANCODE_KP_E
  | SCANCODE_KP_F
  | SCANCODE_KP_XOR
  | SCANCODE_KP_POWER
  | SCANCODE_KP_PERCENT
  | SCANCODE_KP_LESS
  | SCANCODE_KP_GREATER
  | SCANCODE_KP_AMPERSAND
  | SCANCODE_KP_DBLAMPERSAND
  | SCANCODE_KP_VERTICALBAR
  | SCANCODE_KP_DBLVERTICALBAR
  | SCANCODE_KP_COLON
  | SCANCODE_KP_HASH
  | SCANCODE_KP_SPACE
  | SCANCODE_KP_AT
  | SCANCODE_KP_EXCLAM
  | SCANCODE_KP_MEMSTORE
  | SCANCODE_KP_MEMRECALL
  | SCANCODE_KP_MEMCLEAR
  | SCANCODE_KP_MEMADD
  | SCANCODE_KP_MEMSUBTRACT
  | SCANCODE_KP_MEMMULTIPLY
  | SCANCODE_KP_MEMDIVIDE
  | SCANCODE_KP_PLUSMINUS
  | SCANCODE_KP_CLEAR
  | SCANCODE_KP_CLEARENTRY
  | SCANCODE_KP_BINARY
  | SCANCODE_KP_OCTAL
  | SCANCODE_KP_DECIMAL
  | SCANCODE_KP_HEXADECIMAL
  | SCANCODE_LCTRL
  | SCANCODE_LSHIFT
  | SCANCODE_LALT
  | SCANCODE_LGUI
  | SCANCODE_RCTRL
  | SCANCODE_RSHIFT
  | SCANCODE_RALT
  | SCANCODE_RGUI
  | SCANCODE_MODE
  | SCANCODE_SLEEP
  | SCANCODE_WAKE
  | SCANCODE_CHANNEL_INCREMENT
  | SCANCODE_CHANNEL_DECREMENT
  | SCANCODE_MEDIA_PLAY
  | SCANCODE_MEDIA_PAUSE
  | SCANCODE_MEDIA_RECORD
  | SCANCODE_MEDIA_FAST_FORWARD
  | SCANCODE_MEDIA_REWIND
  | SCANCODE_MEDIA_NEXT_TRACK
  | SCANCODE_MEDIA_PREVIOUS_TRACK
  | SCANCODE_MEDIA_STOP
  | SCANCODE_MEDIA_EJECT
  | SCANCODE_MEDIA_PLAY_PAUSE
  | SCANCODE_MEDIA_SELECT
  | SCANCODE_AC_NEW
  | SCANCODE_AC_OPEN
  | SCANCODE_AC_CLOSE
  | SCANCODE_AC_EXIT
  | SCANCODE_AC_SAVE
  | SCANCODE_AC_PRINT
  | SCANCODE_AC_PROPERTIES
  | SCANCODE_AC_SEARCH
  | SCANCODE_AC_HOME
  | SCANCODE_AC_BACK
  | SCANCODE_AC_FORWARD
  | SCANCODE_AC_STOP
  | SCANCODE_AC_REFRESH
  | SCANCODE_AC_BOOKMARKS
  | SCANCODE_SOFTLEFT
  | SCANCODE_SOFTRIGHT
  | SCANCODE_CALL
  | SCANCODE_ENDCALL
  | SCANCODE_RESERVED
  | SCANCODE_COUNT

type scancode_enum = int
let scancode = int

let scancode_to_enum : scancode -> scancode_enum = function
  | SCANCODE_UNKNOWN -> scancode_unknown
  | SCANCODE_A -> scancode_a
  | SCANCODE_B -> scancode_b
  | SCANCODE_C -> scancode_c
  | SCANCODE_D -> scancode_d
  | SCANCODE_E -> scancode_e
  | SCANCODE_F -> scancode_f
  | SCANCODE_G -> scancode_g
  | SCANCODE_H -> scancode_h
  | SCANCODE_I -> scancode_i
  | SCANCODE_J -> scancode_j
  | SCANCODE_K -> scancode_k
  | SCANCODE_L -> scancode_l
  | SCANCODE_M -> scancode_m
  | SCANCODE_N -> scancode_n
  | SCANCODE_O -> scancode_o
  | SCANCODE_P -> scancode_p
  | SCANCODE_Q -> scancode_q
  | SCANCODE_R -> scancode_r
  | SCANCODE_S -> scancode_s
  | SCANCODE_T -> scancode_t
  | SCANCODE_U -> scancode_u
  | SCANCODE_V -> scancode_v
  | SCANCODE_W -> scancode_w
  | SCANCODE_X -> scancode_x
  | SCANCODE_Y -> scancode_y
  | SCANCODE_Z -> scancode_z
  | SCANCODE_1 -> scancode_1
  | SCANCODE_2 -> scancode_2
  | SCANCODE_3 -> scancode_3
  | SCANCODE_4 -> scancode_4
  | SCANCODE_5 -> scancode_5
  | SCANCODE_6 -> scancode_6
  | SCANCODE_7 -> scancode_7
  | SCANCODE_8 -> scancode_8
  | SCANCODE_9 -> scancode_9
  | SCANCODE_0 -> scancode_0
  | SCANCODE_RETURN -> scancode_return
  | SCANCODE_ESCAPE -> scancode_escape
  | SCANCODE_BACKSPACE -> scancode_backspace
  | SCANCODE_TAB -> scancode_tab
  | SCANCODE_SPACE -> scancode_space
  | SCANCODE_MINUS -> scancode_minus
  | SCANCODE_EQUALS -> scancode_equals
  | SCANCODE_LEFTBRACKET -> scancode_leftbracket
  | SCANCODE_RIGHTBRACKET -> scancode_rightbracket
  | SCANCODE_BACKSLASH -> scancode_backslash
  | SCANCODE_NONUSHASH -> scancode_nonushash
  | SCANCODE_SEMICOLON -> scancode_semicolon
  | SCANCODE_APOSTROPHE -> scancode_apostrophe
  | SCANCODE_GRAVE -> scancode_grave
  | SCANCODE_COMMA -> scancode_comma
  | SCANCODE_PERIOD -> scancode_period
  | SCANCODE_SLASH -> scancode_slash
  | SCANCODE_CAPSLOCK -> scancode_capslock
  | SCANCODE_F1 -> scancode_f1
  | SCANCODE_F2 -> scancode_f2
  | SCANCODE_F3 -> scancode_f3
  | SCANCODE_F4 -> scancode_f4
  | SCANCODE_F5 -> scancode_f5
  | SCANCODE_F6 -> scancode_f6
  | SCANCODE_F7 -> scancode_f7
  | SCANCODE_F8 -> scancode_f8
  | SCANCODE_F9 -> scancode_f9
  | SCANCODE_F10 -> scancode_f10
  | SCANCODE_F11 -> scancode_f11
  | SCANCODE_F12 -> scancode_f12
  | SCANCODE_PRINTSCREEN -> scancode_printscreen
  | SCANCODE_SCROLLLOCK -> scancode_scrolllock
  | SCANCODE_PAUSE -> scancode_pause
  | SCANCODE_INSERT -> scancode_insert
  | SCANCODE_HOME -> scancode_home
  | SCANCODE_PAGEUP -> scancode_pageup
  | SCANCODE_DELETE -> scancode_delete
  | SCANCODE_END -> scancode_end
  | SCANCODE_PAGEDOWN -> scancode_pagedown
  | SCANCODE_RIGHT -> scancode_right
  | SCANCODE_LEFT -> scancode_left
  | SCANCODE_DOWN -> scancode_down
  | SCANCODE_UP -> scancode_up
  | SCANCODE_NUMLOCKCLEAR -> scancode_numlockclear
  | SCANCODE_KP_DIVIDE -> scancode_kp_divide
  | SCANCODE_KP_MULTIPLY -> scancode_kp_multiply
  | SCANCODE_KP_MINUS -> scancode_kp_minus
  | SCANCODE_KP_PLUS -> scancode_kp_plus
  | SCANCODE_KP_ENTER -> scancode_kp_enter
  | SCANCODE_KP_1 -> scancode_kp_1
  | SCANCODE_KP_2 -> scancode_kp_2
  | SCANCODE_KP_3 -> scancode_kp_3
  | SCANCODE_KP_4 -> scancode_kp_4
  | SCANCODE_KP_5 -> scancode_kp_5
  | SCANCODE_KP_6 -> scancode_kp_6
  | SCANCODE_KP_7 -> scancode_kp_7
  | SCANCODE_KP_8 -> scancode_kp_8
  | SCANCODE_KP_9 -> scancode_kp_9
  | SCANCODE_KP_0 -> scancode_kp_0
  | SCANCODE_KP_PERIOD -> scancode_kp_period
  | SCANCODE_NONUSBACKSLASH -> scancode_nonusbackslash
  | SCANCODE_APPLICATION -> scancode_application
  | SCANCODE_POWER -> scancode_power
  | SCANCODE_KP_EQUALS -> scancode_kp_equals
  | SCANCODE_F13 -> scancode_f13
  | SCANCODE_F14 -> scancode_f14
  | SCANCODE_F15 -> scancode_f15
  | SCANCODE_F16 -> scancode_f16
  | SCANCODE_F17 -> scancode_f17
  | SCANCODE_F18 -> scancode_f18
  | SCANCODE_F19 -> scancode_f19
  | SCANCODE_F20 -> scancode_f20
  | SCANCODE_F21 -> scancode_f21
  | SCANCODE_F22 -> scancode_f22
  | SCANCODE_F23 -> scancode_f23
  | SCANCODE_F24 -> scancode_f24
  | SCANCODE_EXECUTE -> scancode_execute
  | SCANCODE_HELP -> scancode_help
  | SCANCODE_MENU -> scancode_menu
  | SCANCODE_SELECT -> scancode_select
  | SCANCODE_STOP -> scancode_stop
  | SCANCODE_AGAIN -> scancode_again
  | SCANCODE_UNDO -> scancode_undo
  | SCANCODE_CUT -> scancode_cut
  | SCANCODE_COPY -> scancode_copy
  | SCANCODE_PASTE -> scancode_paste
  | SCANCODE_FIND -> scancode_find
  | SCANCODE_MUTE -> scancode_mute
  | SCANCODE_VOLUMEUP -> scancode_volumeup
  | SCANCODE_VOLUMEDOWN -> scancode_volumedown
  | SCANCODE_KP_COMMA -> scancode_kp_comma
  | SCANCODE_KP_EQUALSAS400 -> scancode_kp_equalsas400
  | SCANCODE_INTERNATIONAL1 -> scancode_international1
  | SCANCODE_INTERNATIONAL2 -> scancode_international2
  | SCANCODE_INTERNATIONAL3 -> scancode_international3
  | SCANCODE_INTERNATIONAL4 -> scancode_international4
  | SCANCODE_INTERNATIONAL5 -> scancode_international5
  | SCANCODE_INTERNATIONAL6 -> scancode_international6
  | SCANCODE_INTERNATIONAL7 -> scancode_international7
  | SCANCODE_INTERNATIONAL8 -> scancode_international8
  | SCANCODE_INTERNATIONAL9 -> scancode_international9
  | SCANCODE_LANG1 -> scancode_lang1
  | SCANCODE_LANG2 -> scancode_lang2
  | SCANCODE_LANG3 -> scancode_lang3
  | SCANCODE_LANG4 -> scancode_lang4
  | SCANCODE_LANG5 -> scancode_lang5
  | SCANCODE_LANG6 -> scancode_lang6
  | SCANCODE_LANG7 -> scancode_lang7
  | SCANCODE_LANG8 -> scancode_lang8
  | SCANCODE_LANG9 -> scancode_lang9
  | SCANCODE_ALTERASE -> scancode_alterase
  | SCANCODE_SYSREQ -> scancode_sysreq
  | SCANCODE_CANCEL -> scancode_cancel
  | SCANCODE_CLEAR -> scancode_clear
  | SCANCODE_PRIOR -> scancode_prior
  | SCANCODE_RETURN2 -> scancode_return2
  | SCANCODE_SEPARATOR -> scancode_separator
  | SCANCODE_OUT -> scancode_out
  | SCANCODE_OPER -> scancode_oper
  | SCANCODE_CLEARAGAIN -> scancode_clearagain
  | SCANCODE_CRSEL -> scancode_crsel
  | SCANCODE_EXSEL -> scancode_exsel
  | SCANCODE_KP_00 -> scancode_kp_00
  | SCANCODE_KP_000 -> scancode_kp_000
  | SCANCODE_THOUSANDSSEPARATOR -> scancode_thousandsseparator
  | SCANCODE_DECIMALSEPARATOR -> scancode_decimalseparator
  | SCANCODE_CURRENCYUNIT -> scancode_currencyunit
  | SCANCODE_CURRENCYSUBUNIT -> scancode_currencysubunit
  | SCANCODE_KP_LEFTPAREN -> scancode_kp_leftparen
  | SCANCODE_KP_RIGHTPAREN -> scancode_kp_rightparen
  | SCANCODE_KP_LEFTBRACE -> scancode_kp_leftbrace
  | SCANCODE_KP_RIGHTBRACE -> scancode_kp_rightbrace
  | SCANCODE_KP_TAB -> scancode_kp_tab
  | SCANCODE_KP_BACKSPACE -> scancode_kp_backspace
  | SCANCODE_KP_A -> scancode_kp_a
  | SCANCODE_KP_B -> scancode_kp_b
  | SCANCODE_KP_C -> scancode_kp_c
  | SCANCODE_KP_D -> scancode_kp_d
  | SCANCODE_KP_E -> scancode_kp_e
  | SCANCODE_KP_F -> scancode_kp_f
  | SCANCODE_KP_XOR -> scancode_kp_xor
  | SCANCODE_KP_POWER -> scancode_kp_power
  | SCANCODE_KP_PERCENT -> scancode_kp_percent
  | SCANCODE_KP_LESS -> scancode_kp_less
  | SCANCODE_KP_GREATER -> scancode_kp_greater
  | SCANCODE_KP_AMPERSAND -> scancode_kp_ampersand
  | SCANCODE_KP_DBLAMPERSAND -> scancode_kp_dblampersand
  | SCANCODE_KP_VERTICALBAR -> scancode_kp_verticalbar
  | SCANCODE_KP_DBLVERTICALBAR -> scancode_kp_dblverticalbar
  | SCANCODE_KP_COLON -> scancode_kp_colon
  | SCANCODE_KP_HASH -> scancode_kp_hash
  | SCANCODE_KP_SPACE -> scancode_kp_space
  | SCANCODE_KP_AT -> scancode_kp_at
  | SCANCODE_KP_EXCLAM -> scancode_kp_exclam
  | SCANCODE_KP_MEMSTORE -> scancode_kp_memstore
  | SCANCODE_KP_MEMRECALL -> scancode_kp_memrecall
  | SCANCODE_KP_MEMCLEAR -> scancode_kp_memclear
  | SCANCODE_KP_MEMADD -> scancode_kp_memadd
  | SCANCODE_KP_MEMSUBTRACT -> scancode_kp_memsubtract
  | SCANCODE_KP_MEMMULTIPLY -> scancode_kp_memmultiply
  | SCANCODE_KP_MEMDIVIDE -> scancode_kp_memdivide
  | SCANCODE_KP_PLUSMINUS -> scancode_kp_plusminus
  | SCANCODE_KP_CLEAR -> scancode_kp_clear
  | SCANCODE_KP_CLEARENTRY -> scancode_kp_clearentry
  | SCANCODE_KP_BINARY -> scancode_kp_binary
  | SCANCODE_KP_OCTAL -> scancode_kp_octal
  | SCANCODE_KP_DECIMAL -> scancode_kp_decimal
  | SCANCODE_KP_HEXADECIMAL -> scancode_kp_hexadecimal
  | SCANCODE_LCTRL -> scancode_lctrl
  | SCANCODE_LSHIFT -> scancode_lshift
  | SCANCODE_LALT -> scancode_lalt
  | SCANCODE_LGUI -> scancode_lgui
  | SCANCODE_RCTRL -> scancode_rctrl
  | SCANCODE_RSHIFT -> scancode_rshift
  | SCANCODE_RALT -> scancode_ralt
  | SCANCODE_RGUI -> scancode_rgui
  | SCANCODE_MODE -> scancode_mode
  | SCANCODE_SLEEP -> scancode_sleep
  | SCANCODE_WAKE -> scancode_wake
  | SCANCODE_CHANNEL_INCREMENT -> scancode_channel_increment
  | SCANCODE_CHANNEL_DECREMENT -> scancode_channel_decrement
  | SCANCODE_MEDIA_PLAY -> scancode_media_play
  | SCANCODE_MEDIA_PAUSE -> scancode_media_pause
  | SCANCODE_MEDIA_RECORD -> scancode_media_record
  | SCANCODE_MEDIA_FAST_FORWARD -> scancode_media_fast_forward
  | SCANCODE_MEDIA_REWIND -> scancode_media_rewind
  | SCANCODE_MEDIA_NEXT_TRACK -> scancode_media_next_track
  | SCANCODE_MEDIA_PREVIOUS_TRACK -> scancode_media_previous_track
  | SCANCODE_MEDIA_STOP -> scancode_media_stop
  | SCANCODE_MEDIA_EJECT -> scancode_media_eject
  | SCANCODE_MEDIA_PLAY_PAUSE -> scancode_media_play_pause
  | SCANCODE_MEDIA_SELECT -> scancode_media_select
  | SCANCODE_AC_NEW -> scancode_ac_new
  | SCANCODE_AC_OPEN -> scancode_ac_open
  | SCANCODE_AC_CLOSE -> scancode_ac_close
  | SCANCODE_AC_EXIT -> scancode_ac_exit
  | SCANCODE_AC_SAVE -> scancode_ac_save
  | SCANCODE_AC_PRINT -> scancode_ac_print
  | SCANCODE_AC_PROPERTIES -> scancode_ac_properties
  | SCANCODE_AC_SEARCH -> scancode_ac_search
  | SCANCODE_AC_HOME -> scancode_ac_home
  | SCANCODE_AC_BACK -> scancode_ac_back
  | SCANCODE_AC_FORWARD -> scancode_ac_forward
  | SCANCODE_AC_STOP -> scancode_ac_stop
  | SCANCODE_AC_REFRESH -> scancode_ac_refresh
  | SCANCODE_AC_BOOKMARKS -> scancode_ac_bookmarks
  | SCANCODE_SOFTLEFT -> scancode_softleft
  | SCANCODE_SOFTRIGHT -> scancode_softright
  | SCANCODE_CALL -> scancode_call
  | SCANCODE_ENDCALL -> scancode_endcall
  | SCANCODE_RESERVED -> scancode_reserved
  | SCANCODE_COUNT -> scancode_count

let keycode = uint (* prim *)
let keymod = ushort (* prim *)
let keyboard_id = uint (* prim *)
type text_input_type =
  | TEXTINPUT_TYPE_TEXT
  | TEXTINPUT_TYPE_TEXT_NAME
  | TEXTINPUT_TYPE_TEXT_EMAIL
  | TEXTINPUT_TYPE_TEXT_USERNAME
  | TEXTINPUT_TYPE_TEXT_PASSWORD_HIDDEN
  | TEXTINPUT_TYPE_TEXT_PASSWORD_VISIBLE
  | TEXTINPUT_TYPE_NUMBER
  | TEXTINPUT_TYPE_NUMBER_PASSWORD_HIDDEN
  | TEXTINPUT_TYPE_NUMBER_PASSWORD_VISIBLE

type text_input_type_enum = int
let text_input_type = int

let text_input_type_to_enum : text_input_type -> text_input_type_enum = function
  | TEXTINPUT_TYPE_TEXT -> textinput_type_text
  | TEXTINPUT_TYPE_TEXT_NAME -> textinput_type_text_name
  | TEXTINPUT_TYPE_TEXT_EMAIL -> textinput_type_text_email
  | TEXTINPUT_TYPE_TEXT_USERNAME -> textinput_type_text_username
  | TEXTINPUT_TYPE_TEXT_PASSWORD_HIDDEN -> textinput_type_text_password_hidden
  | TEXTINPUT_TYPE_TEXT_PASSWORD_VISIBLE -> textinput_type_text_password_visible
  | TEXTINPUT_TYPE_NUMBER -> textinput_type_number
  | TEXTINPUT_TYPE_NUMBER_PASSWORD_HIDDEN -> textinput_type_number_password_hidden
  | TEXTINPUT_TYPE_NUMBER_PASSWORD_VISIBLE -> textinput_type_number_password_visible

type capitalization =
  | CAPITALIZE_NONE
  | CAPITALIZE_SENTENCES
  | CAPITALIZE_WORDS
  | CAPITALIZE_LETTERS

type capitalization_enum = int
let capitalization = int

let capitalization_to_enum : capitalization -> capitalization_enum = function
  | CAPITALIZE_NONE -> capitalize_none
  | CAPITALIZE_SENTENCES -> capitalize_sentences
  | CAPITALIZE_WORDS -> capitalize_words
  | CAPITALIZE_LETTERS -> capitalize_letters

let mouse_id = uint (* prim *)

(* No definition (opaque struct) *)
type cursor = unit ptr
let cursor : cursor typ = ptr void
let cursor_opt : cursor option typ = ptr_opt void

type system_cursor =
  | SYSTEM_CURSOR_DEFAULT
  | SYSTEM_CURSOR_TEXT
  | SYSTEM_CURSOR_WAIT
  | SYSTEM_CURSOR_CROSSHAIR
  | SYSTEM_CURSOR_PROGRESS
  | SYSTEM_CURSOR_NWSE_RESIZE
  | SYSTEM_CURSOR_NESW_RESIZE
  | SYSTEM_CURSOR_EW_RESIZE
  | SYSTEM_CURSOR_NS_RESIZE
  | SYSTEM_CURSOR_MOVE
  | SYSTEM_CURSOR_NOT_ALLOWED
  | SYSTEM_CURSOR_POINTER
  | SYSTEM_CURSOR_NW_RESIZE
  | SYSTEM_CURSOR_N_RESIZE
  | SYSTEM_CURSOR_NE_RESIZE
  | SYSTEM_CURSOR_E_RESIZE
  | SYSTEM_CURSOR_SE_RESIZE
  | SYSTEM_CURSOR_S_RESIZE
  | SYSTEM_CURSOR_SW_RESIZE
  | SYSTEM_CURSOR_W_RESIZE
  | SYSTEM_CURSOR_COUNT

type system_cursor_enum = int
let system_cursor = int

let system_cursor_to_enum : system_cursor -> system_cursor_enum = function
  | SYSTEM_CURSOR_DEFAULT -> system_cursor_default
  | SYSTEM_CURSOR_TEXT -> system_cursor_text
  | SYSTEM_CURSOR_WAIT -> system_cursor_wait
  | SYSTEM_CURSOR_CROSSHAIR -> system_cursor_crosshair
  | SYSTEM_CURSOR_PROGRESS -> system_cursor_progress
  | SYSTEM_CURSOR_NWSE_RESIZE -> system_cursor_nwse_resize
  | SYSTEM_CURSOR_NESW_RESIZE -> system_cursor_nesw_resize
  | SYSTEM_CURSOR_EW_RESIZE -> system_cursor_ew_resize
  | SYSTEM_CURSOR_NS_RESIZE -> system_cursor_ns_resize
  | SYSTEM_CURSOR_MOVE -> system_cursor_move
  | SYSTEM_CURSOR_NOT_ALLOWED -> system_cursor_not_allowed
  | SYSTEM_CURSOR_POINTER -> system_cursor_pointer
  | SYSTEM_CURSOR_NW_RESIZE -> system_cursor_nw_resize
  | SYSTEM_CURSOR_N_RESIZE -> system_cursor_n_resize
  | SYSTEM_CURSOR_NE_RESIZE -> system_cursor_ne_resize
  | SYSTEM_CURSOR_E_RESIZE -> system_cursor_e_resize
  | SYSTEM_CURSOR_SE_RESIZE -> system_cursor_se_resize
  | SYSTEM_CURSOR_S_RESIZE -> system_cursor_s_resize
  | SYSTEM_CURSOR_SW_RESIZE -> system_cursor_sw_resize
  | SYSTEM_CURSOR_W_RESIZE -> system_cursor_w_resize
  | SYSTEM_CURSOR_COUNT -> system_cursor_count

type mouse_wheel_direction =
  | MOUSEWHEEL_NORMAL
  | MOUSEWHEEL_FLIPPED

type mouse_wheel_direction_enum = int
let mouse_wheel_direction = int

let mouse_wheel_direction_to_enum : mouse_wheel_direction -> mouse_wheel_direction_enum = function
  | MOUSEWHEEL_NORMAL -> mousewheel_normal
  | MOUSEWHEEL_FLIPPED -> mousewheel_flipped

module CursorFrameInfo = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_CursorFrameInfo"
  let surface = field t "surface" surface
  let duration = field t "duration" int_as_uint
  let () = seal t
end
type cursor_frame_info = CursorFrameInfo.t
let cursor_frame_info = CursorFrameInfo.t


let mouse_button_flags = uint (* prim *)
let mouse_motion_transform_callback = funptr (ptr void @-> ulong @-> window @-> uint @-> ptr float @-> ptr float @-> returning void)
let touch_id = ulong (* prim *)
let finger_id = ulong (* prim *)
type touch_device_type =
  | TOUCH_DEVICE_INVALID
  | TOUCH_DEVICE_DIRECT
  | TOUCH_DEVICE_INDIRECT_ABSOLUTE
  | TOUCH_DEVICE_INDIRECT_RELATIVE

type touch_device_type_enum = int
let touch_device_type = int

let touch_device_type_to_enum : touch_device_type -> touch_device_type_enum = function
  | TOUCH_DEVICE_INVALID -> touch_device_invalid
  | TOUCH_DEVICE_DIRECT -> touch_device_direct
  | TOUCH_DEVICE_INDIRECT_ABSOLUTE -> touch_device_indirect_absolute
  | TOUCH_DEVICE_INDIRECT_RELATIVE -> touch_device_indirect_relative

module Finger = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_Finger"
  let id = field t "id" finger_id
  let x = field t "x" float
  let y = field t "y" float
  let pressure = field t "pressure" float
  let () = seal t
end
type finger = Finger.t
let finger = Finger.t


let pen_id = uint (* prim *)
let pen_input_flags = uint (* prim *)
type pen_axis =
  | PEN_AXIS_PRESSURE
  | PEN_AXIS_XTILT
  | PEN_AXIS_YTILT
  | PEN_AXIS_DISTANCE
  | PEN_AXIS_ROTATION
  | PEN_AXIS_SLIDER
  | PEN_AXIS_TANGENTIAL_PRESSURE
  | PEN_AXIS_COUNT

type pen_axis_enum = int
let pen_axis = int

let pen_axis_to_enum : pen_axis -> pen_axis_enum = function
  | PEN_AXIS_PRESSURE -> pen_axis_pressure
  | PEN_AXIS_XTILT -> pen_axis_xtilt
  | PEN_AXIS_YTILT -> pen_axis_ytilt
  | PEN_AXIS_DISTANCE -> pen_axis_distance
  | PEN_AXIS_ROTATION -> pen_axis_rotation
  | PEN_AXIS_SLIDER -> pen_axis_slider
  | PEN_AXIS_TANGENTIAL_PRESSURE -> pen_axis_tangential_pressure
  | PEN_AXIS_COUNT -> pen_axis_count

type pen_device_type =
  | PEN_DEVICE_TYPE_INVALID
  | PEN_DEVICE_TYPE_UNKNOWN
  | PEN_DEVICE_TYPE_DIRECT
  | PEN_DEVICE_TYPE_INDIRECT

type pen_device_type_enum = int
let pen_device_type = int

let pen_device_type_to_enum : pen_device_type -> pen_device_type_enum = function
  | PEN_DEVICE_TYPE_INVALID -> pen_device_type_invalid
  | PEN_DEVICE_TYPE_UNKNOWN -> pen_device_type_unknown
  | PEN_DEVICE_TYPE_DIRECT -> pen_device_type_direct
  | PEN_DEVICE_TYPE_INDIRECT -> pen_device_type_indirect

type event_type =
  | EVENT_FIRST
  | EVENT_QUIT
  | EVENT_TERMINATING
  | EVENT_LOW_MEMORY
  | EVENT_WILL_ENTER_BACKGROUND
  | EVENT_DID_ENTER_BACKGROUND
  | EVENT_WILL_ENTER_FOREGROUND
  | EVENT_DID_ENTER_FOREGROUND
  | EVENT_LOCALE_CHANGED
  | EVENT_SYSTEM_THEME_CHANGED
  | EVENT_DISPLAY_ORIENTATION
  | EVENT_DISPLAY_ADDED
  | EVENT_DISPLAY_REMOVED
  | EVENT_DISPLAY_MOVED
  | EVENT_DISPLAY_DESKTOP_MODE_CHANGED
  | EVENT_DISPLAY_CURRENT_MODE_CHANGED
  | EVENT_DISPLAY_CONTENT_SCALE_CHANGED
  | EVENT_DISPLAY_USABLE_BOUNDS_CHANGED
  | EVENT_DISPLAY_FIRST
  | EVENT_DISPLAY_LAST
  | EVENT_WINDOW_SHOWN
  | EVENT_WINDOW_HIDDEN
  | EVENT_WINDOW_EXPOSED
  | EVENT_WINDOW_MOVED
  | EVENT_WINDOW_RESIZED
  | EVENT_WINDOW_PIXEL_SIZE_CHANGED
  | EVENT_WINDOW_METAL_VIEW_RESIZED
  | EVENT_WINDOW_MINIMIZED
  | EVENT_WINDOW_MAXIMIZED
  | EVENT_WINDOW_RESTORED
  | EVENT_WINDOW_MOUSE_ENTER
  | EVENT_WINDOW_MOUSE_LEAVE
  | EVENT_WINDOW_FOCUS_GAINED
  | EVENT_WINDOW_FOCUS_LOST
  | EVENT_WINDOW_CLOSE_REQUESTED
  | EVENT_WINDOW_HIT_TEST
  | EVENT_WINDOW_ICCPROF_CHANGED
  | EVENT_WINDOW_DISPLAY_CHANGED
  | EVENT_WINDOW_DISPLAY_SCALE_CHANGED
  | EVENT_WINDOW_SAFE_AREA_CHANGED
  | EVENT_WINDOW_OCCLUDED
  | EVENT_WINDOW_ENTER_FULLSCREEN
  | EVENT_WINDOW_LEAVE_FULLSCREEN
  | EVENT_WINDOW_DESTROYED
  | EVENT_WINDOW_HDR_STATE_CHANGED
  | EVENT_WINDOW_FIRST
  | EVENT_WINDOW_LAST
  | EVENT_KEY_DOWN
  | EVENT_KEY_UP
  | EVENT_TEXT_EDITING
  | EVENT_TEXT_INPUT
  | EVENT_KEYMAP_CHANGED
  | EVENT_KEYBOARD_ADDED
  | EVENT_KEYBOARD_REMOVED
  | EVENT_TEXT_EDITING_CANDIDATES
  | EVENT_SCREEN_KEYBOARD_SHOWN
  | EVENT_SCREEN_KEYBOARD_HIDDEN
  | EVENT_MOUSE_MOTION
  | EVENT_MOUSE_BUTTON_DOWN
  | EVENT_MOUSE_BUTTON_UP
  | EVENT_MOUSE_WHEEL
  | EVENT_MOUSE_ADDED
  | EVENT_MOUSE_REMOVED
  | EVENT_JOYSTICK_AXIS_MOTION
  | EVENT_JOYSTICK_BALL_MOTION
  | EVENT_JOYSTICK_HAT_MOTION
  | EVENT_JOYSTICK_BUTTON_DOWN
  | EVENT_JOYSTICK_BUTTON_UP
  | EVENT_JOYSTICK_ADDED
  | EVENT_JOYSTICK_REMOVED
  | EVENT_JOYSTICK_BATTERY_UPDATED
  | EVENT_JOYSTICK_UPDATE_COMPLETE
  | EVENT_GAMEPAD_AXIS_MOTION
  | EVENT_GAMEPAD_BUTTON_DOWN
  | EVENT_GAMEPAD_BUTTON_UP
  | EVENT_GAMEPAD_ADDED
  | EVENT_GAMEPAD_REMOVED
  | EVENT_GAMEPAD_REMAPPED
  | EVENT_GAMEPAD_TOUCHPAD_DOWN
  | EVENT_GAMEPAD_TOUCHPAD_MOTION
  | EVENT_GAMEPAD_TOUCHPAD_UP
  | EVENT_GAMEPAD_SENSOR_UPDATE
  | EVENT_GAMEPAD_UPDATE_COMPLETE
  | EVENT_GAMEPAD_STEAM_HANDLE_UPDATED
  | EVENT_FINGER_DOWN
  | EVENT_FINGER_UP
  | EVENT_FINGER_MOTION
  | EVENT_FINGER_CANCELED
  | EVENT_PINCH_BEGIN
  | EVENT_PINCH_UPDATE
  | EVENT_PINCH_END
  | EVENT_CLIPBOARD_UPDATE
  | EVENT_DROP_FILE
  | EVENT_DROP_TEXT
  | EVENT_DROP_BEGIN
  | EVENT_DROP_COMPLETE
  | EVENT_DROP_POSITION
  | EVENT_AUDIO_DEVICE_ADDED
  | EVENT_AUDIO_DEVICE_REMOVED
  | EVENT_AUDIO_DEVICE_FORMAT_CHANGED
  | EVENT_SENSOR_UPDATE
  | EVENT_PEN_PROXIMITY_IN
  | EVENT_PEN_PROXIMITY_OUT
  | EVENT_PEN_DOWN
  | EVENT_PEN_UP
  | EVENT_PEN_BUTTON_DOWN
  | EVENT_PEN_BUTTON_UP
  | EVENT_PEN_MOTION
  | EVENT_PEN_AXIS
  | EVENT_CAMERA_DEVICE_ADDED
  | EVENT_CAMERA_DEVICE_REMOVED
  | EVENT_CAMERA_DEVICE_APPROVED
  | EVENT_CAMERA_DEVICE_DENIED
  | EVENT_RENDER_TARGETS_RESET
  | EVENT_RENDER_DEVICE_RESET
  | EVENT_RENDER_DEVICE_LOST
  | EVENT_PRIVATE0
  | EVENT_PRIVATE1
  | EVENT_PRIVATE2
  | EVENT_PRIVATE3
  | EVENT_POLL_SENTINEL
  | EVENT_USER
  | EVENT_LAST
  | EVENT_ENUM_PADDING

type event_type_enum = int
let event_type = int

let event_type_to_enum : event_type -> event_type_enum = function
  | EVENT_FIRST -> event_first
  | EVENT_QUIT -> event_quit
  | EVENT_TERMINATING -> event_terminating
  | EVENT_LOW_MEMORY -> event_low_memory
  | EVENT_WILL_ENTER_BACKGROUND -> event_will_enter_background
  | EVENT_DID_ENTER_BACKGROUND -> event_did_enter_background
  | EVENT_WILL_ENTER_FOREGROUND -> event_will_enter_foreground
  | EVENT_DID_ENTER_FOREGROUND -> event_did_enter_foreground
  | EVENT_LOCALE_CHANGED -> event_locale_changed
  | EVENT_SYSTEM_THEME_CHANGED -> event_system_theme_changed
  | EVENT_DISPLAY_ORIENTATION -> event_display_orientation
  | EVENT_DISPLAY_ADDED -> event_display_added
  | EVENT_DISPLAY_REMOVED -> event_display_removed
  | EVENT_DISPLAY_MOVED -> event_display_moved
  | EVENT_DISPLAY_DESKTOP_MODE_CHANGED -> event_display_desktop_mode_changed
  | EVENT_DISPLAY_CURRENT_MODE_CHANGED -> event_display_current_mode_changed
  | EVENT_DISPLAY_CONTENT_SCALE_CHANGED -> event_display_content_scale_changed
  | EVENT_DISPLAY_USABLE_BOUNDS_CHANGED -> event_display_usable_bounds_changed
  | EVENT_DISPLAY_FIRST -> event_display_first
  | EVENT_DISPLAY_LAST -> event_display_last
  | EVENT_WINDOW_SHOWN -> event_window_shown
  | EVENT_WINDOW_HIDDEN -> event_window_hidden
  | EVENT_WINDOW_EXPOSED -> event_window_exposed
  | EVENT_WINDOW_MOVED -> event_window_moved
  | EVENT_WINDOW_RESIZED -> event_window_resized
  | EVENT_WINDOW_PIXEL_SIZE_CHANGED -> event_window_pixel_size_changed
  | EVENT_WINDOW_METAL_VIEW_RESIZED -> event_window_metal_view_resized
  | EVENT_WINDOW_MINIMIZED -> event_window_minimized
  | EVENT_WINDOW_MAXIMIZED -> event_window_maximized
  | EVENT_WINDOW_RESTORED -> event_window_restored
  | EVENT_WINDOW_MOUSE_ENTER -> event_window_mouse_enter
  | EVENT_WINDOW_MOUSE_LEAVE -> event_window_mouse_leave
  | EVENT_WINDOW_FOCUS_GAINED -> event_window_focus_gained
  | EVENT_WINDOW_FOCUS_LOST -> event_window_focus_lost
  | EVENT_WINDOW_CLOSE_REQUESTED -> event_window_close_requested
  | EVENT_WINDOW_HIT_TEST -> event_window_hit_test
  | EVENT_WINDOW_ICCPROF_CHANGED -> event_window_iccprof_changed
  | EVENT_WINDOW_DISPLAY_CHANGED -> event_window_display_changed
  | EVENT_WINDOW_DISPLAY_SCALE_CHANGED -> event_window_display_scale_changed
  | EVENT_WINDOW_SAFE_AREA_CHANGED -> event_window_safe_area_changed
  | EVENT_WINDOW_OCCLUDED -> event_window_occluded
  | EVENT_WINDOW_ENTER_FULLSCREEN -> event_window_enter_fullscreen
  | EVENT_WINDOW_LEAVE_FULLSCREEN -> event_window_leave_fullscreen
  | EVENT_WINDOW_DESTROYED -> event_window_destroyed
  | EVENT_WINDOW_HDR_STATE_CHANGED -> event_window_hdr_state_changed
  | EVENT_WINDOW_FIRST -> event_window_first
  | EVENT_WINDOW_LAST -> event_window_last
  | EVENT_KEY_DOWN -> event_key_down
  | EVENT_KEY_UP -> event_key_up
  | EVENT_TEXT_EDITING -> event_text_editing
  | EVENT_TEXT_INPUT -> event_text_input
  | EVENT_KEYMAP_CHANGED -> event_keymap_changed
  | EVENT_KEYBOARD_ADDED -> event_keyboard_added
  | EVENT_KEYBOARD_REMOVED -> event_keyboard_removed
  | EVENT_TEXT_EDITING_CANDIDATES -> event_text_editing_candidates
  | EVENT_SCREEN_KEYBOARD_SHOWN -> event_screen_keyboard_shown
  | EVENT_SCREEN_KEYBOARD_HIDDEN -> event_screen_keyboard_hidden
  | EVENT_MOUSE_MOTION -> event_mouse_motion
  | EVENT_MOUSE_BUTTON_DOWN -> event_mouse_button_down
  | EVENT_MOUSE_BUTTON_UP -> event_mouse_button_up
  | EVENT_MOUSE_WHEEL -> event_mouse_wheel
  | EVENT_MOUSE_ADDED -> event_mouse_added
  | EVENT_MOUSE_REMOVED -> event_mouse_removed
  | EVENT_JOYSTICK_AXIS_MOTION -> event_joystick_axis_motion
  | EVENT_JOYSTICK_BALL_MOTION -> event_joystick_ball_motion
  | EVENT_JOYSTICK_HAT_MOTION -> event_joystick_hat_motion
  | EVENT_JOYSTICK_BUTTON_DOWN -> event_joystick_button_down
  | EVENT_JOYSTICK_BUTTON_UP -> event_joystick_button_up
  | EVENT_JOYSTICK_ADDED -> event_joystick_added
  | EVENT_JOYSTICK_REMOVED -> event_joystick_removed
  | EVENT_JOYSTICK_BATTERY_UPDATED -> event_joystick_battery_updated
  | EVENT_JOYSTICK_UPDATE_COMPLETE -> event_joystick_update_complete
  | EVENT_GAMEPAD_AXIS_MOTION -> event_gamepad_axis_motion
  | EVENT_GAMEPAD_BUTTON_DOWN -> event_gamepad_button_down
  | EVENT_GAMEPAD_BUTTON_UP -> event_gamepad_button_up
  | EVENT_GAMEPAD_ADDED -> event_gamepad_added
  | EVENT_GAMEPAD_REMOVED -> event_gamepad_removed
  | EVENT_GAMEPAD_REMAPPED -> event_gamepad_remapped
  | EVENT_GAMEPAD_TOUCHPAD_DOWN -> event_gamepad_touchpad_down
  | EVENT_GAMEPAD_TOUCHPAD_MOTION -> event_gamepad_touchpad_motion
  | EVENT_GAMEPAD_TOUCHPAD_UP -> event_gamepad_touchpad_up
  | EVENT_GAMEPAD_SENSOR_UPDATE -> event_gamepad_sensor_update
  | EVENT_GAMEPAD_UPDATE_COMPLETE -> event_gamepad_update_complete
  | EVENT_GAMEPAD_STEAM_HANDLE_UPDATED -> event_gamepad_steam_handle_updated
  | EVENT_FINGER_DOWN -> event_finger_down
  | EVENT_FINGER_UP -> event_finger_up
  | EVENT_FINGER_MOTION -> event_finger_motion
  | EVENT_FINGER_CANCELED -> event_finger_canceled
  | EVENT_PINCH_BEGIN -> event_pinch_begin
  | EVENT_PINCH_UPDATE -> event_pinch_update
  | EVENT_PINCH_END -> event_pinch_end
  | EVENT_CLIPBOARD_UPDATE -> event_clipboard_update
  | EVENT_DROP_FILE -> event_drop_file
  | EVENT_DROP_TEXT -> event_drop_text
  | EVENT_DROP_BEGIN -> event_drop_begin
  | EVENT_DROP_COMPLETE -> event_drop_complete
  | EVENT_DROP_POSITION -> event_drop_position
  | EVENT_AUDIO_DEVICE_ADDED -> event_audio_device_added
  | EVENT_AUDIO_DEVICE_REMOVED -> event_audio_device_removed
  | EVENT_AUDIO_DEVICE_FORMAT_CHANGED -> event_audio_device_format_changed
  | EVENT_SENSOR_UPDATE -> event_sensor_update
  | EVENT_PEN_PROXIMITY_IN -> event_pen_proximity_in
  | EVENT_PEN_PROXIMITY_OUT -> event_pen_proximity_out
  | EVENT_PEN_DOWN -> event_pen_down
  | EVENT_PEN_UP -> event_pen_up
  | EVENT_PEN_BUTTON_DOWN -> event_pen_button_down
  | EVENT_PEN_BUTTON_UP -> event_pen_button_up
  | EVENT_PEN_MOTION -> event_pen_motion
  | EVENT_PEN_AXIS -> event_pen_axis
  | EVENT_CAMERA_DEVICE_ADDED -> event_camera_device_added
  | EVENT_CAMERA_DEVICE_REMOVED -> event_camera_device_removed
  | EVENT_CAMERA_DEVICE_APPROVED -> event_camera_device_approved
  | EVENT_CAMERA_DEVICE_DENIED -> event_camera_device_denied
  | EVENT_RENDER_TARGETS_RESET -> event_render_targets_reset
  | EVENT_RENDER_DEVICE_RESET -> event_render_device_reset
  | EVENT_RENDER_DEVICE_LOST -> event_render_device_lost
  | EVENT_PRIVATE0 -> event_private0
  | EVENT_PRIVATE1 -> event_private1
  | EVENT_PRIVATE2 -> event_private2
  | EVENT_PRIVATE3 -> event_private3
  | EVENT_POLL_SENTINEL -> event_poll_sentinel
  | EVENT_USER -> event_user
  | EVENT_LAST -> event_last
  | EVENT_ENUM_PADDING -> event_enum_padding

module CommonEvent = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_CommonEvent"
  let typ = field t "type" int_as_uint
  let reserved = field t "reserved" uint32
  let timestamp = field t "timestamp" uint64
  let () = seal t
end
type common_event = CommonEvent.t
let common_event = CommonEvent.t


module DisplayEvent = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_DisplayEvent"
  let typ = field t "type" event_type
  let reserved = field t "reserved" uint32
  let timestamp = field t "timestamp" uint64
  let display_id = field t "displayID" display_id
  let data1 = field t "data1" sint32
  let data2 = field t "data2" sint32
  let () = seal t
end
type display_event = DisplayEvent.t
let display_event = DisplayEvent.t


module WindowEvent = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_WindowEvent"
  let typ = field t "type" event_type
  let reserved = field t "reserved" uint32
  let timestamp = field t "timestamp" uint64
  let window_id = field t "windowID" window_id
  let data1 = field t "data1" sint32
  let data2 = field t "data2" sint32
  let () = seal t
end
type window_event = WindowEvent.t
let window_event = WindowEvent.t


module KeyboardDeviceEvent = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_KeyboardDeviceEvent"
  let typ = field t "type" event_type
  let reserved = field t "reserved" uint32
  let timestamp = field t "timestamp" uint64
  let which = field t "which" keyboard_id
  let () = seal t
end
type keyboard_device_event = KeyboardDeviceEvent.t
let keyboard_device_event = KeyboardDeviceEvent.t


module KeyboardEvent = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_KeyboardEvent"
  let typ = field t "type" event_type
  let reserved = field t "reserved" uint32
  let timestamp = field t "timestamp" uint64
  let window_id = field t "windowID" window_id
  let which = field t "which" keyboard_id
  let scancode = field t "scancode" scancode
  let key = field t "key" keycode
  let mod_ = field t "mod" keymod
  let raw = field t "raw" uint16
  let down = field t "down" bool
  let repeat = field t "repeat" bool
  let () = seal t
end
type keyboard_event = KeyboardEvent.t
let keyboard_event = KeyboardEvent.t


module TextEditingEvent = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_TextEditingEvent"
  let typ = field t "type" event_type
  let reserved = field t "reserved" uint32
  let timestamp = field t "timestamp" uint64
  let window_id = field t "windowID" window_id
  let text = field t "text" string
  let start = field t "start" sint32
  let length = field t "length" sint32
  let () = seal t
end
type text_editing_event = TextEditingEvent.t
let text_editing_event = TextEditingEvent.t


module TextEditingCandidatesEvent = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_TextEditingCandidatesEvent"
  let typ = field t "type" event_type
  let reserved = field t "reserved" uint32
  let timestamp = field t "timestamp" uint64
  let window_id = field t "windowID" window_id
  let candidates = field t "candidates" (ptr string)
  let num_candidates = field t "num_candidates" sint32
  let selected_candidate = field t "selected_candidate" sint32
  let horizontal = field t "horizontal" bool
  let padding1 = field t "padding1" uint8
  let padding2 = field t "padding2" uint8
  let padding3 = field t "padding3" uint8
  let () = seal t
end
type text_editing_candidates_event = TextEditingCandidatesEvent.t
let text_editing_candidates_event = TextEditingCandidatesEvent.t


module TextInputEvent = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_TextInputEvent"
  let typ = field t "type" event_type
  let reserved = field t "reserved" uint32
  let timestamp = field t "timestamp" uint64
  let window_id = field t "windowID" window_id
  let text = field t "text" string
  let () = seal t
end
type text_input_event = TextInputEvent.t
let text_input_event = TextInputEvent.t


module MouseDeviceEvent = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_MouseDeviceEvent"
  let typ = field t "type" event_type
  let reserved = field t "reserved" uint32
  let timestamp = field t "timestamp" uint64
  let which = field t "which" mouse_id
  let () = seal t
end
type mouse_device_event = MouseDeviceEvent.t
let mouse_device_event = MouseDeviceEvent.t


module MouseMotionEvent = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_MouseMotionEvent"
  let typ = field t "type" event_type
  let reserved = field t "reserved" uint32
  let timestamp = field t "timestamp" uint64
  let window_id = field t "windowID" window_id
  let which = field t "which" mouse_id
  let state = field t "state" mouse_button_flags
  let x = field t "x" float
  let y = field t "y" float
  let xrel = field t "xrel" float
  let yrel = field t "yrel" float
  let () = seal t
end
type mouse_motion_event = MouseMotionEvent.t
let mouse_motion_event = MouseMotionEvent.t


module MouseButtonEvent = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_MouseButtonEvent"
  let typ = field t "type" event_type
  let reserved = field t "reserved" uint32
  let timestamp = field t "timestamp" uint64
  let window_id = field t "windowID" window_id
  let which = field t "which" mouse_id
  let button = field t "button" uint8
  let down = field t "down" bool
  let clicks = field t "clicks" uint8
  let padding = field t "padding" uint8
  let x = field t "x" float
  let y = field t "y" float
  let () = seal t
end
type mouse_button_event = MouseButtonEvent.t
let mouse_button_event = MouseButtonEvent.t


module MouseWheelEvent = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_MouseWheelEvent"
  let typ = field t "type" event_type
  let reserved = field t "reserved" uint32
  let timestamp = field t "timestamp" uint64
  let window_id = field t "windowID" window_id
  let which = field t "which" mouse_id
  let x = field t "x" float
  let y = field t "y" float
  let direction = field t "direction" mouse_wheel_direction
  let mouse_x = field t "mouse_x" float
  let mouse_y = field t "mouse_y" float
  let integer_x = field t "integer_x" sint32
  let integer_y = field t "integer_y" sint32
  let () = seal t
end
type mouse_wheel_event = MouseWheelEvent.t
let mouse_wheel_event = MouseWheelEvent.t


module JoyAxisEvent = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_JoyAxisEvent"
  let typ = field t "type" event_type
  let reserved = field t "reserved" uint32
  let timestamp = field t "timestamp" uint64
  let which = field t "which" joystick_id
  let axis = field t "axis" uint8
  let padding1 = field t "padding1" uint8
  let padding2 = field t "padding2" uint8
  let padding3 = field t "padding3" uint8
  let value = field t "value" sint16
  let padding4 = field t "padding4" uint16
  let () = seal t
end
type joy_axis_event = JoyAxisEvent.t
let joy_axis_event = JoyAxisEvent.t


module JoyBallEvent = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_JoyBallEvent"
  let typ = field t "type" event_type
  let reserved = field t "reserved" uint32
  let timestamp = field t "timestamp" uint64
  let which = field t "which" joystick_id
  let ball = field t "ball" uint8
  let padding1 = field t "padding1" uint8
  let padding2 = field t "padding2" uint8
  let padding3 = field t "padding3" uint8
  let xrel = field t "xrel" sint16
  let yrel = field t "yrel" sint16
  let () = seal t
end
type joy_ball_event = JoyBallEvent.t
let joy_ball_event = JoyBallEvent.t


module JoyHatEvent = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_JoyHatEvent"
  let typ = field t "type" event_type
  let reserved = field t "reserved" uint32
  let timestamp = field t "timestamp" uint64
  let which = field t "which" joystick_id
  let hat = field t "hat" uint8
  let value = field t "value" uint8
  let padding1 = field t "padding1" uint8
  let padding2 = field t "padding2" uint8
  let () = seal t
end
type joy_hat_event = JoyHatEvent.t
let joy_hat_event = JoyHatEvent.t


module JoyButtonEvent = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_JoyButtonEvent"
  let typ = field t "type" event_type
  let reserved = field t "reserved" uint32
  let timestamp = field t "timestamp" uint64
  let which = field t "which" joystick_id
  let button = field t "button" uint8
  let down = field t "down" bool
  let padding1 = field t "padding1" uint8
  let padding2 = field t "padding2" uint8
  let () = seal t
end
type joy_button_event = JoyButtonEvent.t
let joy_button_event = JoyButtonEvent.t


module JoyDeviceEvent = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_JoyDeviceEvent"
  let typ = field t "type" event_type
  let reserved = field t "reserved" uint32
  let timestamp = field t "timestamp" uint64
  let which = field t "which" joystick_id
  let () = seal t
end
type joy_device_event = JoyDeviceEvent.t
let joy_device_event = JoyDeviceEvent.t


module JoyBatteryEvent = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_JoyBatteryEvent"
  let typ = field t "type" event_type
  let reserved = field t "reserved" uint32
  let timestamp = field t "timestamp" uint64
  let which = field t "which" joystick_id
  let state = field t "state" power_state
  let percent = field t "percent" int
  let () = seal t
end
type joy_battery_event = JoyBatteryEvent.t
let joy_battery_event = JoyBatteryEvent.t


module GamepadAxisEvent = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GamepadAxisEvent"
  let typ = field t "type" event_type
  let reserved = field t "reserved" uint32
  let timestamp = field t "timestamp" uint64
  let which = field t "which" joystick_id
  let axis = field t "axis" uint8
  let padding1 = field t "padding1" uint8
  let padding2 = field t "padding2" uint8
  let padding3 = field t "padding3" uint8
  let value = field t "value" sint16
  let padding4 = field t "padding4" uint16
  let () = seal t
end
type gamepad_axis_event = GamepadAxisEvent.t
let gamepad_axis_event = GamepadAxisEvent.t


module GamepadButtonEvent = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GamepadButtonEvent"
  let typ = field t "type" event_type
  let reserved = field t "reserved" uint32
  let timestamp = field t "timestamp" uint64
  let which = field t "which" joystick_id
  let button = field t "button" uint8
  let down = field t "down" bool
  let padding1 = field t "padding1" uint8
  let padding2 = field t "padding2" uint8
  let () = seal t
end
type gamepad_button_event = GamepadButtonEvent.t
let gamepad_button_event = GamepadButtonEvent.t


module GamepadDeviceEvent = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GamepadDeviceEvent"
  let typ = field t "type" event_type
  let reserved = field t "reserved" uint32
  let timestamp = field t "timestamp" uint64
  let which = field t "which" joystick_id
  let () = seal t
end
type gamepad_device_event = GamepadDeviceEvent.t
let gamepad_device_event = GamepadDeviceEvent.t


module GamepadTouchpadEvent = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GamepadTouchpadEvent"
  let typ = field t "type" event_type
  let reserved = field t "reserved" uint32
  let timestamp = field t "timestamp" uint64
  let which = field t "which" joystick_id
  let touchpad = field t "touchpad" sint32
  let finger = field t "finger" sint32
  let x = field t "x" float
  let y = field t "y" float
  let pressure = field t "pressure" float
  let () = seal t
end
type gamepad_touchpad_event = GamepadTouchpadEvent.t
let gamepad_touchpad_event = GamepadTouchpadEvent.t


module GamepadSensorEvent = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GamepadSensorEvent"
  let typ = field t "type" event_type
  let reserved = field t "reserved" uint32
  let timestamp = field t "timestamp" uint64
  let which = field t "which" joystick_id
  let sensor = field t "sensor" sint32
  let data = field t "data" (array 3 float)
  let sensor_timestamp = field t "sensor_timestamp" uint64
  let () = seal t
end
type gamepad_sensor_event = GamepadSensorEvent.t
let gamepad_sensor_event = GamepadSensorEvent.t


module AudioDeviceEvent = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_AudioDeviceEvent"
  let typ = field t "type" event_type
  let reserved = field t "reserved" uint32
  let timestamp = field t "timestamp" uint64
  let which = field t "which" audio_device_id
  let recording = field t "recording" bool
  let padding1 = field t "padding1" uint8
  let padding2 = field t "padding2" uint8
  let padding3 = field t "padding3" uint8
  let () = seal t
end
type audio_device_event = AudioDeviceEvent.t
let audio_device_event = AudioDeviceEvent.t


module CameraDeviceEvent = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_CameraDeviceEvent"
  let typ = field t "type" event_type
  let reserved = field t "reserved" uint32
  let timestamp = field t "timestamp" uint64
  let which = field t "which" camera_id
  let () = seal t
end
type camera_device_event = CameraDeviceEvent.t
let camera_device_event = CameraDeviceEvent.t


module RenderEvent = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_RenderEvent"
  let typ = field t "type" event_type
  let reserved = field t "reserved" uint32
  let timestamp = field t "timestamp" uint64
  let window_id = field t "windowID" window_id
  let () = seal t
end
type render_event = RenderEvent.t
let render_event = RenderEvent.t


module TouchFingerEvent = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_TouchFingerEvent"
  let typ = field t "type" event_type
  let reserved = field t "reserved" uint32
  let timestamp = field t "timestamp" uint64
  let touch_id = field t "touchID" touch_id
  let finger_id = field t "fingerID" finger_id
  let x = field t "x" float
  let y = field t "y" float
  let dx = field t "dx" float
  let dy = field t "dy" float
  let pressure = field t "pressure" float
  let window_id = field t "windowID" window_id
  let () = seal t
end
type touch_finger_event = TouchFingerEvent.t
let touch_finger_event = TouchFingerEvent.t


module PinchFingerEvent = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_PinchFingerEvent"
  let typ = field t "type" event_type
  let reserved = field t "reserved" uint32
  let timestamp = field t "timestamp" uint64
  let scale = field t "scale" float
  let window_id = field t "windowID" window_id
  let () = seal t
end
type pinch_finger_event = PinchFingerEvent.t
let pinch_finger_event = PinchFingerEvent.t


module PenProximityEvent = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_PenProximityEvent"
  let typ = field t "type" event_type
  let reserved = field t "reserved" uint32
  let timestamp = field t "timestamp" uint64
  let window_id = field t "windowID" window_id
  let which = field t "which" pen_id
  let () = seal t
end
type pen_proximity_event = PenProximityEvent.t
let pen_proximity_event = PenProximityEvent.t


module PenMotionEvent = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_PenMotionEvent"
  let typ = field t "type" event_type
  let reserved = field t "reserved" uint32
  let timestamp = field t "timestamp" uint64
  let window_id = field t "windowID" window_id
  let which = field t "which" pen_id
  let pen_state = field t "pen_state" pen_input_flags
  let x = field t "x" float
  let y = field t "y" float
  let () = seal t
end
type pen_motion_event = PenMotionEvent.t
let pen_motion_event = PenMotionEvent.t


module PenTouchEvent = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_PenTouchEvent"
  let typ = field t "type" event_type
  let reserved = field t "reserved" uint32
  let timestamp = field t "timestamp" uint64
  let window_id = field t "windowID" window_id
  let which = field t "which" pen_id
  let pen_state = field t "pen_state" pen_input_flags
  let x = field t "x" float
  let y = field t "y" float
  let eraser = field t "eraser" bool
  let down = field t "down" bool
  let () = seal t
end
type pen_touch_event = PenTouchEvent.t
let pen_touch_event = PenTouchEvent.t


module PenButtonEvent = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_PenButtonEvent"
  let typ = field t "type" event_type
  let reserved = field t "reserved" uint32
  let timestamp = field t "timestamp" uint64
  let window_id = field t "windowID" window_id
  let which = field t "which" pen_id
  let pen_state = field t "pen_state" pen_input_flags
  let x = field t "x" float
  let y = field t "y" float
  let button = field t "button" uint8
  let down = field t "down" bool
  let () = seal t
end
type pen_button_event = PenButtonEvent.t
let pen_button_event = PenButtonEvent.t


module PenAxisEvent = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_PenAxisEvent"
  let typ = field t "type" event_type
  let reserved = field t "reserved" uint32
  let timestamp = field t "timestamp" uint64
  let window_id = field t "windowID" window_id
  let which = field t "which" pen_id
  let pen_state = field t "pen_state" pen_input_flags
  let x = field t "x" float
  let y = field t "y" float
  let axis = field t "axis" pen_axis
  let value = field t "value" float
  let () = seal t
end
type pen_axis_event = PenAxisEvent.t
let pen_axis_event = PenAxisEvent.t


module DropEvent = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_DropEvent"
  let typ = field t "type" event_type
  let reserved = field t "reserved" uint32
  let timestamp = field t "timestamp" uint64
  let window_id = field t "windowID" window_id
  let x = field t "x" float
  let y = field t "y" float
  let source = field t "source" string
  let data = field t "data" string
  let () = seal t
end
type drop_event = DropEvent.t
let drop_event = DropEvent.t


module ClipboardEvent = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_ClipboardEvent"
  let typ = field t "type" event_type
  let reserved = field t "reserved" uint32
  let timestamp = field t "timestamp" uint64
  let owner = field t "owner" bool
  let num_mime_types = field t "num_mime_types" sint32
  let mime_types = field t "mime_types" (ptr string)
  let () = seal t
end
type clipboard_event = ClipboardEvent.t
let clipboard_event = ClipboardEvent.t


module SensorEvent = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_SensorEvent"
  let typ = field t "type" event_type
  let reserved = field t "reserved" uint32
  let timestamp = field t "timestamp" uint64
  let which = field t "which" sensor_id
  let data = field t "data" (array 6 float)
  let sensor_timestamp = field t "sensor_timestamp" uint64
  let () = seal t
end
type sensor_event = SensorEvent.t
let sensor_event = SensorEvent.t


module QuitEvent = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_QuitEvent"
  let typ = field t "type" event_type
  let reserved = field t "reserved" uint32
  let timestamp = field t "timestamp" uint64
  let () = seal t
end
type quit_event = QuitEvent.t
let quit_event = QuitEvent.t


module UserEvent = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_UserEvent"
  let typ = field t "type" int_as_uint
  let reserved = field t "reserved" uint32
  let timestamp = field t "timestamp" uint64
  let window_id = field t "windowID" window_id
  let code = field t "code" sint32
  let data1 = field t "data1" (ptr void)
  let data2 = field t "data2" (ptr void)
  let () = seal t
end
type user_event = UserEvent.t
let user_event = UserEvent.t


module Event = struct (* union 'SDL_Event' *)
  type _t_raw
  type t_raw = _t_raw union
  let t : t_raw typ = union "SDL_Event"
  let typ = field t "type" int_as_uint
  let common = field t "common" common_event
  let display = field t "display" display_event
  let window = field t "window" window_event
  let kdevice = field t "kdevice" keyboard_device_event
  let key = field t "key" keyboard_event
  let edit = field t "edit" text_editing_event
  let edit_candidates = field t "edit_candidates" text_editing_candidates_event
  let text = field t "text" text_input_event
  let mdevice = field t "mdevice" mouse_device_event
  let motion = field t "motion" mouse_motion_event
  let button = field t "button" mouse_button_event
  let wheel = field t "wheel" mouse_wheel_event
  let jdevice = field t "jdevice" joy_device_event
  let jaxis = field t "jaxis" joy_axis_event
  let jball = field t "jball" joy_ball_event
  let jhat = field t "jhat" joy_hat_event
  let jbutton = field t "jbutton" joy_button_event
  let jbattery = field t "jbattery" joy_battery_event
  let gdevice = field t "gdevice" gamepad_device_event
  let gaxis = field t "gaxis" gamepad_axis_event
  let gbutton = field t "gbutton" gamepad_button_event
  let gtouchpad = field t "gtouchpad" gamepad_touchpad_event
  let gsensor = field t "gsensor" gamepad_sensor_event
  let adevice = field t "adevice" audio_device_event
  let cdevice = field t "cdevice" camera_device_event
  let sensor = field t "sensor" sensor_event
  let quit = field t "quit" quit_event
  let user = field t "user" user_event
  let tfinger = field t "tfinger" touch_finger_event
  let pinch = field t "pinch" pinch_finger_event
  let pproximity = field t "pproximity" pen_proximity_event
  let ptouch = field t "ptouch" pen_touch_event
  let pmotion = field t "pmotion" pen_motion_event
  let pbutton = field t "pbutton" pen_button_event
  let paxis = field t "paxis" pen_axis_event
  let render = field t "render" render_event
  let drop = field t "drop" drop_event
  let clipboard = field t "clipboard" clipboard_event
  let padding = field t "padding" (array 128 uint8)
  let () = seal t
  let t_raw = t
  type t = t_raw ptr
  let t : t typ = ptr t_raw
  let t_opt : t option typ = ptr_opt t_raw
  let get (e : t) field = getf {structured = e} field
  let set (e : t) field v = setf {structured = e} field v
  let create () : t = allocate_n t_raw ~count:1
end
type event = Event.t
let event = Event.t
let event_opt = Event.t_opt
let event_raw = Event.t_raw


type event_action =
  | ADDEVENT
  | PEEKEVENT
  | GETEVENT

type event_action_enum = int
let event_action = int

let event_action_to_enum : event_action -> event_action_enum = function
  | ADDEVENT -> addevent
  | PEEKEVENT -> peekevent
  | GETEVENT -> getevent

let event_filter = funptr (ptr void @-> event @-> returning bool)
type folder =
  | FOLDER_HOME
  | FOLDER_DESKTOP
  | FOLDER_DOCUMENTS
  | FOLDER_DOWNLOADS
  | FOLDER_MUSIC
  | FOLDER_PICTURES
  | FOLDER_PUBLICSHARE
  | FOLDER_SAVEDGAMES
  | FOLDER_SCREENSHOTS
  | FOLDER_TEMPLATES
  | FOLDER_VIDEOS
  | FOLDER_COUNT

type folder_enum = int
let folder = int

let folder_to_enum : folder -> folder_enum = function
  | FOLDER_HOME -> folder_home
  | FOLDER_DESKTOP -> folder_desktop
  | FOLDER_DOCUMENTS -> folder_documents
  | FOLDER_DOWNLOADS -> folder_downloads
  | FOLDER_MUSIC -> folder_music
  | FOLDER_PICTURES -> folder_pictures
  | FOLDER_PUBLICSHARE -> folder_publicshare
  | FOLDER_SAVEDGAMES -> folder_savedgames
  | FOLDER_SCREENSHOTS -> folder_screenshots
  | FOLDER_TEMPLATES -> folder_templates
  | FOLDER_VIDEOS -> folder_videos
  | FOLDER_COUNT -> folder_count

type path_type =
  | PATHTYPE_NONE
  | PATHTYPE_FILE
  | PATHTYPE_DIRECTORY
  | PATHTYPE_OTHER

type path_type_enum = int
let path_type = int

let path_type_to_enum : path_type -> path_type_enum = function
  | PATHTYPE_NONE -> pathtype_none
  | PATHTYPE_FILE -> pathtype_file
  | PATHTYPE_DIRECTORY -> pathtype_directory
  | PATHTYPE_OTHER -> pathtype_other

module PathInfo = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_PathInfo"
  let typ = field t "type" path_type
  let size = field t "size" uint64
  let create_time = field t "create_time" time
  let modify_time = field t "modify_time" time
  let access_time = field t "access_time" time
  let () = seal t
end
type path_info = PathInfo.t
let path_info = PathInfo.t


let glob_flags = uint (* prim *)
type enumeration_result =
  | ENUM_CONTINUE
  | ENUM_SUCCESS
  | ENUM_FAILURE

type enumeration_result_enum = int
let enumeration_result = int

let enumeration_result_to_enum : enumeration_result -> enumeration_result_enum = function
  | ENUM_CONTINUE -> enum_continue
  | ENUM_SUCCESS -> enum_success
  | ENUM_FAILURE -> enum_failure

let enumerate_directory_callback = funptr (ptr void @-> string @-> string @-> returning enumeration_result)

(* No definition (opaque struct) *)
type gpu_device = unit ptr
let gpu_device : gpu_device typ = ptr void
let gpu_device_opt : gpu_device option typ = ptr_opt void


(* No definition (opaque struct) *)
type gpu_buffer = unit ptr
let gpu_buffer : gpu_buffer typ = ptr void
let gpu_buffer_opt : gpu_buffer option typ = ptr_opt void


(* No definition (opaque struct) *)
type gpu_transfer_buffer = unit ptr
let gpu_transfer_buffer : gpu_transfer_buffer typ = ptr void
let gpu_transfer_buffer_opt : gpu_transfer_buffer option typ = ptr_opt void


(* No definition (opaque struct) *)
type gpu_texture = unit ptr
let gpu_texture : gpu_texture typ = ptr void
let gpu_texture_opt : gpu_texture option typ = ptr_opt void


(* No definition (opaque struct) *)
type gpu_sampler = unit ptr
let gpu_sampler : gpu_sampler typ = ptr void
let gpu_sampler_opt : gpu_sampler option typ = ptr_opt void


(* No definition (opaque struct) *)
type gpu_shader = unit ptr
let gpu_shader : gpu_shader typ = ptr void
let gpu_shader_opt : gpu_shader option typ = ptr_opt void


(* No definition (opaque struct) *)
type gpu_compute_pipeline = unit ptr
let gpu_compute_pipeline : gpu_compute_pipeline typ = ptr void
let gpu_compute_pipeline_opt : gpu_compute_pipeline option typ = ptr_opt void


(* No definition (opaque struct) *)
type gpu_graphics_pipeline = unit ptr
let gpu_graphics_pipeline : gpu_graphics_pipeline typ = ptr void
let gpu_graphics_pipeline_opt : gpu_graphics_pipeline option typ = ptr_opt void


(* No definition (opaque struct) *)
type gpu_command_buffer = unit ptr
let gpu_command_buffer : gpu_command_buffer typ = ptr void
let gpu_command_buffer_opt : gpu_command_buffer option typ = ptr_opt void


(* No definition (opaque struct) *)
type gpu_render_pass = unit ptr
let gpu_render_pass : gpu_render_pass typ = ptr void
let gpu_render_pass_opt : gpu_render_pass option typ = ptr_opt void


(* No definition (opaque struct) *)
type gpu_compute_pass = unit ptr
let gpu_compute_pass : gpu_compute_pass typ = ptr void
let gpu_compute_pass_opt : gpu_compute_pass option typ = ptr_opt void


(* No definition (opaque struct) *)
type gpu_copy_pass = unit ptr
let gpu_copy_pass : gpu_copy_pass typ = ptr void
let gpu_copy_pass_opt : gpu_copy_pass option typ = ptr_opt void


(* No definition (opaque struct) *)
type gpu_fence = unit ptr
let gpu_fence : gpu_fence typ = ptr void
let gpu_fence_opt : gpu_fence option typ = ptr_opt void

type gpu_primitive_type =
  | GPU_PRIMITIVETYPE_TRIANGLELIST
  | GPU_PRIMITIVETYPE_TRIANGLESTRIP
  | GPU_PRIMITIVETYPE_LINELIST
  | GPU_PRIMITIVETYPE_LINESTRIP
  | GPU_PRIMITIVETYPE_POINTLIST

type gpu_primitive_type_enum = int
let gpu_primitive_type = int

let gpu_primitive_type_to_enum : gpu_primitive_type -> gpu_primitive_type_enum = function
  | GPU_PRIMITIVETYPE_TRIANGLELIST -> gpu_primitivetype_trianglelist
  | GPU_PRIMITIVETYPE_TRIANGLESTRIP -> gpu_primitivetype_trianglestrip
  | GPU_PRIMITIVETYPE_LINELIST -> gpu_primitivetype_linelist
  | GPU_PRIMITIVETYPE_LINESTRIP -> gpu_primitivetype_linestrip
  | GPU_PRIMITIVETYPE_POINTLIST -> gpu_primitivetype_pointlist

type gpu_load_op =
  | GPU_LOADOP_LOAD
  | GPU_LOADOP_CLEAR
  | GPU_LOADOP_DONT_CARE

type gpu_load_op_enum = int
let gpu_load_op = int

let gpu_load_op_to_enum : gpu_load_op -> gpu_load_op_enum = function
  | GPU_LOADOP_LOAD -> gpu_loadop_load
  | GPU_LOADOP_CLEAR -> gpu_loadop_clear
  | GPU_LOADOP_DONT_CARE -> gpu_loadop_dont_care

type gpu_store_op =
  | GPU_STOREOP_STORE
  | GPU_STOREOP_DONT_CARE
  | GPU_STOREOP_RESOLVE
  | GPU_STOREOP_RESOLVE_AND_STORE

type gpu_store_op_enum = int
let gpu_store_op = int

let gpu_store_op_to_enum : gpu_store_op -> gpu_store_op_enum = function
  | GPU_STOREOP_STORE -> gpu_storeop_store
  | GPU_STOREOP_DONT_CARE -> gpu_storeop_dont_care
  | GPU_STOREOP_RESOLVE -> gpu_storeop_resolve
  | GPU_STOREOP_RESOLVE_AND_STORE -> gpu_storeop_resolve_and_store

type gpu_index_element_size =
  | GPU_INDEXELEMENTSIZE_16BIT
  | GPU_INDEXELEMENTSIZE_32BIT

type gpu_index_element_size_enum = int
let gpu_index_element_size = int

let gpu_index_element_size_to_enum : gpu_index_element_size -> gpu_index_element_size_enum = function
  | GPU_INDEXELEMENTSIZE_16BIT -> gpu_indexelementsize_16_bit
  | GPU_INDEXELEMENTSIZE_32BIT -> gpu_indexelementsize_32_bit

type gpu_texture_format =
  | GPU_TEXTUREFORMAT_INVALID
  | GPU_TEXTUREFORMAT_A8_UNORM
  | GPU_TEXTUREFORMAT_R8_UNORM
  | GPU_TEXTUREFORMAT_R8G8_UNORM
  | GPU_TEXTUREFORMAT_R8G8B8A8_UNORM
  | GPU_TEXTUREFORMAT_R16_UNORM
  | GPU_TEXTUREFORMAT_R16G16_UNORM
  | GPU_TEXTUREFORMAT_R16G16B16A16_UNORM
  | GPU_TEXTUREFORMAT_R10G10B10A2_UNORM
  | GPU_TEXTUREFORMAT_B5G6R5_UNORM
  | GPU_TEXTUREFORMAT_B5G5R5A1_UNORM
  | GPU_TEXTUREFORMAT_B4G4R4A4_UNORM
  | GPU_TEXTUREFORMAT_B8G8R8A8_UNORM
  | GPU_TEXTUREFORMAT_BC1_RGBA_UNORM
  | GPU_TEXTUREFORMAT_BC2_RGBA_UNORM
  | GPU_TEXTUREFORMAT_BC3_RGBA_UNORM
  | GPU_TEXTUREFORMAT_BC4_R_UNORM
  | GPU_TEXTUREFORMAT_BC5_RG_UNORM
  | GPU_TEXTUREFORMAT_BC7_RGBA_UNORM
  | GPU_TEXTUREFORMAT_BC6H_RGB_FLOAT
  | GPU_TEXTUREFORMAT_BC6H_RGB_UFLOAT
  | GPU_TEXTUREFORMAT_R8_SNORM
  | GPU_TEXTUREFORMAT_R8G8_SNORM
  | GPU_TEXTUREFORMAT_R8G8B8A8_SNORM
  | GPU_TEXTUREFORMAT_R16_SNORM
  | GPU_TEXTUREFORMAT_R16G16_SNORM
  | GPU_TEXTUREFORMAT_R16G16B16A16_SNORM
  | GPU_TEXTUREFORMAT_R16_FLOAT
  | GPU_TEXTUREFORMAT_R16G16_FLOAT
  | GPU_TEXTUREFORMAT_R16G16B16A16_FLOAT
  | GPU_TEXTUREFORMAT_R32_FLOAT
  | GPU_TEXTUREFORMAT_R32G32_FLOAT
  | GPU_TEXTUREFORMAT_R32G32B32A32_FLOAT
  | GPU_TEXTUREFORMAT_R11G11B10_UFLOAT
  | GPU_TEXTUREFORMAT_R8_UINT
  | GPU_TEXTUREFORMAT_R8G8_UINT
  | GPU_TEXTUREFORMAT_R8G8B8A8_UINT
  | GPU_TEXTUREFORMAT_R16_UINT
  | GPU_TEXTUREFORMAT_R16G16_UINT
  | GPU_TEXTUREFORMAT_R16G16B16A16_UINT
  | GPU_TEXTUREFORMAT_R32_UINT
  | GPU_TEXTUREFORMAT_R32G32_UINT
  | GPU_TEXTUREFORMAT_R32G32B32A32_UINT
  | GPU_TEXTUREFORMAT_R8_INT
  | GPU_TEXTUREFORMAT_R8G8_INT
  | GPU_TEXTUREFORMAT_R8G8B8A8_INT
  | GPU_TEXTUREFORMAT_R16_INT
  | GPU_TEXTUREFORMAT_R16G16_INT
  | GPU_TEXTUREFORMAT_R16G16B16A16_INT
  | GPU_TEXTUREFORMAT_R32_INT
  | GPU_TEXTUREFORMAT_R32G32_INT
  | GPU_TEXTUREFORMAT_R32G32B32A32_INT
  | GPU_TEXTUREFORMAT_R8G8B8A8_UNORM_SRGB
  | GPU_TEXTUREFORMAT_B8G8R8A8_UNORM_SRGB
  | GPU_TEXTUREFORMAT_BC1_RGBA_UNORM_SRGB
  | GPU_TEXTUREFORMAT_BC2_RGBA_UNORM_SRGB
  | GPU_TEXTUREFORMAT_BC3_RGBA_UNORM_SRGB
  | GPU_TEXTUREFORMAT_BC7_RGBA_UNORM_SRGB
  | GPU_TEXTUREFORMAT_D16_UNORM
  | GPU_TEXTUREFORMAT_D24_UNORM
  | GPU_TEXTUREFORMAT_D32_FLOAT
  | GPU_TEXTUREFORMAT_D24_UNORM_S8_UINT
  | GPU_TEXTUREFORMAT_D32_FLOAT_S8_UINT
  | GPU_TEXTUREFORMAT_ASTC_4x4_UNORM
  | GPU_TEXTUREFORMAT_ASTC_5x4_UNORM
  | GPU_TEXTUREFORMAT_ASTC_5x5_UNORM
  | GPU_TEXTUREFORMAT_ASTC_6x5_UNORM
  | GPU_TEXTUREFORMAT_ASTC_6x6_UNORM
  | GPU_TEXTUREFORMAT_ASTC_8x5_UNORM
  | GPU_TEXTUREFORMAT_ASTC_8x6_UNORM
  | GPU_TEXTUREFORMAT_ASTC_8x8_UNORM
  | GPU_TEXTUREFORMAT_ASTC_10x5_UNORM
  | GPU_TEXTUREFORMAT_ASTC_10x6_UNORM
  | GPU_TEXTUREFORMAT_ASTC_10x8_UNORM
  | GPU_TEXTUREFORMAT_ASTC_10x10_UNORM
  | GPU_TEXTUREFORMAT_ASTC_12x10_UNORM
  | GPU_TEXTUREFORMAT_ASTC_12x12_UNORM
  | GPU_TEXTUREFORMAT_ASTC_4x4_UNORM_SRGB
  | GPU_TEXTUREFORMAT_ASTC_5x4_UNORM_SRGB
  | GPU_TEXTUREFORMAT_ASTC_5x5_UNORM_SRGB
  | GPU_TEXTUREFORMAT_ASTC_6x5_UNORM_SRGB
  | GPU_TEXTUREFORMAT_ASTC_6x6_UNORM_SRGB
  | GPU_TEXTUREFORMAT_ASTC_8x5_UNORM_SRGB
  | GPU_TEXTUREFORMAT_ASTC_8x6_UNORM_SRGB
  | GPU_TEXTUREFORMAT_ASTC_8x8_UNORM_SRGB
  | GPU_TEXTUREFORMAT_ASTC_10x5_UNORM_SRGB
  | GPU_TEXTUREFORMAT_ASTC_10x6_UNORM_SRGB
  | GPU_TEXTUREFORMAT_ASTC_10x8_UNORM_SRGB
  | GPU_TEXTUREFORMAT_ASTC_10x10_UNORM_SRGB
  | GPU_TEXTUREFORMAT_ASTC_12x10_UNORM_SRGB
  | GPU_TEXTUREFORMAT_ASTC_12x12_UNORM_SRGB
  | GPU_TEXTUREFORMAT_ASTC_4x4_FLOAT
  | GPU_TEXTUREFORMAT_ASTC_5x4_FLOAT
  | GPU_TEXTUREFORMAT_ASTC_5x5_FLOAT
  | GPU_TEXTUREFORMAT_ASTC_6x5_FLOAT
  | GPU_TEXTUREFORMAT_ASTC_6x6_FLOAT
  | GPU_TEXTUREFORMAT_ASTC_8x5_FLOAT
  | GPU_TEXTUREFORMAT_ASTC_8x6_FLOAT
  | GPU_TEXTUREFORMAT_ASTC_8x8_FLOAT
  | GPU_TEXTUREFORMAT_ASTC_10x5_FLOAT
  | GPU_TEXTUREFORMAT_ASTC_10x6_FLOAT
  | GPU_TEXTUREFORMAT_ASTC_10x8_FLOAT
  | GPU_TEXTUREFORMAT_ASTC_10x10_FLOAT
  | GPU_TEXTUREFORMAT_ASTC_12x10_FLOAT
  | GPU_TEXTUREFORMAT_ASTC_12x12_FLOAT

type gpu_texture_format_enum = int
let gpu_texture_format = int

let gpu_texture_format_to_enum : gpu_texture_format -> gpu_texture_format_enum = function
  | GPU_TEXTUREFORMAT_INVALID -> gpu_textureformat_invalid
  | GPU_TEXTUREFORMAT_A8_UNORM -> gpu_textureformat_a8_unorm
  | GPU_TEXTUREFORMAT_R8_UNORM -> gpu_textureformat_r8_unorm
  | GPU_TEXTUREFORMAT_R8G8_UNORM -> gpu_textureformat_r8_g8_unorm
  | GPU_TEXTUREFORMAT_R8G8B8A8_UNORM -> gpu_textureformat_r8_g8_b8_a8_unorm
  | GPU_TEXTUREFORMAT_R16_UNORM -> gpu_textureformat_r16_unorm
  | GPU_TEXTUREFORMAT_R16G16_UNORM -> gpu_textureformat_r16_g16_unorm
  | GPU_TEXTUREFORMAT_R16G16B16A16_UNORM -> gpu_textureformat_r16_g16_b16_a16_unorm
  | GPU_TEXTUREFORMAT_R10G10B10A2_UNORM -> gpu_textureformat_r10_g10_b10_a2_unorm
  | GPU_TEXTUREFORMAT_B5G6R5_UNORM -> gpu_textureformat_b5_g6_r5_unorm
  | GPU_TEXTUREFORMAT_B5G5R5A1_UNORM -> gpu_textureformat_b5_g5_r5_a1_unorm
  | GPU_TEXTUREFORMAT_B4G4R4A4_UNORM -> gpu_textureformat_b4_g4_r4_a4_unorm
  | GPU_TEXTUREFORMAT_B8G8R8A8_UNORM -> gpu_textureformat_b8_g8_r8_a8_unorm
  | GPU_TEXTUREFORMAT_BC1_RGBA_UNORM -> gpu_textureformat_bc1_rgba_unorm
  | GPU_TEXTUREFORMAT_BC2_RGBA_UNORM -> gpu_textureformat_bc2_rgba_unorm
  | GPU_TEXTUREFORMAT_BC3_RGBA_UNORM -> gpu_textureformat_bc3_rgba_unorm
  | GPU_TEXTUREFORMAT_BC4_R_UNORM -> gpu_textureformat_bc4_r_unorm
  | GPU_TEXTUREFORMAT_BC5_RG_UNORM -> gpu_textureformat_bc5_rg_unorm
  | GPU_TEXTUREFORMAT_BC7_RGBA_UNORM -> gpu_textureformat_bc7_rgba_unorm
  | GPU_TEXTUREFORMAT_BC6H_RGB_FLOAT -> gpu_textureformat_bc6_h_rgb_float
  | GPU_TEXTUREFORMAT_BC6H_RGB_UFLOAT -> gpu_textureformat_bc6_h_rgb_ufloat
  | GPU_TEXTUREFORMAT_R8_SNORM -> gpu_textureformat_r8_snorm
  | GPU_TEXTUREFORMAT_R8G8_SNORM -> gpu_textureformat_r8_g8_snorm
  | GPU_TEXTUREFORMAT_R8G8B8A8_SNORM -> gpu_textureformat_r8_g8_b8_a8_snorm
  | GPU_TEXTUREFORMAT_R16_SNORM -> gpu_textureformat_r16_snorm
  | GPU_TEXTUREFORMAT_R16G16_SNORM -> gpu_textureformat_r16_g16_snorm
  | GPU_TEXTUREFORMAT_R16G16B16A16_SNORM -> gpu_textureformat_r16_g16_b16_a16_snorm
  | GPU_TEXTUREFORMAT_R16_FLOAT -> gpu_textureformat_r16_float
  | GPU_TEXTUREFORMAT_R16G16_FLOAT -> gpu_textureformat_r16_g16_float
  | GPU_TEXTUREFORMAT_R16G16B16A16_FLOAT -> gpu_textureformat_r16_g16_b16_a16_float
  | GPU_TEXTUREFORMAT_R32_FLOAT -> gpu_textureformat_r32_float
  | GPU_TEXTUREFORMAT_R32G32_FLOAT -> gpu_textureformat_r32_g32_float
  | GPU_TEXTUREFORMAT_R32G32B32A32_FLOAT -> gpu_textureformat_r32_g32_b32_a32_float
  | GPU_TEXTUREFORMAT_R11G11B10_UFLOAT -> gpu_textureformat_r11_g11_b10_ufloat
  | GPU_TEXTUREFORMAT_R8_UINT -> gpu_textureformat_r8_uint
  | GPU_TEXTUREFORMAT_R8G8_UINT -> gpu_textureformat_r8_g8_uint
  | GPU_TEXTUREFORMAT_R8G8B8A8_UINT -> gpu_textureformat_r8_g8_b8_a8_uint
  | GPU_TEXTUREFORMAT_R16_UINT -> gpu_textureformat_r16_uint
  | GPU_TEXTUREFORMAT_R16G16_UINT -> gpu_textureformat_r16_g16_uint
  | GPU_TEXTUREFORMAT_R16G16B16A16_UINT -> gpu_textureformat_r16_g16_b16_a16_uint
  | GPU_TEXTUREFORMAT_R32_UINT -> gpu_textureformat_r32_uint
  | GPU_TEXTUREFORMAT_R32G32_UINT -> gpu_textureformat_r32_g32_uint
  | GPU_TEXTUREFORMAT_R32G32B32A32_UINT -> gpu_textureformat_r32_g32_b32_a32_uint
  | GPU_TEXTUREFORMAT_R8_INT -> gpu_textureformat_r8_int
  | GPU_TEXTUREFORMAT_R8G8_INT -> gpu_textureformat_r8_g8_int
  | GPU_TEXTUREFORMAT_R8G8B8A8_INT -> gpu_textureformat_r8_g8_b8_a8_int
  | GPU_TEXTUREFORMAT_R16_INT -> gpu_textureformat_r16_int
  | GPU_TEXTUREFORMAT_R16G16_INT -> gpu_textureformat_r16_g16_int
  | GPU_TEXTUREFORMAT_R16G16B16A16_INT -> gpu_textureformat_r16_g16_b16_a16_int
  | GPU_TEXTUREFORMAT_R32_INT -> gpu_textureformat_r32_int
  | GPU_TEXTUREFORMAT_R32G32_INT -> gpu_textureformat_r32_g32_int
  | GPU_TEXTUREFORMAT_R32G32B32A32_INT -> gpu_textureformat_r32_g32_b32_a32_int
  | GPU_TEXTUREFORMAT_R8G8B8A8_UNORM_SRGB -> gpu_textureformat_r8_g8_b8_a8_unorm_srgb
  | GPU_TEXTUREFORMAT_B8G8R8A8_UNORM_SRGB -> gpu_textureformat_b8_g8_r8_a8_unorm_srgb
  | GPU_TEXTUREFORMAT_BC1_RGBA_UNORM_SRGB -> gpu_textureformat_bc1_rgba_unorm_srgb
  | GPU_TEXTUREFORMAT_BC2_RGBA_UNORM_SRGB -> gpu_textureformat_bc2_rgba_unorm_srgb
  | GPU_TEXTUREFORMAT_BC3_RGBA_UNORM_SRGB -> gpu_textureformat_bc3_rgba_unorm_srgb
  | GPU_TEXTUREFORMAT_BC7_RGBA_UNORM_SRGB -> gpu_textureformat_bc7_rgba_unorm_srgb
  | GPU_TEXTUREFORMAT_D16_UNORM -> gpu_textureformat_d16_unorm
  | GPU_TEXTUREFORMAT_D24_UNORM -> gpu_textureformat_d24_unorm
  | GPU_TEXTUREFORMAT_D32_FLOAT -> gpu_textureformat_d32_float
  | GPU_TEXTUREFORMAT_D24_UNORM_S8_UINT -> gpu_textureformat_d24_unorm_s8_uint
  | GPU_TEXTUREFORMAT_D32_FLOAT_S8_UINT -> gpu_textureformat_d32_float_s8_uint
  | GPU_TEXTUREFORMAT_ASTC_4x4_UNORM -> gpu_textureformat_astc_4x4_unorm
  | GPU_TEXTUREFORMAT_ASTC_5x4_UNORM -> gpu_textureformat_astc_5x4_unorm
  | GPU_TEXTUREFORMAT_ASTC_5x5_UNORM -> gpu_textureformat_astc_5x5_unorm
  | GPU_TEXTUREFORMAT_ASTC_6x5_UNORM -> gpu_textureformat_astc_6x5_unorm
  | GPU_TEXTUREFORMAT_ASTC_6x6_UNORM -> gpu_textureformat_astc_6x6_unorm
  | GPU_TEXTUREFORMAT_ASTC_8x5_UNORM -> gpu_textureformat_astc_8x5_unorm
  | GPU_TEXTUREFORMAT_ASTC_8x6_UNORM -> gpu_textureformat_astc_8x6_unorm
  | GPU_TEXTUREFORMAT_ASTC_8x8_UNORM -> gpu_textureformat_astc_8x8_unorm
  | GPU_TEXTUREFORMAT_ASTC_10x5_UNORM -> gpu_textureformat_astc_10x5_unorm
  | GPU_TEXTUREFORMAT_ASTC_10x6_UNORM -> gpu_textureformat_astc_10x6_unorm
  | GPU_TEXTUREFORMAT_ASTC_10x8_UNORM -> gpu_textureformat_astc_10x8_unorm
  | GPU_TEXTUREFORMAT_ASTC_10x10_UNORM -> gpu_textureformat_astc_10x10_unorm
  | GPU_TEXTUREFORMAT_ASTC_12x10_UNORM -> gpu_textureformat_astc_12x10_unorm
  | GPU_TEXTUREFORMAT_ASTC_12x12_UNORM -> gpu_textureformat_astc_12x12_unorm
  | GPU_TEXTUREFORMAT_ASTC_4x4_UNORM_SRGB -> gpu_textureformat_astc_4x4_unorm_srgb
  | GPU_TEXTUREFORMAT_ASTC_5x4_UNORM_SRGB -> gpu_textureformat_astc_5x4_unorm_srgb
  | GPU_TEXTUREFORMAT_ASTC_5x5_UNORM_SRGB -> gpu_textureformat_astc_5x5_unorm_srgb
  | GPU_TEXTUREFORMAT_ASTC_6x5_UNORM_SRGB -> gpu_textureformat_astc_6x5_unorm_srgb
  | GPU_TEXTUREFORMAT_ASTC_6x6_UNORM_SRGB -> gpu_textureformat_astc_6x6_unorm_srgb
  | GPU_TEXTUREFORMAT_ASTC_8x5_UNORM_SRGB -> gpu_textureformat_astc_8x5_unorm_srgb
  | GPU_TEXTUREFORMAT_ASTC_8x6_UNORM_SRGB -> gpu_textureformat_astc_8x6_unorm_srgb
  | GPU_TEXTUREFORMAT_ASTC_8x8_UNORM_SRGB -> gpu_textureformat_astc_8x8_unorm_srgb
  | GPU_TEXTUREFORMAT_ASTC_10x5_UNORM_SRGB -> gpu_textureformat_astc_10x5_unorm_srgb
  | GPU_TEXTUREFORMAT_ASTC_10x6_UNORM_SRGB -> gpu_textureformat_astc_10x6_unorm_srgb
  | GPU_TEXTUREFORMAT_ASTC_10x8_UNORM_SRGB -> gpu_textureformat_astc_10x8_unorm_srgb
  | GPU_TEXTUREFORMAT_ASTC_10x10_UNORM_SRGB -> gpu_textureformat_astc_10x10_unorm_srgb
  | GPU_TEXTUREFORMAT_ASTC_12x10_UNORM_SRGB -> gpu_textureformat_astc_12x10_unorm_srgb
  | GPU_TEXTUREFORMAT_ASTC_12x12_UNORM_SRGB -> gpu_textureformat_astc_12x12_unorm_srgb
  | GPU_TEXTUREFORMAT_ASTC_4x4_FLOAT -> gpu_textureformat_astc_4x4_float
  | GPU_TEXTUREFORMAT_ASTC_5x4_FLOAT -> gpu_textureformat_astc_5x4_float
  | GPU_TEXTUREFORMAT_ASTC_5x5_FLOAT -> gpu_textureformat_astc_5x5_float
  | GPU_TEXTUREFORMAT_ASTC_6x5_FLOAT -> gpu_textureformat_astc_6x5_float
  | GPU_TEXTUREFORMAT_ASTC_6x6_FLOAT -> gpu_textureformat_astc_6x6_float
  | GPU_TEXTUREFORMAT_ASTC_8x5_FLOAT -> gpu_textureformat_astc_8x5_float
  | GPU_TEXTUREFORMAT_ASTC_8x6_FLOAT -> gpu_textureformat_astc_8x6_float
  | GPU_TEXTUREFORMAT_ASTC_8x8_FLOAT -> gpu_textureformat_astc_8x8_float
  | GPU_TEXTUREFORMAT_ASTC_10x5_FLOAT -> gpu_textureformat_astc_10x5_float
  | GPU_TEXTUREFORMAT_ASTC_10x6_FLOAT -> gpu_textureformat_astc_10x6_float
  | GPU_TEXTUREFORMAT_ASTC_10x8_FLOAT -> gpu_textureformat_astc_10x8_float
  | GPU_TEXTUREFORMAT_ASTC_10x10_FLOAT -> gpu_textureformat_astc_10x10_float
  | GPU_TEXTUREFORMAT_ASTC_12x10_FLOAT -> gpu_textureformat_astc_12x10_float
  | GPU_TEXTUREFORMAT_ASTC_12x12_FLOAT -> gpu_textureformat_astc_12x12_float

let gpu_texture_usage_flags = uint (* prim *)
type gpu_texture_type =
  | GPU_TEXTURETYPE_2D
  | GPU_TEXTURETYPE_2D_ARRAY
  | GPU_TEXTURETYPE_3D
  | GPU_TEXTURETYPE_CUBE
  | GPU_TEXTURETYPE_CUBE_ARRAY

type gpu_texture_type_enum = int
let gpu_texture_type = int

let gpu_texture_type_to_enum : gpu_texture_type -> gpu_texture_type_enum = function
  | GPU_TEXTURETYPE_2D -> gpu_texturetype_2_d
  | GPU_TEXTURETYPE_2D_ARRAY -> gpu_texturetype_2_d_array
  | GPU_TEXTURETYPE_3D -> gpu_texturetype_3_d
  | GPU_TEXTURETYPE_CUBE -> gpu_texturetype_cube
  | GPU_TEXTURETYPE_CUBE_ARRAY -> gpu_texturetype_cube_array

type gpu_sample_count =
  | GPU_SAMPLECOUNT_1
  | GPU_SAMPLECOUNT_2
  | GPU_SAMPLECOUNT_4
  | GPU_SAMPLECOUNT_8

type gpu_sample_count_enum = int
let gpu_sample_count = int

let gpu_sample_count_to_enum : gpu_sample_count -> gpu_sample_count_enum = function
  | GPU_SAMPLECOUNT_1 -> gpu_samplecount_1
  | GPU_SAMPLECOUNT_2 -> gpu_samplecount_2
  | GPU_SAMPLECOUNT_4 -> gpu_samplecount_4
  | GPU_SAMPLECOUNT_8 -> gpu_samplecount_8

type gpu_cube_map_face =
  | GPU_CUBEMAPFACE_POSITIVEX
  | GPU_CUBEMAPFACE_NEGATIVEX
  | GPU_CUBEMAPFACE_POSITIVEY
  | GPU_CUBEMAPFACE_NEGATIVEY
  | GPU_CUBEMAPFACE_POSITIVEZ
  | GPU_CUBEMAPFACE_NEGATIVEZ

type gpu_cube_map_face_enum = int
let gpu_cube_map_face = int

let gpu_cube_map_face_to_enum : gpu_cube_map_face -> gpu_cube_map_face_enum = function
  | GPU_CUBEMAPFACE_POSITIVEX -> gpu_cubemapface_positivex
  | GPU_CUBEMAPFACE_NEGATIVEX -> gpu_cubemapface_negativex
  | GPU_CUBEMAPFACE_POSITIVEY -> gpu_cubemapface_positivey
  | GPU_CUBEMAPFACE_NEGATIVEY -> gpu_cubemapface_negativey
  | GPU_CUBEMAPFACE_POSITIVEZ -> gpu_cubemapface_positivez
  | GPU_CUBEMAPFACE_NEGATIVEZ -> gpu_cubemapface_negativez

let gpu_buffer_usage_flags = uint (* prim *)
type gpu_transfer_buffer_usage =
  | GPU_TRANSFERBUFFERUSAGE_UPLOAD
  | GPU_TRANSFERBUFFERUSAGE_DOWNLOAD

type gpu_transfer_buffer_usage_enum = int
let gpu_transfer_buffer_usage = int

let gpu_transfer_buffer_usage_to_enum : gpu_transfer_buffer_usage -> gpu_transfer_buffer_usage_enum = function
  | GPU_TRANSFERBUFFERUSAGE_UPLOAD -> gpu_transferbufferusage_upload
  | GPU_TRANSFERBUFFERUSAGE_DOWNLOAD -> gpu_transferbufferusage_download

type gpu_shader_stage =
  | GPU_SHADERSTAGE_VERTEX
  | GPU_SHADERSTAGE_FRAGMENT

type gpu_shader_stage_enum = int
let gpu_shader_stage = int

let gpu_shader_stage_to_enum : gpu_shader_stage -> gpu_shader_stage_enum = function
  | GPU_SHADERSTAGE_VERTEX -> gpu_shaderstage_vertex
  | GPU_SHADERSTAGE_FRAGMENT -> gpu_shaderstage_fragment

let gpu_shader_format = uint (* prim *)
type gpu_vertex_element_format =
  | GPU_VERTEXELEMENTFORMAT_INVALID
  | GPU_VERTEXELEMENTFORMAT_INT
  | GPU_VERTEXELEMENTFORMAT_INT2
  | GPU_VERTEXELEMENTFORMAT_INT3
  | GPU_VERTEXELEMENTFORMAT_INT4
  | GPU_VERTEXELEMENTFORMAT_UINT
  | GPU_VERTEXELEMENTFORMAT_UINT2
  | GPU_VERTEXELEMENTFORMAT_UINT3
  | GPU_VERTEXELEMENTFORMAT_UINT4
  | GPU_VERTEXELEMENTFORMAT_FLOAT
  | GPU_VERTEXELEMENTFORMAT_FLOAT2
  | GPU_VERTEXELEMENTFORMAT_FLOAT3
  | GPU_VERTEXELEMENTFORMAT_FLOAT4
  | GPU_VERTEXELEMENTFORMAT_BYTE2
  | GPU_VERTEXELEMENTFORMAT_BYTE4
  | GPU_VERTEXELEMENTFORMAT_UBYTE2
  | GPU_VERTEXELEMENTFORMAT_UBYTE4
  | GPU_VERTEXELEMENTFORMAT_BYTE2_NORM
  | GPU_VERTEXELEMENTFORMAT_BYTE4_NORM
  | GPU_VERTEXELEMENTFORMAT_UBYTE2_NORM
  | GPU_VERTEXELEMENTFORMAT_UBYTE4_NORM
  | GPU_VERTEXELEMENTFORMAT_SHORT2
  | GPU_VERTEXELEMENTFORMAT_SHORT4
  | GPU_VERTEXELEMENTFORMAT_USHORT2
  | GPU_VERTEXELEMENTFORMAT_USHORT4
  | GPU_VERTEXELEMENTFORMAT_SHORT2_NORM
  | GPU_VERTEXELEMENTFORMAT_SHORT4_NORM
  | GPU_VERTEXELEMENTFORMAT_USHORT2_NORM
  | GPU_VERTEXELEMENTFORMAT_USHORT4_NORM
  | GPU_VERTEXELEMENTFORMAT_HALF2
  | GPU_VERTEXELEMENTFORMAT_HALF4

type gpu_vertex_element_format_enum = int
let gpu_vertex_element_format = int

let gpu_vertex_element_format_to_enum : gpu_vertex_element_format -> gpu_vertex_element_format_enum = function
  | GPU_VERTEXELEMENTFORMAT_INVALID -> gpu_vertexelementformat_invalid
  | GPU_VERTEXELEMENTFORMAT_INT -> gpu_vertexelementformat_int
  | GPU_VERTEXELEMENTFORMAT_INT2 -> gpu_vertexelementformat_int2
  | GPU_VERTEXELEMENTFORMAT_INT3 -> gpu_vertexelementformat_int3
  | GPU_VERTEXELEMENTFORMAT_INT4 -> gpu_vertexelementformat_int4
  | GPU_VERTEXELEMENTFORMAT_UINT -> gpu_vertexelementformat_uint
  | GPU_VERTEXELEMENTFORMAT_UINT2 -> gpu_vertexelementformat_uint2
  | GPU_VERTEXELEMENTFORMAT_UINT3 -> gpu_vertexelementformat_uint3
  | GPU_VERTEXELEMENTFORMAT_UINT4 -> gpu_vertexelementformat_uint4
  | GPU_VERTEXELEMENTFORMAT_FLOAT -> gpu_vertexelementformat_float
  | GPU_VERTEXELEMENTFORMAT_FLOAT2 -> gpu_vertexelementformat_float2
  | GPU_VERTEXELEMENTFORMAT_FLOAT3 -> gpu_vertexelementformat_float3
  | GPU_VERTEXELEMENTFORMAT_FLOAT4 -> gpu_vertexelementformat_float4
  | GPU_VERTEXELEMENTFORMAT_BYTE2 -> gpu_vertexelementformat_byte2
  | GPU_VERTEXELEMENTFORMAT_BYTE4 -> gpu_vertexelementformat_byte4
  | GPU_VERTEXELEMENTFORMAT_UBYTE2 -> gpu_vertexelementformat_ubyte2
  | GPU_VERTEXELEMENTFORMAT_UBYTE4 -> gpu_vertexelementformat_ubyte4
  | GPU_VERTEXELEMENTFORMAT_BYTE2_NORM -> gpu_vertexelementformat_byte2_norm
  | GPU_VERTEXELEMENTFORMAT_BYTE4_NORM -> gpu_vertexelementformat_byte4_norm
  | GPU_VERTEXELEMENTFORMAT_UBYTE2_NORM -> gpu_vertexelementformat_ubyte2_norm
  | GPU_VERTEXELEMENTFORMAT_UBYTE4_NORM -> gpu_vertexelementformat_ubyte4_norm
  | GPU_VERTEXELEMENTFORMAT_SHORT2 -> gpu_vertexelementformat_short2
  | GPU_VERTEXELEMENTFORMAT_SHORT4 -> gpu_vertexelementformat_short4
  | GPU_VERTEXELEMENTFORMAT_USHORT2 -> gpu_vertexelementformat_ushort2
  | GPU_VERTEXELEMENTFORMAT_USHORT4 -> gpu_vertexelementformat_ushort4
  | GPU_VERTEXELEMENTFORMAT_SHORT2_NORM -> gpu_vertexelementformat_short2_norm
  | GPU_VERTEXELEMENTFORMAT_SHORT4_NORM -> gpu_vertexelementformat_short4_norm
  | GPU_VERTEXELEMENTFORMAT_USHORT2_NORM -> gpu_vertexelementformat_ushort2_norm
  | GPU_VERTEXELEMENTFORMAT_USHORT4_NORM -> gpu_vertexelementformat_ushort4_norm
  | GPU_VERTEXELEMENTFORMAT_HALF2 -> gpu_vertexelementformat_half2
  | GPU_VERTEXELEMENTFORMAT_HALF4 -> gpu_vertexelementformat_half4

type gpu_vertex_input_rate =
  | GPU_VERTEXINPUTRATE_VERTEX
  | GPU_VERTEXINPUTRATE_INSTANCE

type gpu_vertex_input_rate_enum = int
let gpu_vertex_input_rate = int

let gpu_vertex_input_rate_to_enum : gpu_vertex_input_rate -> gpu_vertex_input_rate_enum = function
  | GPU_VERTEXINPUTRATE_VERTEX -> gpu_vertexinputrate_vertex
  | GPU_VERTEXINPUTRATE_INSTANCE -> gpu_vertexinputrate_instance

type gpu_fill_mode =
  | GPU_FILLMODE_FILL
  | GPU_FILLMODE_LINE

type gpu_fill_mode_enum = int
let gpu_fill_mode = int

let gpu_fill_mode_to_enum : gpu_fill_mode -> gpu_fill_mode_enum = function
  | GPU_FILLMODE_FILL -> gpu_fillmode_fill
  | GPU_FILLMODE_LINE -> gpu_fillmode_line

type gpu_cull_mode =
  | GPU_CULLMODE_NONE
  | GPU_CULLMODE_FRONT
  | GPU_CULLMODE_BACK

type gpu_cull_mode_enum = int
let gpu_cull_mode = int

let gpu_cull_mode_to_enum : gpu_cull_mode -> gpu_cull_mode_enum = function
  | GPU_CULLMODE_NONE -> gpu_cullmode_none
  | GPU_CULLMODE_FRONT -> gpu_cullmode_front
  | GPU_CULLMODE_BACK -> gpu_cullmode_back

type gpu_front_face =
  | GPU_FRONTFACE_COUNTER_CLOCKWISE
  | GPU_FRONTFACE_CLOCKWISE

type gpu_front_face_enum = int
let gpu_front_face = int

let gpu_front_face_to_enum : gpu_front_face -> gpu_front_face_enum = function
  | GPU_FRONTFACE_COUNTER_CLOCKWISE -> gpu_frontface_counter_clockwise
  | GPU_FRONTFACE_CLOCKWISE -> gpu_frontface_clockwise

type gpu_compare_op =
  | GPU_COMPAREOP_INVALID
  | GPU_COMPAREOP_NEVER
  | GPU_COMPAREOP_LESS
  | GPU_COMPAREOP_EQUAL
  | GPU_COMPAREOP_LESS_OR_EQUAL
  | GPU_COMPAREOP_GREATER
  | GPU_COMPAREOP_NOT_EQUAL
  | GPU_COMPAREOP_GREATER_OR_EQUAL
  | GPU_COMPAREOP_ALWAYS

type gpu_compare_op_enum = int
let gpu_compare_op = int

let gpu_compare_op_to_enum : gpu_compare_op -> gpu_compare_op_enum = function
  | GPU_COMPAREOP_INVALID -> gpu_compareop_invalid
  | GPU_COMPAREOP_NEVER -> gpu_compareop_never
  | GPU_COMPAREOP_LESS -> gpu_compareop_less
  | GPU_COMPAREOP_EQUAL -> gpu_compareop_equal
  | GPU_COMPAREOP_LESS_OR_EQUAL -> gpu_compareop_less_or_equal
  | GPU_COMPAREOP_GREATER -> gpu_compareop_greater
  | GPU_COMPAREOP_NOT_EQUAL -> gpu_compareop_not_equal
  | GPU_COMPAREOP_GREATER_OR_EQUAL -> gpu_compareop_greater_or_equal
  | GPU_COMPAREOP_ALWAYS -> gpu_compareop_always

type gpu_stencil_op =
  | GPU_STENCILOP_INVALID
  | GPU_STENCILOP_KEEP
  | GPU_STENCILOP_ZERO
  | GPU_STENCILOP_REPLACE
  | GPU_STENCILOP_INCREMENT_AND_CLAMP
  | GPU_STENCILOP_DECREMENT_AND_CLAMP
  | GPU_STENCILOP_INVERT
  | GPU_STENCILOP_INCREMENT_AND_WRAP
  | GPU_STENCILOP_DECREMENT_AND_WRAP

type gpu_stencil_op_enum = int
let gpu_stencil_op = int

let gpu_stencil_op_to_enum : gpu_stencil_op -> gpu_stencil_op_enum = function
  | GPU_STENCILOP_INVALID -> gpu_stencilop_invalid
  | GPU_STENCILOP_KEEP -> gpu_stencilop_keep
  | GPU_STENCILOP_ZERO -> gpu_stencilop_zero
  | GPU_STENCILOP_REPLACE -> gpu_stencilop_replace
  | GPU_STENCILOP_INCREMENT_AND_CLAMP -> gpu_stencilop_increment_and_clamp
  | GPU_STENCILOP_DECREMENT_AND_CLAMP -> gpu_stencilop_decrement_and_clamp
  | GPU_STENCILOP_INVERT -> gpu_stencilop_invert
  | GPU_STENCILOP_INCREMENT_AND_WRAP -> gpu_stencilop_increment_and_wrap
  | GPU_STENCILOP_DECREMENT_AND_WRAP -> gpu_stencilop_decrement_and_wrap

type gpu_blend_op =
  | GPU_BLENDOP_INVALID
  | GPU_BLENDOP_ADD
  | GPU_BLENDOP_SUBTRACT
  | GPU_BLENDOP_REVERSE_SUBTRACT
  | GPU_BLENDOP_MIN
  | GPU_BLENDOP_MAX

type gpu_blend_op_enum = int
let gpu_blend_op = int

let gpu_blend_op_to_enum : gpu_blend_op -> gpu_blend_op_enum = function
  | GPU_BLENDOP_INVALID -> gpu_blendop_invalid
  | GPU_BLENDOP_ADD -> gpu_blendop_add
  | GPU_BLENDOP_SUBTRACT -> gpu_blendop_subtract
  | GPU_BLENDOP_REVERSE_SUBTRACT -> gpu_blendop_reverse_subtract
  | GPU_BLENDOP_MIN -> gpu_blendop_min
  | GPU_BLENDOP_MAX -> gpu_blendop_max

type gpu_blend_factor =
  | GPU_BLENDFACTOR_INVALID
  | GPU_BLENDFACTOR_ZERO
  | GPU_BLENDFACTOR_ONE
  | GPU_BLENDFACTOR_SRC_COLOR
  | GPU_BLENDFACTOR_ONE_MINUS_SRC_COLOR
  | GPU_BLENDFACTOR_DST_COLOR
  | GPU_BLENDFACTOR_ONE_MINUS_DST_COLOR
  | GPU_BLENDFACTOR_SRC_ALPHA
  | GPU_BLENDFACTOR_ONE_MINUS_SRC_ALPHA
  | GPU_BLENDFACTOR_DST_ALPHA
  | GPU_BLENDFACTOR_ONE_MINUS_DST_ALPHA
  | GPU_BLENDFACTOR_CONSTANT_COLOR
  | GPU_BLENDFACTOR_ONE_MINUS_CONSTANT_COLOR
  | GPU_BLENDFACTOR_SRC_ALPHA_SATURATE

type gpu_blend_factor_enum = int
let gpu_blend_factor = int

let gpu_blend_factor_to_enum : gpu_blend_factor -> gpu_blend_factor_enum = function
  | GPU_BLENDFACTOR_INVALID -> gpu_blendfactor_invalid
  | GPU_BLENDFACTOR_ZERO -> gpu_blendfactor_zero
  | GPU_BLENDFACTOR_ONE -> gpu_blendfactor_one
  | GPU_BLENDFACTOR_SRC_COLOR -> gpu_blendfactor_src_color
  | GPU_BLENDFACTOR_ONE_MINUS_SRC_COLOR -> gpu_blendfactor_one_minus_src_color
  | GPU_BLENDFACTOR_DST_COLOR -> gpu_blendfactor_dst_color
  | GPU_BLENDFACTOR_ONE_MINUS_DST_COLOR -> gpu_blendfactor_one_minus_dst_color
  | GPU_BLENDFACTOR_SRC_ALPHA -> gpu_blendfactor_src_alpha
  | GPU_BLENDFACTOR_ONE_MINUS_SRC_ALPHA -> gpu_blendfactor_one_minus_src_alpha
  | GPU_BLENDFACTOR_DST_ALPHA -> gpu_blendfactor_dst_alpha
  | GPU_BLENDFACTOR_ONE_MINUS_DST_ALPHA -> gpu_blendfactor_one_minus_dst_alpha
  | GPU_BLENDFACTOR_CONSTANT_COLOR -> gpu_blendfactor_constant_color
  | GPU_BLENDFACTOR_ONE_MINUS_CONSTANT_COLOR -> gpu_blendfactor_one_minus_constant_color
  | GPU_BLENDFACTOR_SRC_ALPHA_SATURATE -> gpu_blendfactor_src_alpha_saturate

let gpu_color_component_flags = uchar (* prim *)
type gpu_filter =
  | GPU_FILTER_NEAREST
  | GPU_FILTER_LINEAR

type gpu_filter_enum = int
let gpu_filter = int

let gpu_filter_to_enum : gpu_filter -> gpu_filter_enum = function
  | GPU_FILTER_NEAREST -> gpu_filter_nearest
  | GPU_FILTER_LINEAR -> gpu_filter_linear

type gpu_sampler_mipmap_mode =
  | GPU_SAMPLERMIPMAPMODE_NEAREST
  | GPU_SAMPLERMIPMAPMODE_LINEAR

type gpu_sampler_mipmap_mode_enum = int
let gpu_sampler_mipmap_mode = int

let gpu_sampler_mipmap_mode_to_enum : gpu_sampler_mipmap_mode -> gpu_sampler_mipmap_mode_enum = function
  | GPU_SAMPLERMIPMAPMODE_NEAREST -> gpu_samplermipmapmode_nearest
  | GPU_SAMPLERMIPMAPMODE_LINEAR -> gpu_samplermipmapmode_linear

type gpu_sampler_address_mode =
  | GPU_SAMPLERADDRESSMODE_REPEAT
  | GPU_SAMPLERADDRESSMODE_MIRRORED_REPEAT
  | GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE

type gpu_sampler_address_mode_enum = int
let gpu_sampler_address_mode = int

let gpu_sampler_address_mode_to_enum : gpu_sampler_address_mode -> gpu_sampler_address_mode_enum = function
  | GPU_SAMPLERADDRESSMODE_REPEAT -> gpu_sampleraddressmode_repeat
  | GPU_SAMPLERADDRESSMODE_MIRRORED_REPEAT -> gpu_sampleraddressmode_mirrored_repeat
  | GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE -> gpu_sampleraddressmode_clamp_to_edge

type gpu_present_mode =
  | GPU_PRESENTMODE_VSYNC
  | GPU_PRESENTMODE_IMMEDIATE
  | GPU_PRESENTMODE_MAILBOX

type gpu_present_mode_enum = int
let gpu_present_mode = int

let gpu_present_mode_to_enum : gpu_present_mode -> gpu_present_mode_enum = function
  | GPU_PRESENTMODE_VSYNC -> gpu_presentmode_vsync
  | GPU_PRESENTMODE_IMMEDIATE -> gpu_presentmode_immediate
  | GPU_PRESENTMODE_MAILBOX -> gpu_presentmode_mailbox

type gpu_swapchain_composition =
  | GPU_SWAPCHAINCOMPOSITION_SDR
  | GPU_SWAPCHAINCOMPOSITION_SDR_LINEAR
  | GPU_SWAPCHAINCOMPOSITION_HDR_EXTENDED_LINEAR
  | GPU_SWAPCHAINCOMPOSITION_HDR10_ST2084

type gpu_swapchain_composition_enum = int
let gpu_swapchain_composition = int

let gpu_swapchain_composition_to_enum : gpu_swapchain_composition -> gpu_swapchain_composition_enum = function
  | GPU_SWAPCHAINCOMPOSITION_SDR -> gpu_swapchaincomposition_sdr
  | GPU_SWAPCHAINCOMPOSITION_SDR_LINEAR -> gpu_swapchaincomposition_sdr_linear
  | GPU_SWAPCHAINCOMPOSITION_HDR_EXTENDED_LINEAR -> gpu_swapchaincomposition_hdr_extended_linear
  | GPU_SWAPCHAINCOMPOSITION_HDR10_ST2084 -> gpu_swapchaincomposition_hdr10_st2084

module GPUViewport = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GPUViewport"
  let x = field t "x" float
  let y = field t "y" float
  let w = field t "w" float
  let h = field t "h" float
  let min_depth = field t "min_depth" float
  let max_depth = field t "max_depth" float
  let () = seal t
end
type gpu_viewport = GPUViewport.t
let gpu_viewport = GPUViewport.t


module GPUTextureTransferInfo = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GPUTextureTransferInfo"
  let transfer_buffer = field t "transfer_buffer" gpu_transfer_buffer
  let offset = field t "offset" int_as_uint
  let pixels_per_row = field t "pixels_per_row" int_as_uint
  let rows_per_layer = field t "rows_per_layer" int_as_uint
  let () = seal t
end
type gpu_texture_transfer_info = GPUTextureTransferInfo.t
let gpu_texture_transfer_info = GPUTextureTransferInfo.t


module GPUTransferBufferLocation = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GPUTransferBufferLocation"
  let transfer_buffer = field t "transfer_buffer" gpu_transfer_buffer
  let offset = field t "offset" int_as_uint
  let () = seal t
end
type gpu_transfer_buffer_location = GPUTransferBufferLocation.t
let gpu_transfer_buffer_location = GPUTransferBufferLocation.t


module GPUTextureLocation = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GPUTextureLocation"
  let texture = field t "texture" gpu_texture
  let mip_level = field t "mip_level" int_as_uint
  let layer = field t "layer" int_as_uint
  let x = field t "x" int_as_uint
  let y = field t "y" int_as_uint
  let z = field t "z" int_as_uint
  let () = seal t
end
type gpu_texture_location = GPUTextureLocation.t
let gpu_texture_location = GPUTextureLocation.t


module GPUTextureRegion = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GPUTextureRegion"
  let texture = field t "texture" gpu_texture
  let mip_level = field t "mip_level" int_as_uint
  let layer = field t "layer" int_as_uint
  let x = field t "x" int_as_uint
  let y = field t "y" int_as_uint
  let z = field t "z" int_as_uint
  let w = field t "w" int_as_uint
  let h = field t "h" int_as_uint
  let d = field t "d" int_as_uint
  let () = seal t
end
type gpu_texture_region = GPUTextureRegion.t
let gpu_texture_region = GPUTextureRegion.t


module GPUBlitRegion = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GPUBlitRegion"
  let texture = field t "texture" gpu_texture
  let mip_level = field t "mip_level" int_as_uint
  let layer_or_depth_plane = field t "layer_or_depth_plane" int_as_uint
  let x = field t "x" int_as_uint
  let y = field t "y" int_as_uint
  let w = field t "w" int_as_uint
  let h = field t "h" int_as_uint
  let () = seal t
end
type gpu_blit_region = GPUBlitRegion.t
let gpu_blit_region = GPUBlitRegion.t


module GPUBufferLocation = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GPUBufferLocation"
  let buffer = field t "buffer" gpu_buffer
  let offset = field t "offset" int_as_uint
  let () = seal t
end
type gpu_buffer_location = GPUBufferLocation.t
let gpu_buffer_location = GPUBufferLocation.t


module GPUBufferRegion = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GPUBufferRegion"
  let buffer = field t "buffer" gpu_buffer
  let offset = field t "offset" int_as_uint
  let size = field t "size" int_as_uint
  let () = seal t
end
type gpu_buffer_region = GPUBufferRegion.t
let gpu_buffer_region = GPUBufferRegion.t


module GPUIndirectDrawCommand = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GPUIndirectDrawCommand"
  let num_vertices = field t "num_vertices" int_as_uint
  let num_instances = field t "num_instances" int_as_uint
  let first_vertex = field t "first_vertex" int_as_uint
  let first_instance = field t "first_instance" int_as_uint
  let () = seal t
end
type gpu_indirect_draw_command = GPUIndirectDrawCommand.t
let gpu_indirect_draw_command = GPUIndirectDrawCommand.t


module GPUIndexedIndirectDrawCommand = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GPUIndexedIndirectDrawCommand"
  let num_indices = field t "num_indices" int_as_uint
  let num_instances = field t "num_instances" int_as_uint
  let first_index = field t "first_index" int_as_uint
  let vertex_offset = field t "vertex_offset" sint32
  let first_instance = field t "first_instance" int_as_uint
  let () = seal t
end
type gpu_indexed_indirect_draw_command = GPUIndexedIndirectDrawCommand.t
let gpu_indexed_indirect_draw_command = GPUIndexedIndirectDrawCommand.t


module GPUIndirectDispatchCommand = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GPUIndirectDispatchCommand"
  let groupcount_x = field t "groupcount_x" int_as_uint
  let groupcount_y = field t "groupcount_y" int_as_uint
  let groupcount_z = field t "groupcount_z" int_as_uint
  let () = seal t
end
type gpu_indirect_dispatch_command = GPUIndirectDispatchCommand.t
let gpu_indirect_dispatch_command = GPUIndirectDispatchCommand.t


module GPUSamplerCreateInfo = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GPUSamplerCreateInfo"
  let min_filter = field t "min_filter" gpu_filter
  let mag_filter = field t "mag_filter" gpu_filter
  let mipmap_mode = field t "mipmap_mode" gpu_sampler_mipmap_mode
  let address_mode_u = field t "address_mode_u" gpu_sampler_address_mode
  let address_mode_v = field t "address_mode_v" gpu_sampler_address_mode
  let address_mode_w = field t "address_mode_w" gpu_sampler_address_mode
  let mip_lod_bias = field t "mip_lod_bias" float
  let max_anisotropy = field t "max_anisotropy" float
  let compare_op = field t "compare_op" gpu_compare_op
  let min_lod = field t "min_lod" float
  let max_lod = field t "max_lod" float
  let enable_anisotropy = field t "enable_anisotropy" bool
  let enable_compare = field t "enable_compare" bool
  let padding1 = field t "padding1" uint8
  let padding2 = field t "padding2" uint8
  let props = field t "props" properties_id
  let () = seal t
end
type gpu_sampler_create_info = GPUSamplerCreateInfo.t
let gpu_sampler_create_info = GPUSamplerCreateInfo.t


module GPUVertexBufferDescription = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GPUVertexBufferDescription"
  let slot = field t "slot" int_as_uint
  let pitch = field t "pitch" int_as_uint
  let input_rate = field t "input_rate" gpu_vertex_input_rate
  let instance_step_rate = field t "instance_step_rate" int_as_uint
  let () = seal t
end
type gpu_vertex_buffer_description = GPUVertexBufferDescription.t
let gpu_vertex_buffer_description = GPUVertexBufferDescription.t


module GPUVertexAttribute = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GPUVertexAttribute"
  let location = field t "location" int_as_uint
  let buffer_slot = field t "buffer_slot" int_as_uint
  let format = field t "format" gpu_vertex_element_format
  let offset = field t "offset" int_as_uint
  let () = seal t
end
type gpu_vertex_attribute = GPUVertexAttribute.t
let gpu_vertex_attribute = GPUVertexAttribute.t


module GPUVertexInputState = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GPUVertexInputState"
  let vertex_buffer_descriptions = field t "vertex_buffer_descriptions" (ptr gpu_vertex_buffer_description)
  let num_vertex_buffers = field t "num_vertex_buffers" int_as_uint
  let vertex_attributes = field t "vertex_attributes" (ptr gpu_vertex_attribute)
  let num_vertex_attributes = field t "num_vertex_attributes" int_as_uint
  let () = seal t
end
type gpu_vertex_input_state = GPUVertexInputState.t
let gpu_vertex_input_state = GPUVertexInputState.t


module GPUStencilOpState = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GPUStencilOpState"
  let fail_op = field t "fail_op" gpu_stencil_op
  let pass_op = field t "pass_op" gpu_stencil_op
  let depth_fail_op = field t "depth_fail_op" gpu_stencil_op
  let compare_op = field t "compare_op" gpu_compare_op
  let () = seal t
end
type gpu_stencil_op_state = GPUStencilOpState.t
let gpu_stencil_op_state = GPUStencilOpState.t


module GPUColorTargetBlendState = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GPUColorTargetBlendState"
  let src_color_blendfactor = field t "src_color_blendfactor" gpu_blend_factor
  let dst_color_blendfactor = field t "dst_color_blendfactor" gpu_blend_factor
  let color_blend_op = field t "color_blend_op" gpu_blend_op
  let src_alpha_blendfactor = field t "src_alpha_blendfactor" gpu_blend_factor
  let dst_alpha_blendfactor = field t "dst_alpha_blendfactor" gpu_blend_factor
  let alpha_blend_op = field t "alpha_blend_op" gpu_blend_op
  let color_write_mask = field t "color_write_mask" gpu_color_component_flags
  let enable_blend = field t "enable_blend" bool
  let enable_color_write_mask = field t "enable_color_write_mask" bool
  let padding1 = field t "padding1" uint8
  let padding2 = field t "padding2" uint8
  let () = seal t
end
type gpu_color_target_blend_state = GPUColorTargetBlendState.t
let gpu_color_target_blend_state = GPUColorTargetBlendState.t


module GPUShaderCreateInfo = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GPUShaderCreateInfo"
  let code_size = field t "code_size" size_t
  let code = field t "code" (ptr uint8)
  let entrypoint = field t "entrypoint" string
  let format = field t "format" gpu_shader_format
  let stage = field t "stage" gpu_shader_stage
  let num_samplers = field t "num_samplers" int_as_uint
  let num_storage_textures = field t "num_storage_textures" int_as_uint
  let num_storage_buffers = field t "num_storage_buffers" int_as_uint
  let num_uniform_buffers = field t "num_uniform_buffers" int_as_uint
  let props = field t "props" properties_id
  let () = seal t
end
type gpu_shader_create_info = GPUShaderCreateInfo.t
let gpu_shader_create_info = GPUShaderCreateInfo.t


module GPUTextureCreateInfo = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GPUTextureCreateInfo"
  let typ = field t "type" gpu_texture_type
  let format = field t "format" gpu_texture_format
  let usage = field t "usage" gpu_texture_usage_flags
  let width = field t "width" int_as_uint
  let height = field t "height" int_as_uint
  let layer_count_or_depth = field t "layer_count_or_depth" int_as_uint
  let num_levels = field t "num_levels" int_as_uint
  let sample_count = field t "sample_count" gpu_sample_count
  let props = field t "props" properties_id
  let () = seal t
end
type gpu_texture_create_info = GPUTextureCreateInfo.t
let gpu_texture_create_info = GPUTextureCreateInfo.t


module GPUBufferCreateInfo = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GPUBufferCreateInfo"
  let usage = field t "usage" gpu_buffer_usage_flags
  let size = field t "size" int_as_uint
  let props = field t "props" properties_id
  let () = seal t
end
type gpu_buffer_create_info = GPUBufferCreateInfo.t
let gpu_buffer_create_info = GPUBufferCreateInfo.t


module GPUTransferBufferCreateInfo = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GPUTransferBufferCreateInfo"
  let usage = field t "usage" gpu_transfer_buffer_usage
  let size = field t "size" int_as_uint
  let props = field t "props" properties_id
  let () = seal t
end
type gpu_transfer_buffer_create_info = GPUTransferBufferCreateInfo.t
let gpu_transfer_buffer_create_info = GPUTransferBufferCreateInfo.t


module GPURasterizerState = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GPURasterizerState"
  let fill_mode = field t "fill_mode" gpu_fill_mode
  let cull_mode = field t "cull_mode" gpu_cull_mode
  let front_face = field t "front_face" gpu_front_face
  let depth_bias_constant_factor = field t "depth_bias_constant_factor" float
  let depth_bias_clamp = field t "depth_bias_clamp" float
  let depth_bias_slope_factor = field t "depth_bias_slope_factor" float
  let enable_depth_bias = field t "enable_depth_bias" bool
  let enable_depth_clip = field t "enable_depth_clip" bool
  let padding1 = field t "padding1" uint8
  let padding2 = field t "padding2" uint8
  let () = seal t
end
type gpu_rasterizer_state = GPURasterizerState.t
let gpu_rasterizer_state = GPURasterizerState.t


module GPUMultisampleState = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GPUMultisampleState"
  let sample_count = field t "sample_count" gpu_sample_count
  let sample_mask = field t "sample_mask" int_as_uint
  let enable_mask = field t "enable_mask" bool
  let enable_alpha_to_coverage = field t "enable_alpha_to_coverage" bool
  let padding2 = field t "padding2" uint8
  let padding3 = field t "padding3" uint8
  let () = seal t
end
type gpu_multisample_state = GPUMultisampleState.t
let gpu_multisample_state = GPUMultisampleState.t


module GPUDepthStencilState = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GPUDepthStencilState"
  let compare_op = field t "compare_op" gpu_compare_op
  let back_stencil_state = field t "back_stencil_state" gpu_stencil_op_state
  let front_stencil_state = field t "front_stencil_state" gpu_stencil_op_state
  let compare_mask = field t "compare_mask" uint8
  let write_mask = field t "write_mask" uint8
  let enable_depth_test = field t "enable_depth_test" bool
  let enable_depth_write = field t "enable_depth_write" bool
  let enable_stencil_test = field t "enable_stencil_test" bool
  let padding1 = field t "padding1" uint8
  let padding2 = field t "padding2" uint8
  let padding3 = field t "padding3" uint8
  let () = seal t
end
type gpu_depth_stencil_state = GPUDepthStencilState.t
let gpu_depth_stencil_state = GPUDepthStencilState.t


module GPUColorTargetDescription = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GPUColorTargetDescription"
  let format = field t "format" gpu_texture_format
  let blend_state = field t "blend_state" gpu_color_target_blend_state
  let () = seal t
end
type gpu_color_target_description = GPUColorTargetDescription.t
let gpu_color_target_description = GPUColorTargetDescription.t


module GPUGraphicsPipelineTargetInfo = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GPUGraphicsPipelineTargetInfo"
  let color_target_descriptions = field t "color_target_descriptions" (ptr gpu_color_target_description)
  let num_color_targets = field t "num_color_targets" int_as_uint
  let depth_stencil_format = field t "depth_stencil_format" gpu_texture_format
  let has_depth_stencil_target = field t "has_depth_stencil_target" bool
  let padding1 = field t "padding1" uint8
  let padding2 = field t "padding2" uint8
  let padding3 = field t "padding3" uint8
  let () = seal t
end
type gpu_graphics_pipeline_target_info = GPUGraphicsPipelineTargetInfo.t
let gpu_graphics_pipeline_target_info = GPUGraphicsPipelineTargetInfo.t


module GPUGraphicsPipelineCreateInfo = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GPUGraphicsPipelineCreateInfo"
  let vertex_shader = field t "vertex_shader" gpu_shader
  let fragment_shader = field t "fragment_shader" gpu_shader
  let vertex_input_state = field t "vertex_input_state" gpu_vertex_input_state
  let primitive_type = field t "primitive_type" gpu_primitive_type
  let rasterizer_state = field t "rasterizer_state" gpu_rasterizer_state
  let multisample_state = field t "multisample_state" gpu_multisample_state
  let depth_stencil_state = field t "depth_stencil_state" gpu_depth_stencil_state
  let target_info = field t "target_info" gpu_graphics_pipeline_target_info
  let props = field t "props" properties_id
  let () = seal t
end
type gpu_graphics_pipeline_create_info = GPUGraphicsPipelineCreateInfo.t
let gpu_graphics_pipeline_create_info = GPUGraphicsPipelineCreateInfo.t


module GPUComputePipelineCreateInfo = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GPUComputePipelineCreateInfo"
  let code_size = field t "code_size" size_t
  let code = field t "code" (ptr uint8)
  let entrypoint = field t "entrypoint" string
  let format = field t "format" gpu_shader_format
  let num_samplers = field t "num_samplers" int_as_uint
  let num_readonly_storage_textures = field t "num_readonly_storage_textures" int_as_uint
  let num_readonly_storage_buffers = field t "num_readonly_storage_buffers" int_as_uint
  let num_readwrite_storage_textures = field t "num_readwrite_storage_textures" int_as_uint
  let num_readwrite_storage_buffers = field t "num_readwrite_storage_buffers" int_as_uint
  let num_uniform_buffers = field t "num_uniform_buffers" int_as_uint
  let threadcount_x = field t "threadcount_x" int_as_uint
  let threadcount_y = field t "threadcount_y" int_as_uint
  let threadcount_z = field t "threadcount_z" int_as_uint
  let props = field t "props" properties_id
  let () = seal t
end
type gpu_compute_pipeline_create_info = GPUComputePipelineCreateInfo.t
let gpu_compute_pipeline_create_info = GPUComputePipelineCreateInfo.t


module GPUColorTargetInfo = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GPUColorTargetInfo"
  let texture = field t "texture" gpu_texture
  let mip_level = field t "mip_level" int_as_uint
  let layer_or_depth_plane = field t "layer_or_depth_plane" int_as_uint
  let clear_color = field t "clear_color" f_color
  let load_op = field t "load_op" gpu_load_op
  let store_op = field t "store_op" gpu_store_op
  let resolve_texture = field t "resolve_texture" gpu_texture
  let resolve_mip_level = field t "resolve_mip_level" int_as_uint
  let resolve_layer = field t "resolve_layer" int_as_uint
  let cycle = field t "cycle" bool
  let cycle_resolve_texture = field t "cycle_resolve_texture" bool
  let padding1 = field t "padding1" uint8
  let padding2 = field t "padding2" uint8
  let () = seal t
end
type gpu_color_target_info = GPUColorTargetInfo.t
let gpu_color_target_info = GPUColorTargetInfo.t


module GPUDepthStencilTargetInfo = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GPUDepthStencilTargetInfo"
  let texture = field t "texture" gpu_texture
  let clear_depth = field t "clear_depth" float
  let load_op = field t "load_op" gpu_load_op
  let store_op = field t "store_op" gpu_store_op
  let stencil_load_op = field t "stencil_load_op" gpu_load_op
  let stencil_store_op = field t "stencil_store_op" gpu_store_op
  let cycle = field t "cycle" bool
  let clear_stencil = field t "clear_stencil" uint8
  let mip_level = field t "mip_level" uint8
  let layer = field t "layer" uint8
  let () = seal t
end
type gpu_depth_stencil_target_info = GPUDepthStencilTargetInfo.t
let gpu_depth_stencil_target_info = GPUDepthStencilTargetInfo.t


module GPUBlitInfo = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GPUBlitInfo"
  let source = field t "source" gpu_blit_region
  let destination = field t "destination" gpu_blit_region
  let load_op = field t "load_op" gpu_load_op
  let clear_color = field t "clear_color" f_color
  let flip_mode = field t "flip_mode" flip_mode
  let filter = field t "filter" gpu_filter
  let cycle = field t "cycle" bool
  let padding1 = field t "padding1" uint8
  let padding2 = field t "padding2" uint8
  let padding3 = field t "padding3" uint8
  let () = seal t
end
type gpu_blit_info = GPUBlitInfo.t
let gpu_blit_info = GPUBlitInfo.t


module GPUBufferBinding = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GPUBufferBinding"
  let buffer = field t "buffer" gpu_buffer
  let offset = field t "offset" int_as_uint
  let () = seal t
end
type gpu_buffer_binding = GPUBufferBinding.t
let gpu_buffer_binding = GPUBufferBinding.t


module GPUTextureSamplerBinding = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GPUTextureSamplerBinding"
  let texture = field t "texture" gpu_texture
  let sampler = field t "sampler" gpu_sampler
  let () = seal t
end
type gpu_texture_sampler_binding = GPUTextureSamplerBinding.t
let gpu_texture_sampler_binding = GPUTextureSamplerBinding.t


module GPUStorageBufferReadWriteBinding = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GPUStorageBufferReadWriteBinding"
  let buffer = field t "buffer" gpu_buffer
  let cycle = field t "cycle" bool
  let padding1 = field t "padding1" uint8
  let padding2 = field t "padding2" uint8
  let padding3 = field t "padding3" uint8
  let () = seal t
end
type gpu_storage_buffer_read_write_binding = GPUStorageBufferReadWriteBinding.t
let gpu_storage_buffer_read_write_binding = GPUStorageBufferReadWriteBinding.t


module GPUStorageTextureReadWriteBinding = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GPUStorageTextureReadWriteBinding"
  let texture = field t "texture" gpu_texture
  let mip_level = field t "mip_level" int_as_uint
  let layer = field t "layer" int_as_uint
  let cycle = field t "cycle" bool
  let padding1 = field t "padding1" uint8
  let padding2 = field t "padding2" uint8
  let padding3 = field t "padding3" uint8
  let () = seal t
end
type gpu_storage_texture_read_write_binding = GPUStorageTextureReadWriteBinding.t
let gpu_storage_texture_read_write_binding = GPUStorageTextureReadWriteBinding.t


module GPUVulkanOptions = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GPUVulkanOptions"
  let vulkan_api_version = field t "vulkan_api_version" int_as_uint
  let feature_list = field t "feature_list" (ptr void)
  let vulkan_10_physical_device_features = field t "vulkan_10_physical_device_features" (ptr void)
  let device_extension_count = field t "device_extension_count" int_as_uint
  let device_extension_names = field t "device_extension_names" (ptr string)
  let instance_extension_count = field t "instance_extension_count" int_as_uint
  let instance_extension_names = field t "instance_extension_names" (ptr string)
  let () = seal t
end
type gpu_vulkan_options = GPUVulkanOptions.t
let gpu_vulkan_options = GPUVulkanOptions.t



(* No definition (opaque struct) *)
type haptic = unit ptr
let haptic : haptic typ = ptr void
let haptic_opt : haptic option typ = ptr_opt void

let haptic_effect_type = ushort (* prim *)
let haptic_direction_type = uchar (* prim *)
let haptic_effect_id = int (* prim *)
module HapticDirection = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_HapticDirection"
  let typ = field t "type" haptic_direction_type
  let dir = field t "dir" (array 3 sint32)
  let () = seal t
end
type haptic_direction = HapticDirection.t
let haptic_direction = HapticDirection.t


module HapticConstant = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_HapticConstant"
  let typ = field t "type" haptic_effect_type
  let direction = field t "direction" haptic_direction
  let length = field t "length" int_as_uint
  let delay = field t "delay" uint16
  let button = field t "button" uint16
  let interval = field t "interval" uint16
  let level = field t "level" sint16
  let attack_length = field t "attack_length" uint16
  let attack_level = field t "attack_level" uint16
  let fade_length = field t "fade_length" uint16
  let fade_level = field t "fade_level" uint16
  let () = seal t
end
type haptic_constant = HapticConstant.t
let haptic_constant = HapticConstant.t


module HapticPeriodic = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_HapticPeriodic"
  let typ = field t "type" haptic_effect_type
  let direction = field t "direction" haptic_direction
  let length = field t "length" int_as_uint
  let delay = field t "delay" uint16
  let button = field t "button" uint16
  let interval = field t "interval" uint16
  let period = field t "period" uint16
  let magnitude = field t "magnitude" sint16
  let offset = field t "offset" sint16
  let phase = field t "phase" uint16
  let attack_length = field t "attack_length" uint16
  let attack_level = field t "attack_level" uint16
  let fade_length = field t "fade_length" uint16
  let fade_level = field t "fade_level" uint16
  let () = seal t
end
type haptic_periodic = HapticPeriodic.t
let haptic_periodic = HapticPeriodic.t


module HapticCondition = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_HapticCondition"
  let typ = field t "type" haptic_effect_type
  let direction = field t "direction" haptic_direction
  let length = field t "length" int_as_uint
  let delay = field t "delay" uint16
  let button = field t "button" uint16
  let interval = field t "interval" uint16
  let right_sat = field t "right_sat" (array 3 uint16)
  let left_sat = field t "left_sat" (array 3 uint16)
  let right_coeff = field t "right_coeff" (array 3 sint16)
  let left_coeff = field t "left_coeff" (array 3 sint16)
  let deadband = field t "deadband" (array 3 uint16)
  let center = field t "center" (array 3 sint16)
  let () = seal t
end
type haptic_condition = HapticCondition.t
let haptic_condition = HapticCondition.t


module HapticRamp = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_HapticRamp"
  let typ = field t "type" haptic_effect_type
  let direction = field t "direction" haptic_direction
  let length = field t "length" int_as_uint
  let delay = field t "delay" uint16
  let button = field t "button" uint16
  let interval = field t "interval" uint16
  let start = field t "start" sint16
  let end_ = field t "end" sint16
  let attack_length = field t "attack_length" uint16
  let attack_level = field t "attack_level" uint16
  let fade_length = field t "fade_length" uint16
  let fade_level = field t "fade_level" uint16
  let () = seal t
end
type haptic_ramp = HapticRamp.t
let haptic_ramp = HapticRamp.t


module HapticLeftRight = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_HapticLeftRight"
  let typ = field t "type" haptic_effect_type
  let length = field t "length" int_as_uint
  let large_magnitude = field t "large_magnitude" uint16
  let small_magnitude = field t "small_magnitude" uint16
  let () = seal t
end
type haptic_left_right = HapticLeftRight.t
let haptic_left_right = HapticLeftRight.t


module HapticCustom = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_HapticCustom"
  let typ = field t "type" haptic_effect_type
  let direction = field t "direction" haptic_direction
  let length = field t "length" int_as_uint
  let delay = field t "delay" uint16
  let button = field t "button" uint16
  let interval = field t "interval" uint16
  let channels = field t "channels" uint8
  let period = field t "period" uint16
  let samples = field t "samples" uint16
  let data = field t "data" (ptr uint16)
  let attack_length = field t "attack_length" uint16
  let attack_level = field t "attack_level" uint16
  let fade_length = field t "fade_length" uint16
  let fade_level = field t "fade_level" uint16
  let () = seal t
end
type haptic_custom = HapticCustom.t
let haptic_custom = HapticCustom.t


module HapticEffect = struct (* union 'SDL_HapticEffect' *)
  type _t
  type t = _t union
  let t : t typ = union "SDL_HapticEffect"
  let typ = field t "type" haptic_effect_type
  let constant = field t "constant" haptic_constant
  let periodic = field t "periodic" haptic_periodic
  let condition = field t "condition" haptic_condition
  let ramp = field t "ramp" haptic_ramp
  let leftright = field t "leftright" haptic_left_right
  let custom = field t "custom" haptic_custom
  let () = seal t
end
type haptic_effect = HapticEffect.t
let haptic_effect = HapticEffect.t


let haptic_id = uint (* prim *)

(* No definition (opaque struct) *)
type hid_device = unit ptr
let hid_device : hid_device typ = ptr void
let hid_device_opt : hid_device option typ = ptr_opt void

type hid_bus_type =
  | HID_API_BUS_UNKNOWN
  | HID_API_BUS_USB
  | HID_API_BUS_BLUETOOTH
  | HID_API_BUS_I2C
  | HID_API_BUS_SPI

type hid_bus_type_enum = int
let hid_bus_type = int

let hid_bus_type_to_enum : hid_bus_type -> hid_bus_type_enum = function
  | HID_API_BUS_UNKNOWN -> hid_api_bus_unknown
  | HID_API_BUS_USB -> hid_api_bus_usb
  | HID_API_BUS_BLUETOOTH -> hid_api_bus_bluetooth
  | HID_API_BUS_I2C -> hid_api_bus_i2_c
  | HID_API_BUS_SPI -> hid_api_bus_spi

module Hid_device_info = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_hid_device_info"
  let path = field t "path" string
  let vendor_id = field t "vendor_id" ushort
  let product_id = field t "product_id" ushort
  let serial_number = field t "serial_number" (ptr int32_t)
  let release_number = field t "release_number" ushort
  let manufacturer_string = field t "manufacturer_string" (ptr int32_t)
  let product_string = field t "product_string" (ptr int32_t)
  let usage_page = field t "usage_page" ushort
  let usage = field t "usage" ushort
  let interface_number = field t "interface_number" int
  let interface_class = field t "interface_class" int
  let interface_subclass = field t "interface_subclass" int
  let interface_protocol = field t "interface_protocol" int
  let bus_type = field t "bus_type" hid_bus_type
  let next = field t "next" (ptr t)
  let () = seal t
end
type hid_device_info = Hid_device_info.t
let hid_device_info = Hid_device_info.t


type hint_priority =
  | HINT_DEFAULT
  | HINT_NORMAL
  | HINT_OVERRIDE

type hint_priority_enum = int
let hint_priority = int

let hint_priority_to_enum : hint_priority -> hint_priority_enum = function
  | HINT_DEFAULT -> hint_default
  | HINT_NORMAL -> hint_normal
  | HINT_OVERRIDE -> hint_override

let hint_callback = funptr (ptr void @-> string @-> string @-> string @-> returning void)
let init_flags = uint (* prim *)
type app_result =
  | APP_CONTINUE
  | APP_SUCCESS
  | APP_FAILURE

type app_result_enum = int
let app_result = int

let app_result_to_enum : app_result -> app_result_enum = function
  | APP_CONTINUE -> app_continue
  | APP_SUCCESS -> app_success
  | APP_FAILURE -> app_failure

let app_init_func = funptr (ptr (ptr void) @-> int @-> ptr string @-> returning app_result)
let app_iterate_func = funptr (ptr void @-> returning app_result)
let app_event_func = funptr (ptr void @-> event @-> returning app_result)
let app_quit_func = funptr (ptr void @-> app_result @-> returning void)
let main_thread_callback = funptr (ptr void @-> returning void)

(* No definition (opaque struct) *)
type shared_object = unit ptr
let shared_object : shared_object typ = ptr void
let shared_object_opt : shared_object option typ = ptr_opt void

module Locale = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_Locale"
  let language = field t "language" string
  let country = field t "country" string
  let () = seal t
end
type locale = Locale.t
let locale = Locale.t


type log_category =
  | LOG_CATEGORY_APPLICATION
  | LOG_CATEGORY_ERROR
  | LOG_CATEGORY_ASSERT
  | LOG_CATEGORY_SYSTEM
  | LOG_CATEGORY_AUDIO
  | LOG_CATEGORY_VIDEO
  | LOG_CATEGORY_RENDER
  | LOG_CATEGORY_INPUT
  | LOG_CATEGORY_TEST
  | LOG_CATEGORY_GPU
  | LOG_CATEGORY_RESERVED2
  | LOG_CATEGORY_RESERVED3
  | LOG_CATEGORY_RESERVED4
  | LOG_CATEGORY_RESERVED5
  | LOG_CATEGORY_RESERVED6
  | LOG_CATEGORY_RESERVED7
  | LOG_CATEGORY_RESERVED8
  | LOG_CATEGORY_RESERVED9
  | LOG_CATEGORY_RESERVED10
  | LOG_CATEGORY_CUSTOM

type log_category_enum = int
let log_category = int

let log_category_to_enum : log_category -> log_category_enum = function
  | LOG_CATEGORY_APPLICATION -> log_category_application
  | LOG_CATEGORY_ERROR -> log_category_error
  | LOG_CATEGORY_ASSERT -> log_category_assert
  | LOG_CATEGORY_SYSTEM -> log_category_system
  | LOG_CATEGORY_AUDIO -> log_category_audio
  | LOG_CATEGORY_VIDEO -> log_category_video
  | LOG_CATEGORY_RENDER -> log_category_render
  | LOG_CATEGORY_INPUT -> log_category_input
  | LOG_CATEGORY_TEST -> log_category_test
  | LOG_CATEGORY_GPU -> log_category_gpu
  | LOG_CATEGORY_RESERVED2 -> log_category_reserved2
  | LOG_CATEGORY_RESERVED3 -> log_category_reserved3
  | LOG_CATEGORY_RESERVED4 -> log_category_reserved4
  | LOG_CATEGORY_RESERVED5 -> log_category_reserved5
  | LOG_CATEGORY_RESERVED6 -> log_category_reserved6
  | LOG_CATEGORY_RESERVED7 -> log_category_reserved7
  | LOG_CATEGORY_RESERVED8 -> log_category_reserved8
  | LOG_CATEGORY_RESERVED9 -> log_category_reserved9
  | LOG_CATEGORY_RESERVED10 -> log_category_reserved10
  | LOG_CATEGORY_CUSTOM -> log_category_custom

type log_priority =
  | LOG_PRIORITY_INVALID
  | LOG_PRIORITY_TRACE
  | LOG_PRIORITY_VERBOSE
  | LOG_PRIORITY_DEBUG
  | LOG_PRIORITY_INFO
  | LOG_PRIORITY_WARN
  | LOG_PRIORITY_ERROR
  | LOG_PRIORITY_CRITICAL
  | LOG_PRIORITY_COUNT

type log_priority_enum = int
let log_priority = int

let log_priority_to_enum : log_priority -> log_priority_enum = function
  | LOG_PRIORITY_INVALID -> log_priority_invalid
  | LOG_PRIORITY_TRACE -> log_priority_trace
  | LOG_PRIORITY_VERBOSE -> log_priority_verbose
  | LOG_PRIORITY_DEBUG -> log_priority_debug
  | LOG_PRIORITY_INFO -> log_priority_info
  | LOG_PRIORITY_WARN -> log_priority_warn
  | LOG_PRIORITY_ERROR -> log_priority_error
  | LOG_PRIORITY_CRITICAL -> log_priority_critical
  | LOG_PRIORITY_COUNT -> log_priority_count

let log_output_function = funptr (ptr void @-> int @-> log_priority @-> string @-> returning void)
let message_box_flags = uint (* prim *)
let message_box_button_flags = uint (* prim *)
module MessageBoxButtonData = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_MessageBoxButtonData"
  let flags = field t "flags" message_box_button_flags
  let button_id = field t "buttonID" int
  let text = field t "text" string
  let () = seal t
end
type message_box_button_data = MessageBoxButtonData.t
let message_box_button_data = MessageBoxButtonData.t


module MessageBoxColor = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_MessageBoxColor"
  let r = field t "r" uint8
  let g = field t "g" uint8
  let b = field t "b" uint8
  let () = seal t
end
type message_box_color = MessageBoxColor.t
let message_box_color = MessageBoxColor.t


type message_box_color_type =
  | MESSAGEBOX_COLOR_BACKGROUND
  | MESSAGEBOX_COLOR_TEXT
  | MESSAGEBOX_COLOR_BUTTON_BORDER
  | MESSAGEBOX_COLOR_BUTTON_BACKGROUND
  | MESSAGEBOX_COLOR_BUTTON_SELECTED
  | MESSAGEBOX_COLOR_COUNT

type message_box_color_type_enum = int
let message_box_color_type = int

let message_box_color_type_to_enum : message_box_color_type -> message_box_color_type_enum = function
  | MESSAGEBOX_COLOR_BACKGROUND -> messagebox_color_background
  | MESSAGEBOX_COLOR_TEXT -> messagebox_color_text
  | MESSAGEBOX_COLOR_BUTTON_BORDER -> messagebox_color_button_border
  | MESSAGEBOX_COLOR_BUTTON_BACKGROUND -> messagebox_color_button_background
  | MESSAGEBOX_COLOR_BUTTON_SELECTED -> messagebox_color_button_selected
  | MESSAGEBOX_COLOR_COUNT -> messagebox_color_count

module MessageBoxColorScheme = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_MessageBoxColorScheme"
  let colors = field t "colors" (array 5 message_box_color)
  let () = seal t
end
type message_box_color_scheme = MessageBoxColorScheme.t
let message_box_color_scheme = MessageBoxColorScheme.t


module MessageBoxData = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_MessageBoxData"
  let flags = field t "flags" message_box_flags
  let window = field t "window" window
  let title = field t "title" string
  let message = field t "message" string
  let numbuttons = field t "numbuttons" int
  let buttons = field t "buttons" (ptr message_box_button_data)
  let color_scheme = field t "colorScheme" (ptr message_box_color_scheme)
  let () = seal t
end
type message_box_data = MessageBoxData.t
let message_box_data = MessageBoxData.t


let metal_view = ptr void

(* No definition (opaque struct) *)
type process = unit ptr
let process : process typ = ptr void
let process_opt : process option typ = ptr_opt void

type process_io =
  | PROCESS_STDIO_INHERITED
  | PROCESS_STDIO_NULL
  | PROCESS_STDIO_APP
  | PROCESS_STDIO_REDIRECT

type process_io_enum = int
let process_io = int

let process_io_to_enum : process_io -> process_io_enum = function
  | PROCESS_STDIO_INHERITED -> process_stdio_inherited
  | PROCESS_STDIO_NULL -> process_stdio_null
  | PROCESS_STDIO_APP -> process_stdio_app
  | PROCESS_STDIO_REDIRECT -> process_stdio_redirect

module Vertex = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_Vertex"
  let position = field t "position" f_point
  let color = field t "color" f_color
  let tex_coord = field t "tex_coord" f_point
  let () = seal t
end
type vertex = Vertex.t
let vertex = Vertex.t


type texture_access =
  | TEXTUREACCESS_STATIC
  | TEXTUREACCESS_STREAMING
  | TEXTUREACCESS_TARGET

type texture_access_enum = int
let texture_access = int

let texture_access_to_enum : texture_access -> texture_access_enum = function
  | TEXTUREACCESS_STATIC -> textureaccess_static
  | TEXTUREACCESS_STREAMING -> textureaccess_streaming
  | TEXTUREACCESS_TARGET -> textureaccess_target

type texture_address_mode =
  | TEXTURE_ADDRESS_INVALID
  | TEXTURE_ADDRESS_AUTO
  | TEXTURE_ADDRESS_CLAMP
  | TEXTURE_ADDRESS_WRAP

type texture_address_mode_enum = int
let texture_address_mode = int

let texture_address_mode_to_enum : texture_address_mode -> texture_address_mode_enum = function
  | TEXTURE_ADDRESS_INVALID -> texture_address_invalid
  | TEXTURE_ADDRESS_AUTO -> texture_address_auto
  | TEXTURE_ADDRESS_CLAMP -> texture_address_clamp
  | TEXTURE_ADDRESS_WRAP -> texture_address_wrap

type renderer_logical_presentation =
  | LOGICAL_PRESENTATION_DISABLED
  | LOGICAL_PRESENTATION_STRETCH
  | LOGICAL_PRESENTATION_LETTERBOX
  | LOGICAL_PRESENTATION_OVERSCAN
  | LOGICAL_PRESENTATION_INTEGER_SCALE

type renderer_logical_presentation_enum = int
let renderer_logical_presentation = int

let renderer_logical_presentation_to_enum : renderer_logical_presentation -> renderer_logical_presentation_enum = function
  | LOGICAL_PRESENTATION_DISABLED -> logical_presentation_disabled
  | LOGICAL_PRESENTATION_STRETCH -> logical_presentation_stretch
  | LOGICAL_PRESENTATION_LETTERBOX -> logical_presentation_letterbox
  | LOGICAL_PRESENTATION_OVERSCAN -> logical_presentation_overscan
  | LOGICAL_PRESENTATION_INTEGER_SCALE -> logical_presentation_integer_scale


(* No definition (opaque struct) *)
type renderer = unit ptr
let renderer : renderer typ = ptr void
let renderer_opt : renderer option typ = ptr_opt void

module Texture = struct
  type _t_raw
  type t_raw = _t_raw structure
  let t : t_raw typ = structure "SDL_Texture"
  let format = field t "format" pixel_format
  let w = field t "w" int
  let h = field t "h" int
  let refcount = field t "refcount" int
  let () = seal t
  let t_raw = t
  type t = t_raw ptr
  let t : t typ = ptr t_raw
  let t_opt : t option typ = ptr_opt t_raw
  let get (e : t) field = getf {structured = e} field
  let set (e : t) field v = setf {structured = e} field v
end
type texture = Texture.t
let texture = Texture.t
let texture_opt = Texture.t_opt
let texture_raw = Texture.t_raw


module GPURenderStateCreateInfo = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_GPURenderStateCreateInfo"
  let fragment_shader = field t "fragment_shader" gpu_shader
  let num_sampler_bindings = field t "num_sampler_bindings" sint32
  let sampler_bindings = field t "sampler_bindings" (ptr gpu_texture_sampler_binding)
  let num_storage_textures = field t "num_storage_textures" sint32
  let storage_textures = field t "storage_textures" (ptr gpu_texture)
  let num_storage_buffers = field t "num_storage_buffers" sint32
  let storage_buffers = field t "storage_buffers" (ptr gpu_buffer)
  let props = field t "props" properties_id
  let () = seal t
end
type gpu_render_state_create_info = GPURenderStateCreateInfo.t
let gpu_render_state_create_info = GPURenderStateCreateInfo.t



(* No definition (opaque struct) *)
type gpu_render_state = unit ptr
let gpu_render_state : gpu_render_state typ = ptr void
let gpu_render_state_opt : gpu_render_state option typ = ptr_opt void

module StorageInterface = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_StorageInterface"
  let version = field t "version" int_as_uint
  let close = field t "close" (funptr (ptr void @-> returning bool))
  let ready = field t "ready" (funptr (ptr void @-> returning bool))
  let enumerate = field t "enumerate" (funptr (ptr void @-> string @-> enumerate_directory_callback @-> ptr void @-> returning bool))
  let info = field t "info" (funptr (ptr void @-> string @-> ptr path_info @-> returning bool))
  let read_file = field t "read_file" (funptr (ptr void @-> string @-> ptr void @-> uint64 @-> returning bool))
  let write_file = field t "write_file" (funptr (ptr void @-> string @-> ptr void @-> uint64 @-> returning bool))
  let mkdir = field t "mkdir" (funptr (ptr void @-> string @-> returning bool))
  let remove = field t "remove" (funptr (ptr void @-> string @-> returning bool))
  let rename = field t "rename" (funptr (ptr void @-> string @-> string @-> returning bool))
  let copy = field t "copy" (funptr (ptr void @-> string @-> string @-> returning bool))
  let space_remaining = field t "space_remaining" (funptr (ptr void @-> returning uint64))
  let () = seal t
end
type storage_interface = StorageInterface.t
let storage_interface = StorageInterface.t



(* No definition (opaque struct) *)
type storage = unit ptr
let storage : storage typ = ptr void
let storage_opt : storage option typ = ptr_opt void

type sandbox =
  | SANDBOX_NONE
  | SANDBOX_UNKNOWN_CONTAINER
  | SANDBOX_FLATPAK
  | SANDBOX_SNAP
  | SANDBOX_MACOS

type sandbox_enum = int
let sandbox = int

let sandbox_to_enum : sandbox -> sandbox_enum = function
  | SANDBOX_NONE -> sandbox_none
  | SANDBOX_UNKNOWN_CONTAINER -> sandbox_unknown_container
  | SANDBOX_FLATPAK -> sandbox_flatpak
  | SANDBOX_SNAP -> sandbox_snap
  | SANDBOX_MACOS -> sandbox_macos

module DateTime = struct
  type _t
  type t = _t structure
  let t : t typ = structure "SDL_DateTime"
  let year = field t "year" int
  let month = field t "month" int
  let day = field t "day" int
  let hour = field t "hour" int
  let minute = field t "minute" int
  let second = field t "second" int
  let nanosecond = field t "nanosecond" int
  let day_of_week = field t "day_of_week" int
  let utc_offset = field t "utc_offset" int
  let () = seal t
end
type date_time = DateTime.t
let date_time = DateTime.t


type date_format =
  | DATE_FORMAT_YYYYMMDD
  | DATE_FORMAT_DDMMYYYY
  | DATE_FORMAT_MMDDYYYY

type date_format_enum = int
let date_format = int

let date_format_to_enum : date_format -> date_format_enum = function
  | DATE_FORMAT_YYYYMMDD -> date_format_yyyymmdd
  | DATE_FORMAT_DDMMYYYY -> date_format_ddmmyyyy
  | DATE_FORMAT_MMDDYYYY -> date_format_mmddyyyy

type time_format =
  | TIME_FORMAT_24HR
  | TIME_FORMAT_12HR

type time_format_enum = int
let time_format = int

let time_format_to_enum : time_format -> time_format_enum = function
  | TIME_FORMAT_24HR -> time_format_24_hr
  | TIME_FORMAT_12HR -> time_format_12_hr

let timer_id = uint (* prim *)
let timer_callback = funptr (ptr void @-> uint @-> uint @-> returning uint)
let ns_timer_callback = funptr (ptr void @-> uint @-> ulong @-> returning ulong)

(* No definition (opaque struct) *)
type tray = unit ptr
let tray : tray typ = ptr void
let tray_opt : tray option typ = ptr_opt void


(* No definition (opaque struct) *)
type tray_menu = unit ptr
let tray_menu : tray_menu typ = ptr void
let tray_menu_opt : tray_menu option typ = ptr_opt void


(* No definition (opaque struct) *)
type tray_entry = unit ptr
let tray_entry : tray_entry typ = ptr void
let tray_entry_opt : tray_entry option typ = ptr_opt void

let tray_entry_flags = uint (* prim *)
let tray_callback = funptr (ptr void @-> tray_entry @-> returning void)
let tray_click_callback = funptr (ptr void @-> tray @-> returning bool)
