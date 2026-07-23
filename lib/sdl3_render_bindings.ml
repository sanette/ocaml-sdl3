(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Helpers
open Sdl3_types

let ff = Load.foreign

module Global = struct
let get_num_render_drivers = ff "SDL_GetNumRenderDrivers"
  (void @-> returning int)

let get_render_driver = ff "SDL_GetRenderDriver"
  (int @-> returning string)

let create_window_and_renderer = ff "SDL_CreateWindowAndRenderer"
  (string @-> int @-> int @-> window_flags @-> ptr window @-> ptr renderer @-> returning bool)
let create_window_and_renderer title width height window_flags =
  let window = allocate window null in
  let renderer = allocate renderer null in
  if create_window_and_renderer title width height (Unsigned.ULong.of_int64 window_flags) window renderer then Ok (!@ window, !@ renderer) else error ()

end
include Global

module Renderer = struct
let create = ff "SDL_CreateRenderer"
  (window @-> string @-> returning (some_to_ok renderer_opt))

let create_with_properties = ff "SDL_CreateRendererWithProperties"
  (properties_id @-> returning (some_to_ok renderer_opt))
let create_with_properties props =
  create_with_properties (Unsigned.UInt.of_int props)

let create_gpu = ff "SDL_CreateGPURenderer"
  (gpu_device_opt @-> window_opt @-> returning (some_to_ok renderer_opt))

let create_software = ff "SDL_CreateSoftwareRenderer"
  (surface @-> returning (some_to_ok renderer_opt))

let get = ff "SDL_GetRenderer"
  (window @-> returning (some_to_ok renderer_opt))

let get_window = ff "SDL_GetRenderWindow"
  (renderer @-> returning (some_to_ok window_opt))

let get_name = ff "SDL_GetRendererName"
  (renderer @-> returning string)

let get_properties = ff "SDL_GetRendererProperties"
  (renderer @-> returning properties_id)

let get_output_size = ff "SDL_GetRenderOutputSize"
  (renderer @-> ptr int @-> ptr int @-> returning bool)
let get_output_size renderer =
  let w = allocate int 0 in
  let h = allocate int 0 in
  if get_output_size renderer w h then Ok (!@ w, !@ h) else error ()

let get_current_render_output_size = ff "SDL_GetCurrentRenderOutputSize"
  (renderer @-> ptr int @-> ptr int @-> returning bool)
let get_current_render_output_size renderer =
  let w = allocate int 0 in
  let h = allocate int 0 in
  if get_current_render_output_size renderer w h then Ok (!@ w, !@ h) else error ()

let get_from_texture = ff "SDL_GetRendererFromTexture"
  (texture @-> returning (some_to_ok renderer_opt))

let set_target = ff "SDL_SetRenderTarget"
  (renderer @-> texture_opt @-> returning true_to_ok)

let set_logical_presentation = ff "SDL_SetRenderLogicalPresentation"
  (renderer @-> int @-> int @-> renderer_logical_presentation @-> returning true_to_ok)

let get_logical_presentation = ff "SDL_GetRenderLogicalPresentation"
  (renderer @-> ptr int @-> ptr int @-> ptr renderer_logical_presentation @-> returning true_to_ok)

let get_logical_presentation_rect = ff "SDL_GetRenderLogicalPresentationRect"
  (renderer @-> f_rect_opt @-> returning true_to_ok)

let render_coordinates_from_window = ff "SDL_RenderCoordinatesFromWindow"
  (renderer @-> float @-> float @-> ptr float @-> ptr float @-> returning bool)
let render_coordinates_from_window renderer window_x window_y =
  let x = allocate float 0. in
  let y = allocate float 0. in
  if render_coordinates_from_window renderer window_x window_y x y then Ok (!@ x, !@ y) else error ()

let render_coordinates_to_window = ff "SDL_RenderCoordinatesToWindow"
  (renderer @-> float @-> float @-> ptr float @-> ptr float @-> returning bool)
let render_coordinates_to_window renderer x y =
  let window_x = allocate float 0. in
  let window_y = allocate float 0. in
  if render_coordinates_to_window renderer x y window_x window_y then Ok (!@ window_x, !@ window_y) else error ()

let convert_event_to_render_coordinates = ff "SDL_ConvertEventToRenderCoordinates"
  (renderer @-> event @-> returning true_to_ok)

let set_viewport = ff "SDL_SetRenderViewport"
  (renderer @-> rect_opt @-> returning true_to_ok)

let get_viewport = ff "SDL_GetRenderViewport"
  (renderer @-> rect @-> returning true_to_ok)

let render_viewport_set = ff "SDL_RenderViewportSet"
  (renderer @-> returning true_to_ok)

let get_safe_area = ff "SDL_GetRenderSafeArea"
  (renderer @-> rect @-> returning true_to_ok)

let set_clip_rect = ff "SDL_SetRenderClipRect"
  (renderer @-> rect_opt @-> returning true_to_ok)

let get_clip_rect = ff "SDL_GetRenderClipRect"
  (renderer @-> rect @-> returning true_to_ok)

let render_clip_enabled = ff "SDL_RenderClipEnabled"
  (renderer @-> returning bool)

let set_scale = ff "SDL_SetRenderScale"
  (renderer @-> float @-> float @-> returning true_to_ok)

let get_scale = ff "SDL_GetRenderScale"
  (renderer @-> ptr float @-> ptr float @-> returning bool)
let get_scale renderer =
  let scale_x = allocate float 0. in
  let scale_y = allocate float 0. in
  if get_scale renderer scale_x scale_y then Ok (!@ scale_x, !@ scale_y) else error ()

let set_draw_color = ff "SDL_SetRenderDrawColor"
  (renderer @-> uint8 @-> uint8 @-> uint8 @-> uint8 @-> returning true_to_ok)
let set_draw_color renderer r g b a =
  set_draw_color renderer (Unsigned.UChar.of_int r) (Unsigned.UChar.of_int g) (Unsigned.UChar.of_int b) (Unsigned.UChar.of_int a)

let set_draw_color_float = ff "SDL_SetRenderDrawColorFloat"
  (renderer @-> float @-> float @-> float @-> float @-> returning true_to_ok)

let get_draw_color = ff "SDL_GetRenderDrawColor"
  (renderer @-> ptr uint8 @-> ptr uint8 @-> ptr uint8 @-> ptr uint8 @-> returning bool)
let get_draw_color renderer =
  let r = allocate uchar (Unsigned.UChar.of_int 0) in
  let g = allocate uchar (Unsigned.UChar.of_int 0) in
  let b = allocate uchar (Unsigned.UChar.of_int 0) in
  let a = allocate uchar (Unsigned.UChar.of_int 0) in
  if get_draw_color renderer r g b a then Ok (Unsigned.UChar.to_int (!@ r), Unsigned.UChar.to_int (!@ g), Unsigned.UChar.to_int (!@ b), Unsigned.UChar.to_int (!@ a)) else error ()

let get_draw_color_float = ff "SDL_GetRenderDrawColorFloat"
  (renderer @-> ptr float @-> ptr float @-> ptr float @-> ptr float @-> returning bool)
let get_draw_color_float renderer =
  let r = allocate float 0. in
  let g = allocate float 0. in
  let b = allocate float 0. in
  let a = allocate float 0. in
  if get_draw_color_float renderer r g b a then Ok (!@ r, !@ g, !@ b, !@ a) else error ()

let set_color_scale = ff "SDL_SetRenderColorScale"
  (renderer @-> float @-> returning true_to_ok)

let get_color_scale = ff "SDL_GetRenderColorScale"
  (renderer @-> ptr float @-> returning bool)
let get_color_scale renderer =
  let scale = allocate float 0. in
  if get_color_scale renderer scale then Ok (!@ scale) else error ()

let set_draw_blend_mode = ff "SDL_SetRenderDrawBlendMode"
  (renderer @-> blend_mode @-> returning true_to_ok)
let set_draw_blend_mode renderer blend_mode =
  set_draw_blend_mode renderer (Unsigned.UInt.of_int blend_mode)

let get_draw_blend_mode = ff "SDL_GetRenderDrawBlendMode"
  (renderer @-> ptr blend_mode @-> returning true_to_ok)

let render_clear = ff "SDL_RenderClear"
  (renderer @-> returning true_to_ok)

let render_point = ff "SDL_RenderPoint"
  (renderer @-> float @-> float @-> returning true_to_ok)

let render_points = ff "SDL_RenderPoints"
  (renderer @-> f_point @-> int @-> returning true_to_ok)
let render_points renderer points =
  let points, count = carray_of_list f_point_raw points in
  render_points renderer points count

let render_line = ff "SDL_RenderLine"
  (renderer @-> float @-> float @-> float @-> float @-> returning true_to_ok)

let render_lines = ff "SDL_RenderLines"
  (renderer @-> f_point @-> int @-> returning true_to_ok)
let render_lines renderer points =
  let points, count = carray_of_list f_point_raw points in
  render_lines renderer points count

let render_rect = ff "SDL_RenderRect"
  (renderer @-> f_rect_opt @-> returning true_to_ok)

let render_rects = ff "SDL_RenderRects"
  (renderer @-> f_rect @-> int @-> returning true_to_ok)
let render_rects renderer rects =
  let rects, count = carray_of_list f_rect_raw rects in
  render_rects renderer rects count

let render_fill_rect = ff "SDL_RenderFillRect"
  (renderer @-> f_rect_opt @-> returning true_to_ok)

let render_fill_rects = ff "SDL_RenderFillRects"
  (renderer @-> f_rect @-> int @-> returning true_to_ok)
let render_fill_rects renderer rects =
  let rects, count = carray_of_list f_rect_raw rects in
  render_fill_rects renderer rects count

let render_texture = ff "SDL_RenderTexture"
  (renderer @-> texture @-> f_rect_opt @-> f_rect_opt @-> returning true_to_ok)

let render_texture_rotated = ff "SDL_RenderTextureRotated"
  (renderer @-> texture @-> f_rect_opt @-> f_rect_opt @-> double @-> f_point_opt @-> flip_mode @-> returning true_to_ok)

let render_texture_affine = ff "SDL_RenderTextureAffine"
  (renderer @-> texture @-> f_rect_opt @-> f_point_opt @-> f_point_opt @-> f_point_opt @-> returning true_to_ok)

let render_texture_tiled = ff "SDL_RenderTextureTiled"
  (renderer @-> texture @-> f_rect_opt @-> float @-> f_rect_opt @-> returning true_to_ok)

let render_texture9_grid = ff "SDL_RenderTexture9Grid"
  (renderer @-> texture @-> f_rect_opt @-> float @-> float @-> float @-> float @-> float @-> f_rect_opt @-> returning true_to_ok)

let render_texture9_grid_tiled = ff "SDL_RenderTexture9GridTiled"
  (renderer @-> texture @-> f_rect_opt @-> float @-> float @-> float @-> float @-> float @-> f_rect_opt @-> float @-> returning true_to_ok)

let render_geometry = ff "SDL_RenderGeometry"
  (renderer @-> texture @-> ptr vertex @-> int @-> ptr (const int) @-> int @-> returning true_to_ok)
let render_geometry renderer texture vertices indices =
  let vertices, num_vertices = carray_of_list vertex vertices in
  let indices, num_indices = carray_of_list (const int) indices in
  render_geometry renderer texture vertices num_vertices indices num_indices

let render_geometry_raw = ff "SDL_RenderGeometryRaw"
  (renderer @-> texture @-> ptr (const float) @-> int @-> ptr f_color @-> int @-> ptr (const float) @-> int @-> int @-> ptr void @-> int @-> int @-> returning true_to_ok)
let render_geometry_raw renderer texture xy xy_stride color color_stride uv uv_stride num_vertices indices size_indices =
  let indices, num_indices = carray_of_list void indices in
  render_geometry_raw renderer texture xy xy_stride color color_stride uv uv_stride num_vertices indices num_indices size_indices

let set_texture_address_mode = ff "SDL_SetRenderTextureAddressMode"
  (renderer @-> texture_address_mode @-> texture_address_mode @-> returning true_to_ok)

let get_texture_address_mode = ff "SDL_GetRenderTextureAddressMode"
  (renderer @-> ptr texture_address_mode @-> ptr texture_address_mode @-> returning true_to_ok)

let render_read_pixels = ff "SDL_RenderReadPixels"
  (renderer @-> rect_opt @-> returning (some_to_ok surface_opt))

let render_present = ff "SDL_RenderPresent"
  (renderer @-> returning true_to_ok)

let destroy = ff "SDL_DestroyRenderer"
  (renderer @-> returning void)

let flush = ff "SDL_FlushRenderer"
  (renderer @-> returning true_to_ok)

let get_metal_layer = ff "SDL_GetRenderMetalLayer"
  (renderer @-> returning (ptr void))

let get_metal_command_encoder = ff "SDL_GetRenderMetalCommandEncoder"
  (renderer @-> returning (ptr void))

let add_vulkan_render_semaphores = ff "SDL_AddVulkanRenderSemaphores"
  (renderer @-> uint32 @-> sint64 @-> sint64 @-> returning true_to_ok)
let add_vulkan_render_semaphores renderer wait_stage_mask wait_semaphore signal_semaphore =
  add_vulkan_render_semaphores renderer (Unsigned.UInt.of_int wait_stage_mask) (Signed.Long.of_int wait_semaphore) (Signed.Long.of_int signal_semaphore)

let set_v_sync = ff "SDL_SetRenderVSync"
  (renderer @-> int @-> returning true_to_ok)

let get_v_sync = ff "SDL_GetRenderVSync"
  (renderer @-> ptr int @-> returning bool)
let get_v_sync renderer =
  let vsync = allocate int 0 in
  if get_v_sync renderer vsync then Ok (!@ vsync) else error ()

let render_debug_text = ff "SDL_RenderDebugText"
  (renderer @-> float @-> float @-> string @-> returning true_to_ok)

let set_default_texture_scale_mode = ff "SDL_SetDefaultTextureScaleMode"
  (renderer @-> scale_mode @-> returning true_to_ok)

let get_default_texture_scale_mode = ff "SDL_GetDefaultTextureScaleMode"
  (renderer @-> ptr scale_mode @-> returning true_to_ok)

let set_gpu_render_state = ff "SDL_SetGPURenderState"
  (renderer @-> gpu_render_state_opt @-> returning true_to_ok)

end

module GPUDevice = struct
let get_gpu_renderer_device = ff "SDL_GetGPURendererDevice"
  (renderer @-> returning (some_to_ok gpu_device_opt))

end

module Texture = struct
let create = ff "SDL_CreateTexture"
  (renderer @-> pixel_format @-> texture_access @-> int @-> int @-> returning (some_to_ok texture_opt))

let create_from_surface = ff "SDL_CreateTextureFromSurface"
  (renderer @-> surface @-> returning (some_to_ok texture_opt))

let create_with_properties = ff "SDL_CreateTextureWithProperties"
  (renderer @-> properties_id @-> returning (some_to_ok texture_opt))
let create_with_properties renderer props =
  create_with_properties renderer (Unsigned.UInt.of_int props)

let get_properties = ff "SDL_GetTextureProperties"
  (texture @-> returning properties_id)

let get_size = ff "SDL_GetTextureSize"
  (texture @-> ptr float @-> ptr float @-> returning bool)
let get_size texture =
  let w = allocate float 0. in
  let h = allocate float 0. in
  if get_size texture w h then Ok (!@ w, !@ h) else error ()

let set_palette = ff "SDL_SetTexturePalette"
  (texture @-> palette @-> returning true_to_ok)

let get_palette = ff "SDL_GetTexturePalette"
  (texture @-> returning (some_to_ok palette_opt))

let set_color_mod = ff "SDL_SetTextureColorMod"
  (texture @-> uint8 @-> uint8 @-> uint8 @-> returning true_to_ok)
let set_color_mod texture r g b =
  set_color_mod texture (Unsigned.UChar.of_int r) (Unsigned.UChar.of_int g) (Unsigned.UChar.of_int b)

let set_color_mod_float = ff "SDL_SetTextureColorModFloat"
  (texture @-> float @-> float @-> float @-> returning true_to_ok)

let get_color_mod = ff "SDL_GetTextureColorMod"
  (texture @-> ptr uint8 @-> ptr uint8 @-> ptr uint8 @-> returning bool)
let get_color_mod texture =
  let r = allocate uchar (Unsigned.UChar.of_int 0) in
  let g = allocate uchar (Unsigned.UChar.of_int 0) in
  let b = allocate uchar (Unsigned.UChar.of_int 0) in
  if get_color_mod texture r g b then Ok (Unsigned.UChar.to_int (!@ r), Unsigned.UChar.to_int (!@ g), Unsigned.UChar.to_int (!@ b)) else error ()

let get_color_mod_float = ff "SDL_GetTextureColorModFloat"
  (texture @-> ptr float @-> ptr float @-> ptr float @-> returning bool)
let get_color_mod_float texture =
  let r = allocate float 0. in
  let g = allocate float 0. in
  let b = allocate float 0. in
  if get_color_mod_float texture r g b then Ok (!@ r, !@ g, !@ b) else error ()

let set_alpha_mod = ff "SDL_SetTextureAlphaMod"
  (texture @-> uint8 @-> returning true_to_ok)
let set_alpha_mod texture alpha =
  set_alpha_mod texture (Unsigned.UChar.of_int alpha)

let set_alpha_mod_float = ff "SDL_SetTextureAlphaModFloat"
  (texture @-> float @-> returning true_to_ok)

let get_alpha_mod = ff "SDL_GetTextureAlphaMod"
  (texture @-> ptr uint8 @-> returning bool)
let get_alpha_mod texture =
  let alpha = allocate uchar (Unsigned.UChar.of_int 0) in
  if get_alpha_mod texture alpha then Ok (Unsigned.UChar.to_int (!@ alpha)) else error ()

let get_alpha_mod_float = ff "SDL_GetTextureAlphaModFloat"
  (texture @-> ptr float @-> returning bool)
let get_alpha_mod_float texture =
  let alpha = allocate float 0. in
  if get_alpha_mod_float texture alpha then Ok (!@ alpha) else error ()

let set_blend_mode = ff "SDL_SetTextureBlendMode"
  (texture @-> blend_mode @-> returning true_to_ok)
let set_blend_mode texture blend_mode =
  set_blend_mode texture (Unsigned.UInt.of_int blend_mode)

let get_blend_mode = ff "SDL_GetTextureBlendMode"
  (texture @-> ptr blend_mode @-> returning true_to_ok)

let set_scale_mode = ff "SDL_SetTextureScaleMode"
  (texture @-> scale_mode @-> returning true_to_ok)

let get_scale_mode = ff "SDL_GetTextureScaleMode"
  (texture @-> ptr scale_mode @-> returning true_to_ok)

let update = ff "SDL_UpdateTexture"
  (texture @-> rect_opt @-> ptr void @-> int @-> returning true_to_ok)

let update_yuv = ff "SDL_UpdateYUVTexture"
  (texture @-> rect_opt @-> ptr uint8 @-> int @-> ptr uint8 @-> int @-> ptr uint8 @-> int @-> returning true_to_ok)

let update_nv = ff "SDL_UpdateNVTexture"
  (texture @-> rect_opt @-> ptr uint8 @-> int @-> ptr uint8 @-> int @-> returning true_to_ok)

let lock = ff "SDL_LockTexture"
  (texture @-> rect_opt @-> ptr (ptr void) @-> ptr int @-> returning bool)
let lock texture rect pixels =
  let pitch = allocate int 0 in
  if lock texture rect pixels pitch then Ok (!@ pitch) else error ()

let lock_to_surface = ff "SDL_LockTextureToSurface"
  (texture @-> rect_opt @-> ptr surface @-> returning true_to_ok)

let unlock = ff "SDL_UnlockTexture"
  (texture @-> returning void)

let get_render_target = ff "SDL_GetRenderTarget"
  (renderer @-> returning (some_to_ok texture_opt))

let destroy = ff "SDL_DestroyTexture"
  (texture @-> returning void)

include Texture

end

module GPURenderState = struct
let create = ff "SDL_CreateGPURenderState"
  (renderer @-> ptr gpu_render_state_create_info @-> returning (some_to_ok gpu_render_state_opt))

let set_sampler_bindings = ff "SDL_SetGPURenderStateSamplerBindings"
  (gpu_render_state @-> int @-> ptr gpu_texture_sampler_binding @-> returning true_to_ok)
let set_sampler_bindings state sampler_bindings =
  let sampler_bindings, num_sampler_bindings = carray_of_list gpu_texture_sampler_binding sampler_bindings in
  set_sampler_bindings state num_sampler_bindings sampler_bindings

let set_storage_textures = ff "SDL_SetGPURenderStateStorageTextures"
  (gpu_render_state @-> int @-> ptr gpu_texture @-> returning true_to_ok)
let set_storage_textures state storage_textures =
  let storage_textures, num_storage_textures = carray_of_list gpu_texture storage_textures in
  set_storage_textures state num_storage_textures storage_textures

let set_storage_buffers = ff "SDL_SetGPURenderStateStorageBuffers"
  (gpu_render_state @-> int @-> ptr gpu_buffer @-> returning true_to_ok)
let set_storage_buffers state storage_buffers =
  let storage_buffers, num_storage_buffers = carray_of_list gpu_buffer storage_buffers in
  set_storage_buffers state num_storage_buffers storage_buffers

let set_fragment_uniforms = ff "SDL_SetGPURenderStateFragmentUniforms"
  (gpu_render_state @-> uint32 @-> ptr void @-> uint32 @-> returning true_to_ok)
let set_fragment_uniforms state slot_index data length =
  set_fragment_uniforms state (Unsigned.UInt.of_int slot_index) data (Unsigned.UInt.of_int length)

let destroy = ff "SDL_DestroyGPURenderState"
  (gpu_render_state @-> returning void)

end

