(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Sdl3_types
module GPU : sig

val supports_shader_formats : int -> string -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_GPUSupportsShaderFormats}SDL_GPUSupportsShaderFormats}: Checks for GPU runtime support.


    @param format_flags a bitflag indicating which shader formats the app is
able to provide.
    @param name the preferred GPU driver, or NULL to let SDL pick the optimal
driver.

    @return true if supported, false otherwise.*)

val get_num_drivers : unit -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetNumGPUDrivers}SDL_GetNumGPUDrivers}: Get the number of GPU drivers compiled into SDL.


    @return the number of built in GPU drivers.*)

val get_driver : int -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGPUDriver}SDL_GetGPUDriver}: Get the name of a built in GPU driver.

The GPU drivers are presented in the order in which they are normally
checked during initialization.

The names of drivers are all simple, low-ASCII identifiers, like "vulkan",
"metal" or "direct3d12". These never have Unicode characters, and are not
meant to be proper names.


    @param index the index of a GPU driver.

    @return the name of the GPU driver with the given **index**.*)

val get_shader_formats : gpu_device -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGPUShaderFormats}SDL_GetGPUShaderFormats}: Returns the supported shader formats for this GPU context.


    @param device a GPU context to query.

    @return a bitflag indicating which shader formats the driver is able to
consume.*)

val set_buffer_name : gpu_device -> gpu_buffer -> string -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetGPUBufferName}SDL_SetGPUBufferName}: Sets an arbitrary string constant to label a buffer.

You should use SDL_PROP_GPU_BUFFER_CREATE_NAME_STRING with
SDL_CreateGPUBuffer instead of this function to avoid thread safety issues.


    @param device a GPU Context.
    @param buffer a buffer to attach the name to.
    @param text a UTF-8 string constant to mark as the name of the buffer.
*)

val set_texture_name : gpu_device -> gpu_texture -> string -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetGPUTextureName}SDL_SetGPUTextureName}: Sets an arbitrary string constant to label a texture.

You should use SDL_PROP_GPU_TEXTURE_CREATE_NAME_STRING with
SDL_CreateGPUTexture instead of this function to avoid thread safety
issues.


    @param device a GPU Context.
    @param texture a texture to attach the name to.
    @param text a UTF-8 string constant to mark as the name of the texture.
*)

val insert_debug_label : gpu_command_buffer -> string -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_InsertGPUDebugLabel}SDL_InsertGPUDebugLabel}: Inserts an arbitrary string label into the command buffer callstream.

Useful for debugging.

On Direct3D 12, using SDL_InsertGPUDebugLabel requires
WinPixEventRuntime.dll to be in your PATH or in the same directory as your
executable. See
\[here\](https://devblogs.microsoft.com/pix/winpixeventruntime/)
for instructions on how to obtain it.


    @param command_buffer a command buffer.
    @param text a UTF-8 string constant to insert as the label.
*)

val push_debug_group : gpu_command_buffer -> string -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_PushGPUDebugGroup}SDL_PushGPUDebugGroup}: Begins a debug group with an arbitrary name.

Used for denoting groups of calls when viewing the command buffer
callstream in a graphics debugging tool.

Each call to SDL_PushGPUDebugGroup must have a corresponding call to
SDL_PopGPUDebugGroup.

On Direct3D 12, using SDL_PushGPUDebugGroup requires WinPixEventRuntime.dll
to be in your PATH or in the same directory as your executable. See
\[here\](https://devblogs.microsoft.com/pix/winpixeventruntime/)
for instructions on how to obtain it.

On some backends (e.g. Metal), pushing a debug group during a
render/blit/compute pass will create a group that is scoped to the native
pass rather than the command buffer. For best results, if you push a debug
group during a pass, always pop it in the same pass.


    @param command_buffer a command buffer.
    @param name a UTF-8 string constant that names the group.
*)

val pop_debug_group : gpu_command_buffer -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_PopGPUDebugGroup}SDL_PopGPUDebugGroup}: Ends the most-recently pushed debug group.

On Direct3D 12, using SDL_PopGPUDebugGroup requires WinPixEventRuntime.dll
to be in your PATH or in the same directory as your executable. See
\[here\](https://devblogs.microsoft.com/pix/winpixeventruntime/)
for instructions on how to obtain it.


    @param command_buffer a command buffer.
*)

val release_texture : gpu_device -> gpu_texture -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUTexture}SDL_ReleaseGPUTexture}: Frees the given texture as soon as it is safe to do so.

You must not reference the texture after calling this function.


    @param device a GPU context.
    @param texture a texture to be destroyed.
*)

val release_sampler : gpu_device -> gpu_sampler -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUSampler}SDL_ReleaseGPUSampler}: Frees the given sampler as soon as it is safe to do so.

You must not reference the sampler after calling this function.


    @param device a GPU context.
    @param sampler a sampler to be destroyed.
*)

val release_buffer : gpu_device -> gpu_buffer -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUBuffer}SDL_ReleaseGPUBuffer}: Frees the given buffer as soon as it is safe to do so.

You must not reference the buffer after calling this function.


    @param device a GPU context.
    @param buffer a buffer to be destroyed.
*)

val release_transfer_buffer : gpu_device -> gpu_transfer_buffer -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUTransferBuffer}SDL_ReleaseGPUTransferBuffer}: Frees the given transfer buffer as soon as it is safe to do so.

You must not reference the transfer buffer after calling this function.


    @param device a GPU context.
    @param transfer_buffer a transfer buffer to be destroyed.
*)

val release_compute_pipeline : gpu_device -> gpu_compute_pipeline -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUComputePipeline}SDL_ReleaseGPUComputePipeline}: Frees the given compute pipeline as soon as it is safe to do so.

You must not reference the compute pipeline after calling this function.


    @param device a GPU context.
    @param compute_pipeline a compute pipeline to be destroyed.
*)

val release_shader : gpu_device -> gpu_shader -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUShader}SDL_ReleaseGPUShader}: Frees the given shader as soon as it is safe to do so.

You must not reference the shader after calling this function.


    @param device a GPU context.
    @param shader a shader to be destroyed.
*)

val release_graphics_pipeline : gpu_device -> gpu_graphics_pipeline -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUGraphicsPipeline}SDL_ReleaseGPUGraphicsPipeline}: Frees the given graphics pipeline as soon as it is safe to do so.

You must not reference the graphics pipeline after calling this function.


    @param device a GPU context.
    @param graphics_pipeline a graphics pipeline to be destroyed.
*)

val push_vertex_uniform_data : gpu_command_buffer -> int -> data -> int -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_PushGPUVertexUniformData}SDL_PushGPUVertexUniformData}: Pushes data to a vertex uniform slot on the command buffer.

Subsequent draw calls in this command buffer will use this uniform data.

The data being pushed must respect std140 layout conventions. In practical
terms this means you must ensure that vec3 and vec4 fields are 16-byte
aligned.

For detailed information about accessing uniform data from a shader, please
refer to SDL_CreateGPUShader.


    @param command_buffer a command buffer.
    @param slot_index the vertex uniform slot to push data to.
    @param data client data to write.
    @param length the length of the data to write.
*)

val push_fragment_uniform_data : gpu_command_buffer -> int -> data -> int -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_PushGPUFragmentUniformData}SDL_PushGPUFragmentUniformData}: Pushes data to a fragment uniform slot on the command buffer.

Subsequent draw calls in this command buffer will use this uniform data.

The data being pushed must respect std140 layout conventions. In practical
terms this means you must ensure that vec3 and vec4 fields are 16-byte
aligned.


    @param command_buffer a command buffer.
    @param slot_index the fragment uniform slot to push data to.
    @param data client data to write.
    @param length the length of the data to write.
*)

val push_compute_uniform_data : gpu_command_buffer -> int -> data -> int -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_PushGPUComputeUniformData}SDL_PushGPUComputeUniformData}: Pushes data to a uniform slot on the command buffer.

Subsequent draw calls in this command buffer will use this uniform data.

The data being pushed must respect std140 layout conventions. In practical
terms this means you must ensure that vec3 and vec4 fields are 16-byte
aligned.


    @param command_buffer a command buffer.
    @param slot_index the uniform slot to push data to.
    @param data client data to write.
    @param length the length of the data to write.
