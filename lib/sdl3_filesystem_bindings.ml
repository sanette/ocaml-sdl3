(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Sdl3_types
open Helpers

let ff = Load.foreign

module Global = struct
let get_base_path = ff "SDL_GetBasePath"
  (void @-> returning string)

let get_pref_path = ff "SDL_GetPrefPath"
  (string @-> string @-> returning string)

let create_directory = ff "SDL_CreateDirectory"
  (string @-> returning true_to_ok)

let enumerate_directory = ff "SDL_EnumerateDirectory"
  (string @-> enumerate_directory_callback @-> ptr void @-> returning true_to_ok)

let remove_path = ff "SDL_RemovePath"
  (string @-> returning true_to_ok)

let rename_path = ff "SDL_RenamePath"
  (string @-> string @-> returning true_to_ok)

let copy_file = ff "SDL_CopyFile"
  (string @-> string @-> returning true_to_ok)

let get_path_info = ff "SDL_GetPathInfo"
  (string @-> ptr path_info @-> returning true_to_ok)

let glob_directory = ff "SDL_GlobDirectory"
  (string @-> string @-> glob_flags @-> ptr int @-> returning (ptr string))
(* Wrapper for returning string list *)
let glob_directory path pattern flags =
  let count = allocate int 0 in
  let p = glob_directory path pattern flags count in
  if is_null p then []
  else let n =  (!@ count) in
    Fun.protect ~finally:(fun () -> Sdl3_stdinc_bindings.free (to_voidp p))
      (fun () ->
        CArray.from_ptr p n
        |> CArray.to_list)
let glob_directory path pattern flags =
  glob_directory path pattern (Unsigned.UInt.of_int flags)

let get_current_directory = ff "SDL_GetCurrentDirectory"
  (void @-> returning string)

end
include Global

module Folder = struct
let get_user = ff "SDL_GetUserFolder"
  (folder @-> returning string)

end

