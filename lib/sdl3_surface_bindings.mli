(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Sdl3_types
module Surface : sig

val create : int -> int -> pixel_format_enum -> surface result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateSurface}SDL_CreateSurface}: Allocate a new surface with a specific pixel format.

The pixels of the new surface are initialized to zero.


    @param width the width of the surface.
    @param height the height of the surface.
    @param format the SDL_PixelFormat for the new surface's pixel format.

    @return the new SDL_Surface structure that is created or [Error] on failure;
call SDL_GetError() for more information.*)

val create_from : int -> int -> pixel_format_enum -> data -> int -> surface result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateSurfaceFrom}SDL_CreateSurfaceFrom}: Allocate a new surface with a specific pixel format and existing pixel
data.

No copy is made of the pixel data. Pixel data is not managed automatically;
you must free the surface before you free the pixel data.

Pitch is the offset in bytes from one row of pixels to the next, e.g.[width*4]for[SDL_PIXELFORMAT_RGBA8888]

You may pass NULL for pixels and 0 for pitch to create a surface that you
will fill in with valid values later.


    @param width the width of the surface.
    @param height the height of the surface.
    @param format the SDL_PixelFormat for the new surface's pixel format.
    @param pixels a pointer to existing pixel data.
    @param pitch the number of bytes between each row, including padding.

    @return the new SDL_Surface structure that is created or [Error] on failure;
call SDL_GetError() for more information.*)

val destroy : surface -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_DestroySurface}SDL_DestroySurface}: Free a surface.

It is safe to pass NULL to this function.


    @param surface the SDL_Surface to free.
*)

val get_properties : surface -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetSurfaceProperties}SDL_GetSurfaceProperties}: Get the properties associated with a surface.

The following properties are understood by SDL:

-[SDL_PROP_SURFACE_SDR_WHITE_POINT_FLOAT] for HDR10 and floating point
  surfaces, this defines the value of 100% diffuse white, with higher
  values being displayed in the High Dynamic Range headroom. This defaults
  to 203 for HDR10 surfaces and 1.0 for floating point surfaces.
-[SDL_PROP_SURFACE_HDR_HEADROOM_FLOAT] for HDR10 and floating point
  surfaces, this defines the maximum dynamic range used by the content, in
  terms of the SDR white point. This defaults to 0.0, which disables tone
  mapping.
-[SDL_PROP_SURFACE_TONEMAP_OPERATOR_STRING] the tone mapping operator
  used when compressing from a surface with high dynamic range to another
  with lower dynamic range. Currently this supports "chrome", which uses
  the same tone mapping that Chrome uses for HDR content, the form "*=N",
  where N is a floating point scale factor applied in linear space, and
  "none", which disables tone mapping. This defaults to "chrome".
-[SDL_PROP_SURFACE_HOTSPOT_X_NUMBER] the hotspot pixel offset from the
  left edge of the image, if this surface is being used as a cursor.
-[SDL_PROP_SURFACE_HOTSPOT_Y_NUMBER] the hotspot pixel offset from the
  top edge of the image, if this surface is being used as a cursor.
-[SDL_PROP_SURFACE_ROTATION_FLOAT] the number of degrees a surface's data
  is meant to be rotated clockwise to make the image right-side up. Default
  0. This is used by the camera API, if a mobile device is oriented
  differently than what its camera provides (i.e. - the camera always
  provides portrait images but the phone is being held in landscape
  orientation). Since SDL 3.4.0.


    @param surface the SDL_Surface structure to query.

    @return a valid property ID on success or 0 on failure; call
SDL_GetError() for more information.*)

val set_colorspace : surface -> colorspace_enum -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetSurfaceColorspace}SDL_SetSurfaceColorspace}: Set the colorspace used by a surface.

Setting the colorspace doesn't change the pixels, only how they are
interpreted in color operations.


    @param surface the SDL_Surface structure to update.
    @param colorspace an SDL_Colorspace value describing the surface
colorspace.*)

val get_colorspace : surface -> colorspace_enum
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetSurfaceColorspace}SDL_GetSurfaceColorspace}: Get the colorspace used by a surface.

The colorspace defaults to SDL_COLORSPACE_SRGB_LINEAR for floating point
formats, SDL_COLORSPACE_HDR10 for 10-bit formats, SDL_COLORSPACE_SRGB for
other RGB surfaces and SDL_COLORSPACE_BT709_FULL for YUV textures.


    @param surface the SDL_Surface structure to query.

    @return the colorspace used by the surface, or SDL_COLORSPACE_UNKNOWN if
the surface is NULL.*)

val create_palette : surface -> palette result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateSurfacePalette}SDL_CreateSurfacePalette}: Create a palette and associate it with a surface.

This function creates a palette compatible with the provided surface. The
palette is then returned for you to modify, and the surface will
automatically use the new palette in future operations. You do not need to
destroy the returned palette, it will be freed when the reference count
reaches 0, usually when the surface is destroyed.

Bitmap surfaces (with format SDL_PIXELFORMAT_INDEX1LSB or
SDL_PIXELFORMAT_INDEX1MSB) will have the palette initialized with 0 as
white and 1 as black. Other surfaces will get a palette initialized with
white in every entry.