*)

val bind_graphics_pipeline : gpu_render_pass -> gpu_graphics_pipeline -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_BindGPUGraphicsPipeline}SDL_BindGPUGraphicsPipeline}: Binds a graphics pipeline on a render pass to be used in rendering.

A graphics pipeline must be bound before making any draw calls.


    @param render_pass a render pass handle.
    @param graphics_pipeline the graphics pipeline to bind.
*)

val set_viewport : gpu_render_pass -> gpu_viewport Ctypes.ptr -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetGPUViewport}SDL_SetGPUViewport}: Sets the current viewport state on a command buffer.


    @param render_pass a render pass handle.
    @param viewport the viewport to set.
*)

val set_scissor : gpu_render_pass -> rect Ctypes.ptr -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetGPUScissor}SDL_SetGPUScissor}: Sets the current scissor state on a command buffer.


    @param render_pass a render pass handle.
    @param scissor the scissor area to set.
*)

val set_blend_constants : gpu_render_pass -> f_color -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetGPUBlendConstants}SDL_SetGPUBlendConstants}: Sets the current blend constants on a command buffer.


    @param render_pass a render pass handle.
    @param blend_constants the blend constant color.
*)

val set_stencil_reference : gpu_render_pass -> int -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetGPUStencilReference}SDL_SetGPUStencilReference}: Sets the current stencil reference value on a command buffer.


    @param render_pass a render pass handle.
    @param reference the stencil reference value to set.
*)

val bind_vertex_buffers : gpu_render_pass -> int -> gpu_buffer_binding list -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_BindGPUVertexBuffers}SDL_BindGPUVertexBuffers}: Binds vertex buffers on a command buffer for use with subsequent draw
calls.


    @param render_pass a render pass handle.
    @param first_slot the vertex buffer slot to begin binding from.
    @param bindings an array of SDL_GPUBufferBinding structs containing vertex
buffers and offset values.*)

val bind_index_buffer : gpu_render_pass -> gpu_buffer_binding Ctypes.ptr -> gpu_index_element_size_enum -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_BindGPUIndexBuffer}SDL_BindGPUIndexBuffer}: Binds an index buffer on a command buffer for use with subsequent draw
calls.


    @param render_pass a render pass handle.
    @param binding a pointer to a struct containing an index buffer and offset.
    @param index_element_size whether the index values in the buffer are 16- or
32-bit.
*)

val bind_vertex_samplers : gpu_render_pass -> int -> gpu_texture_sampler_binding Ctypes.ptr -> int -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_BindGPUVertexSamplers}SDL_BindGPUVertexSamplers}: Binds texture-sampler pairs for use on the vertex shader.

The textures must have been created with SDL_GPU_TEXTUREUSAGE_SAMPLER.

Be sure your shader is set up according to the requirements documented in
SDL_CreateGPUShader().


    @param render_pass a render pass handle.
    @param first_slot the vertex sampler slot to begin binding from.
    @param texture_sampler_bindings an array of texture-sampler binding
structs.
    @param num_bindings the number of texture-sampler pairs to bind from the
array.
*)

val bind_vertex_storage_textures : gpu_render_pass -> int -> gpu_texture Ctypes.ptr -> int -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_BindGPUVertexStorageTextures}SDL_BindGPUVertexStorageTextures}: Binds storage textures for use on the vertex shader.

These textures must have been created with
SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ.

Be sure your shader is set up according to the requirements documented in
SDL_CreateGPUShader().


    @param render_pass a render pass handle.
    @param first_slot the vertex storage texture slot to begin binding from.
    @param storage_textures an array of storage textures.
    @param num_bindings the number of storage texture to bind from the array.
*)

val bind_vertex_storage_buffers : gpu_render_pass -> int -> gpu_buffer Ctypes.ptr -> int -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_BindGPUVertexStorageBuffers}SDL_BindGPUVertexStorageBuffers}: Binds storage buffers for use on the vertex shader.

These buffers must have been created with
SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ.

Be sure your shader is set up according to the requirements documented in
SDL_CreateGPUShader().


    @param render_pass a render pass handle.
    @param first_slot the vertex storage buffer slot to begin binding from.
    @param storage_buffers an array of buffers.
    @param num_bindings the number of buffers to bind from the array.
*)

val bind_fragment_samplers : gpu_render_pass -> int -> gpu_texture_sampler_binding Ctypes.ptr -> int -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_BindGPUFragmentSamplers}SDL_BindGPUFragmentSamplers}: Binds texture-sampler pairs for use on the fragment shader.

The textures must have been created with SDL_GPU_TEXTUREUSAGE_SAMPLER.

Be sure your shader is set up according to the requirements documented in
SDL_CreateGPUShader().


    @param render_pass a render pass handle.
    @param first_slot the fragment sampler slot to begin binding from.
    @param texture_sampler_bindings an array of texture-sampler binding
structs.
    @param num_bindings the number of texture-sampler pairs to bind from the
array.
*)

val bind_fragment_storage_textures : gpu_render_pass -> int -> gpu_texture Ctypes.ptr -> int -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_BindGPUFragmentStorageTextures}SDL_BindGPUFragmentStorageTextures}: Binds storage textures for use on the fragment shader.

These textures must have been created with
SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ.

Be sure your shader is set up according to the requirements documented in
SDL_CreateGPUShader().


    @param render_pass a render pass handle.
    @param first_slot the fragment storage texture slot to begin binding from.
    @param storage_textures an array of storage textures.
    @param num_bindings the number of storage textures to bind from the array.
*)

val bind_fragment_storage_buffers : gpu_render_pass -> int -> gpu_buffer Ctypes.ptr -> int -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_BindGPUFragmentStorageBuffers}SDL_BindGPUFragmentStorageBuffers}: Binds storage buffers for use on the fragment shader.

These buffers must have been created with
SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ.

Be sure your shader is set up according to the requirements documented in
SDL_CreateGPUShader().


    @param render_pass a render pass handle.
    @param first_slot the fragment storage buffer slot to begin binding from.
    @param storage_buffers an array of storage buffers.
    @param num_bindings the number of storage buffers to bind from the array.
*)

val draw_indexed_primitives : gpu_render_pass -> int -> int -> int -> int -> int -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_DrawGPUIndexedPrimitives}SDL_DrawGPUIndexedPrimitives}: Draws data using bound graphics state with an index buffer and instancing
enabled.

You must not call this function before binding a graphics pipeline.

Note that the[first_vertex]and[first_instance]parameters are NOT
compatible with built-in vertex/instance ID variables in shaders (for
example, SV_VertexID); GPU APIs and shader languages do not define these
built-in variables consistently, so if your shader depends on them, the
only way to keep behavior consistent and portable is to always pass 0 for
the correlating parameter in the draw calls.


    @param render_pass a render pass handle.
    @param num_indices the number of indices to draw per instance.
    @param num_instances the number of instances to draw.
    @param first_index the starting index within the index buffer.
    @param vertex_offset value added to vertex index before indexing into the
vertex buffer.
    @param first_instance the ID of the first instance to draw.
*)

val draw_primitives : gpu_render_pass -> int -> int -> int -> int -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_DrawGPUPrimitives}SDL_DrawGPUPrimitives}: Draws data using bound graphics state.

You must not call this function before binding a graphics pipeline.

Note that the[first_vertex]and[first_instance]parameters are NOT
compatible with built-in vertex/instance ID variables in shaders (for
example, SV_VertexID); GPU APIs and shader languages do not define these
built-in variables consistently, so if your shader depends on them, the
only way to keep behavior consistent and portable is to always pass 0 for
the correlating parameter in the draw calls.


    @param render_pass a render pass handle.
    @param num_vertices the number of vertices to draw.
    @param num_instances the number of instances that will be drawn.
    @param first_vertex the index of the first vertex to draw.
    @param first_instance the ID of the first instance to draw.
*)

val draw_primitives_indirect : gpu_render_pass -> gpu_buffer -> int -> int -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_DrawGPUPrimitivesIndirect}SDL_DrawGPUPrimitivesIndirect}: Draws data using bound graphics state and with draw parameters set from a
buffer.

