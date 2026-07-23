(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Sdl3_types

let ff = Load.foreign

module Global = struct
let get_preferred_locales = ff "SDL_GetPreferredLocales"
  (ptr int @-> returning (ptr (ptr locale)))
(* Wrapper for returning (ptr locale) list *)
let get_preferred_locales () =
  let count = allocate int 0 in
  let p = get_preferred_locales count in
  if is_null p then []
  else let n =  (!@ count) in
    Fun.protect ~finally:(fun () -> Sdl3_stdinc_bindings.free (to_voidp p))
      (fun () ->
        CArray.from_ptr p n
        |> CArray.to_list)

end
include Global

