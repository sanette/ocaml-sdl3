(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Sdl3_types
open Helpers

let ff = Load.foreign

module GPU = struct
let supports_shader_formats = ff "SDL_GPUSupportsShaderFormats"
  (gpu_shader_format @-> string @-> returning bool)
let supports_shader_formats format_flags name =
  supports_shader_formats (Unsigned.UInt.of_int format_flags) name

let get_num_drivers = ff "SDL_GetNumGPUDrivers"
  (void @-> returning int)

let get_driver = ff "SDL_GetGPUDriver"
  (int @-> returning string)

let get_shader_formats = ff "SDL_GetGPUShaderFormats"
  (gpu_device @-> returning int_as_uint)

let set_buffer_name = ff "SDL_SetGPUBufferName"
  (gpu_device @-> gpu_buffer @-> string @-> returning void)

let set_texture_name = ff "SDL_SetGPUTextureName"
  (gpu_device @-> gpu_texture @-> string @-> returning void)

let insert_debug_label = ff "SDL_InsertGPUDebugLabel"
  (gpu_command_buffer @-> string @-> returning void)

let push_debug_group = ff "SDL_PushGPUDebugGroup"
  (gpu_command_buffer @-> string @-> returning void)

let pop_debug_group = ff "SDL_PopGPUDebugGroup"
  (gpu_command_buffer @-> returning void)

let release_texture = ff "SDL_ReleaseGPUTexture"
  (gpu_device @-> gpu_texture @-> returning void)

let release_sampler = ff "SDL_ReleaseGPUSampler"
  (gpu_device @-> gpu_sampler @-> returning void)

let release_buffer = ff "SDL_ReleaseGPUBuffer"
  (gpu_device @-> gpu_buffer @-> returning void)

let release_transfer_buffer = ff "SDL_ReleaseGPUTransferBuffer"
  (gpu_device @-> gpu_transfer_buffer @-> returning void)

let release_compute_pipeline = ff "SDL_ReleaseGPUComputePipeline"
  (gpu_device @-> gpu_compute_pipeline @-> returning void)

let release_shader = ff "SDL_ReleaseGPUShader"
  (gpu_device @-> gpu_shader @-> returning void)

let release_graphics_pipeline = ff "SDL_ReleaseGPUGraphicsPipeline"
  (gpu_device @-> gpu_graphics_pipeline @-> returning void)

let push_vertex_uniform_data = ff "SDL_PushGPUVertexUniformData"
  (gpu_command_buffer @-> uint32 @-> ptr void @-> uint32 @-> returning void)
let push_vertex_uniform_data command_buffer slot_index data length =
  push_vertex_uniform_data command_buffer (Unsigned.UInt.of_int slot_index) data (Unsigned.UInt.of_int length)

let push_fragment_uniform_data = ff "SDL_PushGPUFragmentUniformData"
  (gpu_command_buffer @-> uint32 @-> ptr void @-> uint32 @-> returning void)
let push_fragment_uniform_data command_buffer slot_index data length =
  push_fragment_uniform_data command_buffer (Unsigned.UInt.of_int slot_index) data (Unsigned.UInt.of_int length)

let push_compute_uniform_data = ff "SDL_PushGPUComputeUniformData"
  (gpu_command_buffer @-> uint32 @-> ptr void @-> uint32 @-> returning void)
let push_compute_uniform_data command_buffer slot_index data length =
  push_compute_uniform_data command_buffer (Unsigned.UInt.of_int slot_index) data (Unsigned.UInt.of_int length)

let bind_graphics_pipeline = ff "SDL_BindGPUGraphicsPipeline"
  (gpu_render_pass @-> gpu_graphics_pipeline @-> returning void)

let set_viewport = ff "SDL_SetGPUViewport"
  (gpu_render_pass @-> ptr gpu_viewport @-> returning void)

let set_scissor = ff "SDL_SetGPUScissor"
  (gpu_render_pass @-> ptr rect @-> returning void)

let set_blend_constants = ff "SDL_SetGPUBlendConstants"
  (gpu_render_pass @-> f_color @-> returning void)

let set_stencil_reference = ff "SDL_SetGPUStencilReference"
  (gpu_render_pass @-> uint8 @-> returning void)
let set_stencil_reference render_pass reference =
  set_stencil_reference render_pass (Unsigned.UChar.of_int reference)

let bind_vertex_buffers = ff "SDL_BindGPUVertexBuffers"
  (gpu_render_pass @-> uint32 @-> ptr gpu_buffer_binding @-> uint32 @-> returning void)
let bind_vertex_buffers render_pass first_slot bindings =
  let bindings, num_bindings = carray_of_list gpu_buffer_binding bindings in
  bind_vertex_buffers render_pass (Unsigned.UInt.of_int first_slot) bindings (Unsigned.UInt.of_int num_bindings)

let bind_index_buffer = ff "SDL_BindGPUIndexBuffer"
  (gpu_render_pass @-> ptr gpu_buffer_binding @-> gpu_index_element_size @-> returning void)

let bind_vertex_samplers = ff "SDL_BindGPUVertexSamplers"
  (gpu_render_pass @-> uint32 @-> ptr gpu_texture_sampler_binding @-> uint32 @-> returning void)
let bind_vertex_samplers render_pass first_slot texture_sampler_bindings num_bindings =
  bind_vertex_samplers render_pass (Unsigned.UInt.of_int first_slot) texture_sampler_bindings (Unsigned.UInt.of_int num_bindings)

let bind_vertex_storage_textures = ff "SDL_BindGPUVertexStorageTextures"
  (gpu_render_pass @-> uint32 @-> ptr gpu_texture @-> uint32 @-> returning void)
let bind_vertex_storage_textures render_pass first_slot storage_textures num_bindings =
  bind_vertex_storage_textures render_pass (Unsigned.UInt.of_int first_slot) storage_textures (Unsigned.UInt.of_int num_bindings)

let bind_vertex_storage_buffers = ff "SDL_BindGPUVertexStorageBuffers"
  (gpu_render_pass @-> uint32 @-> ptr gpu_buffer @-> uint32 @-> returning void)
let bind_vertex_storage_buffers render_pass first_slot storage_buffers num_bindings =
  bind_vertex_storage_buffers render_pass (Unsigned.UInt.of_int first_slot) storage_buffers (Unsigned.UInt.of_int num_bindings)

let bind_fragment_samplers = ff "SDL_BindGPUFragmentSamplers"
  (gpu_render_pass @-> uint32 @-> ptr gpu_texture_sampler_binding @-> uint32 @-> returning void)
let bind_fragment_samplers render_pass first_slot texture_sampler_bindings num_bindings =
  bind_fragment_samplers render_pass (Unsigned.UInt.of_int first_slot) texture_sampler_bindings (Unsigned.UInt.of_int num_bindings)

let bind_fragment_storage_textures = ff "SDL_BindGPUFragmentStorageTextures"
  (gpu_render_pass @-> uint32 @-> ptr gpu_texture @-> uint32 @-> returning void)
let bind_fragment_storage_textures render_pass first_slot storage_textures num_bindings =
  bind_fragment_storage_textures render_pass (Unsigned.UInt.of_int first_slot) storage_textures (Unsigned.UInt.of_int num_bindings)

let bind_fragment_storage_buffers = ff "SDL_BindGPUFragmentStorageBuffers"
  (gpu_render_pass @-> uint32 @-> ptr gpu_buffer @-> uint32 @-> returning void)
let bind_fragment_storage_buffers render_pass first_slot storage_buffers num_bindings =
  bind_fragment_storage_buffers render_pass (Unsigned.UInt.of_int first_slot) storage_buffers (Unsigned.UInt.of_int num_bindings)

let draw_indexed_primitives = ff "SDL_DrawGPUIndexedPrimitives"
  (gpu_render_pass @-> uint32 @-> uint32 @-> uint32 @-> sint32 @-> uint32 @-> returning void)
let draw_indexed_primitives render_pass num_indices num_instances first_index vertex_offset first_instance =
  draw_indexed_primitives render_pass (Unsigned.UInt.of_int num_indices) (Unsigned.UInt.of_int num_instances) (Unsigned.UInt.of_int first_index) vertex_offset (Unsigned.UInt.of_int first_instance)

let draw_primitives = ff "SDL_DrawGPUPrimitives"
  (gpu_render_pass @-> uint32 @-> uint32 @-> uint32 @-> uint32 @-> returning void)
let draw_primitives render_pass num_vertices num_instances first_vertex first_instance =
  draw_primitives render_pass (Unsigned.UInt.of_int num_vertices) (Unsigned.UInt.of_int num_instances) (Unsigned.UInt.of_int first_vertex) (Unsigned.UInt.of_int first_instance)

let draw_primitives_indirect = ff "SDL_DrawGPUPrimitivesIndirect"
  (gpu_render_pass @-> gpu_buffer @-> uint32 @-> uint32 @-> returning void)
let draw_primitives_indirect render_pass buffer offset draw_count =
  draw_primitives_indirect render_pass buffer (Unsigned.UInt.of_int offset) (Unsigned.UInt.of_int draw_count)

let draw_indexed_primitives_indirect = ff "SDL_DrawGPUIndexedPrimitivesIndirect"
  (gpu_render_pass @-> gpu_buffer @-> uint32 @-> uint32 @-> returning void)
let draw_indexed_primitives_indirect render_pass buffer offset draw_count =
  draw_indexed_primitives_indirect render_pass buffer (Unsigned.UInt.of_int offset) (Unsigned.UInt.of_int draw_count)

let bind_compute_pipeline = ff "SDL_BindGPUComputePipeline"
  (gpu_compute_pass @-> gpu_compute_pipeline @-> returning void)

let bind_compute_samplers = ff "SDL_BindGPUComputeSamplers"
  (gpu_compute_pass @-> uint32 @-> ptr gpu_texture_sampler_binding @-> uint32 @-> returning void)
let bind_compute_samplers compute_pass first_slot texture_sampler_bindings num_bindings =
  bind_compute_samplers compute_pass (Unsigned.UInt.of_int first_slot) texture_sampler_bindings (Unsigned.UInt.of_int num_bindings)

let bind_compute_storage_textures = ff "SDL_BindGPUComputeStorageTextures"
  (gpu_compute_pass @-> uint32 @-> ptr gpu_texture @-> uint32 @-> returning void)
let bind_compute_storage_textures compute_pass first_slot storage_textures num_bindings =
  bind_compute_storage_textures compute_pass (Unsigned.UInt.of_int first_slot) storage_textures (Unsigned.UInt.of_int num_bindings)

let bind_compute_storage_buffers = ff "SDL_BindGPUComputeStorageBuffers"
  (gpu_compute_pass @-> uint32 @-> ptr gpu_buffer @-> uint32 @-> returning void)
let bind_compute_storage_buffers compute_pass first_slot storage_buffers num_bindings =
  bind_compute_storage_buffers compute_pass (Unsigned.UInt.of_int first_slot) storage_buffers (Unsigned.UInt.of_int num_bindings)

let dispatch_compute = ff "SDL_DispatchGPUCompute"
  (gpu_compute_pass @-> uint32 @-> uint32 @-> uint32 @-> returning void)
let dispatch_compute compute_pass groupcount_x groupcount_y groupcount_z =
  dispatch_compute compute_pass (Unsigned.UInt.of_int groupcount_x) (Unsigned.UInt.of_int groupcount_y) (Unsigned.UInt.of_int groupcount_z)

let dispatch_compute_indirect = ff "SDL_DispatchGPUComputeIndirect"
  (gpu_compute_pass @-> gpu_buffer @-> uint32 @-> returning void)
let dispatch_compute_indirect compute_pass buffer offset =
  dispatch_compute_indirect compute_pass buffer (Unsigned.UInt.of_int offset)

let map_transfer_buffer = ff "SDL_MapGPUTransferBuffer"
  (gpu_device @-> gpu_transfer_buffer @-> bool @-> returning (ptr void))

let unmap_transfer_buffer = ff "SDL_UnmapGPUTransferBuffer"
  (gpu_device @-> gpu_transfer_buffer @-> returning void)

let upload_to_texture = ff "SDL_UploadToGPUTexture"
  (gpu_copy_pass @-> ptr gpu_texture_transfer_info @-> ptr gpu_texture_region @-> bool @-> returning void)

let upload_to_buffer = ff "SDL_UploadToGPUBuffer"
  (gpu_copy_pass @-> ptr gpu_transfer_buffer_location @-> ptr gpu_buffer_region @-> bool @-> returning void)

let copy_texture_to_texture = ff "SDL_CopyGPUTextureToTexture"
  (gpu_copy_pass @-> ptr gpu_texture_location @-> ptr gpu_texture_location @-> uint32 @-> uint32 @-> uint32 @-> bool @-> returning void)
let copy_texture_to_texture copy_pass source destination w h d cycle =
  copy_texture_to_texture copy_pass source destination (Unsigned.UInt.of_int w) (Unsigned.UInt.of_int h) (Unsigned.UInt.of_int d) cycle

let copy_buffer_to_buffer = ff "SDL_CopyGPUBufferToBuffer"
  (gpu_copy_pass @-> ptr gpu_buffer_location @-> ptr gpu_buffer_location @-> uint32 @-> bool @-> returning void)
let copy_buffer_to_buffer copy_pass source destination size cycle =
  copy_buffer_to_buffer copy_pass source destination (Unsigned.UInt.of_int size) cycle

let download_from_texture = ff "SDL_DownloadFromGPUTexture"
  (gpu_copy_pass @-> ptr gpu_texture_region @-> ptr gpu_texture_transfer_info @-> returning void)

let download_from_buffer = ff "SDL_DownloadFromGPUBuffer"
  (gpu_copy_pass @-> ptr gpu_buffer_region @-> ptr gpu_transfer_buffer_location @-> returning void)

let generate_mipmaps_for_texture = ff "SDL_GenerateMipmapsForGPUTexture"
  (gpu_command_buffer @-> gpu_texture @-> returning void)

let blit_texture = ff "SDL_BlitGPUTexture"
  (gpu_command_buffer @-> ptr gpu_blit_info @-> returning void)

let window_supports_swapchain_composition = ff "SDL_WindowSupportsGPUSwapchainComposition"
  (gpu_device @-> window @-> gpu_swapchain_composition @-> returning bool)

let window_supports_present_mode = ff "SDL_WindowSupportsGPUPresentMode"
  (gpu_device @-> window @-> gpu_present_mode @-> returning bool)

let set_swapchain_parameters = ff "SDL_SetGPUSwapchainParameters"
  (gpu_device @-> window @-> gpu_swapchain_composition @-> gpu_present_mode @-> returning true_to_ok)

let set_allowed_frames_in_flight = ff "SDL_SetGPUAllowedFramesInFlight"
  (gpu_device @-> uint32 @-> returning true_to_ok)
let set_allowed_frames_in_flight device allowed_frames_in_flight =
  set_allowed_frames_in_flight device (Unsigned.UInt.of_int allowed_frames_in_flight)

let get_swapchain_texture_format = ff "SDL_GetGPUSwapchainTextureFormat"
  (gpu_device @-> window @-> returning gpu_texture_format)

let acquire_swapchain_texture = ff "SDL_AcquireGPUSwapchainTexture"
  (gpu_command_buffer @-> window @-> ptr gpu_texture @-> ptr uint32 @-> ptr uint32 @-> returning bool)
let acquire_swapchain_texture command_buffer window swapchain_texture =
  let swapchain_texture_width = allocate uint (Unsigned.UInt.of_int 0) in
  let swapchain_texture_height = allocate uint (Unsigned.UInt.of_int 0) in
  if acquire_swapchain_texture command_buffer window swapchain_texture swapchain_texture_width swapchain_texture_height then Ok (Unsigned.UInt.to_int (!@ swapchain_texture_width), Unsigned.UInt.to_int (!@ swapchain_texture_height)) else error ()

let wait_for_swapchain = ff "SDL_WaitForGPUSwapchain"
  (gpu_device @-> window @-> returning true_to_ok)

let wait_and_acquire_swapchain_texture = ff "SDL_WaitAndAcquireGPUSwapchainTexture"
  (gpu_command_buffer @-> window @-> ptr gpu_texture @-> ptr uint32 @-> ptr uint32 @-> returning bool)
let wait_and_acquire_swapchain_texture command_buffer window swapchain_texture =
  let swapchain_texture_width = allocate uint (Unsigned.UInt.of_int 0) in
  let swapchain_texture_height = allocate uint (Unsigned.UInt.of_int 0) in
  if wait_and_acquire_swapchain_texture command_buffer window swapchain_texture swapchain_texture_width swapchain_texture_height then Ok (Unsigned.UInt.to_int (!@ swapchain_texture_width), Unsigned.UInt.to_int (!@ swapchain_texture_height)) else error ()

let wait_for_idle = ff "SDL_WaitForGPUIdle"
  (gpu_device @-> returning true_to_ok)

let wait_for_fences = ff "SDL_WaitForGPUFences"
  (gpu_device @-> bool @-> ptr gpu_fence @-> uint32 @-> returning true_to_ok)
let wait_for_fences device wait_all fences =
  let fences, num_fences = carray_of_list gpu_fence fences in
  wait_for_fences device wait_all fences (Unsigned.UInt.of_int num_fences)

let query_fence = ff "SDL_QueryGPUFence"
  (gpu_device @-> gpu_fence @-> returning true_to_ok)

let release_fence = ff "SDL_ReleaseGPUFence"
  (gpu_device @-> gpu_fence @-> returning void)

let texture_supports_format = ff "SDL_GPUTextureSupportsFormat"
  (gpu_device @-> gpu_texture_format @-> gpu_texture_type @-> gpu_texture_usage_flags @-> returning bool)
let texture_supports_format device format typ usage =
  texture_supports_format device format typ (Unsigned.UInt.of_int usage)

let texture_supports_sample_count = ff "SDL_GPUTextureSupportsSampleCount"
  (gpu_device @-> gpu_texture_format @-> gpu_sample_count @-> returning bool)

end

module Properties = struct
let gpu_supports = ff "SDL_GPUSupportsProperties"
  (properties_id @-> returning bool)
let gpu_supports props =
  gpu_supports (Unsigned.UInt.of_int props)

end

module GPUDevice = struct
let create = ff "SDL_CreateGPUDevice"
  (gpu_shader_format @-> bool @-> string @-> returning (some_to_ok gpu_device_opt))
let create format_flags debug_mode name =
  create (Unsigned.UInt.of_int format_flags) debug_mode name

let create_with_properties = ff "SDL_CreateGPUDeviceWithProperties"
  (properties_id @-> returning (some_to_ok gpu_device_opt))
let create_with_properties props =
  create_with_properties (Unsigned.UInt.of_int props)

let destroy = ff "SDL_DestroyGPUDevice"
  (gpu_device @-> returning void)

let get_driver = ff "SDL_GetGPUDeviceDriver"
  (gpu_device @-> returning string)

let get_properties = ff "SDL_GetGPUDeviceProperties"
  (gpu_device @-> returning int_as_uint)

let claim_window_for = ff "SDL_ClaimWindowForGPUDevice"
  (gpu_device @-> window @-> returning true_to_ok)

let release_window_from = ff "SDL_ReleaseWindowFromGPUDevice"
  (gpu_device @-> window @-> returning void)

end

module GPUComputePipeline = struct
let create = ff "SDL_CreateGPUComputePipeline"
  (gpu_device @-> ptr gpu_compute_pipeline_create_info @-> returning (some_to_ok gpu_compute_pipeline_opt))

end

module GPUGraphicsPipeline = struct
let create = ff "SDL_CreateGPUGraphicsPipeline"
  (gpu_device @-> ptr gpu_graphics_pipeline_create_info @-> returning (some_to_ok gpu_graphics_pipeline_opt))

end

module GPUSampler = struct
let create = ff "SDL_CreateGPUSampler"
  (gpu_device @-> ptr gpu_sampler_create_info @-> returning (some_to_ok gpu_sampler_opt))

end

module GPUShader = struct
let create = ff "SDL_CreateGPUShader"
  (gpu_device @-> ptr gpu_shader_create_info @-> returning (some_to_ok gpu_shader_opt))

end

module GPUTexture = struct
let create = ff "SDL_CreateGPUTexture"
  (gpu_device @-> ptr gpu_texture_create_info @-> returning (some_to_ok gpu_texture_opt))

end

module GPUBuffer = struct
let create = ff "SDL_CreateGPUBuffer"
  (gpu_device @-> ptr gpu_buffer_create_info @-> returning (some_to_ok gpu_buffer_opt))

end

module GPUTransferBuffer = struct
let create = ff "SDL_CreateGPUTransferBuffer"
  (gpu_device @-> ptr gpu_transfer_buffer_create_info @-> returning (some_to_ok gpu_transfer_buffer_opt))

end

module GPUCommandBuffer = struct
let acquire = ff "SDL_AcquireGPUCommandBuffer"
  (gpu_device @-> returning (some_to_ok gpu_command_buffer_opt))

let submit = ff "SDL_SubmitGPUCommandBuffer"
  (gpu_command_buffer @-> returning true_to_ok)

let submit_and_acquire_fence = ff "SDL_SubmitGPUCommandBufferAndAcquireFence"
  (gpu_command_buffer @-> returning (some_to_ok gpu_fence_opt))

let cancel = ff "SDL_CancelGPUCommandBuffer"
  (gpu_command_buffer @-> returning true_to_ok)

end

module GPURenderPass = struct
let begin_ = ff "SDL_BeginGPURenderPass"
  (gpu_command_buffer @-> ptr gpu_color_target_info @-> uint32 @-> gpu_depth_stencil_target_info_opt @-> returning (some_to_ok gpu_render_pass_opt))
let begin_ command_buffer color_target_infos num_color_targets depth_stencil_target_info =
  begin_ command_buffer color_target_infos (Unsigned.UInt.of_int num_color_targets) depth_stencil_target_info

let end_ = ff "SDL_EndGPURenderPass"
  (gpu_render_pass @-> returning void)

end

module GPUComputePass = struct
let begin_ = ff "SDL_BeginGPUComputePass"
  (gpu_command_buffer @-> ptr gpu_storage_texture_read_write_binding @-> uint32 @-> ptr gpu_storage_buffer_read_write_binding @-> uint32 @-> returning (some_to_ok gpu_compute_pass_opt))
let begin_ command_buffer storage_texture_bindings storage_buffer_bindings =
  let storage_texture_bindings, num_storage_texture_bindings = carray_of_list gpu_storage_texture_read_write_binding storage_texture_bindings in
  let storage_buffer_bindings, num_storage_buffer_bindings = carray_of_list gpu_storage_buffer_read_write_binding storage_buffer_bindings in
  begin_ command_buffer storage_texture_bindings (Unsigned.UInt.of_int num_storage_texture_bindings) storage_buffer_bindings (Unsigned.UInt.of_int num_storage_buffer_bindings)

let end_ = ff "SDL_EndGPUComputePass"
  (gpu_compute_pass @-> returning void)

end

module GPUCopyPass = struct
let begin_ = ff "SDL_BeginGPUCopyPass"
  (gpu_command_buffer @-> returning (some_to_ok gpu_copy_pass_opt))

let end_ = ff "SDL_EndGPUCopyPass"
  (gpu_copy_pass @-> returning void)

end

module GPUTextureFormat = struct
let texel_block_size = ff "SDL_GPUTextureFormatTexelBlockSize"
  (gpu_texture_format @-> returning int_as_uint)

let calculate_size = ff "SDL_CalculateGPUTextureFormatSize"
  (gpu_texture_format @-> uint32 @-> uint32 @-> uint32 @-> returning int_as_uint)
let calculate_size format width height depth_or_layer_count =
  calculate_size format (Unsigned.UInt.of_int width) (Unsigned.UInt.of_int height) (Unsigned.UInt.of_int depth_or_layer_count)

let get_from_pixel_format = ff "SDL_GetGPUTextureFormatFromPixelFormat"
  (pixel_format @-> returning gpu_texture_format)

end

module PixelFormat = struct
let get_from_gpu_texture_format = ff "SDL_GetPixelFormatFromGPUTextureFormat"
  (gpu_texture_format @-> returning pixel_format)

end

