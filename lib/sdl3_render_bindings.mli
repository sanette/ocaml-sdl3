(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Sdl3_types
module Renderer : sig

val get_num_drivers : unit -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetNumRenderDrivers}SDL_GetNumRenderDrivers}: Get the number of 2D rendering drivers available for the current display.

A render driver is a set of code that handles rendering and texture
management on a particular display. Normally there is only one, but some
drivers may have several available with different capabilities.

There may be none if SDL was compiled without render support.


    @return the number of built in render drivers.*)

val get_driver : int -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetRenderDriver}SDL_GetRenderDriver}: Use this function to get the name of a built in 2D rendering driver.

The list of rendering drivers is given in the order that they are normally
initialized by default; the drivers that seem more reasonable to choose
first (as far as the SDL developers believe) are earlier in the list.

The names of drivers are all simple, low-ASCII identifiers, like "opengl",
"direct3d12" or "metal". These never have Unicode characters, and are not
meant to be proper names.


    @param index the index of the rendering driver; the value ranges from 0 to
SDL_GetNumRenderDrivers() - 1.

    @return the name of the rendering driver at the requested index, or NULL
if an invalid index was specified.*)

val create : window -> string -> renderer result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateRenderer}SDL_CreateRenderer}: Create a 2D rendering context for a window.

If you want a specific renderer, you can specify its name here. A list of
available renderers can be obtained by calling SDL_GetRenderDriver()
multiple times, with indices from 0 to SDL_GetNumRenderDrivers()-1. If you
don't need a specific renderer, specify NULL and SDL will attempt to choose
the best option for you, based on what is available on the user's system.

If[name]is a comma-separated list, SDL will try each name, in the order
listed, until one succeeds or all of them fail.

By default the rendering size matches the window size in pixels, but you
can call SDL_SetRenderLogicalPresentation() to change the content size and
scaling options.


    @param window the window where rendering is displayed.
    @param name the name of the rendering driver to initialize, or NULL to let
SDL choose one.

    @return a valid rendering context or [Error] if there was an error; call
SDL_GetError() for more information.*)

val create_with_properties : int -> renderer result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateRendererWithProperties}SDL_CreateRendererWithProperties}: Create a 2D rendering context for a window, with the specified properties.

These are the supported properties:

-[SDL_PROP_RENDERER_CREATE_NAME_STRING] the name of the rendering driver
  to use, if a specific one is desired
-[SDL_PROP_RENDERER_CREATE_WINDOW_POINTER] the window where rendering is
  displayed, required if this isn't a software renderer using a surface
-[SDL_PROP_RENDERER_CREATE_SURFACE_POINTER] the surface where rendering
  is displayed, if you want a software renderer without a window
-[SDL_PROP_RENDERER_CREATE_OUTPUT_COLORSPACE_NUMBER] an SDL_Colorspace
  value describing the colorspace for output to the display, defaults to
  SDL_COLORSPACE_SRGB. The direct3d11, direct3d12, and metal renderers
  support SDL_COLORSPACE_SRGB_LINEAR, which is a linear color space and
  supports HDR output. If you select SDL_COLORSPACE_SRGB_LINEAR, drawing
  still uses the sRGB colorspace, but values can go beyond 1.0 and float
  (linear) format textures can be used for HDR content.
-[SDL_PROP_RENDERER_CREATE_PRESENT_VSYNC_NUMBER] non-zero if you want
  present synchronized with the refresh rate. This property can take any
  value that is supported by SDL_SetRenderVSync() for the renderer.

With the SDL GPU renderer (since SDL 3.4.0):

-[SDL_PROP_RENDERER_CREATE_GPU_DEVICE_POINTER] the device to use with the
  renderer, optional.
-[SDL_PROP_RENDERER_CREATE_GPU_SHADERS_SPIRV_BOOLEAN] the app is able to
  provide SPIR-V shaders to SDL_GPURenderState, optional.
-[SDL_PROP_RENDERER_CREATE_GPU_SHADERS_DXIL_BOOLEAN] the app is able to
  provide DXIL shaders to SDL_GPURenderState, optional.
-[SDL_PROP_RENDERER_CREATE_GPU_SHADERS_MSL_BOOLEAN] the app is able to
  provide MSL shaders to SDL_GPURenderState, optional.

With the vulkan renderer:

-[SDL_PROP_RENDERER_CREATE_VULKAN_INSTANCE_POINTER] the VkInstance to use
  with the renderer, optional.
-[SDL_PROP_RENDERER_CREATE_VULKAN_SURFACE_NUMBER] the VkSurfaceKHR to use
  with the renderer, optional.
-[SDL_PROP_RENDERER_CREATE_VULKAN_PHYSICAL_DEVICE_POINTER] the
  VkPhysicalDevice to use with the renderer, optional.
-[SDL_PROP_RENDERER_CREATE_VULKAN_DEVICE_POINTER] the VkDevice to use
  with the renderer, optional.
-[SDL_PROP_RENDERER_CREATE_VULKAN_GRAPHICS_QUEUE_FAMILY_INDEX_NUMBER] the
  queue family index used for rendering.
-[SDL_PROP_RENDERER_CREATE_VULKAN_PRESENT_QUEUE_FAMILY_INDEX_NUMBER] the
  queue family index used for presentation.


    @param props the properties to use.

    @return a valid rendering context or [Error] if there was an error; call
SDL_GetError() for more information.*)

val create_gpu : gpu_device option -> window option -> renderer result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateGPURenderer}SDL_CreateGPURenderer}: Create a 2D GPU rendering context.

The GPU device to use is passed in as a parameter. If this is NULL, then a
device will be created normally and can be retrieved using
SDL_GetGPURendererDevice().

The window to use is passed in as a parameter. If this is NULL, then this
will become an offscreen renderer. In that case, you should call
SDL_SetRenderTarget() to setup rendering to a texture, and then call
SDL_RenderPresent() normally to complete drawing a frame.


    @param device the GPU device to use with the renderer, or [None] to create a
device.
    @param window the window where rendering is displayed, or [None] to create an
offscreen renderer.

    @return a valid rendering context or [Error] if there was an error; call
SDL_GetError() for more information.*)

val get_gpu_device : renderer -> gpu_device result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetGPURendererDevice}SDL_GetGPURendererDevice}: Return the GPU device used by a renderer.


    @param renderer the rendering context.

    @return the GPU device used by the renderer, or [Error] if the renderer is
not a GPU renderer; call SDL_GetError() for more information.*)

val create_software : surface -> renderer result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateSoftwareRenderer}SDL_CreateSoftwareRenderer}: Create a 2D software rendering context for a surface.

Two other API which can be used to create SDL_Renderer:
SDL_CreateRenderer() and SDL_CreateWindowAndRenderer(). These can _also_
create a software renderer, but they are intended to be used with an
SDL_Window as the final destination and not an SDL_Surface.


    @param surface the SDL_Surface structure representing the surface where
rendering is done.

    @return a valid rendering context or [Error] if there was an error; call
SDL_GetError() for more information.*)

val get : window -> renderer result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetRenderer}SDL_GetRenderer}: Get the renderer associated with a window.


    @param window the window to query.

    @return the rendering context on success or [Error] on failure; call
SDL_GetError() for more information.*)

val get_name : renderer -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetRendererName}SDL_GetRendererName}: Get the name of a renderer.


    @param renderer the rendering context.

    @return the name of the selected renderer, or NULL on failure; call
SDL_GetError() for more information.*)

val get_properties : renderer -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetRendererProperties}SDL_GetRendererProperties}: Get the properties associated with a renderer.

The following read-only properties are provided by SDL:

-[SDL_PROP_RENDERER_NAME_STRING] the name of the rendering driver
-[SDL_PROP_RENDERER_WINDOW_POINTER] the window where rendering is
  displayed, if any
-[SDL_PROP_RENDERER_SURFACE_POINTER] the surface where rendering is
  displayed, if this is a software renderer without a window
-[SDL_PROP_RENDERER_VSYNC_NUMBER] the current vsync setting
-[SDL_PROP_RENDERER_MAX_TEXTURE_SIZE_NUMBER] the maximum texture width
  and height
-[SDL_PROP_RENDERER_TEXTURE_FORMATS_POINTER] a (const SDL_PixelFormat * )
  array of pixel formats, terminated with SDL_PIXELFORMAT_UNKNOWN,
  representing the available texture formats for this renderer.
-[SDL_PROP_RENDERER_TEXTURE_WRAPPING_BOOLEAN] true if the renderer
  supports SDL_TEXTURE_ADDRESS_WRAP on non-power-of-two textures.
-[SDL_PROP_RENDERER_OUTPUT_COLORSPACE_NUMBER] an SDL_Colorspace value
  describing the colorspace for output to the display, defaults to
  SDL_COLORSPACE_SRGB.