If this function is called for a surface that already has a palette, a new
palette will be created to replace it.


    @param surface the SDL_Surface structure to update.

    @return a new SDL_Palette structure on success or [Error] on failure (e.g. if
the surface didn't have an index format); call SDL_GetError() for
more information.*)

val set_palette : surface -> palette -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetSurfacePalette}SDL_SetSurfacePalette}: Set the palette used by a surface.

Setting the palette keeps an internal reference to the palette, which can
be safely destroyed afterwards.

A single palette can be shared with many surfaces.


    @param surface the SDL_Surface structure to update.
    @param palette the SDL_Palette structure to use.*)

val get_palette : surface -> palette result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetSurfacePalette}SDL_GetSurfacePalette}: Get the palette used by a surface.


    @param surface the SDL_Surface structure to query.

    @return the palette used by the surface, or [Error] if there is
no palette used.*)

val add_alternate_image : surface -> surface -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_AddSurfaceAlternateImage}SDL_AddSurfaceAlternateImage}: Add an alternate version of a surface.

This function adds an alternate version of this surface, usually used for
content with high DPI representations like cursors or icons. The size,
format, and content do not need to match the original surface, and these
alternate versions will not be updated when the original surface changes.

This function adds a reference to the alternate version, so you should call
SDL_DestroySurface() on the image after this call.


    @param surface the SDL_Surface structure to update.
    @param image a pointer to an alternate SDL_Surface to associate with this
surface.*)

val has_alternate_images : surface -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_SurfaceHasAlternateImages}SDL_SurfaceHasAlternateImages}: Return whether a surface has alternate versions available.


    @param surface the SDL_Surface structure to query.

    @return true if alternate versions are available or false otherwise.*)

val get_images : surface -> surface list
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetSurfaceImages}SDL_GetSurfaceImages}: Get an array including all versions of a surface.

This returns all versions of a surface, with the surface being queried as
the first element in the returned array.

Freeing the array of surfaces does not affect the surfaces in the array.
They are still referenced by the surface being queried and will be cleaned
up normally.


    @param surface the SDL_Surface structure to query.

    @return a list of SDL_Surface pointers or NULL on
failure; call SDL_GetError() for more information. This should be
freed with SDL_free() when it is no longer needed.*)

val remove_alternate_images : surface -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_RemoveSurfaceAlternateImages}SDL_RemoveSurfaceAlternateImages}: Remove all alternate versions of a surface.

This function removes a reference from all the alternative versions,
destroying them if this is the last reference to them.


    @param surface the SDL_Surface structure to update.
*)

val lock : surface -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_LockSurface}SDL_LockSurface}: Set up a surface for directly accessing the pixels.

Between calls to SDL_LockSurface() / SDL_UnlockSurface(), you can write to
and read from[surface->pixels] using the pixel format stored in[surface->format] Once you are done accessing the surface, you should use
SDL_UnlockSurface() to release it.

Not all surfaces require locking. If[SDL_MUSTLOCK(surface)]evaluates to
0, then you can read and write to the surface at any time, and the pixel
format of the surface will not change.


    @param surface the SDL_Surface structure to be locked.*)

val unlock : surface -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_UnlockSurface}SDL_UnlockSurface}: Release a surface after directly accessing the pixels.


    @param surface the SDL_Surface structure to be unlocked.
*)

val load_io : io_stream -> bool -> surface result
(** {{:https://wiki.libsdl.org/SDL3/SDL_LoadSurface_IO}SDL_LoadSurface_IO}: Load a BMP or PNG image from a seekable SDL data stream.

The new surface should be freed with SDL_DestroySurface(). Not doing so
will result in a memory leak.


    @param src the data stream for the surface.
    @param closeio if true, calls SDL_CloseIO() on[src]before returning, even
in the case of an error.

    @return a new SDL_Surface structure or [Error] on failure; call
SDL_GetError() for more information.*)

val load : string -> surface result
(** {{:https://wiki.libsdl.org/SDL3/SDL_LoadSurface}SDL_LoadSurface}: Load a BMP or PNG image from a file.

The new surface should be freed with SDL_DestroySurface(). Not doing so
will result in a memory leak.


    @param file the file to load.

    @return a new SDL_Surface structure or [Error] on failure; call
SDL_GetError() for more information.*)

val set_rle : surface -> bool -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetSurfaceRLE}SDL_SetSurfaceRLE}: Set the RLE acceleration hint for a surface.

If RLE is enabled, color key and alpha blending blits are much faster, but
the surface must be locked before directly accessing the pixels.


    @param surface the SDL_Surface structure to optimize.
    @param enabled true to enable RLE acceleration, false to disable it.*)

val has_rle : surface -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_SurfaceHasRLE}SDL_SurfaceHasRLE}: Returns whether the surface is RLE enabled.

It is safe to pass a NULL[surface]here; it will return false.


    @param surface the SDL_Surface structure to query.

    @return true if the surface is RLE enabled, false otherwise.*)

val set_color_key : surface -> bool -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetSurfaceColorKey}SDL_SetSurfaceColorKey}: Set the color key (transparent pixel) in a surface.

