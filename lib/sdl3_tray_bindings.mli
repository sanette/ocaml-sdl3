(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Sdl3_types
module Tray : sig

val create : surface option -> string -> tray result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateTray}SDL_CreateTray}: Create an icon to be placed in the operating system's tray, or equivalent.

Many platforms advise not using a system tray unless persistence is a
necessary feature. Avoid needlessly creating a tray icon, as the user may
feel like it clutters their interface.

Using tray icons require the video subsystem.


    @param icon a surface to be used as icon. May be [None].
    @param tooltip a tooltip to be displayed when the mouse hovers the icon in
UTF-8 encoding. Not supported on all platforms. May be NULL.

    @return The newly created system tray icon.*)

val set_icon : tray -> surface option -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetTrayIcon}SDL_SetTrayIcon}: Updates the system tray icon's icon.


    @param tray the tray icon to be updated.
    @param icon the new icon. May be [None].
*)

val set_tooltip : tray -> string -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetTrayTooltip}SDL_SetTrayTooltip}: Updates the system tray icon's tooltip.


    @param tray the tray icon to be updated.
    @param tooltip the new tooltip in UTF-8 encoding. May be NULL.
*)

val create_menu : tray -> tray_menu result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateTrayMenu}SDL_CreateTrayMenu}: Create a menu for a system tray.

This should be called at most once per tray icon.

This function does the same thing as SDL_CreateTraySubmenu(), except that
it takes a SDL_Tray instead of a SDL_TrayEntry.

A menu does not need to be destroyed; it will be destroyed with the tray.


    @param tray the tray to bind the menu to.

    @return the newly created menu.*)

val create_submenu : tray_entry -> tray_menu result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateTraySubmenu}SDL_CreateTraySubmenu}: Create a submenu for a system tray entry.

This should be called at most once per tray entry.

This function does the same thing as SDL_CreateTrayMenu, except that it
takes a SDL_TrayEntry instead of a SDL_Tray.

A menu does not need to be destroyed; it will be destroyed with the tray.


    @param entry the tray entry to bind the menu to.

    @return the newly created menu.*)

val get_menu : tray -> tray_menu result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetTrayMenu}SDL_GetTrayMenu}: Gets a previously created tray menu.

You should have called SDL_CreateTrayMenu() on the tray object. This
function allows you to fetch it again later.

This function does the same thing as SDL_GetTraySubmenu(), except that it
takes a SDL_Tray instead of a SDL_TrayEntry.

A menu does not need to be destroyed; it will be destroyed with the tray.


    @param tray the tray entry to bind the menu to.

    @return the newly created menu.*)

val get_submenu : tray_entry -> tray_menu result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetTraySubmenu}SDL_GetTraySubmenu}: Gets a previously created tray entry submenu.

You should have called SDL_CreateTraySubmenu() on the entry object. This
function allows you to fetch it again later.

This function does the same thing as SDL_GetTrayMenu(), except that it
takes a SDL_TrayEntry instead of a SDL_Tray.

A menu does not need to be destroyed; it will be destroyed with the tray.


    @param entry the tray entry to bind the menu to.

    @return the newly created menu.*)

val get_entries : tray_menu -> tray_entry Ctypes.ptr * int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetTrayEntries}SDL_GetTrayEntries}: Returns a list of entries in the menu, in order.


    @param menu The menu to get entries from.

    @return An optional pointer to obtain the number of entries in the
menu.*)

val remove_entry : tray_entry -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_RemoveTrayEntry}SDL_RemoveTrayEntry}: Removes a tray entry.


    @param entry The entry to be deleted.
*)

val insert_entry_at : tray_menu -> int -> string -> int -> tray_entry result
(** {{:https://wiki.libsdl.org/SDL3/SDL_InsertTrayEntryAt}SDL_InsertTrayEntryAt}: Insert a tray entry at a given position.

If label is NULL, the entry will be a separator. Many functions won't work
for an entry that is a separator.

An entry does not need to be destroyed; it will be destroyed with the tray.


    @param menu the menu to append the entry to.
    @param pos the desired position for the new entry. Entries at or following
this place will be moved. If pos is -1, the entry is appended.
    @param label the text to be displayed on the entry, in UTF-8 encoding, or
NULL for a separator.
    @param flags a combination of flags, some of which are mandatory.

    @return the newly created entry, or [Error] if pos is out of bounds.*)

val set_entry_label : tray_entry -> string -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetTrayEntryLabel}SDL_SetTrayEntryLabel}: Sets the label of an entry.