-[SDL_PROP_RENDERER_HDR_ENABLED_BOOLEAN] true if the output colorspace is
  SDL_COLORSPACE_SRGB_LINEAR and the renderer is showing on a display with
  HDR enabled. This property can change dynamically when
  SDL_EVENT_WINDOW_HDR_STATE_CHANGED is sent.
-[SDL_PROP_RENDERER_SDR_WHITE_POINT_FLOAT] the value of SDR white in the
  SDL_COLORSPACE_SRGB_LINEAR colorspace. When HDR is enabled, this value is
  automatically multiplied into the color scale. This property can change
  dynamically when SDL_EVENT_WINDOW_HDR_STATE_CHANGED is sent.
-[SDL_PROP_RENDERER_HDR_HEADROOM_FLOAT] the additional high dynamic range
  that can be displayed, in terms of the SDR white point. When HDR is not
  enabled, this will be 1.0. This property can change dynamically when
  SDL_EVENT_WINDOW_HDR_STATE_CHANGED is sent.

With the direct3d renderer:

-[SDL_PROP_RENDERER_D3D9_DEVICE_POINTER] the IDirect3DDevice9 associated
  with the renderer

With the direct3d11 renderer:

-[SDL_PROP_RENDERER_D3D11_DEVICE_POINTER] the ID3D11Device associated
  with the renderer
-[SDL_PROP_RENDERER_D3D11_SWAPCHAIN_POINTER] the IDXGISwapChain1
  associated with the renderer. This may change when the window is resized.

With the direct3d12 renderer:

-[SDL_PROP_RENDERER_D3D12_DEVICE_POINTER] the ID3D12Device associated
  with the renderer
-[SDL_PROP_RENDERER_D3D12_SWAPCHAIN_POINTER] the IDXGISwapChain4
  associated with the renderer.
-[SDL_PROP_RENDERER_D3D12_COMMAND_QUEUE_POINTER] the ID3D12CommandQueue
  associated with the renderer

With the vulkan renderer:

-[SDL_PROP_RENDERER_VULKAN_INSTANCE_POINTER] the VkInstance associated
  with the renderer
-[SDL_PROP_RENDERER_VULKAN_SURFACE_NUMBER] the VkSurfaceKHR associated
  with the renderer
-[SDL_PROP_RENDERER_VULKAN_PHYSICAL_DEVICE_POINTER] the VkPhysicalDevice
  associated with the renderer
-[SDL_PROP_RENDERER_VULKAN_DEVICE_POINTER] the VkDevice associated with
  the renderer
-[SDL_PROP_RENDERER_VULKAN_GRAPHICS_QUEUE_FAMILY_INDEX_NUMBER] the queue
  family index used for rendering
-[SDL_PROP_RENDERER_VULKAN_PRESENT_QUEUE_FAMILY_INDEX_NUMBER] the queue
  family index used for presentation
-[SDL_PROP_RENDERER_VULKAN_SWAPCHAIN_IMAGE_COUNT_NUMBER] the number of
  swapchain images, or potential frames in flight, used by the Vulkan
  renderer

With the gpu renderer:

-[SDL_PROP_RENDERER_GPU_DEVICE_POINTER] the SDL_GPUDevice associated with
  the renderer


    @param renderer the rendering context.

    @return a valid property ID on success or 0 on failure; call
SDL_GetError() for more information.*)

val get_output_size : renderer -> (int * int) result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetRenderOutputSize}SDL_GetRenderOutputSize}: Get the output size in pixels of a rendering context.

This returns the true output size in pixels, ignoring any render targets or
logical size and presentation.

For the output size of the current rendering target, with logical size
adjustments, use SDL_GetCurrentRenderOutputSize() instead.


    @param renderer the rendering context.

    @return 2 values:
(
  + w : a pointer filled in with the width in pixels.,
  + h : a pointer filled in with the height in pixels.
)*)

val get_current_output_size : renderer -> (int * int) result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetCurrentRenderOutputSize}SDL_GetCurrentRenderOutputSize}: Get the current output size in pixels of a rendering context.

If a rendering target is active, this will return the size of the rendering
target in pixels, otherwise return the value of SDL_GetRenderOutputSize().

Rendering target or not, the output will be adjusted by the current logical
presentation state, dictated by SDL_SetRenderLogicalPresentation().


    @param renderer the rendering context.

    @return 2 values:
(
  + w : a pointer filled in with the current width.,
  + h : a pointer filled in with the current height.
)*)

val get_from_texture : texture -> renderer result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetRendererFromTexture}SDL_GetRendererFromTexture}: Get the renderer that created an SDL_Texture.


    @param texture the texture to query.

    @return the SDL_Renderer that created the texture, or [Error] on
failure; call SDL_GetError() for more information.*)

val set_target : renderer -> texture option -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetRenderTarget}SDL_SetRenderTarget}: Set a texture as the current rendering target.

The default render target is the window for which the renderer was created.
To stop rendering to a texture and render to the window again, call this
function with a NULL[texture]

Viewport, cliprect, scale, and logical presentation are unique to each
render target. Get and set functions for these states apply to the current
render target set by this function, and those states persist on each target
when the current render target changes.


    @param renderer the rendering context.
    @param texture the targeted texture, which must be created with the[SDL_TEXTUREACCESS_TARGET]flag, or [None] to render to the
window instead of a texture.*)

val get_target : renderer -> texture result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetRenderTarget}SDL_GetRenderTarget}: Get the current render target.

The default render target is the window for which the renderer was created,
and is reported a NULL here.


    @param renderer the rendering context.

    @return the current render target or [Error] for the default render target.*)

val set_logical_presentation : renderer -> int -> int -> renderer_logical_presentation_enum -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetRenderLogicalPresentation}SDL_SetRenderLogicalPresentation}: Set a device-independent resolution and presentation mode for rendering.

This function sets the width and height of the logical rendering output.
The renderer will act as if the current render target is always the
requested dimensions, scaling to the actual resolution as necessary.

This can be useful for games that expect a fixed size, but would like to
scale the output to whatever is available, regardless of how a user resizes
a window, or if the display is high DPI.

Logical presentation can be used with both render target textures and the
renderer's window; the state is unique to each render target, and this
function sets the state for the current render target. It might be useful
to draw to a texture that matches the window dimensions with logical
presentation enabled, and then draw that texture across the entire window
with logical presentation disabled. Be careful not to render both with
logical presentation enabled, however, as this could produce
double-letterboxing, etc.

You can disable logical coordinates by setting the mode to
SDL_LOGICAL_PRESENTATION_DISABLED, and in that case you get the full pixel
resolution of the render target; it is safe to toggle logical presentation
during the rendering of a frame: perhaps most of the rendering is done to
specific dimensions but to make fonts look sharp, the app turns off logical
presentation while drawing text, for example.

You can convert coordinates in an event into rendering coordinates using
SDL_ConvertEventToRenderCoordinates().


    @param renderer the rendering context.
    @param w the width of the logical resolution.
    @param h the height of the logical resolution.
    @param mode the presentation mode used.*)

val get_logical_presentation : renderer -> (int * int * renderer_logical_presentation_enum) result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetRenderLogicalPresentation}SDL_GetRenderLogicalPresentation}: Get device independent resolution and presentation mode for rendering.

This function gets the width and height of the logical rendering output, or
0 if a logical resolution is not enabled.

Each render target has its own logical presentation state. This function
gets the state for the current render target.


    @param renderer the rendering context.

    @return 3 values:
(
  + w : an int filled with the logical presentation width.,
  + h : an int filled with the logical presentation height.,
  + mode : a variable filled with the logical presentation mode being
used.
)*)

val get_logical_presentation_rect : renderer -> f_rect option -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetRenderLogicalPresentationRect}SDL_GetRenderLogicalPresentationRect}: Get the final presentation rectangle for rendering.

This function returns the calculated rectangle used for logical
presentation, based on the presentation mode and output size. If logical
presentation is disabled, it will fill the rectangle with the output size,
in pixels.

Each render target has its own logical presentation state. This function
gets the rectangle for the current render target.


    @param renderer the rendering context.
    @param rect a pointer filled in with the final presentation rectangle, may
be [None].*)