The color key defines a pixel value that will be treated as transparent in
a blit. For example, one can use this to specify that cyan pixels should be
considered transparent, and therefore not rendered.

It is a pixel of the format used by the surface, as generated by
SDL_MapRGB().


    @param surface the SDL_Surface structure to update.
    @param enabled true to enable color key, false to disable color key.
    @param key the transparent pixel.*)

val has_color_key : surface -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_SurfaceHasColorKey}SDL_SurfaceHasColorKey}: Returns whether the surface has a color key.

It is safe to pass a NULL[surface]here; it will return false.


    @param surface the SDL_Surface structure to query.

    @return true if the surface has a color key, false otherwise.*)

val get_color_key : surface -> int result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetSurfaceColorKey}SDL_GetSurfaceColorKey}: Get the color key (transparent pixel) for a surface.

The color key is a pixel of the format used by the surface, as generated by
SDL_MapRGB().

If the surface doesn't have color key enabled this function returns false.


    @param surface the SDL_Surface structure to query.

    @return a pointer filled in with the transparent pixel.*)

val set_color_mod : surface -> int -> int -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetSurfaceColorMod}SDL_SetSurfaceColorMod}: Set an additional color value multiplied into blit operations.

When this surface is blitted, during the blit operation each source color
channel is modulated by the appropriate color value according to the
following formula:
[srcC = srcC * (color / 255)]

    @param surface the SDL_Surface structure to update.
    @param r the red color value multiplied into blit operations.
    @param g the green color value multiplied into blit operations.
    @param b the blue color value multiplied into blit operations.*)

val get_color_mod : surface -> (int * int * int) result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetSurfaceColorMod}SDL_GetSurfaceColorMod}: Get the additional color value multiplied into blit operations.


    @param surface the SDL_Surface structure to query.

    @return 3 values:
(
  + r : a pointer filled in with the current red color value.,
  + g : a pointer filled in with the current green color value.,
  + b : a pointer filled in with the current blue color value.
)*)

val set_alpha_mod : surface -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetSurfaceAlphaMod}SDL_SetSurfaceAlphaMod}: Set an additional alpha value used in blit operations.

When this surface is blitted, during the blit operation the source alpha
value is modulated by this alpha value according to the following formula:
[srcA = srcA * (alpha / 255)]

    @param surface the SDL_Surface structure to update.
    @param alpha the alpha value multiplied into blit operations.*)

val get_alpha_mod : surface -> int result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetSurfaceAlphaMod}SDL_GetSurfaceAlphaMod}: Get the additional alpha value used in blit operations.


    @param surface the SDL_Surface structure to query.

    @return a pointer filled in with the current alpha value.*)

val set_blend_mode : surface -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetSurfaceBlendMode}SDL_SetSurfaceBlendMode}: Set the blend mode used for blit operations.

To copy a surface to another surface (or texture) without blending with the
existing data, the blendmode of the SOURCE surface should be set to[SDL_BLENDMODE_NONE]


    @param surface the SDL_Surface structure to update.
    @param blendMode the SDL_BlendMode to use for blit blending.*)

val get_blend_mode : surface -> int result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetSurfaceBlendMode}SDL_GetSurfaceBlendMode}: Get the blend mode used for blit operations.


    @param surface the SDL_Surface structure to query.

    @return a pointer filled in with the current SDL_BlendMode.*)

val set_clip_rect : surface -> rect option -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetSurfaceClipRect}SDL_SetSurfaceClipRect}: Set the clipping rectangle for a surface.

When[surface]is the destination of a blit, only the area within the clip
rectangle is drawn into.

Note that blits are automatically clipped to the edges of the source and
destination surfaces.


    @param surface the SDL_Surface structure to be clipped.
    @param rect the SDL_Rect structure representing the clipping rectangle, or
[None] to disable clipping.*)

val get_clip_rect : surface -> rect Ctypes.ptr -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetSurfaceClipRect}SDL_GetSurfaceClipRect}: Get the clipping rectangle for a surface.

When[surface]is the destination of a blit, only the area within the clip
rectangle is drawn into.


    @param surface the SDL_Surface structure representing the surface to be
clipped.
    @param rect an SDL_Rect structure filled in with the clipping rectangle for
the surface.*)

val flip : surface -> flip_mode_enum -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_FlipSurface}SDL_FlipSurface}: Flip a surface vertically or horizontally.


    @param surface the surface to flip.
    @param flip the direction to flip.*)