The buffer must consist of tightly-packed draw parameter sets that each
match the layout of SDL_GPUIndirectDrawCommand. You must not call this
function before binding a graphics pipeline.


    @param render_pass a render pass handle.
    @param buffer a buffer containing draw parameters.
    @param offset the offset to start reading from the draw buffer.
    @param draw_count the number of draw parameter sets that should be read
from the draw buffer.
*)

val draw_indexed_primitives_indirect : gpu_render_pass -> gpu_buffer -> int -> int -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_DrawGPUIndexedPrimitivesIndirect}SDL_DrawGPUIndexedPrimitivesIndirect}: Draws data using bound graphics state with an index buffer enabled and with
draw parameters set from a buffer.

The buffer must consist of tightly-packed draw parameter sets that each
match the layout of SDL_GPUIndexedIndirectDrawCommand. You must not call
this function before binding a graphics pipeline.


    @param render_pass a render pass handle.
    @param buffer a buffer containing draw parameters.
    @param offset the offset to start reading from the draw buffer.
    @param draw_count the number of draw parameter sets that should be read
from the draw buffer.
*)

val bind_compute_pipeline : gpu_compute_pass -> gpu_compute_pipeline -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_BindGPUComputePipeline}SDL_BindGPUComputePipeline}: Binds a compute pipeline on a command buffer for use in compute dispatch.


    @param compute_pass a compute pass handle.
    @param compute_pipeline a compute pipeline to bind.
*)

val bind_compute_samplers : gpu_compute_pass -> int -> gpu_texture_sampler_binding Ctypes.ptr -> int -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_BindGPUComputeSamplers}SDL_BindGPUComputeSamplers}: Binds texture-sampler pairs for use on the compute shader.

The textures must have been created with SDL_GPU_TEXTUREUSAGE_SAMPLER.

Be sure your shader is set up according to the requirements documented in
SDL_CreateGPUComputePipeline().


    @param compute_pass a compute pass handle.
    @param first_slot the compute sampler slot to begin binding from.
    @param texture_sampler_bindings an array of texture-sampler binding
structs.
    @param num_bindings the number of texture-sampler bindings to bind from the
array.
*)

val bind_compute_storage_textures : gpu_compute_pass -> int -> gpu_texture Ctypes.ptr -> int -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_BindGPUComputeStorageTextures}SDL_BindGPUComputeStorageTextures}: Binds storage textures as readonly for use on the compute pipeline.

These textures must have been created with
SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ.

Be sure your shader is set up according to the requirements documented in
SDL_CreateGPUComputePipeline().


    @param compute_pass a compute pass handle.
    @param first_slot the compute storage texture slot to begin binding from.
    @param storage_textures an array of storage textures.
    @param num_bindings the number of storage textures to bind from the array.
*)

val bind_compute_storage_buffers : gpu_compute_pass -> int -> gpu_buffer Ctypes.ptr -> int -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_BindGPUComputeStorageBuffers}SDL_BindGPUComputeStorageBuffers}: Binds storage buffers as readonly for use on the compute pipeline.

These buffers must have been created with
SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ.

Be sure your shader is set up according to the requirements documented in
SDL_CreateGPUComputePipeline().


    @param compute_pass a compute pass handle.
    @param first_slot the compute storage buffer slot to begin binding from.
    @param storage_buffers an array of storage buffer binding structs.
    @param num_bindings the number of storage buffers to bind from the array.
*)

val dispatch_compute : gpu_compute_pass -> int -> int -> int -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_DispatchGPUCompute}SDL_DispatchGPUCompute}: Dispatches compute work.

You must not call this function before binding a compute pipeline.

A VERY IMPORTANT NOTE If you dispatch multiple times in a compute pass, and
the dispatches write to the same resource region as each other, there is no
guarantee of which order the writes will occur. If the write order matters,
you MUST end the compute pass and begin another one.


    @param compute_pass a compute pass handle.
    @param groupcount_x number of local workgroups to dispatch in the X
dimension.
    @param groupcount_y number of local workgroups to dispatch in the Y
dimension.
    @param groupcount_z number of local workgroups to dispatch in the Z
dimension.
*)

val dispatch_compute_indirect : gpu_compute_pass -> gpu_buffer -> int -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_DispatchGPUComputeIndirect}SDL_DispatchGPUComputeIndirect}: Dispatches compute work with parameters set from a buffer.

The buffer layout should match the layout of
SDL_GPUIndirectDispatchCommand. You must not call this function before
binding a compute pipeline.

A VERY IMPORTANT NOTE If you dispatch multiple times in a compute pass, and
the dispatches write to the same resource region as each other, there is no
guarantee of which order the writes will occur. If the write order matters,
you MUST end the compute pass and begin another one.


    @param compute_pass a compute pass handle.
    @param buffer a buffer containing dispatch parameters.
    @param offset the offset to start reading from the dispatch buffer.
*)

val map_transfer_buffer : gpu_device -> gpu_transfer_buffer -> bool -> data
(** {{:https://wiki.libsdl.org/SDL3/SDL_MapGPUTransferBuffer}SDL_MapGPUTransferBuffer}: Maps a transfer buffer into application address space.

You must unmap the transfer buffer before encoding upload commands. The
memory is owned by the graphics driver - do NOT call SDL_free() on the
returned pointer.


    @param device a GPU context.
    @param transfer_buffer a transfer buffer.
    @param cycle if true, cycles the transfer buffer if it is already bound.

    @return the address of the mapped transfer buffer memory, or NULL on
failure; call SDL_GetError() for more information.*)

val unmap_transfer_buffer : gpu_device -> gpu_transfer_buffer -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_UnmapGPUTransferBuffer}SDL_UnmapGPUTransferBuffer}: Unmaps a previously mapped transfer buffer.


    @param device a GPU context.
    @param transfer_buffer a previously mapped transfer buffer.
*)

val upload_to_texture : gpu_copy_pass -> gpu_texture_transfer_info Ctypes.ptr -> gpu_texture_region Ctypes.ptr -> bool -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_UploadToGPUTexture}SDL_UploadToGPUTexture}: Uploads data from a transfer buffer to a texture.

The upload occurs on the GPU timeline. You may assume that the upload has
finished in subsequent commands.

You must align the data in the transfer buffer to a multiple of the texel
size of the texture format.


    @param copy_pass a copy pass handle.
    @param source the source transfer buffer with image layout information.
    @param destination the destination texture region.
    @param cycle if true, cycles the texture if the texture is bound, otherwise
overwrites the data.
*)

val upload_to_buffer : gpu_copy_pass -> gpu_transfer_buffer_location Ctypes.ptr -> gpu_buffer_region Ctypes.ptr -> bool -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_UploadToGPUBuffer}SDL_UploadToGPUBuffer}: Uploads data from a transfer buffer to a buffer.

The upload occurs on the GPU timeline. You may assume that the upload has
finished in subsequent commands.


    @param copy_pass a copy pass handle.
    @param source the source transfer buffer with offset.
    @param destination the destination buffer with offset and size.
    @param cycle if true, cycles the buffer if it is already bound, otherwise
overwrites the data.
*)

val copy_texture_to_texture : gpu_copy_pass -> gpu_texture_location Ctypes.ptr -> gpu_texture_location Ctypes.ptr -> int -> int -> int -> bool -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_CopyGPUTextureToTexture}SDL_CopyGPUTextureToTexture}: Performs a texture-to-texture copy.

This copy occurs on the GPU timeline. You may assume the copy has finished
in subsequent commands.

This function does not support copying between depth and color textures.
For those, copy the texture to a buffer and then to the destination
texture.


    @param copy_pass a copy pass handle.
    @param source a source texture region.
    @param destination a destination texture region.
    @param w the width of the region to copy.
    @param h the height of the region to copy.
    @param d the depth of the region to copy.
    @param cycle if true, cycles the destination texture if the destination
texture is bound, otherwise overwrites the data.
*)

val copy_buffer_to_buffer : gpu_copy_pass -> gpu_buffer_location Ctypes.ptr -> gpu_buffer_location Ctypes.ptr -> int -> bool -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_CopyGPUBufferToBuffer}SDL_CopyGPUBufferToBuffer}: Performs a buffer-to-buffer copy.