val coordinates_from_window : renderer -> float -> float -> (float * float) result
(** {{:https://wiki.libsdl.org/SDL3/SDL_RenderCoordinatesFromWindow}SDL_RenderCoordinatesFromWindow}: Get a point in render coordinates when given a point in window coordinates.

This takes into account several states:

- The window dimensions.
- The logical presentation settings (SDL_SetRenderLogicalPresentation)
- The scale (SDL_SetRenderScale)
- The viewport (SDL_SetRenderViewport)


    @param renderer the rendering context.
    @param window_x the x coordinate in window coordinates.
    @param window_y the y coordinate in window coordinates.

    @return 2 values:
(
  + x : a pointer filled with the x coordinate in render coordinates.,
  + y : a pointer filled with the y coordinate in render coordinates.
)*)

val coordinates_to_window : renderer -> float -> float -> (float * float) result
(** {{:https://wiki.libsdl.org/SDL3/SDL_RenderCoordinatesToWindow}SDL_RenderCoordinatesToWindow}: Get a point in window coordinates when given a point in render coordinates.

This takes into account several states:

- The window dimensions.
- The logical presentation settings (SDL_SetRenderLogicalPresentation)
- The scale (SDL_SetRenderScale)
- The viewport (SDL_SetRenderViewport)


    @param renderer the rendering context.
    @param x the x coordinate in render coordinates.
    @param y the y coordinate in render coordinates.

    @return 2 values:
(
  + window_x : a pointer filled with the x coordinate in window
coordinates.,
  + window_y : a pointer filled with the y coordinate in window
coordinates.
)*)

val convert_event_to_coordinates : renderer -> event -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_ConvertEventToRenderCoordinates}SDL_ConvertEventToRenderCoordinates}: Convert the coordinates in an event to render coordinates.

This takes into account several states:

- The window dimensions.
- The logical presentation settings (SDL_SetRenderLogicalPresentation)
- The scale (SDL_SetRenderScale)
- The viewport (SDL_SetRenderViewport)

Various event types are converted with this function: mouse, touch, pen,
etc.

Touch coordinates are converted from normalized coordinates in the window
to non-normalized rendering coordinates.

Relative mouse coordinates (xrel and yrel event fields) are _also_
converted. Applications that do not want these fields converted should use
SDL_RenderCoordinatesFromWindow() on the specific event fields instead of
converting the entire event structure.

Once converted, coordinates may be outside the rendering area.


    @param renderer the rendering context.
    @param event the event to modify.*)

val set_viewport : renderer -> rect option -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetRenderViewport}SDL_SetRenderViewport}: Set the drawing area for rendering on the current target.

Drawing will clip to this area (separately from any clipping done with
SDL_SetRenderClipRect), and the top left of the area will become coordinate
(0, 0) for future drawing commands.

The area's width and height must be >= 0.

Each render target has its own viewport. This function sets the viewport
for the current render target.


    @param renderer the rendering context.
    @param rect the SDL_Rect structure representing the drawing area, or [None]
to set the viewport to the entire target.*)

val get_viewport : renderer -> rect Ctypes.ptr -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetRenderViewport}SDL_GetRenderViewport}: Get the drawing area for the current target.

Each render target has its own viewport. This function gets the viewport
for the current render target.


    @param renderer the rendering context.
    @param rect an SDL_Rect structure filled in with the current drawing area.*)

val viewport_set : renderer -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_RenderViewportSet}SDL_RenderViewportSet}: Return whether an explicit rectangle was set as the viewport.

This is useful if you're saving and restoring the viewport and want to know
whether you should restore a specific rectangle or NULL.

Each render target has its own viewport. This function checks the viewport
for the current render target.


    @param renderer the rendering context.*)

val get_safe_area : renderer -> rect Ctypes.ptr -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetRenderSafeArea}SDL_GetRenderSafeArea}: Get the safe area for rendering within the current viewport.

Some devices have portions of the screen which are partially obscured or
not interactive, possibly due to on-screen controls, curved edges, camera
notches, TV overscan, etc. This function provides the area of the current
viewport which is safe to have interactible content. You should continue
rendering into the rest of the render target, but it should not contain
visually important or interactible content.


    @param renderer the rendering context.
    @param rect a pointer filled in with the area that is safe for interactive
content.*)

val set_clip_rect : renderer -> rect option -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetRenderClipRect}SDL_SetRenderClipRect}: Set the clip rectangle for rendering on the specified target.

Each render target has its own clip rectangle. This function sets the
cliprect for the current render target.


    @param renderer the rendering context.
    @param rect an SDL_Rect structure representing the clip area, relative to
the viewport, or [None] to disable clipping.*)

val get_clip_rect : renderer -> rect Ctypes.ptr -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetRenderClipRect}SDL_GetRenderClipRect}: Get the clip rectangle for the current target.

Each render target has its own clip rectangle. This function gets the
cliprect for the current render target.


    @param renderer the rendering context.
    @param rect an SDL_Rect structure filled in with the current clipping area
or an empty rectangle if clipping is disabled.*)

val clip_enabled : renderer -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_RenderClipEnabled}SDL_RenderClipEnabled}: Get whether clipping is enabled on the given render target.

Each render target has its own clip rectangle. This function checks the
cliprect for the current render target.


    @param renderer the rendering context.

    @return true if clipping is enabled or false if not; call SDL_GetError()
for more information.*)

val set_scale : renderer -> float -> float -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetRenderScale}SDL_SetRenderScale}: Set the drawing scale for rendering on the current target.

The drawing coordinates are scaled by the x/y scaling factors before they
are used by the renderer. This allows resolution independent drawing with a
single coordinate system.

If this results in scaling or subpixel drawing by the rendering backend, it
will be handled using the appropriate quality hints. For best results use
integer scaling factors.

Each render target has its own scale. This function sets the scale for the
current render target.


    @param renderer the rendering context.
    @param scaleX the horizontal scaling factor.
    @param scaleY the vertical scaling factor.*)

val get_scale : renderer -> (float * float) result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetRenderScale}SDL_GetRenderScale}: Get the drawing scale for the current target.

Each render target has its own scale. This function gets the scale for the
current render target.


    @param renderer the rendering context.

    @return 2 values:
(
  + scaleX : a pointer filled in with the horizontal scaling factor.,
  + scaleY : a pointer filled in with the vertical scaling factor.
)*)

val set_draw_color : renderer -> int -> int -> int -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetRenderDrawColor}SDL_SetRenderDrawColor}: Set the color used for drawing operations.

Set the color for drawing or filling rectangles, lines, and points, and for
SDL_RenderClear().


    @param renderer the rendering context.
    @param r the red value used to draw on the rendering target.
    @param g the green value used to draw on the rendering target.
    @param b the blue value used to draw on the rendering target.
    @param a the alpha value used to draw on the rendering target; usually[SDL_ALPHA_OPAQUE](255). Use SDL_SetRenderDrawBlendMode to
specify how the alpha channel is used.*)

val set_draw_color_float : renderer -> float -> float -> float -> float -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetRenderDrawColorFloat}SDL_SetRenderDrawColorFloat}: Set the color used for drawing operations (Rect, Line and Clear).

Set the color for drawing or filling rectangles, lines, and points, and for
SDL_RenderClear().


    @param renderer the rendering context.
    @param r the red value used to draw on the rendering target.
    @param g the green value used to draw on the rendering target.
    @param b the blue value used to draw on the rendering target.
    @param a the alpha value used to draw on the rendering target. Use
SDL_SetRenderDrawBlendMode to specify how the alpha channel is
used.*)

val get_draw_color : renderer -> (int * int * int * int) result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetRenderDrawColor}SDL_GetRenderDrawColor}: Get the color used for drawing operations (Rect, Line and Clear).


    @param renderer the rendering context.

    @return 4 values:
(
  + r : a pointer filled in with the red value used to draw on the
rendering target.,
  + g : a pointer filled in with the green value used to draw on the
rendering target.,
  + b : a pointer filled in with the blue value used to draw on the
rendering target.,
  + a : a pointer filled in with the alpha value used to draw on the
rendering target; usually[SDL_ALPHA_OPAQUE](255).
)*)

val get_draw_color_float : renderer -> (float * float * float * float) result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetRenderDrawColorFloat}SDL_GetRenderDrawColorFloat}: Get the color used for drawing operations (Rect, Line and Clear).


    @param renderer the rendering context.

    @return 4 values:
(
  + r : a pointer filled in with the red value used to draw on the
rendering target.,
  + g : a pointer filled in with the green value used to draw on the
rendering target.,
  + b : a pointer filled in with the blue value used to draw on the
rendering target.,
  + a : a pointer filled in with the alpha value used to draw on the
rendering target.
)*)

val set_color_scale : renderer -> float -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetRenderColorScale}SDL_SetRenderColorScale}: Set the color scale used for render operations.

The color scale is an additional scale multiplied into the pixel color
value while rendering. This can be used to adjust the brightness of colors
during HDR rendering, or changing HDR video brightness when playing on an
SDR display.

The color scale does not affect the alpha channel, only the color
brightness.


    @param renderer the rendering context.
    @param scale the color scale value.*)

val get_color_scale : renderer -> float result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetRenderColorScale}SDL_GetRenderColorScale}: Get the color scale used for render operations.


    @param renderer the rendering context.

    @return a pointer filled in with the current color scale value.*)

val set_draw_blend_mode : renderer -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetRenderDrawBlendMode}SDL_SetRenderDrawBlendMode}: Set the blend mode used for drawing operations (Fill and Line).