val rotate : surface -> float -> surface result
(** {{:https://wiki.libsdl.org/SDL3/SDL_RotateSurface}SDL_RotateSurface}: Return a copy of a surface rotated clockwise a number of degrees.

The angle of rotation can be negative for counter-clockwise rotation.

When the rotation isn't a multiple of 90 degrees, the resulting surface is
larger than the original, with the background filled in with the colorkey,
if available, or RGBA 255/255/255/0 if not.

If[surface]has the SDL_PROP_SURFACE_ROTATION_FLOAT property set on it,
the new copy will have the adjusted value set: if the rotation property is
90 and[angle]was 30, the new surface will have a property value of 60
(that is: to be upright vs gravity, this surface needs to rotate 60 more
degrees). However, note that further rotations on the new surface in this
example will produce unexpected results, since the image will have resized
and padded to accommodate the not-90 degree angle.


    @param surface the surface to rotate.
    @param angle the rotation angle, in degrees.

    @return a rotated copy of the surface or [Error] on failure; call
SDL_GetError() for more information.*)

val duplicate : surface -> surface result
(** {{:https://wiki.libsdl.org/SDL3/SDL_DuplicateSurface}SDL_DuplicateSurface}: Creates a new surface identical to the existing surface.

If the original surface has alternate images, the new surface will have a
reference to them as well.

The returned surface should be freed with SDL_DestroySurface().


    @param surface the surface to duplicate.

    @return a copy of the surface or [Error] on failure; call SDL_GetError() for
more information.*)

val scale : surface -> int -> int -> scale_mode_enum -> surface result
(** {{:https://wiki.libsdl.org/SDL3/SDL_ScaleSurface}SDL_ScaleSurface}: Creates a new surface identical to the existing surface, scaled to the
desired size.

The returned surface should be freed with SDL_DestroySurface().


    @param surface the surface to duplicate and scale.
    @param width the width of the new surface.
    @param height the height of the new surface.
    @param scaleMode the SDL_ScaleMode to be used.

    @return a copy of the surface or [Error] on failure; call SDL_GetError() for
more information.*)

val convert : surface -> pixel_format_enum -> surface result
(** {{:https://wiki.libsdl.org/SDL3/SDL_ConvertSurface}SDL_ConvertSurface}: Copy an existing surface to a new surface of the specified format.

This function is used to optimize images for faster *repeat* blitting. This
is accomplished by converting the original and storing the result as a new
surface. The new, optimized surface can then be used as the source for
future blits, making them faster.

If you are converting to an indexed surface and want to map colors to a
palette, you can use SDL_ConvertSurfaceAndColorspace() instead.

If the original surface has alternate images, the new surface will have a
reference to them as well.


    @param surface the existing SDL_Surface structure to convert.
    @param format the new pixel format.

    @return the new SDL_Surface structure that is created or [Error] on failure;
call SDL_GetError() for more information.*)

val convert_and_colorspace : surface -> pixel_format_enum -> palette option -> colorspace_enum -> int -> surface result
(** {{:https://wiki.libsdl.org/SDL3/SDL_ConvertSurfaceAndColorspace}SDL_ConvertSurfaceAndColorspace}: Copy an existing surface to a new surface of the specified format and
colorspace.

This function converts an existing surface to a new format and colorspace
and returns the new surface. This will perform any pixel format and
colorspace conversion needed.

If the original surface has alternate images, the new surface will have a
reference to them as well.


    @param surface the existing SDL_Surface structure to convert.
    @param format the new pixel format.
    @param palette an optional palette to use for indexed formats, may be [None].
    @param colorspace the new colorspace.
    @param props an SDL_PropertiesID with additional color properties, or 0.

    @return the new SDL_Surface structure that is created or [Error] on failure;
call SDL_GetError() for more information.*)

val premultiply_alpha : surface -> bool -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_PremultiplySurfaceAlpha}SDL_PremultiplySurfaceAlpha}: Premultiply the alpha in a surface.

This is safe to use with src == dst, but not for other overlapping areas.


    @param surface the surface to modify.
    @param linear true to convert from sRGB to linear space for the alpha
multiplication, false to do multiplication in sRGB space.*)

val clear : surface -> float -> float -> float -> float -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_ClearSurface}SDL_ClearSurface}: Clear a surface with a specific color, with floating point precision.

This function handles all surface formats, and ignores any clip rectangle.

If the surface is YUV, the color is assumed to be in the sRGB colorspace,
otherwise the color is assumed to be in the colorspace of the surface.


    @param surface the SDL_Surface to clear.
    @param r the red component of the pixel, normally in the range 0-1.
    @param g the green component of the pixel, normally in the range 0-1.
    @param b the blue component of the pixel, normally in the range 0-1.
    @param a the alpha component of the pixel, normally in the range 0-1.*)

val fill_rect : surface -> rect option -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_FillSurfaceRect}SDL_FillSurfaceRect}: Perform a fast fill of a rectangle with a specific color.
[color]should be a pixel of the format used by the surface, and can be
generated by SDL_MapRGB() or SDL_MapRGBA(). If the color value contains an
alpha component then the destination is simply filled with that alpha
information, no blending takes place.

If there is a clip rectangle set on the destination (set via
SDL_SetSurfaceClipRect()), then this function will fill based on the
intersection of the clip rectangle and[rect]


    @param dst the SDL_Surface structure that is the drawing target.
    @param rect the SDL_Rect structure representing the rectangle to fill, or
[None] to fill the entire surface.
    @param color the color to fill with.*)

val fill_rects : surface -> rect list -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_FillSurfaceRects}SDL_FillSurfaceRects}: Perform a fast fill of a set of rectangles with a specific color.
[color]should be a pixel of the format used by the surface, and can be
generated by SDL_MapRGB() or SDL_MapRGBA(). If the color value contains an
alpha component then the destination is simply filled with that alpha
information, no blending takes place.

