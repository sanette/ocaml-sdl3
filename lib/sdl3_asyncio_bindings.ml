(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Helpers
open Sdl3_types

let ff = Load.foreign

module AsyncIO = struct
let from_file = ff "SDL_AsyncIOFromFile"
  (string @-> string @-> returning (some_to_ok async_io_opt))

let get_size = ff "SDL_GetAsyncIOSize"
  (async_io @-> returning sint64)

let read = ff "SDL_ReadAsyncIO"
  (async_io @-> ptr void @-> uint64 @-> uint64 @-> async_io_queue @-> ptr void @-> returning true_to_ok)
let read asyncio ptr offset size queue userdata =
  read asyncio ptr (Unsigned.ULong.of_int64 offset) (Unsigned.ULong.of_int64 size) queue userdata

let write = ff "SDL_WriteAsyncIO"
  (async_io @-> ptr void @-> uint64 @-> uint64 @-> async_io_queue @-> ptr void @-> returning true_to_ok)
let write asyncio ptr offset size queue userdata =
  write asyncio ptr (Unsigned.ULong.of_int64 offset) (Unsigned.ULong.of_int64 size) queue userdata

let close = ff "SDL_CloseAsyncIO"
  (async_io @-> bool @-> async_io_queue @-> ptr void @-> returning true_to_ok)

end

module AsyncIOQueue = struct
let create = ff "SDL_CreateAsyncIOQueue"
  (void @-> returning (some_to_ok async_io_queue_opt))

let destroy = ff "SDL_DestroyAsyncIOQueue"
  (async_io_queue @-> returning void)

let get_async_io_result = ff "SDL_GetAsyncIOResult"
  (async_io_queue @-> ptr async_io_outcome @-> returning true_to_ok)

let wait_async_io_result = ff "SDL_WaitAsyncIOResult"
  (async_io_queue @-> ptr async_io_outcome @-> sint32 @-> returning true_to_ok)

let signal = ff "SDL_SignalAsyncIOQueue"
  (async_io_queue @-> returning void)

end

module Global = struct
let load_file_async = ff "SDL_LoadFileAsync"
  (string @-> async_io_queue @-> ptr void @-> returning true_to_ok)

end
include Global