This copy occurs on the GPU timeline. You may assume the copy has finished
in subsequent commands.


    @param copy_pass a copy pass handle.
    @param source the buffer and offset to copy from.
    @param destination the buffer and offset to copy to.
    @param size the length of the buffer to copy.
    @param cycle if true, cycles the destination buffer if it is already bound,
otherwise overwrites the data.
*)

val download_from_texture : gpu_copy_pass -> gpu_texture_region Ctypes.ptr -> gpu_texture_transfer_info Ctypes.ptr -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_DownloadFromGPUTexture}SDL_DownloadFromGPUTexture}: Copies data from a texture to a transfer buffer on the GPU timeline.

This data is not guaranteed to be copied until the command buffer fence is
signaled.


    @param copy_pass a copy pass handle.
    @param source the source texture region.
    @param destination the destination transfer buffer with image layout
information.
*)

val download_from_buffer : gpu_copy_pass -> gpu_buffer_region Ctypes.ptr -> gpu_transfer_buffer_location Ctypes.ptr -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_DownloadFromGPUBuffer}SDL_DownloadFromGPUBuffer}: Copies data from a buffer to a transfer buffer on the GPU timeline.

This data is not guaranteed to be copied until the command buffer fence is
signaled.


    @param copy_pass a copy pass handle.
    @param source the source buffer with offset and size.
    @param destination the destination transfer buffer with offset.
*)

val generate_mipmaps_for_texture : gpu_command_buffer -> gpu_texture -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_GenerateMipmapsForGPUTexture}SDL_GenerateMipmapsForGPUTexture}: Generates mipmaps for the given texture.

This function must not be called inside of any pass.


    @param command_buffer a command_buffer.
    @param texture a texture with more than 1 mip level.
*)

val blit_texture : gpu_command_buffer -> gpu_blit_info Ctypes.ptr -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_BlitGPUTexture}SDL_BlitGPUTexture}: Blits from a source texture region to a destination texture region.

This function must not be called inside of any pass.


    @param command_buffer a command buffer.
    @param info the blit info struct containing the blit parameters.
*)

val window_supports_swapchain_composition : gpu_device -> window -> gpu_swapchain_composition_enum -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_WindowSupportsGPUSwapchainComposition}SDL_WindowSupportsGPUSwapchainComposition}: Determines whether a swapchain composition is supported by the window.

The window must be claimed before calling this function.


    @param device a GPU context.
    @param window an SDL_Window.
    @param swapchain_composition the swapchain composition to check.

    @return true if supported, false if unsupported.*)

val window_supports_present_mode : gpu_device -> window -> gpu_present_mode_enum -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_WindowSupportsGPUPresentMode}SDL_WindowSupportsGPUPresentMode}: Determines whether a presentation mode is supported by the window.

The window must be claimed before calling this function.


    @param device a GPU context.
    @param window an SDL_Window.
    @param present_mode the presentation mode to check.

    @return true if supported, false if unsupported.*)

val set_swapchain_parameters : gpu_device -> window -> gpu_swapchain_composition_enum -> gpu_present_mode_enum -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetGPUSwapchainParameters}SDL_SetGPUSwapchainParameters}: Changes the swapchain parameters for the given claimed window.

This function will fail if the requested present mode or swapchain
composition are unsupported by the device. Check if the parameters are
supported via SDL_WindowSupportsGPUPresentMode /
SDL_WindowSupportsGPUSwapchainComposition prior to calling this function.

SDL_GPU_PRESENTMODE_VSYNC with SDL_GPU_SWAPCHAINCOMPOSITION_SDR is always
supported.


    @param device a GPU context.
    @param window an SDL_Window that has been claimed.
    @param swapchain_composition the desired composition of the swapchain.
    @param present_mode the desired present mode for the swapchain.*)

val set_allowed_frames_in_flight : gpu_device -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetGPUAllowedFramesInFlight}SDL_SetGPUAllowedFramesInFlight}: Configures the maximum allowed number of frames in flight.

The default value when the device is created is 2. This means that after
you have submitted 2 frames for presentation, if the GPU has not finished
working on the first frame, SDL_AcquireGPUSwapchainTexture() will fill the
swapchain texture pointer with NULL, and
SDL_WaitAndAcquireGPUSwapchainTexture() will block.

Higher values increase throughput at the expense of visual latency. Lower
values decrease visual latency at the expense of throughput.

Note that calling this function will stall and flush the command queue to
prevent synchronization issues.

The minimum value of allowed frames in flight is 1, and the maximum is 3.


    @param device a GPU context.
    @param allowed_frames_in_flight the maximum number of frames that can be
pending on the GPU.*)

val get_swapchain_texture_format : gpu_device -> window -> gpu_texture_format_enum
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGPUSwapchainTextureFormat}SDL_GetGPUSwapchainTextureFormat}: Obtains the texture format of the swapchain for the given window.

Note that this format can change if the swapchain parameters change.


    @param device a GPU context.
    @param window an SDL_Window that has been claimed.

    @return the texture format of the swapchain.*)

val acquire_swapchain_texture : gpu_command_buffer -> window -> gpu_texture Ctypes.ptr -> (int * int) result
(** {{:https://wiki.libsdl.org/SDL3/SDL_AcquireGPUSwapchainTexture}SDL_AcquireGPUSwapchainTexture}: Acquire a texture to use in presentation.

When a swapchain texture is acquired on a command buffer, it will
automatically be submitted for presentation when the command buffer is
submitted. The swapchain texture should only be referenced by the command
buffer used to acquire it.

This function will fill the swapchain texture handle with NULL if too many
frames are in flight. This is not an error. This NULL pointer should not be
passed back into SDL. Instead, it should be considered as an indication to
wait until the swapchain is available.

If you use this function, it is possible to create a situation where many
command buffers are allocated while the rendering context waits for the GPU
to catch up, which will cause memory usage to grow. You should use
SDL_WaitAndAcquireGPUSwapchainTexture() unless you know what you are doing
with timing.

The swapchain texture is managed by the implementation and must not be
freed by the user. You MUST NOT call this function from any thread other
than the one that created the window.


    @param command_buffer a command buffer.
    @param window a window that has been claimed.
    @param swapchain_texture a pointer filled in with a swapchain texture
handle.

    @return 2 values:
(
  + swapchain_texture_width : a pointer filled in with the swapchain
texture width, may be [Error].,
  + swapchain_texture_height : a pointer filled in with the swapchain
texture height, may be [Error].
)*)

val wait_for_swapchain : gpu_device -> window -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_WaitForGPUSwapchain}SDL_WaitForGPUSwapchain}: Blocks the thread until a swapchain texture is available to be acquired.


    @param device a GPU context.
    @param window a window that has been claimed.*)

val wait_and_acquire_swapchain_texture : gpu_command_buffer -> window -> gpu_texture Ctypes.ptr -> (int * int) result
(** {{:https://wiki.libsdl.org/SDL3/SDL_WaitAndAcquireGPUSwapchainTexture}SDL_WaitAndAcquireGPUSwapchainTexture}: Blocks the thread until a swapchain texture is available to be acquired,
and then acquires it.

When a swapchain texture is acquired on a command buffer, it will
automatically be submitted for presentation when the command buffer is
submitted. The swapchain texture should only be referenced by the command
buffer used to acquire it. It is an error to call
SDL_CancelGPUCommandBuffer() after a swapchain texture is acquired.

This function can fill the swapchain texture handle with NULL in certain
cases, for example if the window is minimized. This is not an error. You
should always make sure to check whether the pointer is NULL before
actually using it.

The swapchain texture is managed by the implementation and must not be
freed by the user. You MUST NOT call this function from any thread other
than the one that created the window.

The swapchain texture is write-only and cannot be used as a sampler or for
another reading operation.


    @param command_buffer a command buffer.
    @param window a window that has been claimed.
    @param swapchain_texture a pointer filled in with a swapchain texture
handle.

    @return 2 values:
(
  + swapchain_texture_width : a pointer filled in with the swapchain
texture width, may be [Error].,
  + swapchain_texture_height : a pointer filled in with the swapchain
texture height, may be [Error].
)*)

val wait_for_idle : gpu_device -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_WaitForGPUIdle}SDL_WaitForGPUIdle}: Blocks the thread until the GPU is completely idle.


    @param device a GPU context.*)