If there is a clip rectangle set on the destination (set via
SDL_SetSurfaceClipRect()), then this function will fill based on the
intersection of the clip rectangle and[rect]


    @param dst the SDL_Surface structure that is the drawing target.
    @param rects an array of SDL_Rects representing the rectangles to fill.
    @param color the color to fill with.*)

val blit : surface -> rect option -> surface -> rect option -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_BlitSurface}SDL_BlitSurface}: Performs a fast blit from the source surface to the destination surface
with clipping.

If either[srcrect]or[dstrect]are NULL, the entire surface [src]or[dst] is copied while ensuring clipping to[dst->clip_rect]

The blit function should not be called on a locked surface.

The blit semantics for surfaces with and without blending and colorkey are
defined as follows:

]}
   RGBA->RGB:
     Source surface blend mode set to SDL_BLENDMODE_BLEND:
      alpha-blend (using the source alpha-channel and per-surface alpha)
      SDL_SRCCOLORKEY ignored.
    Source surface blend mode set to SDL_BLENDMODE_NONE:
      copy RGB.
      if SDL_SRCCOLORKEY set, only copy the pixels that do not match the
      RGB values of the source color key, ignoring alpha in the
      comparison.

  RGB->RGBA:
    Source surface blend mode set to SDL_BLENDMODE_BLEND:
      alpha-blend (using the source per-surface alpha)
    Source surface blend mode set to SDL_BLENDMODE_NONE:
      copy RGB, set destination alpha to source per-surface alpha value.
    both:
      if SDL_SRCCOLORKEY set, only copy the pixels that do not match the
      source color key.

  RGBA->RGBA:
    Source surface blend mode set to SDL_BLENDMODE_BLEND:
      alpha-blend (using the source alpha-channel and per-surface alpha)
      SDL_SRCCOLORKEY ignored.
    Source surface blend mode set to SDL_BLENDMODE_NONE:
      copy all of RGBA to the destination.
      if SDL_SRCCOLORKEY set, only copy the pixels that do not match the
      RGB values of the source color key, ignoring alpha in the
      comparison.

  RGB->RGB:
    Source surface blend mode set to SDL_BLENDMODE_BLEND:
      alpha-blend (using the source per-surface alpha)
    Source surface blend mode set to SDL_BLENDMODE_NONE:
      copy RGB.
    both:
      if SDL_SRCCOLORKEY set, only copy the pixels that do not match the
      source color key.
]}


    @param src the SDL_Surface structure to be copied from.
    @param srcrect the SDL_Rect structure representing the rectangle to be
copied, or [None] to copy the entire surface.
    @param dst the SDL_Surface structure that is the blit target.
    @param dstrect the SDL_Rect structure representing the x and y position in
the destination surface, or [None] for (0,0). The width and
height are ignored, and are copied from[srcrect] If you
want a specific width and height, you should use
SDL_BlitSurfaceScaled().*)

val blit_unchecked : surface -> rect option -> surface -> rect option -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_BlitSurfaceUnchecked}SDL_BlitSurfaceUnchecked}: Perform low-level surface blitting only.

This is a semi-private blit function and it performs low-level surface
blitting, assuming the input rectangles have already been clipped.


    @param src the SDL_Surface structure to be copied from.
    @param srcrect the SDL_Rect structure representing the rectangle to be
copied, may not be [None].
    @param dst the SDL_Surface structure that is the blit target.
    @param dstrect the SDL_Rect structure representing the target rectangle in
the destination surface, may not be [None].*)

val blit_scaled : surface -> rect option -> surface -> rect option -> scale_mode_enum -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_BlitSurfaceScaled}SDL_BlitSurfaceScaled}: Perform a scaled blit to a destination surface, which may be of a different
format.


    @param src the SDL_Surface structure to be copied from.
    @param srcrect the SDL_Rect structure representing the rectangle to be
copied, or [None] to copy the entire surface.
    @param dst the SDL_Surface structure that is the blit target.
    @param dstrect the SDL_Rect structure representing the target rectangle in
the destination surface, or [None] to fill the entire
destination surface.
    @param scaleMode the SDL_ScaleMode to be used.*)

val blit_unchecked_scaled : surface -> rect option -> surface -> rect option -> scale_mode_enum -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_BlitSurfaceUncheckedScaled}SDL_BlitSurfaceUncheckedScaled}: Perform low-level surface scaled blitting only.

This is a semi-private function and it performs low-level surface blitting,
assuming the input rectangles have already been clipped.


    @param src the SDL_Surface structure to be copied from.
    @param srcrect the SDL_Rect structure representing the rectangle to be
copied, may not be [None].
    @param dst the SDL_Surface structure that is the blit target.
    @param dstrect the SDL_Rect structure representing the target rectangle in
the destination surface, may not be [None].
    @param scaleMode the SDL_ScaleMode to be used.*)

val stretch : surface -> rect option -> surface -> rect option -> scale_mode_enum -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_StretchSurface}SDL_StretchSurface}: Perform a stretched pixel copy from one surface to another.


    @param src the SDL_Surface structure to be copied from.
    @param srcrect the SDL_Rect structure representing the rectangle to be
copied, or [None] to copy the entire surface.
    @param dst the SDL_Surface structure that is the blit target.
    @param dstrect the SDL_Rect structure representing the target rectangle in
