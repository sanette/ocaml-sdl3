(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Sdl3_types
open Helpers

let ff = Load.foreign

module MessageBoxData = struct
let show_message_box = ff "SDL_ShowMessageBox"
  (ptr message_box_data @-> ptr int @-> returning bool)
let show_message_box messageboxdata =
  let buttonid = allocate int 0 in
  if show_message_box messageboxdata buttonid then Ok (!@ buttonid) else error ()

include MessageBoxData

end

module Global = struct
let show_simple_message_box = ff "SDL_ShowSimpleMessageBox"
  (message_box_flags @-> string @-> string @-> window_opt @-> returning true_to_ok)
let show_simple_message_box flags title message window =
  show_simple_message_box (Unsigned.UInt.of_int flags) title message window

end
include Global