val wait_for_fences : gpu_device -> bool -> gpu_fence list -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_WaitForGPUFences}SDL_WaitForGPUFences}: Blocks the thread until the given fences are signaled.


    @param device a GPU context.
    @param wait_all if 0, wait for any fence to be signaled, if 1, wait for all
fences to be signaled.
    @param fences an array of fences to wait on.*)

val query_fence : gpu_device -> gpu_fence -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_QueryGPUFence}SDL_QueryGPUFence}: Checks the status of a fence.


    @param device a GPU context.
    @param fence a fence.*)

val release_fence : gpu_device -> gpu_fence -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_ReleaseGPUFence}SDL_ReleaseGPUFence}: Releases a fence obtained from SDL_SubmitGPUCommandBufferAndAcquireFence.

You must not reference the fence after calling this function.


    @param device a GPU context.
    @param fence a fence.
*)

val texture_supports_format : gpu_device -> gpu_texture_format_enum -> gpu_texture_type_enum -> int -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_GPUTextureSupportsFormat}SDL_GPUTextureSupportsFormat}: Determines whether a texture format is supported for a given type and
usage.


    @param device a GPU context.
    @param format the texture format to check.
    @param type the type of texture (2D, 3D, Cube).
    @param usage a bitmask of all usage scenarios to check.

    @return whether the texture format is supported for this type and usage.*)

val texture_supports_sample_count : gpu_device -> gpu_texture_format_enum -> gpu_sample_count_enum -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_GPUTextureSupportsSampleCount}SDL_GPUTextureSupportsSampleCount}: Determines if a sample count for a texture format is supported.


    @param device a GPU context.
    @param format the texture format to check.
    @param sample_count the sample count to check.

    @return whether the sample count is supported for this texture format.*)

end

module Properties : sig

val gpu_supports : int -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_GPUSupportsProperties}SDL_GPUSupportsProperties}: Checks for GPU runtime support.


    @param props the properties to use.

    @return true if supported, false otherwise.*)

end

module GPUDevice : sig

val create : int -> bool -> string -> gpu_device result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateGPUDevice}SDL_CreateGPUDevice}: Creates a GPU context.

The GPU driver name can be one of the following:

- "vulkan": \[Vulkan\](CategoryGPU#vulkan)
- "direct3d12": \[D3D12\](CategoryGPU#d3d12)
- "metal": \[Metal\](CategoryGPU#metal)
- NULL: let SDL pick the optimal driver


    @param format_flags a bitflag indicating which shader formats the app is
able to provide.
    @param debug_mode enable debug mode properties and validations.
    @param name the preferred GPU driver, or NULL to let SDL pick the optimal
driver.

    @return a GPU context on success or [Error] on failure; call SDL_GetError()
for more information.*)

val create_with_properties : int -> gpu_device result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateGPUDeviceWithProperties}SDL_CreateGPUDeviceWithProperties}: Creates a GPU context.

These are the supported properties:

-[SDL_PROP_GPU_DEVICE_CREATE_DEBUGMODE_BOOLEAN] enable debug mode
  properties and validations, defaults to true.
-[SDL_PROP_GPU_DEVICE_CREATE_PREFERLOWPOWER_BOOLEAN] enable to prefer
  energy efficiency over maximum GPU performance, defaults to false.
-[SDL_PROP_GPU_DEVICE_CREATE_VERBOSE_BOOLEAN] enable to automatically log
  useful debug information on device creation, defaults to true.
-[SDL_PROP_GPU_DEVICE_CREATE_NAME_STRING] the name of the GPU driver to
  use, if a specific one is desired.
-[SDL_PROP_GPU_DEVICE_CREATE_FEATURE_CLIP_DISTANCE_BOOLEAN] Enable Vulkan
  device feature shaderClipDistance. If disabled, clip distances are not
  supported in shader code: gl_ClipDistance\[\] built-ins of GLSL,
  SV_ClipDistance0/1 semantics of HLSL and \[\[clip_distance\]\] attribute of
  Metal. Disabling optional features allows the application to run on some
  older Android devices. Defaults to true.
-[SDL_PROP_GPU_DEVICE_CREATE_FEATURE_DEPTH_CLAMPING_BOOLEAN] Enable
  Vulkan device feature depthClamp. If disabled, there is no depth clamp
  support and enable_depth_clip in SDL_GPURasterizerState must always be
  set to true. Disabling optional features allows the application to run on
  some older Android devices. Defaults to true.
-[SDL_PROP_GPU_DEVICE_CREATE_FEATURE_INDIRECT_DRAW_FIRST_INSTANCE_BOOLEAN]
  Enable Vulkan device feature drawIndirectFirstInstance. If disabled, the
  argument first_instance of SDL_GPUIndirectDrawCommand must be set to
  zero. Disabling optional features allows the application to run on some
  older Android devices. Defaults to true.
-[SDL_PROP_GPU_DEVICE_CREATE_FEATURE_ANISOTROPY_BOOLEAN] Enable Vulkan
  device feature samplerAnisotropy. If disabled, enable_anisotropy of
  SDL_GPUSamplerCreateInfo must be set to false. Disabling optional
  features allows the application to run on some older Android devices.
  Defaults to true.

These are the current shader format properties:

-[SDL_PROP_GPU_DEVICE_CREATE_SHADERS_PRIVATE_BOOLEAN] The app is able to
  provide shaders for an NDA platform.
-[SDL_PROP_GPU_DEVICE_CREATE_SHADERS_SPIRV_BOOLEAN] The app is able to
  provide SPIR-V shaders if applicable.
-[SDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXBC_BOOLEAN] The app is able to
  provide DXBC shaders if applicable
-[SDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXIL_BOOLEAN] The app is able to
  provide DXIL shaders if applicable.
-[SDL_PROP_GPU_DEVICE_CREATE_SHADERS_MSL_BOOLEAN] The app is able to
  provide MSL shaders if applicable.
-[SDL_PROP_GPU_DEVICE_CREATE_SHADERS_METALLIB_BOOLEAN] The app is able to
  provide Metal shader libraries if applicable.

With the D3D12 backend:

-[SDL_PROP_GPU_DEVICE_CREATE_D3D12_SEMANTIC_NAME_STRING] the prefix to
  use for all vertex semantics, default is "TEXCOORD".
-[SDL_PROP_GPU_DEVICE_CREATE_D3D12_ALLOW_FEWER_RESOURCE_SLOTS_BOOLEAN] By
  default, Resourcing Binding Tier 2 is required for D3D12 support.
  However, an application can set this property to true to enable Tier 1
  support, if (and only if) the application uses 8 or fewer storage
  resources across all shader stages. As of writing, this property is
  useful for targeting Intel Haswell and Broadwell GPUs; other hardware
  either supports Tier 2 Resource Binding or does not support D3D12 in any
  capacity. Defaults to false.
-[SDL_PROP_GPU_DEVICE_CREATE_D3D12_AGILITY_SDK_VERSION_NUMBER] Certain
  feature checks are only possible on Windows 11 by default. By setting
  this alongside[SDL_PROP_GPU_DEVICE_CREATE_D3D12_AGILITY_SDK_PATH_STRING]  and vendoring D3D12Core.dll from the D3D12 Agility SDK, you can make
  those feature checks possible on older platforms. The version you provide
  must match the one given in the DLL.
-[SDL_PROP_GPU_DEVICE_CREATE_D3D12_AGILITY_SDK_PATH_STRING] Certain
  feature checks are only possible on Windows 11 by default. By setting
  this alongside
 [SDL_PROP_GPU_DEVICE_CREATE_D3D12_AGILITY_SDK_VERSION_NUMBER]and
  vendoring D3D12Core.dll from the D3D12 Agility SDK, you can make those
  feature checks possible on older platforms. The path you provide must be
  relative to the executable path of your app. Be sure not to put the DLL
  in the same directory as the exe; Microsoft strongly advises against
  this!