If the blend mode is not supported, the closest supported mode is chosen.


    @param renderer the rendering context.
    @param blendMode the SDL_BlendMode to use for blending.*)

val get_draw_blend_mode : renderer -> int result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetRenderDrawBlendMode}SDL_GetRenderDrawBlendMode}: Get the blend mode used for drawing operations.


    @param renderer the rendering context.

    @return a pointer filled in with the current SDL_BlendMode.*)

val clear : renderer -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_RenderClear}SDL_RenderClear}: Clear the current rendering target with the drawing color.

This function clears the entire rendering target, ignoring the viewport and
the clip rectangle. Note, that clearing will also set/fill all pixels of
the rendering target to current renderer draw color, so make sure to invoke
SDL_SetRenderDrawColor() when needed.


    @param renderer the rendering context.*)

val set_texture_address_mode : renderer -> texture_address_mode_enum -> texture_address_mode_enum -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetRenderTextureAddressMode}SDL_SetRenderTextureAddressMode}: Set the texture addressing mode used in SDL_RenderGeometry().


    @param renderer the rendering context.
    @param u_mode the SDL_TextureAddressMode to use for horizontal texture
coordinates in SDL_RenderGeometry().
    @param v_mode the SDL_TextureAddressMode to use for vertical texture
coordinates in SDL_RenderGeometry().*)

val get_texture_address_mode : renderer -> texture_address_mode_enum Ctypes.ptr option -> texture_address_mode_enum Ctypes.ptr option -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetRenderTextureAddressMode}SDL_GetRenderTextureAddressMode}: Get the texture addressing mode used in SDL_RenderGeometry().


    @param renderer the rendering context.
    @param u_mode a pointer filled in with the SDL_TextureAddressMode to use
for horizontal texture coordinates in SDL_RenderGeometry(),
may be [None].
    @param v_mode a pointer filled in with the SDL_TextureAddressMode to use
for vertical texture coordinates in SDL_RenderGeometry(), may
be [None].*)

val read_pixels : renderer -> rect option -> surface result
(** {{:https://wiki.libsdl.org/SDL3/SDL_RenderReadPixels}SDL_RenderReadPixels}: Read pixels from the current rendering target.

The returned surface contains pixels inside the desired area clipped to the
current viewport, and should be freed with SDL_DestroySurface().

Note that this returns the actual pixels on the screen, so if you are using
logical presentation you should use SDL_GetRenderLogicalPresentationRect()
to get the area containing your content.

**WARNING**: This is a very slow operation, and should not be used
frequently. If you're using this on the main rendering target, it should be
called after rendering and before SDL_RenderPresent().


    @param renderer the rendering context.
    @param rect an SDL_Rect structure representing the area to read, which will
be clipped to the current viewport, or [None] for the entire
viewport.

    @return a new SDL_Surface on success or [Error] on failure; call
SDL_GetError() for more information.*)

val present : renderer -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_RenderPresent}SDL_RenderPresent}: Update the screen with any rendering performed since the previous call.

SDL's rendering functions operate on a backbuffer; that is, calling a
rendering function such as SDL_RenderLine() does not directly put a line on
the screen, but rather updates the backbuffer. As such, you compose your
entire scene and *present* the composed backbuffer to the screen as a
complete picture.

Therefore, when using SDL's rendering API, one does all drawing intended
for the frame, and then calls this function once per frame to present the
final drawing to the user.

The backbuffer should be considered invalidated after each present; do not
assume that previous contents will exist between frames. You are strongly
encouraged to call SDL_RenderClear() to initialize the backbuffer before
starting each new frame's drawing, even if you plan to overwrite every
pixel.

Please note, that in case of rendering to a texture - there is **no need**
to call[SDL_RenderPresent]after drawing needed objects to a texture, and
should not be done; you are only required to change back the rendering
target to default via[SDL_SetRenderTarget(renderer, NULL)]afterwards, as
textures by themselves do not have a concept of backbuffers. Calling
SDL_RenderPresent while rendering to a texture will fail.


    @param renderer the rendering context.*)

val destroy : renderer -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_DestroyRenderer}SDL_DestroyRenderer}: Destroy the rendering context for a window and free all associated
textures.

This should be called before destroying the associated window.


    @param renderer the rendering context.
*)

val flush : renderer -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_FlushRenderer}SDL_FlushRenderer}: Force the rendering context to flush any pending commands and state.

You do not need to (and in fact, shouldn't) call this function unless you
are planning to call into OpenGL/Direct3D/Metal/whatever directly, in
addition to using an SDL_Renderer.

This is for a very-specific case: if you are using SDL's render API, and
you plan to make OpenGL/D3D/whatever calls in addition to SDL render API
calls. If this applies, you should call this function between calls to
SDL's render API and the low-level API you're using in cooperation.

In all other cases, you can ignore this function.

This call makes SDL flush any pending rendering work it was queueing up to
do later in a single batch, and marks any internal cached state as invalid,
so it'll prepare all its state again later, from scratch.

This means you do not need to save state in your rendering code to protect
the SDL renderer. However, there lots of arbitrary pieces of Direct3D and
OpenGL state that can confuse things; you should use your best judgment and
be prepared to make changes if specific state needs to be protected.


    @param renderer the rendering context.*)

val get_metal_layer : renderer -> data
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetRenderMetalLayer}SDL_GetRenderMetalLayer}: Get the CAMetalLayer associated with the given Metal renderer.

This function returns[void *] so SDL doesn't have to include Metal's
headers, but it can be safely cast to a[CAMetalLayer *]


    @param renderer the renderer to query.

    @return a[CAMetalLayer *]on success, or NULL if the renderer isn't a
Metal renderer.*)

val get_metal_command_encoder : renderer -> data
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetRenderMetalCommandEncoder}SDL_GetRenderMetalCommandEncoder}: Get the Metal command encoder for the current frame.

This function returns[void *] so SDL doesn't have to include Metal's
headers, but it can be safely cast to an[id<MTLRenderCommandEncoder>]

This will return NULL if Metal refuses to give SDL a drawable to render to,
which might happen if the window is hidden/minimized/offscreen. This
doesn't apply to command encoders for render targets, just the window's
backbuffer. Check your return values!


    @param renderer the renderer to query.

    @return an[id<MTLRenderCommandEncoder>]on success, or NULL if the
renderer isn't a Metal renderer or there was an error.*)

val add_vulkan_semaphores : renderer -> int -> int -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_AddVulkanRenderSemaphores}SDL_AddVulkanRenderSemaphores}: Add a set of synchronization semaphores for the current frame.

The Vulkan renderer will wait for[wait_semaphore]before submitting
rendering commands and signal[signal_semaphore]after rendering commands
are complete for this frame.

This should be called each frame that you want semaphore synchronization.
The Vulkan renderer may have multiple frames in flight on the GPU, so you
should have multiple semaphores that are used for synchronization. Querying
SDL_PROP_RENDERER_VULKAN_SWAPCHAIN_IMAGE_COUNT_NUMBER will give you the
maximum number of semaphores you'll need.


    @param renderer the rendering context.
    @param wait_stage_mask the VkPipelineStageFlags for the wait.
    @param wait_semaphore a VkSempahore to wait on before rendering the current
frame, or 0 if not needed.
    @param signal_semaphore a VkSempahore that SDL will signal when rendering
for the current frame is complete, or 0 if not
needed.*)

val set_v_sync : renderer -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetRenderVSync}SDL_SetRenderVSync}: Toggle VSync of the given renderer.

When a renderer is created, vsync defaults to SDL_RENDERER_VSYNC_DISABLED.

The[vsync]parameter can be 1 to synchronize present with every vertical
refresh, 2 to synchronize present with every second vertical refresh, etc.,
SDL_RENDERER_VSYNC_ADAPTIVE for late swap tearing (adaptive vsync), or
SDL_RENDERER_VSYNC_DISABLED to disable. Not every value is supported by
every driver, so you should check the return value to see whether the
requested setting is supported.


    @param renderer the renderer to toggle.
    @param vsync the vertical refresh sync interval.*)

val get_v_sync : renderer -> int result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetRenderVSync}SDL_GetRenderVSync}: Get VSync of the given renderer.


    @param renderer the renderer to toggle.

    @return an int filled with the current vertical refresh sync interval.
See SDL_SetRenderVSync() for the meaning of the value.*)

val set_gpu_state : renderer -> gpu_render_state option -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetGPURenderState}SDL_SetGPURenderState}: Set custom GPU render state.

This function sets custom GPU render state for subsequent draw calls. This
allows using custom shaders with the GPU renderer.


    @param renderer the renderer to use.
    @param state the state to to use, or [None] to clear custom GPU render state.*)

end

module Global : sig

