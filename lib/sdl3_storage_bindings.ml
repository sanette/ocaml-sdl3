(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Helpers
open Sdl3_types

let ff = Load.foreign

module Storage = struct
let open_title = ff "SDL_OpenTitleStorage"
  (string @-> properties_id @-> returning (some_to_ok storage_opt))
let open_title override props =
  open_title override (Unsigned.UInt.of_int props)

let open_user = ff "SDL_OpenUserStorage"
  (string @-> string @-> properties_id @-> returning (some_to_ok storage_opt))
let open_user org app props =
  open_user org app (Unsigned.UInt.of_int props)

let open_file = ff "SDL_OpenFileStorage"
  (string @-> returning (some_to_ok storage_opt))

let open_ = ff "SDL_OpenStorage"
  (ptr storage_interface @-> ptr void @-> returning (some_to_ok storage_opt))

let close = ff "SDL_CloseStorage"
  (storage @-> returning true_to_ok)

let ready = ff "SDL_StorageReady"
  (storage @-> returning true_to_ok)

let get_file_size = ff "SDL_GetStorageFileSize"
  (storage @-> string @-> ptr uint64 @-> returning bool)
let get_file_size storage path =
  let length = allocate ulong (Unsigned.ULong.of_int 0) in
  if get_file_size storage path length then Ok (Unsigned.ULong.to_int64 (!@ length)) else error ()

let read_file = ff "SDL_ReadStorageFile"
  (storage @-> string @-> ptr void @-> uint64 @-> returning true_to_ok)
let read_file storage path destination length =
  read_file storage path destination (Unsigned.ULong.of_int64 length)

let write_file = ff "SDL_WriteStorageFile"
  (storage @-> string @-> ptr void @-> uint64 @-> returning true_to_ok)
let write_file storage path source length =
  write_file storage path source (Unsigned.ULong.of_int64 length)

let create_directory = ff "SDL_CreateStorageDirectory"
  (storage @-> string @-> returning true_to_ok)

let enumerate_directory = ff "SDL_EnumerateStorageDirectory"
  (storage @-> string @-> enumerate_directory_callback @-> ptr void @-> returning true_to_ok)

let remove_path = ff "SDL_RemoveStoragePath"
  (storage @-> string @-> returning true_to_ok)

let rename_path = ff "SDL_RenameStoragePath"
  (storage @-> string @-> string @-> returning true_to_ok)

let copy_file = ff "SDL_CopyStorageFile"
  (storage @-> string @-> string @-> returning true_to_ok)

let get_path_info = ff "SDL_GetStoragePathInfo"
  (storage @-> string @-> ptr path_info @-> returning true_to_ok)

let get_space_remaining = ff "SDL_GetStorageSpaceRemaining"
  (storage @-> returning uint64)

let glob_directory = ff "SDL_GlobStorageDirectory"
  (storage @-> string @-> string @-> glob_flags @-> ptr int @-> returning (ptr string))
(* Wrapper for returning string list *)
let glob_directory storage path pattern flags =
  let count = allocate int 0 in
  let p = glob_directory storage path pattern flags count in
  if is_null p then []
  else let n =  (!@ count) in
    Fun.protect ~finally:(fun () -> Sdl3_stdinc_bindings.free (to_voidp p))
      (fun () ->
        CArray.from_ptr p n
        |> CArray.to_list)
let glob_directory storage path pattern flags =
  glob_directory storage path pattern (Unsigned.UInt.of_int flags)

end