the destination surface, or [None] to fill the entire
destination surface.
    @param scaleMode the SDL_ScaleMode to be used.*)

val blit_tiled : surface -> rect option -> surface -> rect option -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_BlitSurfaceTiled}SDL_BlitSurfaceTiled}: Perform a tiled blit to a destination surface, which may be of a different
format.

The pixels in[srcrect]will be repeated as many times as needed to
completely fill[dstrect]


    @param src the SDL_Surface structure to be copied from.
    @param srcrect the SDL_Rect structure representing the rectangle to be
copied, or [None] to copy the entire surface.
    @param dst the SDL_Surface structure that is the blit target.
    @param dstrect the SDL_Rect structure representing the target rectangle in
the destination surface, or [None] to fill the entire surface.*)

val blit_tiled_with_scale : surface -> rect option -> float -> scale_mode_enum -> surface -> rect option -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_BlitSurfaceTiledWithScale}SDL_BlitSurfaceTiledWithScale}: Perform a scaled and tiled blit to a destination surface, which may be of a
different format.

The pixels in[srcrect]will be scaled and repeated as many times as needed
to completely fill[dstrect]


    @param src the SDL_Surface structure to be copied from.
    @param srcrect the SDL_Rect structure representing the rectangle to be
copied, or [None] to copy the entire surface.
    @param scale the scale used to transform srcrect into the destination
rectangle, e.g. a 32x32 texture with a scale of 2 would fill
64x64 tiles.
    @param scaleMode scale algorithm to be used.
    @param dst the SDL_Surface structure that is the blit target.
    @param dstrect the SDL_Rect structure representing the target rectangle in
the destination surface, or [None] to fill the entire surface.*)

val blit9_grid : surface -> rect option -> int -> int -> int -> int -> float -> scale_mode_enum -> surface -> rect option -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_BlitSurface9Grid}SDL_BlitSurface9Grid}: Perform a scaled blit using the 9-grid algorithm to a destination surface,
which may be of a different format.

The pixels in the source surface are split into a 3x3 grid, using the
different corner sizes for each corner, and the sides and center making up
the remaining pixels. The corners are then scaled using[scale]and fit
into the corners of the destination rectangle. The sides and center are
then stretched into place to cover the remaining destination rectangle.


    @param src the SDL_Surface structure to be copied from.
    @param srcrect the SDL_Rect structure representing the rectangle to be used
for the 9-grid, or [None] to use the entire surface.
    @param left_width the width, in pixels, of the left corners in[srcrect]
    @param right_width the width, in pixels, of the right corners in[srcrect]
    @param top_height the height, in pixels, of the top corners in[srcrect]
    @param bottom_height the height, in pixels, of the bottom corners in[srcrect]
    @param scale the scale used to transform the corner of[srcrect]into the
corner of[dstrect] or 0.0f for an unscaled blit.
    @param scaleMode scale algorithm to be used.
    @param dst the SDL_Surface structure that is the blit target.
    @param dstrect the SDL_Rect structure representing the target rectangle in
the destination surface, or [None] to fill the entire surface.*)

val map_rgb : surface -> int -> int -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_MapSurfaceRGB}SDL_MapSurfaceRGB}: Map an RGB triple to an opaque pixel value for a surface.

This function maps the RGB color value to the specified pixel format and
returns the pixel value best approximating the given RGB color value for
the given pixel format.

If the surface has a palette, the index of the closest matching color in
the palette will be returned.

If the surface pixel format has an alpha component it will be returned as
all 1 bits (fully opaque).

If the pixel format bpp (color depth) is less than 32-bpp then the unused
upper bits of the return value can safely be ignored (e.g., with a 16-bpp
format the return value can be assigned to a Uint16, and similarly a Uint8
for an 8-bpp format).


    @param surface the surface to use for the pixel format and palette.
    @param r the red component of the pixel in the range 0-255.
    @param g the green component of the pixel in the range 0-255.
    @param b the blue component of the pixel in the range 0-255.

    @return a pixel value.*)

val map_rgba : surface -> int -> int -> int -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_MapSurfaceRGBA}SDL_MapSurfaceRGBA}: Map an RGBA quadruple to a pixel value for a surface.

This function maps the RGBA color value to the specified pixel format and
returns the pixel value best approximating the given RGBA color value for
the given pixel format.

If the surface pixel format has no alpha component the alpha value will be
ignored (as it will be in formats with a palette).

If the surface has a palette, the index of the closest matching color in
the palette will be returned.

If the pixel format bpp (color depth) is less than 32-bpp then the unused
upper bits of the return value can safely be ignored (e.g., with a 16-bpp
format the return value can be assigned to a Uint16, and similarly a Uint8
for an 8-bpp format).


    @param surface the surface to use for the pixel format and palette.
    @param r the red component of the pixel in the range 0-255.
    @param g the green component of the pixel in the range 0-255.
    @param b the blue component of the pixel in the range 0-255.
    @param a the alpha component of the pixel in the range 0-255.

    @return a pixel value.*)