val create_window_and_renderer : string -> int -> int -> int64 -> (window * renderer) result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateWindowAndRenderer}SDL_CreateWindowAndRenderer}: Create a window and default renderer.


    @param title the title of the window, in UTF-8 encoding.
    @param width the width of the window.
    @param height the height of the window.
    @param window_flags the flags used to create the window (see
SDL_CreateWindow()).

    @return 2 values:
(
  + window : a pointer filled with the window, or [Error] on error.,
  + renderer : a pointer filled with the renderer, or [Error] on error.
)*)

val render_point : renderer -> float -> float -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_RenderPoint}SDL_RenderPoint}: Draw a point on the current rendering target at subpixel precision.


    @param renderer the renderer which should draw a point.
    @param x the x coordinate of the point.
    @param y the y coordinate of the point.*)

val render_points : renderer -> f_point list -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_RenderPoints}SDL_RenderPoints}: Draw multiple points on the current rendering target at subpixel precision.


    @param renderer the renderer which should draw multiple points.
    @param points the points to draw.*)

val render_line : renderer -> float -> float -> float -> float -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_RenderLine}SDL_RenderLine}: Draw a line on the current rendering target at subpixel precision.


    @param renderer the renderer which should draw a line.
    @param x1 the x coordinate of the start point.
    @param y1 the y coordinate of the start point.
    @param x2 the x coordinate of the end point.
    @param y2 the y coordinate of the end point.*)

val render_lines : renderer -> f_point list -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_RenderLines}SDL_RenderLines}: Draw a series of connected lines on the current rendering target at
subpixel precision.


    @param renderer the renderer which should draw multiple lines.
    @param points the points along the lines.*)

val render_rect : renderer -> f_rect option -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_RenderRect}SDL_RenderRect}: Draw a rectangle on the current rendering target at subpixel precision.


    @param renderer the renderer which should draw a rectangle.
    @param rect the destination rectangle, or [None] to outline the
entire rendering target.*)

val render_rects : renderer -> f_rect list -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_RenderRects}SDL_RenderRects}: Draw some number of rectangles on the current rendering target at subpixel
precision.


    @param renderer the renderer which should draw multiple rectangles.
    @param rects a pointer to an array of destination rectangles.*)

val render_fill_rect : renderer -> f_rect option -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_RenderFillRect}SDL_RenderFillRect}: Fill a rectangle on the current rendering target with the drawing color at
subpixel precision.


    @param renderer the renderer which should fill a rectangle.
    @param rect the destination rectangle, or [None] for the entire
rendering target.*)

val render_fill_rects : renderer -> f_rect list -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_RenderFillRects}SDL_RenderFillRects}: Fill some number of rectangles on the current rendering target with the
drawing color at subpixel precision.


    @param renderer the renderer which should fill multiple rectangles.
    @param rects a pointer to an array of destination rectangles.*)

val render_texture : renderer -> texture -> f_rect option -> f_rect option -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_RenderTexture}SDL_RenderTexture}: Copy a portion of the texture to the current rendering target at subpixel
precision.


    @param renderer the renderer which should copy parts of a texture.
    @param texture the source texture.
    @param srcrect the source rectangle, or [None] for the entire
texture.
    @param dstrect the destination rectangle, or [None] for the
entire rendering target.*)

val render_texture_rotated : renderer -> texture -> f_rect option -> f_rect option -> float -> f_point option -> flip_mode_enum -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_RenderTextureRotated}SDL_RenderTextureRotated}: Copy a portion of the source texture to the current rendering target, with
rotation and flipping, at subpixel precision.


    @param renderer the renderer which should copy parts of a texture.
    @param texture the source texture.
    @param srcrect the source rectangle, or [None] for the entire
texture.
    @param dstrect the destination rectangle, or [None] for the
entire rendering target.
    @param angle an angle in degrees that indicates the rotation that will be
applied to dstrect, rotating it in a clockwise direction.
    @param center a point indicating the point around which
dstrect will be rotated (if [None], rotation will be done
around dstrect.w/2, dstrect.h/2).
    @param flip an SDL_FlipMode value stating which flipping actions should be
performed on the texture.*)

val render_texture_affine : renderer -> texture -> f_rect option -> f_point option -> f_point option -> f_point option -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_RenderTextureAffine}SDL_RenderTextureAffine}: Copy a portion of the source texture to the current rendering target, with
affine transform, at subpixel precision.


    @param renderer the renderer which should copy parts of a texture.
    @param texture the source texture.
    @param srcrect the source rectangle, or [None] for the entire
texture.
    @param origin a point indicating where the top-left corner of
srcrect should be mapped to, or [None] for the rendering
target's origin.
    @param right a point indicating where the top-right corner of
srcrect should be mapped to, or [None] for the rendering
target's top-right corner.
    @param down a point indicating where the bottom-left corner of
srcrect should be mapped to, or [None] for the rendering target's
bottom-left corner.*)

val render_texture_tiled : renderer -> texture -> f_rect option -> float -> f_rect option -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_RenderTextureTiled}SDL_RenderTextureTiled}: Tile a portion of the texture to the current rendering target at subpixel
precision.

The pixels in[srcrect]will be repeated as many times as needed to
completely fill[dstrect]


    @param renderer the renderer which should copy parts of a texture.
    @param texture the source texture.
    @param srcrect the source rectangle, or [None] for the entire
texture.
    @param scale the scale used to transform srcrect into the destination
rectangle, e.g. a 32x32 texture with a scale of 2 would fill
64x64 tiles.
    @param dstrect the destination rectangle, or [None] for the
entire rendering target.*)

val render_texture9_grid : renderer -> texture -> f_rect option -> float -> float -> float -> float -> float -> f_rect option -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_RenderTexture9Grid}SDL_RenderTexture9Grid}: Perform a scaled copy using the 9-grid algorithm to the current rendering
target at subpixel precision.

The pixels in the texture are split into a 3x3 grid, using the different
corner sizes for each corner, and the sides and center making up the
remaining pixels. The corners are then scaled using[scale]and fit into
the corners of the destination rectangle. The sides and center are then
stretched into place to cover the remaining destination rectangle.


    @param renderer the renderer which should copy parts of a texture.
    @param texture the source texture.
    @param srcrect the SDL_Rect structure representing the rectangle to be used
for the 9-grid, or [None] to use the entire texture.
    @param left_width the width, in pixels, of the left corners in[srcrect]
    @param right_width the width, in pixels, of the right corners in[srcrect]
    @param top_height the height, in pixels, of the top corners in[srcrect]
    @param bottom_height the height, in pixels, of the bottom corners in[srcrect]
    @param scale the scale used to transform the corner of[srcrect]into the
corner of[dstrect] or 0.0f for an unscaled copy.
    @param dstrect the destination rectangle, or [None] for the
entire rendering target.*)

val render_texture9_grid_tiled : renderer -> texture -> f_rect option -> float -> float -> float -> float -> float -> f_rect option -> float -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_RenderTexture9GridTiled}SDL_RenderTexture9GridTiled}: Perform a scaled copy using the 9-grid algorithm to the current rendering
target at subpixel precision.

The pixels in the texture are split into a 3x3 grid, using the different
corner sizes for each corner, and the sides and center making up the
remaining pixels. The corners are then scaled using[scale]and fit into
the corners of the destination rectangle. The sides and center are then
tiled into place to cover the remaining destination rectangle.


    @param renderer the renderer which should copy parts of a texture.
    @param texture the source texture.
    @param srcrect the SDL_Rect structure representing the rectangle to be used
for the 9-grid, or [None] to use the entire texture.
    @param left_width the width, in pixels, of the left corners in[srcrect]
    @param right_width the width, in pixels, of the right corners in[srcrect]
    @param top_height the height, in pixels, of the top corners in[srcrect]
    @param bottom_height the height, in pixels, of the bottom corners in[srcrect]
    @param scale the scale used to transform the corner of[srcrect]into the
corner of[dstrect] or 0.0f for an unscaled copy.
    @param dstrect the destination rectangle, or [None] for the
entire rendering target.
    @param tileScale the scale used to transform the borders and center of[srcrect]into the borders and middle of[dstrect] or
1.0f for an unscaled copy.*)

val render_geometry : renderer -> texture option -> vertex list -> int list -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_RenderGeometry}SDL_RenderGeometry}: Render a list of triangles, optionally using a texture and indices into the
vertex array Color and alpha modulation is done per vertex
(SDL_SetTextureColorMod and SDL_SetTextureAlphaMod are ignored).


    @param renderer the rendering context.
    @param texture (optional) The SDL texture to use.
    @param vertices vertices.
    @param indices (optional) An array of integer indices into the 'vertices'
array, if NULL all vertices will be rendered in sequential
order.*)