An entry cannot change between a separator and an ordinary entry; that is,
it is not possible to set a non-NULL label on an entry that has a NULL
label (separators), or to set a NULL label to an entry that has a non-NULL
label. The function will silently fail if that happens.


    @param entry the entry to be updated.
    @param label the new label for the entry in UTF-8 encoding.
*)

val get_entry_label : tray_entry -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetTrayEntryLabel}SDL_GetTrayEntryLabel}: Gets the label of an entry.

If the returned value is NULL, the entry is a separator.


    @param entry the entry to be read.

    @return the label of the entry in UTF-8 encoding.*)

val set_entry_checked : tray_entry -> bool -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetTrayEntryChecked}SDL_SetTrayEntryChecked}: Sets whether or not an entry is checked.

The entry must have been created with the SDL_TRAYENTRY_CHECKBOX flag.


    @param entry the entry to be updated.
    @param checked true if the entry should be checked; false otherwise.
*)

val get_entry_checked : tray_entry -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetTrayEntryChecked}SDL_GetTrayEntryChecked}: Gets whether or not an entry is checked.

The entry must have been created with the SDL_TRAYENTRY_CHECKBOX flag.


    @param entry the entry to be read.*)

val set_entry_enabled : tray_entry -> bool -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetTrayEntryEnabled}SDL_SetTrayEntryEnabled}: Sets whether or not an entry is enabled.


    @param entry the entry to be updated.
    @param enabled true if the entry should be enabled; false otherwise.
*)

val get_entry_enabled : tray_entry -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetTrayEntryEnabled}SDL_GetTrayEntryEnabled}: Gets whether or not an entry is enabled.


    @param entry the entry to be read.

    @return true if the entry is enabled; false otherwise.*)

val set_entry_callback : tray_entry -> tray_callback -> data -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetTrayEntryCallback}SDL_SetTrayEntryCallback}: Sets a callback to be invoked when the entry is selected.


    @param entry the entry to be updated.
    @param callback a callback to be invoked when the entry is selected.
    @param userdata an optional pointer to pass extra data to the callback when
it will be invoked.
*)

val click_entry : tray_entry -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_ClickTrayEntry}SDL_ClickTrayEntry}: Simulate a click on a tray entry.


    @param entry The entry to activate.
*)

val destroy : tray -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_DestroyTray}SDL_DestroyTray}: Destroys a tray object.

This also destroys all associated menus and entries.


    @param tray the tray icon to be destroyed.
*)

val get_entry_parent : tray_entry -> tray_menu result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetTrayEntryParent}SDL_GetTrayEntryParent}: Gets the menu containing a certain tray entry.


    @param entry the entry for which to get the parent menu.

    @return the parent menu.*)

val get_menu_parent_entry : tray_menu -> tray_entry result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetTrayMenuParentEntry}SDL_GetTrayMenuParentEntry}: Gets the entry for which the menu is a submenu, if the current menu is a
submenu.

Either this function or SDL_GetTrayMenuParentTray() will return non-NULL
for any given menu.


    @param menu the menu for which to get the parent entry.

    @return the parent entry, or [Error] if this menu is not a submenu.*)

val get_menu_parent_tray : tray_menu -> tray result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetTrayMenuParentTray}SDL_GetTrayMenuParentTray}: Gets the tray for which this menu is the first-level menu, if the current
menu isn't a submenu.

Either this function or SDL_GetTrayMenuParentEntry() will return non-NULL
for any given menu.


    @param menu the menu for which to get the parent enttrayry.

    @return the parent tray, or [Error] if this menu is a submenu.*)

val updates : unit -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_UpdateTrays}SDL_UpdateTrays}: Update the trays.

This is called automatically by the event loop and is only needed if you're
using trays but aren't handling SDL events.
*)

end