With the Vulkan backend:

-[SDL_PROP_GPU_DEVICE_CREATE_VULKAN_REQUIRE_HARDWARE_ACCELERATION_BOOLEAN]
  By default, Vulkan device enumeration includes drivers of all types,
  including software renderers (for example, the Lavapipe Mesa driver).
  This can be useful if your application _requires_ SDL_GPU, but if you can
  provide your own fallback renderer (for example, an OpenGL renderer) this
  property can be set to true. Defaults to false.
-[SDL_PROP_GPU_DEVICE_CREATE_VULKAN_OPTIONS_POINTER] a pointer to an
  SDL_GPUVulkanOptions structure to be processed during device creation.
  This allows configuring a variety of Vulkan-specific options such as
  increasing the API version and opting into extensions aside from the
  minimal set SDL requires.

With the Metal backend: -[SDL_PROP_GPU_DEVICE_CREATE_METAL_ALLOW_MACFAMILY1_BOOLEAN] By default,
macOS support requires what Apple calls "MTLGPUFamilyMac2" hardware or
newer. However, an application can set this property to true to enable
support for "MTLGPUFamilyMac1" hardware, if (and only if) the application
does not write to sRGB textures. (For history's sake: MacFamily1 also does
not support indirect command buffers, MSAA depth resolve, and stencil
resolve/feedback, but these are not exposed features in SDL_GPU.)


    @param props the properties to use.

    @return a GPU context on success or [Error] on failure; call SDL_GetError()
for more information.*)

val destroy : gpu_device -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_DestroyGPUDevice}SDL_DestroyGPUDevice}: Destroys a GPU context previously returned by SDL_CreateGPUDevice.


    @param device a GPU Context to destroy.
*)

val get_driver : gpu_device -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGPUDeviceDriver}SDL_GetGPUDeviceDriver}: Returns the name of the backend used to create this GPU context.


    @param device a GPU context to query.

    @return the name of the device's driver, or NULL on error.*)

val get_properties : gpu_device -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGPUDeviceProperties}SDL_GetGPUDeviceProperties}: Get the properties associated with a GPU device.

All properties are optional and may differ between GPU backends and SDL
versions.

The following properties are provided by SDL:
[SDL_PROP_GPU_DEVICE_NAME_STRING] Contains the name of the underlying
device as reported by the system driver. This string has no standardized
format, is highly inconsistent between hardware devices and drivers, and is
able to change at any time. Do not attempt to parse this string as it is
bound to fail at some point in the future when system drivers are updated,
new hardware devices are introduced, or when SDL adds new GPU backends or
modifies existing ones.

Strings that have been found in the wild include:

- GTX 970
- GeForce GTX 970
- NVIDIA GeForce GTX 970
- Microsoft Direct3D12 (NVIDIA GeForce GTX 970)
- NVIDIA Graphics Device
- GeForce GPU
- P106-100
- AMD 15D8:C9
- AMD Custom GPU 0405
- AMD Radeon (TM) Graphics
- ASUS Radeon RX 470 Series
- Intel(R) Arc(tm) A380 Graphics (DG2)
- Virtio-GPU Venus (NVIDIA TITAN V)
- SwiftShader Device (LLVM 16.0.0)
- llvmpipe (LLVM 15.0.4, 256 bits)
- Microsoft Basic Render Driver
- unknown device

The above list shows that the same device can have different formats, the
vendor name may or may not appear in the string, the included vendor name
may not be the vendor of the chipset on the device, some manufacturers
include pseudo-legal marks while others don't, some devices may not use a
marketing name in the string, the device string may be wrapped by the name
of a translation interface, the device may be emulated in software, or the
string may contain generic text that does not identify the device at all.
[SDL_PROP_GPU_DEVICE_DRIVER_NAME_STRING] Contains the self-reported name
of the underlying system driver.

Strings that have been found in the wild include:

- Intel Corporation
- Intel open-source Mesa driver
- Qualcomm Technologies Inc. Adreno Vulkan Driver
- MoltenVK
- Mali-G715
- venus
[SDL_PROP_GPU_DEVICE_DRIVER_VERSION_STRING] Contains the self-reported
version of the underlying system driver. This is a relatively short version
string in an unspecified format. If SDL_PROP_GPU_DEVICE_DRIVER_INFO_STRING
is available then that property should be preferred over this one as it may
contain additional information that is useful for identifying the exact
driver version used.

Strings that have been found in the wild include:

- 53.0.0
- 0.405.2463
- 32.0.15.6614
[SDL_PROP_GPU_DEVICE_DRIVER_INFO_STRING] Contains the detailed version
information of the underlying system driver as reported by the driver. This
is an arbitrary string with no standardized format and it may contain
newlines. This property should be preferred over
SDL_PROP_GPU_DEVICE_DRIVER_VERSION_STRING if it is available as it usually
contains the same information but in a format that is easier to read.

Strings that have been found in the wild include:

- 101.6559
- 1.2.11
- Mesa 21.2.2 (LLVM 12.0.1)
- Mesa 22.2.0-devel (git-f226222 2022-04-14 impish-oibaf-ppa)
- v1.r53p0-00eac0.824c4f31403fb1fbf8ee1042422c2129

This string has also been observed to be a multiline string (which has a
trailing newline):

]}
Driver Build: 85da404, I46ff5fc46f, 1606794520
Date: 11/30/20
Compiler Version: EV031.31.04.01
Driver Branch: promo490_3_Google
]}


    @param device a GPU context to query.

    @return a valid property ID on success or 0 on failure; call
SDL_GetError() for more information.*)

val claim_window_for : gpu_device -> window -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_ClaimWindowForGPUDevice}SDL_ClaimWindowForGPUDevice}: Claims a window, creating a swapchain structure for it.

This must be called before SDL_AcquireGPUSwapchainTexture is called using
the window. You should only call this function from the thread that created
the window.

The swapchain will be created with SDL_GPU_SWAPCHAINCOMPOSITION_SDR and
SDL_GPU_PRESENTMODE_VSYNC. If you want to have different swapchain
parameters, you must call SDL_SetGPUSwapchainParameters after claiming the
window.


    @param device a GPU context.
    @param window an SDL_Window.*)

val release_window_from : gpu_device -> window -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_ReleaseWindowFromGPUDevice}SDL_ReleaseWindowFromGPUDevice}: Unclaims a window, destroying its swapchain structure.


    @param device a GPU context.
    @param window an SDL_Window that has been claimed.
*)

end

module GPUComputePipeline : sig

val create : gpu_device -> gpu_compute_pipeline_create_info Ctypes.ptr -> gpu_compute_pipeline result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateGPUComputePipeline}SDL_CreateGPUComputePipeline}: Creates a pipeline object to be used in a compute workflow.

Shader resource bindings must be authored to follow a particular order
depending on the shader format.

For SPIR-V shaders, use the following resource sets:

- 0: Sampled textures, followed by read-only storage textures, followed by
  read-only storage buffers
- 1: Read-write storage textures, followed by read-write storage buffers
- 2: Uniform buffers

For DXBC and DXIL shaders, use the following register order:

- (t\[n\], space0): Sampled textures, followed by read-only storage textures,
  followed by read-only storage buffers
- (u\[n\], space1): Read-write storage textures, followed by read-write
  storage buffers
- (b\[n\], space2): Uniform buffers

For MSL/metallib, use the following order:

- \[\[buffer\]\]: Uniform buffers, followed by read-only storage buffers,
  followed by read-write storage buffers
- \[\[texture\]\]: Sampled textures, followed by read-only storage textures,
  followed by read-write storage textures

There are optional properties that can be provided through[props] These
are the supported properties:

-[SDL_PROP_GPU_COMPUTEPIPELINE_CREATE_NAME_STRING] a name that can be
  displayed in debugging tools.


    @param device a GPU Context.
    @param createinfo a struct describing the state of the compute pipeline to
create.

    @return a compute pipeline object on success, or [Error] on failure; call
SDL_GetError() for more information.*)

end

module GPUGraphicsPipeline : sig