val read_pixel : surface -> int -> int -> (int * int * int * int) result
(** {{:https://wiki.libsdl.org/SDL3/SDL_ReadSurfacePixel}SDL_ReadSurfacePixel}: Retrieves a single pixel from a surface.

This function prioritizes correctness over speed: it is suitable for unit
tests, but is not intended for use in a game engine.

Like SDL_GetRGBA, this uses the entire 0..255 range when converting color
components from pixel formats with less than 8 bits per RGB component.


    @param surface the surface to read.
    @param x the horizontal coordinate, 0 <= x < width.
    @param y the vertical coordinate, 0 <= y < height.

    @return 4 values:
(
  + r : a pointer filled in with the red channel, 0-255, or [Error] to ignore
this channel.,
  + g : a pointer filled in with the green channel, 0-255, or [Error] to
ignore this channel.,
  + b : a pointer filled in with the blue channel, 0-255, or [Error] to
ignore this channel.,
  + a : a pointer filled in with the alpha channel, 0-255, or [Error] to
ignore this channel.
)*)

val read_pixel_float : surface -> int -> int -> (float * float * float * float) result
(** {{:https://wiki.libsdl.org/SDL3/SDL_ReadSurfacePixelFloat}SDL_ReadSurfacePixelFloat}: Retrieves a single pixel from a surface.

This function prioritizes correctness over speed: it is suitable for unit
tests, but is not intended for use in a game engine.


    @param surface the surface to read.
    @param x the horizontal coordinate, 0 <= x < width.
    @param y the vertical coordinate, 0 <= y < height.

    @return 4 values:
(
  + r : a pointer filled in with the red channel, normally in the range
0-1, or [Error] to ignore this channel.,
  + g : a pointer filled in with the green channel, normally in the range
0-1, or [Error] to ignore this channel.,
  + b : a pointer filled in with the blue channel, normally in the range
0-1, or [Error] to ignore this channel.,
  + a : a pointer filled in with the alpha channel, normally in the range
0-1, or [Error] to ignore this channel.
)*)

val write_pixel : surface -> int -> int -> int -> int -> int -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_WriteSurfacePixel}SDL_WriteSurfacePixel}: Writes a single pixel to a surface.

This function prioritizes correctness over speed: it is suitable for unit
tests, but is not intended for use in a game engine.

Like SDL_MapRGBA, this uses the entire 0..255 range when converting color
components from pixel formats with less than 8 bits per RGB component.


    @param surface the surface to write.
    @param x the horizontal coordinate, 0 <= x < width.
    @param y the vertical coordinate, 0 <= y < height.
    @param r the red channel value, 0-255.
    @param g the green channel value, 0-255.
    @param b the blue channel value, 0-255.
    @param a the alpha channel value, 0-255.*)

val write_pixel_float : surface -> int -> int -> float -> float -> float -> float -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_WriteSurfacePixelFloat}SDL_WriteSurfacePixelFloat}: Writes a single pixel to a surface.

This function prioritizes correctness over speed: it is suitable for unit
tests, but is not intended for use in a game engine.


    @param surface the surface to write.
    @param x the horizontal coordinate, 0 <= x < width.
    @param y the vertical coordinate, 0 <= y < height.
    @param r the red channel value, normally in the range 0-1.
    @param g the green channel value, normally in the range 0-1.
    @param b the blue channel value, normally in the range 0-1.
    @param a the alpha channel value, normally in the range 0-1.*)

(* Additional manual code: *)

val get_pixels_ba : surface -> (int, Bigarray.int8_unsigned_elt, Bigarray.c_layout) Bigarray.Array1.t
(** Warning! the ba should be accessed only during the surface lifespan. *)

include module type of Surface

end

module Global : sig

val load_bmp_io : io_stream -> bool -> surface result
(** {{:https://wiki.libsdl.org/SDL3/SDL_LoadBMP_IO}SDL_LoadBMP_IO}: Load a BMP image from a seekable SDL data stream.

The new surface should be freed with SDL_DestroySurface(). Not doing so
will result in a memory leak.


    @param src the data stream for the surface.
    @param closeio if true, calls SDL_CloseIO() on[src]before returning, even
in the case of an error.

    @return a new SDL_Surface structure or [Error] on failure; call
SDL_GetError() for more information.*)

val load_bmp : string -> surface result
(** {{:https://wiki.libsdl.org/SDL3/SDL_LoadBMP}SDL_LoadBMP}: Load a BMP image from a file.

The new surface should be freed with SDL_DestroySurface(). Not doing so
will result in a memory leak.


    @param file the BMP file to load.

    @return a new SDL_Surface structure or [Error] on failure; call
SDL_GetError() for more information.*)

val save_bmp_io : surface -> io_stream -> bool -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SaveBMP_IO}SDL_SaveBMP_IO}: Save a surface to a seekable SDL data stream in BMP format.

Surfaces with a 24-bit, 32-bit and paletted 8-bit format get saved in the
BMP directly. Other RGB formats with 8-bit or higher get converted to a
24-bit surface or, if they have an alpha mask or a colorkey, to a 32-bit
surface before they are saved. YUV and paletted 1-bit and 4-bit formats are
not supported.


    @param surface the SDL_Surface structure containing the image to be saved.
    @param dst a data stream to save to.
    @param closeio if true, calls SDL_CloseIO() on[dst]before returning, even
in the case of an error.*)

val save_bmp : surface -> string -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SaveBMP}SDL_SaveBMP}: Save a surface to a file in BMP format.

