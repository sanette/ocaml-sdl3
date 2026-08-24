(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Sdl3_types

let ff = Load.foreign

module Locale = struct
let get_preferreds = ff "SDL_GetPreferredLocales"
  (ptr int @-> returning (ptr locale))
(* Wrapper for returning locale list *)
let get_preferreds () =
  let count = allocate int 0 in
  let p = get_preferreds count in
  if is_null p then []
  else let n =  (!@ (count)) in
    Fun.protect ~finally:(fun () -> Sdl3_stdinc_bindings.free (to_voidp p))
      (fun () ->
        CArray.from_ptr p n
        |> CArray.to_list)

include Locale

end