val create : gpu_device -> gpu_graphics_pipeline_create_info Ctypes.ptr -> gpu_graphics_pipeline result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateGPUGraphicsPipeline}SDL_CreateGPUGraphicsPipeline}: Creates a pipeline object to be used in a graphics workflow.

There are optional properties that can be provided through[props] These
are the supported properties:

-[SDL_PROP_GPU_GRAPHICSPIPELINE_CREATE_NAME_STRING] a name that can be
  displayed in debugging tools.


    @param device a GPU Context.
    @param createinfo a struct describing the state of the graphics pipeline to
create.

    @return a graphics pipeline object on success, or [Error] on failure; call
SDL_GetError() for more information.*)

end

module GPUSampler : sig

val create : gpu_device -> gpu_sampler_create_info Ctypes.ptr -> gpu_sampler result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateGPUSampler}SDL_CreateGPUSampler}: Creates a sampler object to be used when binding textures in a graphics
workflow.

There are optional properties that can be provided through[props] These
are the supported properties:

-[SDL_PROP_GPU_SAMPLER_CREATE_NAME_STRING] a name that can be displayed
  in debugging tools.


    @param device a GPU Context.
    @param createinfo a struct describing the state of the sampler to create.

    @return a sampler object on success, or [Error] on failure; call
SDL_GetError() for more information.*)

end

module GPUShader : sig

val create : gpu_device -> gpu_shader_create_info Ctypes.ptr -> gpu_shader result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateGPUShader}SDL_CreateGPUShader}: Creates a shader to be used when creating a graphics pipeline.

Shader resource bindings must be authored to follow a particular order
depending on the shader format.

For SPIR-V shaders, use the following resource sets:

For vertex shaders:

- 0: Sampled textures, followed by storage textures, followed by storage
  buffers
- 1: Uniform buffers

For fragment shaders:

- 2: Sampled textures, followed by storage textures, followed by storage
  buffers
- 3: Uniform buffers

For DXBC and DXIL shaders, use the following register order:

For vertex shaders:

- (t\[n\], space0): Sampled textures, followed by storage textures, followed
  by storage buffers
- (s\[n\], space0): Samplers with indices corresponding to the sampled
  textures
- (b\[n\], space1): Uniform buffers

For pixel shaders:

- (t\[n\], space2): Sampled textures, followed by storage textures, followed
  by storage buffers
- (s\[n\], space2): Samplers with indices corresponding to the sampled
  textures
- (b\[n\], space3): Uniform buffers

For MSL/metallib, use the following order:

- \[\[texture\]\]: Sampled textures, followed by storage textures
- \[\[sampler\]\]: Samplers with indices corresponding to the sampled textures
- \[\[buffer\]\]: Uniform buffers, followed by storage buffers. Vertex buffer 0
  is bound at \[\[buffer(14)\]\], vertex buffer 1 at \[\[buffer(15)\]\], and so on.
  Rather than manually authoring vertex buffer indices, use the
  \[\[stage_in\]\] attribute which will automatically use the vertex input
  information from the SDL_GPUGraphicsPipeline.

Shader semantics other than system-value semantics do not matter in D3D12
and for ease of use the SDL implementation assumes that non system-value
semantics will all be TEXCOORD. If you are using HLSL as the shader source
language, your vertex semantics should start at TEXCOORD0 and increment
like so: TEXCOORD1, TEXCOORD2, etc. If you wish to change the semantic
prefix to something other than TEXCOORD you can use
SDL_PROP_GPU_DEVICE_CREATE_D3D12_SEMANTIC_NAME_STRING with
SDL_CreateGPUDeviceWithProperties().

There are optional properties that can be provided through[props] These
are the supported properties:

-[SDL_PROP_GPU_SHADER_CREATE_NAME_STRING] a name that can be displayed in
  debugging tools.


    @param device a GPU Context.
    @param createinfo a struct describing the state of the shader to create.

    @return a shader object on success, or [Error] on failure; call
SDL_GetError() for more information.*)

end

module GPUTexture : sig

val create : gpu_device -> gpu_texture_create_info Ctypes.ptr -> gpu_texture result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateGPUTexture}SDL_CreateGPUTexture}: Creates a texture object to be used in graphics or compute workflows.

The contents of this texture are undefined until data is written to the
texture, either via SDL_UploadToGPUTexture or by performing a render or
compute pass with this texture as a target.

Note that certain combinations of usage flags are invalid. For example, a
texture cannot have both the SAMPLER and GRAPHICS_STORAGE_READ flags.

If you request a sample count higher than the hardware supports, the
implementation will automatically fall back to the highest available sample
count.

There are optional properties that can be provided through
SDL_GPUTextureCreateInfo's[props] These are the supported properties:

-[SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_R_FLOAT] (Direct3D 12 only) if
  the texture usage is SDL_GPU_TEXTUREUSAGE_COLOR_TARGET, clear the texture
  to a color with this red intensity. Defaults to zero.
-[SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_G_FLOAT] (Direct3D 12 only) if
  the texture usage is SDL_GPU_TEXTUREUSAGE_COLOR_TARGET, clear the texture
  to a color with this green intensity. Defaults to zero.
-[SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_B_FLOAT] (Direct3D 12 only) if
  the texture usage is SDL_GPU_TEXTUREUSAGE_COLOR_TARGET, clear the texture
  to a color with this blue intensity. Defaults to zero.
-[SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_A_FLOAT] (Direct3D 12 only) if
  the texture usage is SDL_GPU_TEXTUREUSAGE_COLOR_TARGET, clear the texture
  to a color with this alpha intensity. Defaults to zero.
-[SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_DEPTH_FLOAT] (Direct3D 12 only)
  if the texture usage is SDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET, clear
  the texture to a depth of this value. Defaults to zero.
-[SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_STENCIL_NUMBER] (Direct3D 12
  only) if the texture usage is SDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET,
  clear the texture to a stencil of this Uint8 value. Defaults to zero.
-[SDL_PROP_GPU_TEXTURE_CREATE_NAME_STRING] a name that can be displayed
  in debugging tools.


    @param device a GPU Context.
    @param createinfo a struct describing the state of the texture to create.

    @return a texture object on success, or [Error] on failure; call
SDL_GetError() for more information.*)

end

module GPUBuffer : sig

val create : gpu_device -> gpu_buffer_create_info Ctypes.ptr -> gpu_buffer result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateGPUBuffer}SDL_CreateGPUBuffer}: Creates a buffer object to be used in graphics or compute workflows.

The contents of this buffer are undefined until data is written to the
buffer.

Note that certain combinations of usage flags are invalid. For example, a
buffer cannot have both the VERTEX and INDEX flags.

If you use a STORAGE flag, the data in the buffer must respect std140
layout conventions. In practical terms this means you must ensure that vec3
and vec4 fields are 16-byte aligned.

For better understanding of underlying concepts and memory management with
SDL GPU API, you may refer
\[this blog post\](https://moonside.games/posts/sdl-gpu-concepts-cycling/)
.

There are optional properties that can be provided through[props] These
are the supported properties:

-[SDL_PROP_GPU_BUFFER_CREATE_NAME_STRING] a name that can be displayed in
  debugging tools.


    @param device a GPU Context.
    @param createinfo a struct describing the state of the buffer to create.

    @return a buffer object on success, or [Error] on failure; call
SDL_GetError() for more information.*)

end

module GPUTransferBuffer : sig

val create : gpu_device -> gpu_transfer_buffer_create_info Ctypes.ptr -> gpu_transfer_buffer result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateGPUTransferBuffer}SDL_CreateGPUTransferBuffer}: Creates a transfer buffer to be used when uploading to or downloading from
graphics resources.

Download buffers can be particularly expensive to create, so it is good
practice to reuse them if data will be downloaded regularly.

There are optional properties that can be provided through[props] These
are the supported properties:

-[SDL_PROP_GPU_TRANSFERBUFFER_CREATE_NAME_STRING] a name that can be
  displayed in debugging tools.


    @param device a GPU Context.
    @param createinfo a struct describing the state of the transfer buffer to
create.

    @return a transfer buffer on success, or [Error] on failure; call
SDL_GetError() for more information.*)

end