val render_geometry_raw : renderer -> texture option -> float Ctypes.ptr -> int -> f_color Ctypes.ptr -> int -> float Ctypes.ptr -> int -> int -> unit list -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_RenderGeometryRaw}SDL_RenderGeometryRaw}: Render a list of triangles, optionally using a texture and indices into the
vertex arrays Color and alpha modulation is done per vertex
(SDL_SetTextureColorMod and SDL_SetTextureAlphaMod are ignored).


    @param renderer the rendering context.
    @param texture (optional) The SDL texture to use.
    @param xy vertex positions.
    @param xy_stride byte size to move from one element to the next element.
    @param color vertex colors (as SDL_FColor).
    @param color_stride byte size to move from one element to the next element.
    @param uv vertex normalized texture coordinates.
    @param uv_stride byte size to move from one element to the next element.
    @param num_vertices number of vertices.
    @param indices (optional) An array of indices into the 'vertices' arrays,
if NULL all vertices will be rendered in sequential order.
    @param size_indices index size: 1 (byte), 2 (short), 4 (int).*)

val render_debug_text : renderer -> float -> float -> string -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_RenderDebugText}SDL_RenderDebugText}: Draw debug text to an SDL_Renderer.

This function will render a string of text to an SDL_Renderer. Note that
this is a convenience function for debugging, with severe limitations, and
not intended to be used for production apps and games.

Among these limitations:

- It accepts UTF-8 strings, but will only renders ASCII characters.
- It has a single, tiny size (8x8 pixels). You can use logical presentation
  or SDL_SetRenderScale() to adjust it.
- It uses a simple, hardcoded bitmap font. It does not allow different font
  selections and it does not support truetype, for proper scaling.
- It does no word-wrapping and does not treat newline characters as a line
  break. If the text goes out of the window, it's gone.

For serious text rendering, there are several good options, such as
SDL_ttf, stb_truetype, or other external libraries.

On first use, this will create an internal texture for rendering glyphs.
This texture will live until the renderer is destroyed.

The text is drawn in the color specified by SDL_SetRenderDrawColor().


    @param renderer the renderer which should draw a line of text.
    @param x the x coordinate where the top-left corner of the text will draw.
    @param y the y coordinate where the top-left corner of the text will draw.
    @param str the string to render.*)

val set_default_texture_scale_mode : renderer -> scale_mode_enum -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetDefaultTextureScaleMode}SDL_SetDefaultTextureScaleMode}: Set default scale mode for new textures for given renderer.

When a renderer is created, scale_mode defaults to SDL_SCALEMODE_LINEAR.


    @param renderer the renderer to update.
    @param scale_mode the scale mode to change to for new textures.*)

val get_default_texture_scale_mode : renderer -> scale_mode_enum Ctypes.ptr -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetDefaultTextureScaleMode}SDL_GetDefaultTextureScaleMode}: Get default texture scale mode of the given renderer.


    @param renderer the renderer to get data from.
    @param scale_mode a SDL_ScaleMode filled with current default scale mode.
See SDL_SetDefaultTextureScaleMode() for the meaning of
the value.*)

end
include module type of Global

module Window : sig

val get_render : renderer -> window result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetRenderWindow}SDL_GetRenderWindow}: Get the window associated with a renderer.


    @param renderer the renderer to query.

    @return the window on success or [Error] on failure; call SDL_GetError() for
more information.*)

end

module Texture : sig

val create : renderer -> pixel_format_enum -> texture_access_enum -> int -> int -> texture result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateTexture}SDL_CreateTexture}: Create a texture for a rendering context.

The contents of a texture when first created are not defined.


    @param renderer the rendering context.
    @param format one of the enumerated values in SDL_PixelFormat.
    @param access one of the enumerated values in SDL_TextureAccess.
    @param w the width of the texture in pixels.
    @param h the height of the texture in pixels.

    @return the created texture or [Error] on failure; call SDL_GetError() for
more information.*)

val create_from_surface : renderer -> surface -> texture result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateTextureFromSurface}SDL_CreateTextureFromSurface}: Create a texture from an existing surface.

The surface is not modified or freed by this function.

The SDL_TextureAccess hint for the created texture is[SDL_TEXTUREACCESS_STATIC]

The pixel format of the created texture may be different from the pixel
format of the surface, and can be queried using the
SDL_PROP_TEXTURE_FORMAT_NUMBER property.


    @param renderer the rendering context.
    @param surface the SDL_Surface structure containing pixel data used to fill
the texture.

    @return the created texture or [Error] on failure; call SDL_GetError() for
more information.*)

val create_with_properties : renderer -> int -> texture result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateTextureWithProperties}SDL_CreateTextureWithProperties}: Create a texture for a rendering context with the specified properties.

These are the supported properties:

-[SDL_PROP_TEXTURE_CREATE_COLORSPACE_NUMBER] an SDL_Colorspace value
  describing the texture colorspace, defaults to SDL_COLORSPACE_SRGB_LINEAR
  for floating point textures, SDL_COLORSPACE_HDR10 for 10-bit textures,
  SDL_COLORSPACE_SRGB for other RGB textures and SDL_COLORSPACE_JPEG for
  YUV textures.
-[SDL_PROP_TEXTURE_CREATE_FORMAT_NUMBER] one of the enumerated values in
  SDL_PixelFormat, defaults to the best RGBA format for the renderer
-[SDL_PROP_TEXTURE_CREATE_ACCESS_NUMBER] one of the enumerated values in
  SDL_TextureAccess, defaults to SDL_TEXTUREACCESS_STATIC
-[SDL_PROP_TEXTURE_CREATE_WIDTH_NUMBER] the width of the texture in
  pixels, required
-[SDL_PROP_TEXTURE_CREATE_HEIGHT_NUMBER] the height of the texture in
  pixels, required
-[SDL_PROP_TEXTURE_CREATE_PALETTE_POINTER] an SDL_Palette to use with
  palettized texture formats. This can be set later with
  SDL_SetTexturePalette()
-[SDL_PROP_TEXTURE_CREATE_SDR_WHITE_POINT_FLOAT] for HDR10 and floating
  point textures, this defines the value of 100% diffuse white, with higher
  values being displayed in the High Dynamic Range headroom. This defaults
  to 100 for HDR10 textures and 1.0 for floating point textures.
-[SDL_PROP_TEXTURE_CREATE_HDR_HEADROOM_FLOAT] for HDR10 and floating
  point textures, this defines the maximum dynamic range used by the
  content, in terms of the SDR white point. This would be equivalent to
  maxCLL / SDL_PROP_TEXTURE_CREATE_SDR_WHITE_POINT_FLOAT for HDR10 content.
  If this is defined, any values outside the range supported by the display
  will be scaled into the available HDR headroom, otherwise they are
  clipped.

With the direct3d11 renderer:

-[SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_POINTER] the ID3D11Texture2D
  associated with the texture, if you want to wrap an existing texture.
-[SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_U_POINTER] the ID3D11Texture2D
  associated with the U plane of a YUV texture, if you want to wrap an
  existing texture.
-[SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_V_POINTER] the ID3D11Texture2D
  associated with the V plane of a YUV texture, if you want to wrap an
  existing texture.

With the direct3d12 renderer:

-[SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_POINTER] the ID3D12Resource
  associated with the texture, if you want to wrap an existing texture.
-[SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_U_POINTER] the ID3D12Resource
  associated with the U plane of a YUV texture, if you want to wrap an
  existing texture.
-[SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_V_POINTER] the ID3D12Resource
  associated with the V plane of a YUV texture, if you want to wrap an
  existing texture.

With the metal renderer:

-[SDL_PROP_TEXTURE_CREATE_METAL_PIXELBUFFER_POINTER] the CVPixelBufferRef
  associated with the texture, if you want to create a texture from an
  existing pixel buffer.

With the opengl renderer:

-[SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_NUMBER] the GLuint texture
  associated with the texture, if you want to wrap an existing texture.
-[SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_UV_NUMBER] the GLuint texture
  associated with the UV plane of an NV12 texture, if you want to wrap an
  existing texture.
-[SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_U_NUMBER] the GLuint texture
  associated with the U plane of a YUV texture, if you want to wrap an
  existing texture.
-[SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_V_NUMBER] the GLuint texture
  associated with the V plane of a YUV texture, if you want to wrap an
  existing texture.

With the opengles2 renderer:

-[SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_NUMBER] the GLuint texture
  associated with the texture, if you want to wrap an existing texture.
-[SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_UV_NUMBER] the GLuint texture
  associated with the UV plane of an NV12 texture, if you want to wrap an
  existing texture.
-[SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_U_NUMBER] the GLuint texture
  associated with the U plane of a YUV texture, if you want to wrap an
  existing texture.
-[SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_V_NUMBER] the GLuint texture
  associated with the V plane of a YUV texture, if you want to wrap an
  existing texture.

With the vulkan renderer:

-[SDL_PROP_TEXTURE_CREATE_VULKAN_TEXTURE_NUMBER] the VkImage associated
  with the texture, if you want to wrap an existing texture.
-[SDL_PROP_TEXTURE_CREATE_VULKAN_LAYOUT_NUMBER] the VkImageLayout for the
  VkImage, defaults to VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL.

