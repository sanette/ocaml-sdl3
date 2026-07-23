(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Sdl3_types
open Helpers

let ff = Load.foreign

module IOStream = struct
let io_from_file = ff "SDL_IOFromFile"
  (string @-> string @-> returning (some_to_ok io_stream_opt))

let io_from_mem = ff "SDL_IOFromMem"
  (ptr void @-> size_t @-> returning (some_to_ok io_stream_opt))
let io_from_mem mem size =
  io_from_mem mem (Unsigned.Size_t.of_int size)

let io_from_const_mem = ff "SDL_IOFromConstMem"
  (ptr void @-> size_t @-> returning (some_to_ok io_stream_opt))
let io_from_const_mem mem size =
  io_from_const_mem mem (Unsigned.Size_t.of_int size)

let io_from_dynamic_mem = ff "SDL_IOFromDynamicMem"
  (void @-> returning (some_to_ok io_stream_opt))

let open_io = ff "SDL_OpenIO"
  (ptr io_stream_interface @-> ptr void @-> returning (some_to_ok io_stream_opt))

let close_io = ff "SDL_CloseIO"
  (io_stream @-> returning true_to_ok)

let get_io_properties = ff "SDL_GetIOProperties"
  (io_stream @-> returning properties_id)

let get_io_size = ff "SDL_GetIOSize"
  (io_stream @-> returning sint64)

let seek_io = ff "SDL_SeekIO"
  (io_stream @-> sint64 @-> io_whence @-> returning sint64)
let seek_io context offset whence =
  seek_io context (Signed.Long.of_int offset) whence

let tell_io = ff "SDL_TellIO"
  (io_stream @-> returning sint64)

let read_io = ff "SDL_ReadIO"
  (io_stream @-> ptr void @-> size_t @-> returning size_t)
let read_io context ptr size =
  read_io context ptr (Unsigned.Size_t.of_int size)

let write_io = ff "SDL_WriteIO"
  (io_stream @-> ptr void @-> size_t @-> returning size_t)
let write_io context ptr size =
  write_io context ptr (Unsigned.Size_t.of_int size)

let flush_io = ff "SDL_FlushIO"
  (io_stream @-> returning true_to_ok)

let load_file_io = ff "SDL_LoadFile_IO"
  (io_stream @-> ptr size_t @-> bool @-> returning (ptr void))

let save_file_io = ff "SDL_SaveFile_IO"
  (io_stream @-> ptr void @-> size_t @-> bool @-> returning true_to_ok)
let save_file_io src data datasize closeio =
  save_file_io src data (Unsigned.Size_t.of_int datasize) closeio

let read_u8 = ff "SDL_ReadU8"
  (io_stream @-> ptr uint8 @-> returning bool)
let read_u8 src =
  let value = allocate uchar (Unsigned.UChar.of_int 0) in
  if read_u8 src value then Ok (Unsigned.UChar.to_int (!@ value)) else error ()

let read_s8 = ff "SDL_ReadS8"
  (io_stream @-> ptr sint8 @-> returning true_to_ok)

let read_u16_le = ff "SDL_ReadU16LE"
  (io_stream @-> ptr uint16 @-> returning bool)
let read_u16_le src =
  let value = allocate ushort (Unsigned.UShort.of_int 0) in
  if read_u16_le src value then Ok (Unsigned.UShort.to_int (!@ value)) else error ()

let read_s16_le = ff "SDL_ReadS16LE"
  (io_stream @-> ptr sint16 @-> returning true_to_ok)

let read_u16_be = ff "SDL_ReadU16BE"
  (io_stream @-> ptr uint16 @-> returning bool)
let read_u16_be src =
  let value = allocate ushort (Unsigned.UShort.of_int 0) in
  if read_u16_be src value then Ok (Unsigned.UShort.to_int (!@ value)) else error ()

let read_s16_be = ff "SDL_ReadS16BE"
  (io_stream @-> ptr sint16 @-> returning true_to_ok)

let read_u32_le = ff "SDL_ReadU32LE"
  (io_stream @-> ptr uint32 @-> returning true_to_ok)

let read_s32_le = ff "SDL_ReadS32LE"
  (io_stream @-> ptr sint32 @-> returning true_to_ok)

let read_u32_be = ff "SDL_ReadU32BE"
  (io_stream @-> ptr uint32 @-> returning true_to_ok)

let read_s32_be = ff "SDL_ReadS32BE"
  (io_stream @-> ptr sint32 @-> returning true_to_ok)

let read_u64_le = ff "SDL_ReadU64LE"
  (io_stream @-> ptr uint64 @-> returning bool)
let read_u64_le src =
  let value = allocate ulong (Unsigned.ULong.of_int 0) in
  if read_u64_le src value then Ok (Unsigned.ULong.to_int64 (!@ value)) else error ()

let read_s64_le = ff "SDL_ReadS64LE"
  (io_stream @-> ptr sint64 @-> returning true_to_ok)

let read_u64_be = ff "SDL_ReadU64BE"
  (io_stream @-> ptr uint64 @-> returning bool)
let read_u64_be src =
  let value = allocate ulong (Unsigned.ULong.of_int 0) in
  if read_u64_be src value then Ok (Unsigned.ULong.to_int64 (!@ value)) else error ()

let read_s64_be = ff "SDL_ReadS64BE"
  (io_stream @-> ptr sint64 @-> returning true_to_ok)

let write_u8 = ff "SDL_WriteU8"
  (io_stream @-> uint8 @-> returning true_to_ok)
let write_u8 dst value =
  write_u8 dst (Unsigned.UChar.of_int value)

let write_s8 = ff "SDL_WriteS8"
  (io_stream @-> sint8 @-> returning true_to_ok)

let write_u16_le = ff "SDL_WriteU16LE"
  (io_stream @-> uint16 @-> returning true_to_ok)
let write_u16_le dst value =
  write_u16_le dst (Unsigned.UShort.of_int value)

let write_s16_le = ff "SDL_WriteS16LE"
  (io_stream @-> sint16 @-> returning true_to_ok)

let write_u16_be = ff "SDL_WriteU16BE"
  (io_stream @-> uint16 @-> returning true_to_ok)
let write_u16_be dst value =
  write_u16_be dst (Unsigned.UShort.of_int value)

let write_s16_be = ff "SDL_WriteS16BE"
  (io_stream @-> sint16 @-> returning true_to_ok)

let write_u32_le = ff "SDL_WriteU32LE"
  (io_stream @-> uint32 @-> returning true_to_ok)
let write_u32_le dst value =
  write_u32_le dst (Unsigned.UInt.of_int value)

let write_s32_le = ff "SDL_WriteS32LE"
  (io_stream @-> sint32 @-> returning true_to_ok)

let write_u32_be = ff "SDL_WriteU32BE"
  (io_stream @-> uint32 @-> returning true_to_ok)
let write_u32_be dst value =
  write_u32_be dst (Unsigned.UInt.of_int value)

let write_s32_be = ff "SDL_WriteS32BE"
  (io_stream @-> sint32 @-> returning true_to_ok)

let write_u64_le = ff "SDL_WriteU64LE"
  (io_stream @-> uint64 @-> returning true_to_ok)
let write_u64_le dst value =
  write_u64_le dst (Unsigned.ULong.of_int64 value)

let write_s64_le = ff "SDL_WriteS64LE"
  (io_stream @-> sint64 @-> returning true_to_ok)
let write_s64_le dst value =
  write_s64_le dst (Signed.Long.of_int value)

let write_u64_be = ff "SDL_WriteU64BE"
  (io_stream @-> uint64 @-> returning true_to_ok)
let write_u64_be dst value =
  write_u64_be dst (Unsigned.ULong.of_int64 value)

let write_s64_be = ff "SDL_WriteS64BE"
  (io_stream @-> sint64 @-> returning true_to_ok)
let write_s64_be dst value =
  write_s64_be dst (Signed.Long.of_int value)

end

module IOStatus = struct
let get = ff "SDL_GetIOStatus"
  (io_stream @-> returning io_status)

end

module Global = struct
let load_file = ff "SDL_LoadFile"
  (string @-> ptr size_t @-> returning (ptr void))

let save_file = ff "SDL_SaveFile"
  (string @-> ptr void @-> size_t @-> returning true_to_ok)
let save_file file data datasize =
  save_file file data (Unsigned.Size_t.of_int datasize)

end
include Global

