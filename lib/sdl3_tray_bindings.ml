(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Sdl3_types
open Helpers

let ff = Load.foreign

module Tray = struct
let create = ff "SDL_CreateTray"
  (surface_opt @-> string @-> returning (some_to_ok tray_opt))

let set_icon = ff "SDL_SetTrayIcon"
  (tray @-> surface_opt @-> returning void)

let set_tooltip = ff "SDL_SetTrayTooltip"
  (tray @-> string @-> returning void)

let create_menu = ff "SDL_CreateTrayMenu"
  (tray @-> returning (some_to_ok tray_menu_opt))

let create_submenu = ff "SDL_CreateTraySubmenu"
  (tray_entry @-> returning (some_to_ok tray_menu_opt))

let get_menu = ff "SDL_GetTrayMenu"
  (tray @-> returning (some_to_ok tray_menu_opt))

let get_submenu = ff "SDL_GetTraySubmenu"
  (tray_entry @-> returning (some_to_ok tray_menu_opt))

let get_entries = ff "SDL_GetTrayEntries"
  (tray_menu @-> ptr int @-> returning (ptr tray_entry))
let get_entries menu =
  let count = allocate int 0 in
  let ret = get_entries menu count in
(ret, !@ count)

let remove_entry = ff "SDL_RemoveTrayEntry"
  (tray_entry @-> returning void)

let insert_entry_at = ff "SDL_InsertTrayEntryAt"
  (tray_menu @-> int @-> string @-> tray_entry_flags @-> returning (some_to_ok tray_entry_opt))
let insert_entry_at menu pos label flags =
  insert_entry_at menu pos label (Unsigned.UInt.of_int flags)

let set_entry_label = ff "SDL_SetTrayEntryLabel"
  (tray_entry @-> string @-> returning void)

let get_entry_label = ff "SDL_GetTrayEntryLabel"
  (tray_entry @-> returning string)

let set_entry_checked = ff "SDL_SetTrayEntryChecked"
  (tray_entry @-> bool @-> returning void)

let get_entry_checked = ff "SDL_GetTrayEntryChecked"
  (tray_entry @-> returning true_to_ok)

let set_entry_enabled = ff "SDL_SetTrayEntryEnabled"
  (tray_entry @-> bool @-> returning void)

let get_entry_enabled = ff "SDL_GetTrayEntryEnabled"
  (tray_entry @-> returning bool)

let set_entry_callback = ff "SDL_SetTrayEntryCallback"
  (tray_entry @-> tray_callback @-> ptr void @-> returning void)

let click_entry = ff "SDL_ClickTrayEntry"
  (tray_entry @-> returning void)

let destroy = ff "SDL_DestroyTray"
  (tray @-> returning void)

let get_entry_parent = ff "SDL_GetTrayEntryParent"
  (tray_entry @-> returning (some_to_ok tray_menu_opt))

let get_menu_parent_entry = ff "SDL_GetTrayMenuParentEntry"
  (tray_menu @-> returning (some_to_ok tray_entry_opt))

let get_menu_parent_tray = ff "SDL_GetTrayMenuParentTray"
  (tray_menu @-> returning (some_to_ok tray_opt))

let updates = ff "SDL_UpdateTrays"
  (void @-> returning void)

end