With the GPU renderer:

-[SDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_POINTER] the SDL_GPUTexture
  associated with the texture, if you want to wrap an existing texture.
-[SDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_UV_NUMBER] the SDL_GPUTexture
  associated with the UV plane of an NV12 texture, if you want to wrap an
  existing texture.
-[SDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_U_NUMBER] the SDL_GPUTexture
  associated with the U plane of a YUV texture, if you want to wrap an
  existing texture.
-[SDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_V_NUMBER] the SDL_GPUTexture
  associated with the V plane of a YUV texture, if you want to wrap an
  existing texture.


    @param renderer the rendering context.
    @param props the properties to use.

    @return the created texture or [Error] on failure; call SDL_GetError() for
more information.*)

val get_properties : texture -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetTextureProperties}SDL_GetTextureProperties}: Get the properties associated with a texture.

The following read-only properties are provided by SDL:

-[SDL_PROP_TEXTURE_COLORSPACE_NUMBER] an SDL_Colorspace value describing
  the texture colorspace.
-[SDL_PROP_TEXTURE_FORMAT_NUMBER] one of the enumerated values in
  SDL_PixelFormat.
-[SDL_PROP_TEXTURE_ACCESS_NUMBER] one of the enumerated values in
  SDL_TextureAccess.
-[SDL_PROP_TEXTURE_WIDTH_NUMBER] the width of the texture in pixels.
-[SDL_PROP_TEXTURE_HEIGHT_NUMBER] the height of the texture in pixels.
-[SDL_PROP_TEXTURE_SDR_WHITE_POINT_FLOAT] for HDR10 and floating point
  textures, this defines the value of 100% diffuse white, with higher
  values being displayed in the High Dynamic Range headroom. This defaults
  to 100 for HDR10 textures and 1.0 for other textures.
-[SDL_PROP_TEXTURE_HDR_HEADROOM_FLOAT] for HDR10 and floating point
  textures, this defines the maximum dynamic range used by the content, in
  terms of the SDR white point. If this is defined, any values outside the
  range supported by the display will be scaled into the available HDR
  headroom, otherwise they are clipped. This defaults to 1.0 for SDR
  textures, 4.0 for HDR10 textures, and no default for floating point
  textures.

With the direct3d11 renderer:

-[SDL_PROP_TEXTURE_D3D11_TEXTURE_POINTER] the ID3D11Texture2D associated
  with the texture
-[SDL_PROP_TEXTURE_D3D11_TEXTURE_U_POINTER] the ID3D11Texture2D
  associated with the U plane of a YUV texture
-[SDL_PROP_TEXTURE_D3D11_TEXTURE_V_POINTER] the ID3D11Texture2D
  associated with the V plane of a YUV texture

With the direct3d12 renderer:

-[SDL_PROP_TEXTURE_D3D12_TEXTURE_POINTER] the ID3D12Resource associated
  with the texture
-[SDL_PROP_TEXTURE_D3D12_TEXTURE_U_POINTER] the ID3D12Resource associated
  with the U plane of a YUV texture
-[SDL_PROP_TEXTURE_D3D12_TEXTURE_V_POINTER] the ID3D12Resource associated
  with the V plane of a YUV texture

With the vulkan renderer:

-[SDL_PROP_TEXTURE_VULKAN_TEXTURE_NUMBER] the VkImage associated with the
  texture

With the opengl renderer:

-[SDL_PROP_TEXTURE_OPENGL_TEXTURE_NUMBER] the GLuint texture associated
  with the texture
-[SDL_PROP_TEXTURE_OPENGL_TEXTURE_UV_NUMBER] the GLuint texture
  associated with the UV plane of an NV12 texture
-[SDL_PROP_TEXTURE_OPENGL_TEXTURE_U_NUMBER] the GLuint texture associated
  with the U plane of a YUV texture
-[SDL_PROP_TEXTURE_OPENGL_TEXTURE_V_NUMBER] the GLuint texture associated
  with the V plane of a YUV texture
-[SDL_PROP_TEXTURE_OPENGL_TEXTURE_TARGET_NUMBER] the GLenum for the
  texture target [GL_TEXTURE_2D][GL_TEXTURE_RECTANGLE_ARB] etc)
-[SDL_PROP_TEXTURE_OPENGL_TEX_W_FLOAT] the texture coordinate width of
  the texture (0.0 - 1.0)
-[SDL_PROP_TEXTURE_OPENGL_TEX_H_FLOAT] the texture coordinate height of
  the texture (0.0 - 1.0)

With the opengles2 renderer:

-[SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_NUMBER] the GLuint texture
  associated with the texture
-[SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_UV_NUMBER] the GLuint texture
  associated with the UV plane of an NV12 texture
-[SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_U_NUMBER] the GLuint texture
  associated with the U plane of a YUV texture
-[SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_V_NUMBER] the GLuint texture
  associated with the V plane of a YUV texture
-[SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_TARGET_NUMBER] the GLenum for the
  texture target [GL_TEXTURE_2D][GL_TEXTURE_EXTERNAL_OES] etc)

With the gpu renderer:

-[SDL_PROP_TEXTURE_GPU_TEXTURE_POINTER] the SDL_GPUTexture associated
  with the texture
-[SDL_PROP_TEXTURE_GPU_TEXTURE_UV_POINTER] the SDL_GPUTexture associated
  with the UV plane of an NV12 texture
-[SDL_PROP_TEXTURE_GPU_TEXTURE_U_POINTER] the SDL_GPUTexture associated
  with the U plane of a YUV texture
-[SDL_PROP_TEXTURE_GPU_TEXTURE_V_POINTER] the SDL_GPUTexture associated
  with the V plane of a YUV texture


    @param texture the texture to query.

    @return a valid property ID on success or 0 on failure; call
SDL_GetError() for more information.*)

val get_size : texture -> (float * float) result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetTextureSize}SDL_GetTextureSize}: Get the size of a texture, as floating point values.


    @param texture the texture to query.

    @return 2 values:
(
  + w : a pointer filled in with the width of the texture in pixels. This
argument can be [Error] if you don't need this information.,
  + h : a pointer filled in with the height of the texture in pixels. This
argument can be [Error] if you don't need this information.
)*)

val set_palette : texture -> palette -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetTexturePalette}SDL_SetTexturePalette}: Set the palette used by a texture.

Setting the palette keeps an internal reference to the palette, which can
be safely destroyed afterwards.

A single palette can be shared with many textures.


    @param texture the texture to update.
    @param palette the SDL_Palette structure to use.*)

val get_palette : texture -> palette result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetTexturePalette}SDL_GetTexturePalette}: Get the palette used by a texture.


    @param texture the texture to query.

    @return the palette used by the texture, or [Error] if there is
no palette used.*)

val set_color_mod : texture -> int -> int -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetTextureColorMod}SDL_SetTextureColorMod}: Set an additional color value multiplied into render copy operations.

When this texture is rendered, during the copy operation each source color
channel is modulated by the appropriate color value according to the
following formula:
[srcC = srcC * (color / 255)]
Color modulation is not always supported by the renderer; it will return
false if color modulation is not supported.


    @param texture the texture to update.
    @param r the red color value multiplied into copy operations.
    @param g the green color value multiplied into copy operations.
    @param b the blue color value multiplied into copy operations.*)

val set_color_mod_float : texture -> float -> float -> float -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetTextureColorModFloat}SDL_SetTextureColorModFloat}: Set an additional color value multiplied into render copy operations.

When this texture is rendered, during the copy operation each source color
channel is modulated by the appropriate color value according to the
following formula:
[srcC = srcC * color]
Color modulation is not always supported by the renderer; it will return
false if color modulation is not supported.


    @param texture the texture to update.
    @param r the red color value multiplied into copy operations.
    @param g the green color value multiplied into copy operations.
    @param b the blue color value multiplied into copy operations.*)

val get_color_mod : texture -> (int * int * int) result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetTextureColorMod}SDL_GetTextureColorMod}: Get the additional color value multiplied into render copy operations.


    @param texture the texture to query.

    @return 3 values:
(
  + r : a pointer filled in with the current red color value.,
  + g : a pointer filled in with the current green color value.,
  + b : a pointer filled in with the current blue color value.
)*)

val get_color_mod_float : texture -> (float * float * float) result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetTextureColorModFloat}SDL_GetTextureColorModFloat}: Get the additional color value multiplied into render copy operations.


    @param texture the texture to query.

    @return 3 values:
(
  + r : a pointer filled in with the current red color value.,
  + g : a pointer filled in with the current green color value.,
  + b : a pointer filled in with the current blue color value.
)*)

val set_alpha_mod : texture -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetTextureAlphaMod}SDL_SetTextureAlphaMod}: Set an additional alpha value multiplied into render copy operations.

