(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Helpers
open Sdl3_types

let ff = Load.foreign

module Global = struct
let set_clipboard_text = ff "SDL_SetClipboardText"
  (string @-> returning true_to_ok)

let get_clipboard_text = ff "SDL_GetClipboardText"
  (void @-> returning string)

let has_clipboard_text = ff "SDL_HasClipboardText"
  (void @-> returning bool)

let set_primary_selection_text = ff "SDL_SetPrimarySelectionText"
  (string @-> returning true_to_ok)

let get_primary_selection_text = ff "SDL_GetPrimarySelectionText"
  (void @-> returning string)

let has_primary_selection_text = ff "SDL_HasPrimarySelectionText"
  (void @-> returning bool)

let set_clipboard_data = ff "SDL_SetClipboardData"
  (clipboard_data_callback @-> clipboard_cleanup_callback @-> ptr void @-> ptr string @-> size_t @-> returning true_to_ok)
let set_clipboard_data callback cleanup userdata mime_types =
  let mime_types, num_mime_types = carray_of_list string mime_types in
  set_clipboard_data callback cleanup userdata mime_types (Unsigned.Size_t.of_int num_mime_types)

let clear_clipboard_data = ff "SDL_ClearClipboardData"
  (void @-> returning true_to_ok)

let get_clipboard_data = ff "SDL_GetClipboardData"
  (string @-> ptr size_t @-> returning (ptr void))

let has_clipboard_data = ff "SDL_HasClipboardData"
  (string @-> returning bool)

let get_clipboard_mime_types = ff "SDL_GetClipboardMimeTypes"
  (ptr size_t @-> returning (ptr string))
(* Wrapper for returning string list *)
let get_clipboard_mime_types () =
  let num_mime_types = allocate size_t (Unsigned.Size_t.of_int 0) in
  let p = get_clipboard_mime_types num_mime_types in
  if is_null p then []
  else let n = Unsigned.Size_t.to_int (!@ num_mime_types) in
    Fun.protect ~finally:(fun () -> Sdl3_stdinc_bindings.free (to_voidp p))
      (fun () ->
        CArray.from_ptr p n
        |> CArray.to_list)

end
include Global