module GPUCommandBuffer : sig

val acquire : gpu_device -> gpu_command_buffer result
(** {{:https://wiki.libsdl.org/SDL3/SDL_AcquireGPUCommandBuffer}SDL_AcquireGPUCommandBuffer}: Acquire a command buffer.

This command buffer is managed by the implementation and should not be
freed by the user. The command buffer may only be used on the thread it was
acquired on. The command buffer should be submitted on the thread it was
acquired on.

It is valid to acquire multiple command buffers on the same thread at once.
In fact a common design pattern is to acquire two command buffers per frame
where one is dedicated to render and compute passes and the other is
dedicated to copy passes and other preparatory work such as generating
mipmaps. Interleaving commands between the two command buffers reduces the
total amount of passes overall which improves rendering performance.


    @param device a GPU context.

    @return a command buffer, or [Error] on failure; call SDL_GetError() for more
information.*)

val submit : gpu_command_buffer -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SubmitGPUCommandBuffer}SDL_SubmitGPUCommandBuffer}: Submits a command buffer so its commands can be processed on the GPU.

It is invalid to use the command buffer after this is called.

This must be called from the thread the command buffer was acquired on.

All commands in the submission are guaranteed to begin executing before any
command in a subsequent submission begins executing.


    @param command_buffer a command buffer.*)

val submit_and_acquire_fence : gpu_command_buffer -> gpu_fence result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SubmitGPUCommandBufferAndAcquireFence}SDL_SubmitGPUCommandBufferAndAcquireFence}: Submits a command buffer so its commands can be processed on the GPU, and
acquires a fence associated with the command buffer.

You must release this fence when it is no longer needed or it will cause a
leak. It is invalid to use the command buffer after this is called.

This must be called from the thread the command buffer was acquired on.

All commands in the submission are guaranteed to begin executing before any
command in a subsequent submission begins executing.


    @param command_buffer a command buffer.

    @return a fence associated with the command buffer, or [Error] on failure;
call SDL_GetError() for more information.*)

val cancel : gpu_command_buffer -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CancelGPUCommandBuffer}SDL_CancelGPUCommandBuffer}: Cancels a command buffer.

None of the enqueued commands are executed.

It is an error to call this function after a swapchain texture has been
acquired.

This must be called from the thread the command buffer was acquired on.

You must not reference the command buffer after calling this function.


    @param command_buffer a command buffer.*)

end

module GPURenderPass : sig

val begin_ : gpu_command_buffer -> gpu_color_target_info Ctypes.ptr -> int -> gpu_depth_stencil_target_info option -> gpu_render_pass result
(** {{:https://wiki.libsdl.org/SDL3/SDL_BeginGPURenderPass}SDL_BeginGPURenderPass}: Begins a render pass on a command buffer.

A render pass consists of a set of texture subresources (or depth slices in
the 3D texture case) which will be rendered to during the render pass,
along with corresponding clear values and load/store operations. All
operations related to graphics pipelines must take place inside of a render
pass. A default viewport and scissor state are automatically set when this
is called. You cannot begin another render pass, or begin a compute pass or
copy pass until you have ended the render pass.

Using SDL_GPU_LOADOP_LOAD before any contents have been written to the
texture subresource will result in undefined behavior. SDL_GPU_LOADOP_CLEAR
will set the contents of the texture subresource to a single value before
any rendering is performed. It's fine to do an empty render pass using
SDL_GPU_STOREOP_STORE to clear a texture, but in general it's better to
think of clearing not as an independent operation but as something that's
done as the beginning of a render pass.


    @param command_buffer a command buffer.
    @param color_target_infos an array of texture subresources with
corresponding clear values and load/store ops.
    @param num_color_targets the number of color targets in the
color_target_infos array.
    @param depth_stencil_target_info a texture subresource with corresponding
clear value and load/store ops, may be
[None].

    @return a render pass handle.*)

val end_ : gpu_render_pass -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_EndGPURenderPass}SDL_EndGPURenderPass}: Ends the given render pass.

All bound graphics state on the render pass command buffer is unset. The
render pass handle is now invalid.


    @param render_pass a render pass handle.
*)

end

module GPUComputePass : sig

val begin_ : gpu_command_buffer -> gpu_storage_texture_read_write_binding list -> gpu_storage_buffer_read_write_binding list -> gpu_compute_pass result
(** {{:https://wiki.libsdl.org/SDL3/SDL_BeginGPUComputePass}SDL_BeginGPUComputePass}: Begins a compute pass on a command buffer.

A compute pass is defined by a set of texture subresources and buffers that
may be written to by compute pipelines. These textures and buffers must
have been created with the COMPUTE_STORAGE_WRITE bit or the
COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE bit. If you do not create a texture
with COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE, you must not read from the
texture in the compute pass. All operations related to compute pipelines
must take place inside of a compute pass. You must not begin another
compute pass, or a render pass or copy pass before ending the compute pass.

A VERY IMPORTANT NOTE - Reads and writes in compute passes are NOT
implicitly synchronized. This means you may cause data races by both
reading and writing a resource region in a compute pass, or by writing
multiple times to a resource region. If your compute work depends on
reading the completed output from a previous dispatch, you MUST end the
current compute pass and begin a new one before you can safely access the
data. Otherwise you will receive unexpected results. Reading and writing a
texture in the same compute pass is only supported by specific texture
formats. Make sure you check the format support!


    @param command_buffer a command buffer.
    @param storage_texture_bindings an array of writeable storage texture
binding structs.
    @param storage_buffer_bindings an array of writeable storage buffer binding
structs.

    @return a compute pass handle.*)

val end_ : gpu_compute_pass -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_EndGPUComputePass}SDL_EndGPUComputePass}: Ends the current compute pass.

All bound compute state on the command buffer is unset. The compute pass
handle is now invalid.


    @param compute_pass a compute pass handle.
*)

end

module GPUCopyPass : sig

val begin_ : gpu_command_buffer -> gpu_copy_pass result
(** {{:https://wiki.libsdl.org/SDL3/SDL_BeginGPUCopyPass}SDL_BeginGPUCopyPass}: Begins a copy pass on a command buffer.

All operations related to copying to or from buffers or textures take place
inside a copy pass. You must not begin another copy pass, or a render pass
or compute pass before ending the copy pass.


    @param command_buffer a command buffer.

    @return a copy pass handle.*)

val end_ : gpu_copy_pass -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_EndGPUCopyPass}SDL_EndGPUCopyPass}: Ends the current copy pass.


    @param copy_pass a copy pass handle.
*)

end

module GPUTextureFormat : sig

val texel_block_size : gpu_texture_format_enum -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GPUTextureFormatTexelBlockSize}SDL_GPUTextureFormatTexelBlockSize}: Obtains the texel block size for a texture format.


    @param format the texture format you want to know the texel size of.

    @return the texel block size of the texture format.*)

val calculate_size : gpu_texture_format_enum -> int -> int -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_CalculateGPUTextureFormatSize}SDL_CalculateGPUTextureFormatSize}: Calculate the size in bytes of a texture format with dimensions.


    @param format a texture format.
    @param width width in pixels.
    @param height height in pixels.
    @param depth_or_layer_count depth for 3D textures or layer count otherwise.

    @return the size of a texture with this format and dimensions.*)

val get_from_pixel_format : pixel_format_enum -> gpu_texture_format_enum
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGPUTextureFormatFromPixelFormat}SDL_GetGPUTextureFormatFromPixelFormat}: Get the GPU texture format corresponding to an SDL pixel format.


    @param format a pixel format.

    @return the corresponding GPU texture format, or
SDL_GPU_TEXTUREFORMAT_INVALID if there is no corresponding GPU
texture format.*)

end

module PixelFormat : sig

val get_from_gpu_texture_format : gpu_texture_format_enum -> pixel_format_enum
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetPixelFormatFromGPUTextureFormat}SDL_GetPixelFormatFromGPUTextureFormat}: Get the SDL pixel format corresponding to a GPU texture format.


    @param format a texture format.

    @return the corresponding pixel format, or SDL_PIXELFORMAT_UNKNOWN if
there is no corresponding pixel format.*)

end