When this texture is rendered, during the copy operation the source alpha
value is modulated by this alpha value according to the following formula:
[srcA = srcA * (alpha / 255)]
Alpha modulation is not always supported by the renderer; it will return
false if alpha modulation is not supported.


    @param texture the texture to update.
    @param alpha the source alpha value multiplied into copy operations.*)

val set_alpha_mod_float : texture -> float -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetTextureAlphaModFloat}SDL_SetTextureAlphaModFloat}: Set an additional alpha value multiplied into render copy operations.

When this texture is rendered, during the copy operation the source alpha
value is modulated by this alpha value according to the following formula:
[srcA = srcA * alpha]
Alpha modulation is not always supported by the renderer; it will return
false if alpha modulation is not supported.


    @param texture the texture to update.
    @param alpha the source alpha value multiplied into copy operations.*)

val get_alpha_mod : texture -> int result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetTextureAlphaMod}SDL_GetTextureAlphaMod}: Get the additional alpha value multiplied into render copy operations.


    @param texture the texture to query.

    @return a pointer filled in with the current alpha value.*)

val get_alpha_mod_float : texture -> float result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetTextureAlphaModFloat}SDL_GetTextureAlphaModFloat}: Get the additional alpha value multiplied into render copy operations.


    @param texture the texture to query.

    @return a pointer filled in with the current alpha value.*)

val set_blend_mode : texture -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetTextureBlendMode}SDL_SetTextureBlendMode}: Set the blend mode for a texture, used by SDL_RenderTexture().

If the blend mode is not supported, the closest supported mode is chosen
and this function returns false.


    @param texture the texture to update.
    @param blendMode the SDL_BlendMode to use for texture blending.*)

val get_blend_mode : texture -> int result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetTextureBlendMode}SDL_GetTextureBlendMode}: Get the blend mode used for texture copy operations.


    @param texture the texture to query.

    @return a pointer filled in with the current SDL_BlendMode.*)

val set_scale_mode : texture -> scale_mode_enum -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetTextureScaleMode}SDL_SetTextureScaleMode}: Set the scale mode used for texture scale operations.

The default texture scale mode is SDL_SCALEMODE_LINEAR.

If the scale mode is not supported, the closest supported mode is chosen.


    @param texture the texture to update.
    @param scaleMode the SDL_ScaleMode to use for texture scaling.*)

val get_scale_mode : texture -> scale_mode_enum Ctypes.ptr -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetTextureScaleMode}SDL_GetTextureScaleMode}: Get the scale mode used for texture scale operations.


    @param texture the texture to query.
    @param scaleMode a pointer filled in with the current scale mode.*)

val update : texture -> rect option -> data -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_UpdateTexture}SDL_UpdateTexture}: Update the given texture rectangle with new pixel data.

The pixel data must be in the pixel format of the texture, which can be
queried using the SDL_PROP_TEXTURE_FORMAT_NUMBER property.

This is a fairly slow function, intended for use with static textures that
do not change often.

If the texture is intended to be updated often, it is preferred to create
the texture as streaming and use the locking functions referenced below.
While this function will work with streaming textures, for optimization
reasons you may not get the pixels back if you lock the texture afterward.


    @param texture the texture to update.
    @param rect an SDL_Rect structure representing the area to update, or [None]
to update the entire texture.
    @param pixels the raw pixel data in the format of the texture.
    @param pitch the number of bytes in a row of pixel data, including padding
between lines.*)

val update_yuv : texture -> rect option -> Unsigned.uchar Ctypes.ptr -> int -> Unsigned.uchar Ctypes.ptr -> int -> Unsigned.uchar Ctypes.ptr -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_UpdateYUVTexture}SDL_UpdateYUVTexture}: Update a rectangle within a planar YV12 or IYUV texture with new pixel
data.

You can use SDL_UpdateTexture() as long as your pixel data is a contiguous
block of Y and U/V planes in the proper order, but this function is
available if your pixel data is not contiguous.


    @param texture the texture to update.
    @param rect the rectangle of pixels to update, or [None] to
update the entire texture.
    @param Yplane the raw pixel data for the Y plane.
    @param Ypitch the number of bytes between rows of pixel data for the Y
plane.
    @param Uplane the raw pixel data for the U plane.
    @param Upitch the number of bytes between rows of pixel data for the U
plane.
    @param Vplane the raw pixel data for the V plane.
    @param Vpitch the number of bytes between rows of pixel data for the V
plane.*)

val update_nv : texture -> rect option -> Unsigned.uchar Ctypes.ptr -> int -> Unsigned.uchar Ctypes.ptr -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_UpdateNVTexture}SDL_UpdateNVTexture}: Update a rectangle within a planar NV12 or NV21 texture with new pixels.

You can use SDL_UpdateTexture() as long as your pixel data is a contiguous
block of NV12/21 planes in the proper order, but this function is available
if your pixel data is not contiguous.


    @param texture the texture to update.
    @param rect the rectangle of pixels to update, or [None] to
update the entire texture.
    @param Yplane the raw pixel data for the Y plane.
    @param Ypitch the number of bytes between rows of pixel data for the Y
plane.
    @param UVplane the raw pixel data for the UV plane.
    @param UVpitch the number of bytes between rows of pixel data for the UV
plane.*)

val lock : texture -> rect option -> data Ctypes.ptr -> int result
(** {{:https://wiki.libsdl.org/SDL3/SDL_LockTexture}SDL_LockTexture}: Lock a portion of the texture for **write-only** pixel access.

As an optimization, the pixels made available for editing don't necessarily
contain the old texture data. This is a write-only operation, and if you
need to keep a copy of the texture data you should do that at the
application level.

You must use SDL_UnlockTexture() to unlock the pixels and apply any
changes.


    @param texture the texture to lock for access, which was created with[SDL_TEXTUREACCESS_STREAMING]
    @param rect an SDL_Rect structure representing the area to lock for access;
[None] to lock the entire texture.
    @param pixels this is filled in with a pointer to the locked pixels,
appropriately offset by the locked area.

    @return this is filled in with the pitch of the locked pixels; the
pitch is the length of one row in bytes.*)

val lock_to_surface : texture -> rect option -> surface Ctypes.ptr -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_LockTextureToSurface}SDL_LockTextureToSurface}: Lock a portion of the texture for **write-only** pixel access, and expose
it as a SDL surface.

Besides providing an SDL_Surface instead of raw pixel data, this function
operates like SDL_LockTexture.

As an optimization, the pixels made available for editing don't necessarily
contain the old texture data. This is a write-only operation, and if you
need to keep a copy of the texture data you should do that at the
application level.

You must use SDL_UnlockTexture() to unlock the pixels and apply any
changes.

The returned surface is freed internally after calling SDL_UnlockTexture()
or SDL_DestroyTexture(). The caller should not free it.


    @param texture the texture to lock for access, which must be created with[SDL_TEXTUREACCESS_STREAMING]
    @param rect the rectangle to lock for access. If the rect is
[None], the entire texture will be locked.
    @param surface a pointer to an SDL surface of size **rect**. Don't assume
any specific pixel content.*)

val unlock : texture -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_UnlockTexture}SDL_UnlockTexture}: Unlock a texture, uploading the changes to video memory, if needed.

**Warning**: Please note that SDL_LockTexture() is intended to be
write-only; it will not guarantee the previous contents of the texture will
be provided. You must fully initialize any area of a texture that you lock
before unlocking it, as the pixels might otherwise be uninitialized memory.

Which is to say: locking and immediately unlocking a texture can result in
corrupted textures, depending on the renderer in use.


    @param texture a texture locked by SDL_LockTexture().
*)

val destroy : texture -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_DestroyTexture}SDL_DestroyTexture}: Destroy the specified texture.

Passing NULL or an otherwise invalid texture will set the SDL error message
to "Invalid texture".


    @param texture the texture to destroy.
*)

include module type of Texture

end

module GPURenderState : sig

val create : renderer -> gpu_render_state_create_info Ctypes.ptr -> gpu_render_state result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateGPURenderState}SDL_CreateGPURenderState}: Create custom GPU render state.


    @param renderer the renderer to use.
    @param createinfo a struct describing the GPU render state to create.

    @return a custom GPU render state or [Error] on failure; call SDL_GetError()
for more information.*)

val set_fragment_uniforms : gpu_render_state -> int -> data -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetGPURenderStateFragmentUniforms}SDL_SetGPURenderStateFragmentUniforms}: Set fragment shader uniform variables in a custom GPU render state.

The data is copied and will be pushed using
SDL_PushGPUFragmentUniformData() during draw call execution.


    @param state the state to modify.
    @param slot_index the fragment uniform slot to push data to.
    @param data client data to write.
    @param length the length of the data to write.*)

val destroy : gpu_render_state -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_DestroyGPURenderState}SDL_DestroyGPURenderState}: Destroy custom GPU render state.


    @param state the state to destroy.
*)

end

