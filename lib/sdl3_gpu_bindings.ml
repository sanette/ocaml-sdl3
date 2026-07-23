(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Helpers
open Sdl3_types

let ff = Load.foreign

module Global = struct
let gpu_supports_shader_formats = ff "SDL_GPUSupportsShaderFormats"
  (gpu_shader_format @-> string @-> returning bool)
let gpu_supports_shader_formats format_flags name =
  gpu_supports_shader_formats (Unsigned.UInt.of_int format_flags) name

let gpu_supports_properties = ff "SDL_GPUSupportsProperties"
  (properties_id @-> returning bool)
let gpu_supports_properties props =
  gpu_supports_properties (Unsigned.UInt.of_int props)

let get_num_gpu_drivers = ff "SDL_GetNumGPUDrivers"
  (void @-> returning int)

let get_gpu_driver = ff "SDL_GetGPUDriver"
  (int @-> returning string)

end
include Global

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

let get_gpu_shader_formats = ff "SDL_GetGPUShaderFormats"
  (gpu_device @-> returning gpu_shader_format)

let get_properties = ff "SDL_GetGPUDeviceProperties"
  (gpu_device @-> returning properties_id)

let set_gpu_buffer_name = ff "SDL_SetGPUBufferName"
  (gpu_device @-> gpu_buffer @-> string @-> returning void)

let set_gpu_texture_name = ff "SDL_SetGPUTextureName"
  (gpu_device @-> gpu_texture @-> string @-> returning void)

let release_gpu_texture = ff "SDL_ReleaseGPUTexture"
  (gpu_device @-> gpu_texture @-> returning void)

let release_gpu_sampler = ff "SDL_ReleaseGPUSampler"
  (gpu_device @-> gpu_sampler @-> returning void)

let release_gpu_buffer = ff "SDL_ReleaseGPUBuffer"
  (gpu_device @-> gpu_buffer @-> returning void)

let release_gpu_transfer_buffer = ff "SDL_ReleaseGPUTransferBuffer"
  (gpu_device @-> gpu_transfer_buffer @-> returning void)

let release_gpu_compute_pipeline = ff "SDL_ReleaseGPUComputePipeline"
  (gpu_device @-> gpu_compute_pipeline @-> returning void)

let release_gpu_shader = ff "SDL_ReleaseGPUShader"
  (gpu_device @-> gpu_shader @-> returning void)

let release_gpu_graphics_pipeline = ff "SDL_ReleaseGPUGraphicsPipeline"
  (gpu_device @-> gpu_graphics_pipeline @-> returning void)

let map_gpu_transfer_buffer = ff "SDL_MapGPUTransferBuffer"
  (gpu_device @-> gpu_transfer_buffer @-> bool @-> returning (ptr void))

let unmap_gpu_transfer_buffer = ff "SDL_UnmapGPUTransferBuffer"
  (gpu_device @-> gpu_transfer_buffer @-> returning void)

let window_supports_gpu_swapchain_composition = ff "SDL_WindowSupportsGPUSwapchainComposition"
  (gpu_device @-> window @-> gpu_swapchain_composition @-> returning bool)

let window_supports_gpu_present_mode = ff "SDL_WindowSupportsGPUPresentMode"
  (gpu_device @-> window @-> gpu_present_mode @-> returning bool)

let claim_window_for = ff "SDL_ClaimWindowForGPUDevice"
  (gpu_device @-> window @-> returning true_to_ok)

let release_window_from = ff "SDL_ReleaseWindowFromGPUDevice"
  (gpu_device @-> window @-> returning void)

let set_gpu_swapchain_parameters = ff "SDL_SetGPUSwapchainParameters"
  (gpu_device @-> window @-> gpu_swapchain_composition @-> gpu_present_mode @-> returning true_to_ok)

let set_gpu_allowed_frames_in_flight = ff "SDL_SetGPUAllowedFramesInFlight"
  (gpu_device @-> uint32 @-> returning true_to_ok)
let set_gpu_allowed_frames_in_flight device allowed_frames_in_flight =
  set_gpu_allowed_frames_in_flight device (Unsigned.UInt.of_int allowed_frames_in_flight)

let wait_for_gpu_swapchain = ff "SDL_WaitForGPUSwapchain"
  (gpu_device @-> window @-> returning true_to_ok)

let wait_for_gpu_idle = ff "SDL_WaitForGPUIdle"
  (gpu_device @-> returning true_to_ok)

let wait_for_gpu_fences = ff "SDL_WaitForGPUFences"
  (gpu_device @-> bool @-> ptr gpu_fence @-> uint32 @-> returning true_to_ok)
let wait_for_gpu_fences device wait_all fences =
  let fences, num_fences = carray_of_list gpu_fence fences in
  wait_for_gpu_fences device wait_all fences (Unsigned.UInt.of_int num_fences)

let query_gpu_fence = ff "SDL_QueryGPUFence"
  (gpu_device @-> gpu_fence @-> returning true_to_ok)

let release_gpu_fence = ff "SDL_ReleaseGPUFence"
  (gpu_device @-> gpu_fence @-> returning void)

let gpu_texture_supports_format = ff "SDL_GPUTextureSupportsFormat"
  (gpu_device @-> gpu_texture_format @-> gpu_texture_type @-> gpu_texture_usage_flags @-> returning bool)
let gpu_texture_supports_format device format typ usage =
  gpu_texture_supports_format device format typ (Unsigned.UInt.of_int usage)

let gpu_texture_supports_sample_count = ff "SDL_GPUTextureSupportsSampleCount"
  (gpu_device @-> gpu_texture_format @-> gpu_sample_count @-> returning bool)

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
let insert_gpu_debug_label = ff "SDL_InsertGPUDebugLabel"
  (gpu_command_buffer @-> string @-> returning void)

let push_gpu_debug_group = ff "SDL_PushGPUDebugGroup"
  (gpu_command_buffer @-> string @-> returning void)

let pop_gpu_debug_group = ff "SDL_PopGPUDebugGroup"
  (gpu_command_buffer @-> returning void)

let acquire = ff "SDL_AcquireGPUCommandBuffer"
  (gpu_device @-> returning (some_to_ok gpu_command_buffer_opt))

let push_gpu_vertex_uniform_data = ff "SDL_PushGPUVertexUniformData"
  (gpu_command_buffer @-> uint32 @-> ptr void @-> uint32 @-> returning void)
let push_gpu_vertex_uniform_data command_buffer slot_index data length =
  push_gpu_vertex_uniform_data command_buffer (Unsigned.UInt.of_int slot_index) data (Unsigned.UInt.of_int length)

let push_gpu_fragment_uniform_data = ff "SDL_PushGPUFragmentUniformData"
  (gpu_command_buffer @-> uint32 @-> ptr void @-> uint32 @-> returning void)
let push_gpu_fragment_uniform_data command_buffer slot_index data length =
  push_gpu_fragment_uniform_data command_buffer (Unsigned.UInt.of_int slot_index) data (Unsigned.UInt.of_int length)

let push_gpu_compute_uniform_data = ff "SDL_PushGPUComputeUniformData"
  (gpu_command_buffer @-> uint32 @-> ptr void @-> uint32 @-> returning void)
let push_gpu_compute_uniform_data command_buffer slot_index data length =
  push_gpu_compute_uniform_data command_buffer (Unsigned.UInt.of_int slot_index) data (Unsigned.UInt.of_int length)

let generate_mipmaps_for_gpu_texture = ff "SDL_GenerateMipmapsForGPUTexture"
  (gpu_command_buffer @-> gpu_texture @-> returning void)

let blit_gpu_texture = ff "SDL_BlitGPUTexture"
  (gpu_command_buffer @-> ptr gpu_blit_info @-> returning void)

let acquire_gpu_swapchain_texture = ff "SDL_AcquireGPUSwapchainTexture"
  (gpu_command_buffer @-> window @-> ptr gpu_texture @-> ptr uint32 @-> ptr uint32 @-> returning true_to_ok)

let wait_and_acquire_gpu_swapchain_texture = ff "SDL_WaitAndAcquireGPUSwapchainTexture"
  (gpu_command_buffer @-> window @-> ptr gpu_texture @-> ptr uint32 @-> ptr uint32 @-> returning true_to_ok)

let submit = ff "SDL_SubmitGPUCommandBuffer"
  (gpu_command_buffer @-> returning true_to_ok)

let cancel = ff "SDL_CancelGPUCommandBuffer"
  (gpu_command_buffer @-> returning true_to_ok)

end

module GPURenderPass = struct
let begin_ = ff "SDL_BeginGPURenderPass"
  (gpu_command_buffer @-> ptr gpu_color_target_info @-> uint32 @-> ptr gpu_depth_stencil_target_info @-> returning (some_to_ok gpu_render_pass_opt))
let begin_ command_buffer color_target_infos num_color_targets depth_stencil_target_info =
  begin_ command_buffer color_target_infos (Unsigned.UInt.of_int num_color_targets) depth_stencil_target_info

let bind_gpu_graphics_pipeline = ff "SDL_BindGPUGraphicsPipeline"
  (gpu_render_pass @-> gpu_graphics_pipeline @-> returning void)

let set_gpu_viewport = ff "SDL_SetGPUViewport"
  (gpu_render_pass @-> ptr gpu_viewport @-> returning void)

let set_gpu_scissor = ff "SDL_SetGPUScissor"
  (gpu_render_pass @-> rect @-> returning void)

let set_gpu_blend_constants = ff "SDL_SetGPUBlendConstants"
  (gpu_render_pass @-> f_color @-> returning void)

let set_gpu_stencil_reference = ff "SDL_SetGPUStencilReference"
  (gpu_render_pass @-> uint8 @-> returning void)
let set_gpu_stencil_reference render_pass reference =
  set_gpu_stencil_reference render_pass (Unsigned.UChar.of_int reference)

let bind_gpu_vertex_buffers = ff "SDL_BindGPUVertexBuffers"
  (gpu_render_pass @-> uint32 @-> ptr gpu_buffer_binding @-> uint32 @-> returning void)
let bind_gpu_vertex_buffers render_pass first_slot bindings =
  let bindings, num_bindings = carray_of_list gpu_buffer_binding bindings in
  bind_gpu_vertex_buffers render_pass (Unsigned.UInt.of_int first_slot) bindings (Unsigned.UInt.of_int num_bindings)

let bind_gpu_index_buffer = ff "SDL_BindGPUIndexBuffer"
  (gpu_render_pass @-> ptr gpu_buffer_binding @-> gpu_index_element_size @-> returning void)

let bind_gpu_vertex_samplers = ff "SDL_BindGPUVertexSamplers"
  (gpu_render_pass @-> uint32 @-> ptr gpu_texture_sampler_binding @-> uint32 @-> returning void)
let bind_gpu_vertex_samplers render_pass first_slot texture_sampler_bindings num_bindings =
  bind_gpu_vertex_samplers render_pass (Unsigned.UInt.of_int first_slot) texture_sampler_bindings (Unsigned.UInt.of_int num_bindings)

let bind_gpu_vertex_storage_textures = ff "SDL_BindGPUVertexStorageTextures"
  (gpu_render_pass @-> uint32 @-> ptr gpu_texture @-> uint32 @-> returning void)
let bind_gpu_vertex_storage_textures render_pass first_slot storage_textures num_bindings =
  bind_gpu_vertex_storage_textures render_pass (Unsigned.UInt.of_int first_slot) storage_textures (Unsigned.UInt.of_int num_bindings)

let bind_gpu_vertex_storage_buffers = ff "SDL_BindGPUVertexStorageBuffers"
  (gpu_render_pass @-> uint32 @-> ptr gpu_buffer @-> uint32 @-> returning void)
let bind_gpu_vertex_storage_buffers render_pass first_slot storage_buffers num_bindings =
  bind_gpu_vertex_storage_buffers render_pass (Unsigned.UInt.of_int first_slot) storage_buffers (Unsigned.UInt.of_int num_bindings)

let bind_gpu_fragment_samplers = ff "SDL_BindGPUFragmentSamplers"
  (gpu_render_pass @-> uint32 @-> ptr gpu_texture_sampler_binding @-> uint32 @-> returning void)
let bind_gpu_fragment_samplers render_pass first_slot texture_sampler_bindings num_bindings =
  bind_gpu_fragment_samplers render_pass (Unsigned.UInt.of_int first_slot) texture_sampler_bindings (Unsigned.UInt.of_int num_bindings)

let bind_gpu_fragment_storage_textures = ff "SDL_BindGPUFragmentStorageTextures"
  (gpu_render_pass @-> uint32 @-> ptr gpu_texture @-> uint32 @-> returning void)
let bind_gpu_fragment_storage_textures render_pass first_slot storage_textures num_bindings =
  bind_gpu_fragment_storage_textures render_pass (Unsigned.UInt.of_int first_slot) storage_textures (Unsigned.UInt.of_int num_bindings)

let bind_gpu_fragment_storage_buffers = ff "SDL_BindGPUFragmentStorageBuffers"
  (gpu_render_pass @-> uint32 @-> ptr gpu_buffer @-> uint32 @-> returning void)
let bind_gpu_fragment_storage_buffers render_pass first_slot storage_buffers num_bindings =
  bind_gpu_fragment_storage_buffers render_pass (Unsigned.UInt.of_int first_slot) storage_buffers (Unsigned.UInt.of_int num_bindings)

let draw_gpu_indexed_primitives = ff "SDL_DrawGPUIndexedPrimitives"
  (gpu_render_pass @-> uint32 @-> uint32 @-> uint32 @-> sint32 @-> uint32 @-> returning void)
let draw_gpu_indexed_primitives render_pass num_indices num_instances first_index vertex_offset first_instance =
  draw_gpu_indexed_primitives render_pass (Unsigned.UInt.of_int num_indices) (Unsigned.UInt.of_int num_instances) (Unsigned.UInt.of_int first_index) vertex_offset (Unsigned.UInt.of_int first_instance)

let draw_gpu_primitives = ff "SDL_DrawGPUPrimitives"
  (gpu_render_pass @-> uint32 @-> uint32 @-> uint32 @-> uint32 @-> returning void)
let draw_gpu_primitives render_pass num_vertices num_instances first_vertex first_instance =
  draw_gpu_primitives render_pass (Unsigned.UInt.of_int num_vertices) (Unsigned.UInt.of_int num_instances) (Unsigned.UInt.of_int first_vertex) (Unsigned.UInt.of_int first_instance)

let draw_gpu_primitives_indirect = ff "SDL_DrawGPUPrimitivesIndirect"
  (gpu_render_pass @-> gpu_buffer @-> uint32 @-> uint32 @-> returning void)
let draw_gpu_primitives_indirect render_pass buffer offset draw_count =
  draw_gpu_primitives_indirect render_pass buffer (Unsigned.UInt.of_int offset) (Unsigned.UInt.of_int draw_count)

let draw_gpu_indexed_primitives_indirect = ff "SDL_DrawGPUIndexedPrimitivesIndirect"
  (gpu_render_pass @-> gpu_buffer @-> uint32 @-> uint32 @-> returning void)
let draw_gpu_indexed_primitives_indirect render_pass buffer offset draw_count =
  draw_gpu_indexed_primitives_indirect render_pass buffer (Unsigned.UInt.of_int offset) (Unsigned.UInt.of_int draw_count)

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

let bind_gpu_compute_pipeline = ff "SDL_BindGPUComputePipeline"
  (gpu_compute_pass @-> gpu_compute_pipeline @-> returning void)

let bind_gpu_compute_samplers = ff "SDL_BindGPUComputeSamplers"
  (gpu_compute_pass @-> uint32 @-> ptr gpu_texture_sampler_binding @-> uint32 @-> returning void)
let bind_gpu_compute_samplers compute_pass first_slot texture_sampler_bindings num_bindings =
  bind_gpu_compute_samplers compute_pass (Unsigned.UInt.of_int first_slot) texture_sampler_bindings (Unsigned.UInt.of_int num_bindings)

let bind_gpu_compute_storage_textures = ff "SDL_BindGPUComputeStorageTextures"
  (gpu_compute_pass @-> uint32 @-> ptr gpu_texture @-> uint32 @-> returning void)
let bind_gpu_compute_storage_textures compute_pass first_slot storage_textures num_bindings =
  bind_gpu_compute_storage_textures compute_pass (Unsigned.UInt.of_int first_slot) storage_textures (Unsigned.UInt.of_int num_bindings)

let bind_gpu_compute_storage_buffers = ff "SDL_BindGPUComputeStorageBuffers"
  (gpu_compute_pass @-> uint32 @-> ptr gpu_buffer @-> uint32 @-> returning void)
let bind_gpu_compute_storage_buffers compute_pass first_slot storage_buffers num_bindings =
  bind_gpu_compute_storage_buffers compute_pass (Unsigned.UInt.of_int first_slot) storage_buffers (Unsigned.UInt.of_int num_bindings)

let dispatch_gpu_compute = ff "SDL_DispatchGPUCompute"
  (gpu_compute_pass @-> uint32 @-> uint32 @-> uint32 @-> returning void)
let dispatch_gpu_compute compute_pass groupcount_x groupcount_y groupcount_z =
  dispatch_gpu_compute compute_pass (Unsigned.UInt.of_int groupcount_x) (Unsigned.UInt.of_int groupcount_y) (Unsigned.UInt.of_int groupcount_z)

let dispatch_gpu_compute_indirect = ff "SDL_DispatchGPUComputeIndirect"
  (gpu_compute_pass @-> gpu_buffer @-> uint32 @-> returning void)
let dispatch_gpu_compute_indirect compute_pass buffer offset =
  dispatch_gpu_compute_indirect compute_pass buffer (Unsigned.UInt.of_int offset)

let end_ = ff "SDL_EndGPUComputePass"
  (gpu_compute_pass @-> returning void)

end

module GPUCopyPass = struct
let begin_ = ff "SDL_BeginGPUCopyPass"
  (gpu_command_buffer @-> returning (some_to_ok gpu_copy_pass_opt))

let upload_to_gpu_texture = ff "SDL_UploadToGPUTexture"
  (gpu_copy_pass @-> ptr gpu_texture_transfer_info @-> ptr gpu_texture_region @-> bool @-> returning void)

let upload_to_gpu_buffer = ff "SDL_UploadToGPUBuffer"
  (gpu_copy_pass @-> ptr gpu_transfer_buffer_location @-> ptr gpu_buffer_region @-> bool @-> returning void)

let copy_gpu_texture_to_texture = ff "SDL_CopyGPUTextureToTexture"
  (gpu_copy_pass @-> ptr gpu_texture_location @-> ptr gpu_texture_location @-> uint32 @-> uint32 @-> uint32 @-> bool @-> returning void)
let copy_gpu_texture_to_texture copy_pass source destination w h d cycle =
  copy_gpu_texture_to_texture copy_pass source destination (Unsigned.UInt.of_int w) (Unsigned.UInt.of_int h) (Unsigned.UInt.of_int d) cycle

let copy_gpu_buffer_to_buffer = ff "SDL_CopyGPUBufferToBuffer"
  (gpu_copy_pass @-> ptr gpu_buffer_location @-> ptr gpu_buffer_location @-> uint32 @-> bool @-> returning void)
let copy_gpu_buffer_to_buffer copy_pass source destination size cycle =
  copy_gpu_buffer_to_buffer copy_pass source destination (Unsigned.UInt.of_int size) cycle

let download_from_gpu_texture = ff "SDL_DownloadFromGPUTexture"
  (gpu_copy_pass @-> ptr gpu_texture_region @-> ptr gpu_texture_transfer_info @-> returning void)

let download_from_gpu_buffer = ff "SDL_DownloadFromGPUBuffer"
  (gpu_copy_pass @-> ptr gpu_buffer_region @-> ptr gpu_transfer_buffer_location @-> returning void)

let end_ = ff "SDL_EndGPUCopyPass"
  (gpu_copy_pass @-> returning void)

end

module GPUTextureFormat = struct
let get_gpu_swapchain_texture_format = ff "SDL_GetGPUSwapchainTextureFormat"
  (gpu_device @-> window @-> returning gpu_texture_format)

let texel_block_size = ff "SDL_GPUTextureFormatTexelBlockSize"
  (gpu_texture_format @-> returning uint32)

let calculate_size = ff "SDL_CalculateGPUTextureFormatSize"
  (gpu_texture_format @-> uint32 @-> uint32 @-> uint32 @-> returning uint32)
let calculate_size format width height depth_or_layer_count =
  calculate_size format (Unsigned.UInt.of_int width) (Unsigned.UInt.of_int height) (Unsigned.UInt.of_int depth_or_layer_count)

let get_from_pixel_format = ff "SDL_GetGPUTextureFormatFromPixelFormat"
  (pixel_format @-> returning gpu_texture_format)

end

module GPUFence = struct
let submit_gpu_command_buffer_and_acquire_fence = ff "SDL_SubmitGPUCommandBufferAndAcquireFence"
  (gpu_command_buffer @-> returning (some_to_ok gpu_fence_opt))

end

module PixelFormat = struct
let get_from_gpu_texture_format = ff "SDL_GetPixelFormatFromGPUTextureFormat"
  (gpu_texture_format @-> returning pixel_format)

end

