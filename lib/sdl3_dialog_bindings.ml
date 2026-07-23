(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Sdl3_types

let ff = Load.foreign

module Global = struct
let show_open_file_dialog = ff "SDL_ShowOpenFileDialog"
  (dialog_file_callback @-> ptr void @-> window_opt @-> ptr dialog_file_filter @-> int @-> string @-> bool @-> returning void)

let show_save_file_dialog = ff "SDL_ShowSaveFileDialog"
  (dialog_file_callback @-> ptr void @-> window_opt @-> ptr dialog_file_filter @-> int @-> string @-> returning void)

let show_open_folder_dialog = ff "SDL_ShowOpenFolderDialog"
  (dialog_file_callback @-> ptr void @-> window_opt @-> string @-> bool @-> returning void)

end
include Global

module FileDialogType = struct
let show_file_dialog_with_properties = ff "SDL_ShowFileDialogWithProperties"
  (file_dialog_type @-> dialog_file_callback @-> ptr void @-> properties_id @-> returning void)
let show_file_dialog_with_properties typ callback userdata props =
  show_file_dialog_with_properties typ callback userdata (Unsigned.UInt.of_int props)

end

