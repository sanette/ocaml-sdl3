(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Helpers
open Sdl3_types

let ff = Load.foreign

module Global = struct
let get_num_video_drivers = ff "SDL_GetNumVideoDrivers"
  (void @-> returning int)

let get_video_driver = ff "SDL_GetVideoDriver"
  (int @-> returning string)

let get_current_video_driver = ff "SDL_GetCurrentVideoDriver"
  (void @-> returning string)

let get_displays = ff "SDL_GetDisplays"
  (ptr int @-> returning (ptr display_id))
(* Wrapper for returning uint list *)
let get_displays () =
  let count = allocate int 0 in
  let p = get_displays count in
  if is_null p then []
  else let n =  (!@ count) in
    Fun.protect ~finally:(fun () -> Sdl3_stdinc_bindings.free (to_voidp p))
      (fun () ->
        CArray.from_ptr p n
        |> CArray.to_list
        |> List.map Unsigned.UInt.to_int)

let get_primary_display = ff "SDL_GetPrimaryDisplay"
  (void @-> returning display_id)

let get_display_properties = ff "SDL_GetDisplayProperties"
  (display_id @-> returning properties_id)
let get_display_properties display_id =
  get_display_properties (Unsigned.UInt.of_int display_id)

let get_display_name = ff "SDL_GetDisplayName"
  (display_id @-> returning string)
let get_display_name display_id =
  get_display_name (Unsigned.UInt.of_int display_id)

let get_display_bounds = ff "SDL_GetDisplayBounds"
  (display_id @-> rect @-> returning true_to_ok)
let get_display_bounds display_id rect =
  get_display_bounds (Unsigned.UInt.of_int display_id) rect

let get_display_usable_bounds = ff "SDL_GetDisplayUsableBounds"
  (display_id @-> rect @-> returning true_to_ok)
let get_display_usable_bounds display_id rect =
  get_display_usable_bounds (Unsigned.UInt.of_int display_id) rect

let get_display_content_scale = ff "SDL_GetDisplayContentScale"
  (display_id @-> returning float)
let get_display_content_scale display_id =
  get_display_content_scale (Unsigned.UInt.of_int display_id)

let get_fullscreen_display_modes = ff "SDL_GetFullscreenDisplayModes"
  (display_id @-> ptr int @-> returning (ptr display_mode))
(* Wrapper for returning display_mode list *)
let get_fullscreen_display_modes display_id =
  let count = allocate int 0 in
  let p = get_fullscreen_display_modes display_id count in
  if is_null p then []
  else let n =  (!@ count) in
    Fun.protect ~finally:(fun () -> Sdl3_stdinc_bindings.free (to_voidp p))
      (fun () ->
        CArray.from_ptr p n
        |> CArray.to_list)
let get_fullscreen_display_modes display_id =
  get_fullscreen_display_modes (Unsigned.UInt.of_int display_id)

let get_closest_fullscreen_display_mode = ff "SDL_GetClosestFullscreenDisplayMode"
  (display_id @-> int @-> int @-> float @-> bool @-> display_mode @-> returning true_to_ok)
let get_closest_fullscreen_display_mode display_id w h refresh_rate include_high_density_modes closest =
  get_closest_fullscreen_display_mode (Unsigned.UInt.of_int display_id) w h refresh_rate include_high_density_modes closest

let get_windows = ff "SDL_GetWindows"
  (ptr int @-> returning (ptr window))
(* Wrapper for returning window list *)
let get_windows () =
  let count = allocate int 0 in
  let p = get_windows count in
  if is_null p then []
  else let n =  (!@ count) in
    Fun.protect ~finally:(fun () -> Sdl3_stdinc_bindings.free (to_voidp p))
      (fun () ->
        CArray.from_ptr p n
        |> CArray.to_list)

let screen_saver_enabled = ff "SDL_ScreenSaverEnabled"
  (void @-> returning bool)

let enable_screen_saver = ff "SDL_EnableScreenSaver"
  (void @-> returning true_to_ok)

let disable_screen_saver = ff "SDL_DisableScreenSaver"
  (void @-> returning true_to_ok)

let gl_load_library = ff "SDL_GL_LoadLibrary"
  (string @-> returning true_to_ok)

let gl_get_proc_address = ff "SDL_GL_GetProcAddress"
  (string @-> returning function_pointer)

let egl_get_proc_address = ff "SDL_EGL_GetProcAddress"
  (string @-> returning function_pointer)

let gl_unload_library = ff "SDL_GL_UnloadLibrary"
  (void @-> returning void)

let gl_extension_supported = ff "SDL_GL_ExtensionSupported"
  (string @-> returning true_to_ok)

let gl_reset_attributes = ff "SDL_GL_ResetAttributes"
  (void @-> returning void)

let egl_get_current_display = ff "SDL_EGL_GetCurrentDisplay"
  (void @-> returning egl_display)

let egl_get_current_config = ff "SDL_EGL_GetCurrentConfig"
  (void @-> returning egl_config)

let egl_set_attribute_callbacks = ff "SDL_EGL_SetAttributeCallbacks"
  (egl_attrib_array_callback @-> egl_int_array_callback @-> egl_int_array_callback @-> ptr void @-> returning void)

let gl_set_swap_interval = ff "SDL_GL_SetSwapInterval"
  (int @-> returning true_to_ok)

let gl_get_swap_interval = ff "SDL_GL_GetSwapInterval"
  (ptr int @-> returning bool)
let gl_get_swap_interval () =
  let interval = allocate int 0 in
  if gl_get_swap_interval interval then Ok (!@ interval) else error ()

end
include Global

module SystemTheme = struct
let get = ff "SDL_GetSystemTheme"
  (void @-> returning system_theme)

end

module DisplayOrientation = struct
let get_natural = ff "SDL_GetNaturalDisplayOrientation"
  (display_id @-> returning display_orientation)
let get_natural display_id =
  get_natural (Unsigned.UInt.of_int display_id)

let get_current = ff "SDL_GetCurrentDisplayOrientation"
  (display_id @-> returning display_orientation)
let get_current display_id =
  get_current (Unsigned.UInt.of_int display_id)

end

module DisplayMode = struct
let get_desktop = ff "SDL_GetDesktopDisplayMode"
  (display_id @-> returning (some_to_ok display_mode_opt))
let get_desktop display_id =
  get_desktop (Unsigned.UInt.of_int display_id)

let get_current = ff "SDL_GetCurrentDisplayMode"
  (display_id @-> returning (some_to_ok display_mode_opt))
let get_current display_id =
  get_current (Unsigned.UInt.of_int display_id)

include DisplayMode

end

module Point = struct
let get_display_for = ff "SDL_GetDisplayForPoint"
  (point @-> returning display_id)

end

module Rect = struct
let get_display_for = ff "SDL_GetDisplayForRect"
  (rect @-> returning display_id)

end

module Window = struct
let get_display_for = ff "SDL_GetDisplayForWindow"
  (window @-> returning display_id)

let get_pixel_density = ff "SDL_GetWindowPixelDensity"
  (window @-> returning float)

let get_display_scale = ff "SDL_GetWindowDisplayScale"
  (window @-> returning float)

let set_fullscreen_mode = ff "SDL_SetWindowFullscreenMode"
  (window @-> display_mode_opt @-> returning true_to_ok)

let get_fullscreen_mode = ff "SDL_GetWindowFullscreenMode"
  (window @-> returning (some_to_ok display_mode_opt))

let get_icc_profile = ff "SDL_GetWindowICCProfile"
  (window @-> ptr size_t @-> returning (ptr void))

let get_pixel_format = ff "SDL_GetWindowPixelFormat"
  (window @-> returning pixel_format)

let create = ff "SDL_CreateWindow"
  (string @-> int @-> int @-> window_flags @-> returning (some_to_ok window_opt))
let create title w h flags =
  create title w h (Unsigned.ULong.of_int64 flags)

let create_popup = ff "SDL_CreatePopupWindow"
  (window_opt @-> int @-> int @-> int @-> int @-> window_flags @-> returning (some_to_ok window_opt))
let create_popup parent offset_x offset_y w h flags =
  create_popup parent offset_x offset_y w h (Unsigned.ULong.of_int64 flags)

let create_with_properties = ff "SDL_CreateWindowWithProperties"
  (properties_id @-> returning (some_to_ok window_opt))
let create_with_properties props =
  create_with_properties (Unsigned.UInt.of_int props)

let get_id = ff "SDL_GetWindowID"
  (window @-> returning window_id)

let get_from_id = ff "SDL_GetWindowFromID"
  (window_id @-> returning (some_to_ok window_opt))
let get_from_id id =
  get_from_id (Unsigned.UInt.of_int id)

let get_parent = ff "SDL_GetWindowParent"
  (window @-> returning (some_to_ok window_opt))

let get_properties = ff "SDL_GetWindowProperties"
  (window @-> returning properties_id)

let get_flags = ff "SDL_GetWindowFlags"
  (window @-> returning window_flags)

let set_title = ff "SDL_SetWindowTitle"
  (window @-> string @-> returning true_to_ok)

let get_title = ff "SDL_GetWindowTitle"
  (window @-> returning string)

let set_icon = ff "SDL_SetWindowIcon"
  (window @-> surface @-> returning true_to_ok)

let set_position = ff "SDL_SetWindowPosition"
  (window @-> int @-> int @-> returning true_to_ok)

let get_position = ff "SDL_GetWindowPosition"
  (window @-> ptr int @-> ptr int @-> returning bool)
let get_position window =
  let x = allocate int 0 in
  let y = allocate int 0 in
  if get_position window x y then Ok (!@ x, !@ y) else error ()

let set_size = ff "SDL_SetWindowSize"
  (window @-> int @-> int @-> returning true_to_ok)

let get_size = ff "SDL_GetWindowSize"
  (window @-> ptr int @-> ptr int @-> returning bool)
let get_size window =
  let w = allocate int 0 in
  let h = allocate int 0 in
  if get_size window w h then Ok (!@ w, !@ h) else error ()

let get_safe_area = ff "SDL_GetWindowSafeArea"
  (window @-> rect @-> returning true_to_ok)

let set_aspect_ratio = ff "SDL_SetWindowAspectRatio"
  (window @-> float @-> float @-> returning true_to_ok)

let get_aspect_ratio = ff "SDL_GetWindowAspectRatio"
  (window @-> ptr float @-> ptr float @-> returning bool)
let get_aspect_ratio window =
  let min_aspect = allocate float 0. in
  let max_aspect = allocate float 0. in
  if get_aspect_ratio window min_aspect max_aspect then Ok (!@ min_aspect, !@ max_aspect) else error ()

let get_borders_size = ff "SDL_GetWindowBordersSize"
  (window @-> ptr int @-> ptr int @-> ptr int @-> ptr int @-> returning bool)
let get_borders_size window =
  let top = allocate int 0 in
  let left = allocate int 0 in
  let bottom = allocate int 0 in
  let right = allocate int 0 in
  if get_borders_size window top left bottom right then Ok (!@ top, !@ left, !@ bottom, !@ right) else error ()

let get_size_in_pixels = ff "SDL_GetWindowSizeInPixels"
  (window @-> ptr int @-> ptr int @-> returning bool)
let get_size_in_pixels window =
  let w = allocate int 0 in
  let h = allocate int 0 in
  if get_size_in_pixels window w h then Ok (!@ w, !@ h) else error ()

let set_minimum_size = ff "SDL_SetWindowMinimumSize"
  (window @-> int @-> int @-> returning true_to_ok)

let get_minimum_size = ff "SDL_GetWindowMinimumSize"
  (window @-> ptr int @-> ptr int @-> returning bool)
let get_minimum_size window =
  let w = allocate int 0 in
  let h = allocate int 0 in
  if get_minimum_size window w h then Ok (!@ w, !@ h) else error ()

let set_maximum_size = ff "SDL_SetWindowMaximumSize"
  (window @-> int @-> int @-> returning true_to_ok)

let get_maximum_size = ff "SDL_GetWindowMaximumSize"
  (window @-> ptr int @-> ptr int @-> returning bool)
let get_maximum_size window =
  let w = allocate int 0 in
  let h = allocate int 0 in
  if get_maximum_size window w h then Ok (!@ w, !@ h) else error ()

let set_bordered = ff "SDL_SetWindowBordered"
  (window @-> bool @-> returning true_to_ok)

let set_resizable = ff "SDL_SetWindowResizable"
  (window @-> bool @-> returning true_to_ok)

let set_always_on_top = ff "SDL_SetWindowAlwaysOnTop"
  (window @-> bool @-> returning true_to_ok)

let set_fill_document = ff "SDL_SetWindowFillDocument"
  (window @-> bool @-> returning true_to_ok)

let show = ff "SDL_ShowWindow"
  (window @-> returning true_to_ok)

let hide = ff "SDL_HideWindow"
  (window @-> returning true_to_ok)

let raise_ = ff "SDL_RaiseWindow"
  (window @-> returning true_to_ok)

let maximize = ff "SDL_MaximizeWindow"
  (window @-> returning true_to_ok)

let minimize = ff "SDL_MinimizeWindow"
  (window @-> returning true_to_ok)

let restore = ff "SDL_RestoreWindow"
  (window @-> returning true_to_ok)

let set_fullscreen = ff "SDL_SetWindowFullscreen"
  (window @-> bool @-> returning true_to_ok)

let sync = ff "SDL_SyncWindow"
  (window @-> returning true_to_ok)

let has_surface = ff "SDL_WindowHasSurface"
  (window @-> returning bool)

let get_surface = ff "SDL_GetWindowSurface"
  (window @-> returning (some_to_ok surface_opt))

let set_surface_v_sync = ff "SDL_SetWindowSurfaceVSync"
  (window @-> int @-> returning true_to_ok)

let get_surface_v_sync = ff "SDL_GetWindowSurfaceVSync"
  (window @-> ptr int @-> returning bool)
let get_surface_v_sync window =
  let vsync = allocate int 0 in
  if get_surface_v_sync window vsync then Ok (!@ vsync) else error ()

let update_surface = ff "SDL_UpdateWindowSurface"
  (window @-> returning true_to_ok)

let update_surface_rects = ff "SDL_UpdateWindowSurfaceRects"
  (window @-> rect @-> int @-> returning true_to_ok)

let destroy_surface = ff "SDL_DestroyWindowSurface"
  (window @-> returning true_to_ok)

let set_keyboard_grab = ff "SDL_SetWindowKeyboardGrab"
  (window @-> bool @-> returning true_to_ok)

let set_mouse_grab = ff "SDL_SetWindowMouseGrab"
  (window @-> bool @-> returning true_to_ok)

let get_keyboard_grab = ff "SDL_GetWindowKeyboardGrab"
  (window @-> returning true_to_ok)

let get_mouse_grab = ff "SDL_GetWindowMouseGrab"
  (window @-> returning true_to_ok)

let get_grabbed = ff "SDL_GetGrabbedWindow"
  (void @-> returning (some_to_ok window_opt))

let set_mouse_rect = ff "SDL_SetWindowMouseRect"
  (window @-> rect_opt @-> returning true_to_ok)

let get_mouse_rect = ff "SDL_GetWindowMouseRect"
  (window @-> returning (some_to_ok rect_opt))

let set_opacity = ff "SDL_SetWindowOpacity"
  (window @-> float @-> returning true_to_ok)

let get_opacity = ff "SDL_GetWindowOpacity"
  (window @-> returning float)

let set_parent = ff "SDL_SetWindowParent"
  (window @-> window @-> returning true_to_ok)

let set_modal = ff "SDL_SetWindowModal"
  (window @-> bool @-> returning true_to_ok)

let set_focusable = ff "SDL_SetWindowFocusable"
  (window @-> bool @-> returning true_to_ok)

let show_system_menu = ff "SDL_ShowWindowSystemMenu"
  (window @-> int @-> int @-> returning true_to_ok)

let set_hit_test = ff "SDL_SetWindowHitTest"
  (window @-> hit_test @-> ptr void @-> returning true_to_ok)

let set_shape = ff "SDL_SetWindowShape"
  (window @-> surface_opt @-> returning true_to_ok)

let flash = ff "SDL_FlashWindow"
  (window @-> flash_operation @-> returning true_to_ok)

let set_progress_state = ff "SDL_SetWindowProgressState"
  (window @-> progress_state @-> returning true_to_ok)

let get_progress_state = ff "SDL_GetWindowProgressState"
  (window @-> returning progress_state)

let set_progress_value = ff "SDL_SetWindowProgressValue"
  (window @-> float @-> returning true_to_ok)

let get_progress_value = ff "SDL_GetWindowProgressValue"
  (window @-> returning float)

let destroy = ff "SDL_DestroyWindow"
  (window @-> returning void)

let gl_make_current = ff "SDL_GL_MakeCurrent"
  (window @-> gl_context @-> returning true_to_ok)

let gl_get_current = ff "SDL_GL_GetCurrentWindow"
  (void @-> returning (some_to_ok window_opt))

let egl_get_surface = ff "SDL_EGL_GetWindowSurface"
  (window @-> returning egl_surface)

let gl_swap = ff "SDL_GL_SwapWindow"
  (window @-> returning true_to_ok)

end

module GLAttr = struct
let gl_set_attribute = ff "SDL_GL_SetAttribute"
  (gl_attr @-> int @-> returning true_to_ok)

let gl_get_attribute = ff "SDL_GL_GetAttribute"
  (gl_attr @-> ptr int @-> returning bool)
let gl_get_attribute attr =
  let value = allocate int 0 in
  if gl_get_attribute attr value then Ok (!@ value) else error ()

end

module GLContextState = struct
let gl_create_context = ff "SDL_GL_CreateContext"
  (window @-> returning gl_context)

let gl_get_current_context = ff "SDL_GL_GetCurrentContext"
  (void @-> returning gl_context)

let gl_destroy_context = ff "SDL_GL_DestroyContext"
  (gl_context @-> returning true_to_ok)

end