Surfaces with a 24-bit, 32-bit and paletted 8-bit format get saved in the
BMP directly. Other RGB formats with 8-bit or higher get converted to a
24-bit surface or, if they have an alpha mask or a colorkey, to a 32-bit
surface before they are saved. YUV and paletted 1-bit and 4-bit formats are
not supported.


    @param surface the SDL_Surface structure containing the image to be saved.
    @param file a file to save to.*)

val load_png_io : io_stream -> bool -> surface result
(** {{:https://wiki.libsdl.org/SDL3/SDL_LoadPNG_IO}SDL_LoadPNG_IO}: Load a PNG image from a seekable SDL data stream.

This is intended as a convenience function for loading images from trusted
sources. If you want to load arbitrary images you should use libpng or
another image loading library designed with security in mind.

The new surface should be freed with SDL_DestroySurface(). Not doing so
will result in a memory leak.


    @param src the data stream for the surface.
    @param closeio if true, calls SDL_CloseIO() on[src]before returning, even
in the case of an error.

    @return a new SDL_Surface structure or [Error] on failure; call
SDL_GetError() for more information.*)

val load_png : string -> surface result
(** {{:https://wiki.libsdl.org/SDL3/SDL_LoadPNG}SDL_LoadPNG}: Load a PNG image from a file.

This is intended as a convenience function for loading images from trusted
sources. If you want to load arbitrary images you should use libpng or
another image loading library designed with security in mind.

The new surface should be freed with SDL_DestroySurface(). Not doing so
will result in a memory leak.


    @param file the PNG file to load.

    @return a new SDL_Surface structure or [Error] on failure; call
SDL_GetError() for more information.*)

val save_png_io : surface -> io_stream -> bool -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SavePNG_IO}SDL_SavePNG_IO}: Save a surface to a seekable SDL data stream in PNG format.


    @param surface the SDL_Surface structure containing the image to be saved.
    @param dst a data stream to save to.
    @param closeio if true, calls SDL_CloseIO() on[dst]before returning, even
in the case of an error.*)

val save_png : surface -> string -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SavePNG}SDL_SavePNG}: Save a surface to a file in PNG format.


    @param surface the SDL_Surface structure containing the image to be saved.
    @param file a file to save to.*)

val convert_pixels : int -> int -> pixel_format_enum -> data -> int -> pixel_format_enum -> data -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_ConvertPixels}SDL_ConvertPixels}: Copy a block of pixels of one format to another format.


    @param width the width of the block to copy, in pixels.
    @param height the height of the block to copy, in pixels.
    @param src_format an SDL_PixelFormat value of the[src]pixels format.
    @param src a pointer to the source pixels.
    @param src_pitch the pitch of the source pixels, in bytes.
    @param dst_format an SDL_PixelFormat value of the[dst]pixels format.
    @param dst a pointer to be filled in with new pixel data.
    @param dst_pitch the pitch of the destination pixels, in bytes.*)

val convert_pixels_and_colorspace : int -> int -> pixel_format_enum -> colorspace_enum -> int -> data -> int -> pixel_format_enum -> colorspace_enum -> int -> data -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_ConvertPixelsAndColorspace}SDL_ConvertPixelsAndColorspace}: Copy a block of pixels of one format and colorspace to another format and
colorspace.


    @param width the width of the block to copy, in pixels.
    @param height the height of the block to copy, in pixels.
    @param src_format an SDL_PixelFormat value of the[src]pixels format.
    @param src_colorspace an SDL_Colorspace value describing the colorspace of
the[src]pixels.
    @param src_properties an SDL_PropertiesID with additional source color
properties, or 0.
    @param src a pointer to the source pixels.
    @param src_pitch the pitch of the source pixels, in bytes.
    @param dst_format an SDL_PixelFormat value of the[dst]pixels format.
    @param dst_colorspace an SDL_Colorspace value describing the colorspace of
the[dst]pixels.
    @param dst_properties an SDL_PropertiesID with additional destination color
properties, or 0.
    @param dst a pointer to be filled in with new pixel data.
    @param dst_pitch the pitch of the destination pixels, in bytes.*)

val premultiply_alpha : int -> int -> pixel_format_enum -> data -> int -> pixel_format_enum -> data -> int -> bool -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_PremultiplyAlpha}SDL_PremultiplyAlpha}: Premultiply the alpha on a block of pixels.

This is safe to use with src == dst, but not for other overlapping areas.


    @param width the width of the block to convert, in pixels.
    @param height the height of the block to convert, in pixels.
    @param src_format an SDL_PixelFormat value of the[src]pixels format.
    @param src a pointer to the source pixels.
    @param src_pitch the pitch of the source pixels, in bytes.
    @param dst_format an SDL_PixelFormat value of the[dst]pixels format.
    @param dst a pointer to be filled in with premultiplied pixel data.
    @param dst_pitch the pitch of the destination pixels, in bytes.
    @param linear true to convert from sRGB to linear space for the alpha
multiplication, false to do multiplication in sRGB space.*)

end
include module type of Global

