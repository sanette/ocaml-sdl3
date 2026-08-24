(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Sdl3_types
module PixelFormat : sig

val get_name : pixel_format_enum -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetPixelFormatName}SDL_GetPixelFormatName}: Get the human readable name of a pixel format.


    @param format the pixel format to query.

    @return the human readable name of the specified pixel format or
"SDL_PIXELFORMAT_UNKNOWN" if the format isn't recognized.*)

val get_masks_for : pixel_format_enum -> (int * int * int * int * int) result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetMasksForPixelFormat}SDL_GetMasksForPixelFormat}: Convert one of the enumerated pixel formats to a bpp value and RGBA masks.


    @param format one of the SDL_PixelFormat values.

    @return 5 values:
(
  + bpp : a bits per pixel value; usually 15, 16, or 32.,
  + Rmask : a pointer filled in with the red mask for the format.,
  + Gmask : a pointer filled in with the green mask for the format.,
  + Bmask : a pointer filled in with the blue mask for the format.,
  + Amask : a pointer filled in with the alpha mask for the format.
)*)

val get_for_masks : int -> int -> int -> int -> int -> pixel_format_enum
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetPixelFormatForMasks}SDL_GetPixelFormatForMasks}: Convert a bpp value and RGBA masks to an enumerated pixel format.

This will return[SDL_PIXELFORMAT_UNKNOWN]if the conversion wasn't
possible.


    @param bpp a bits per pixel value; usually 15, 16, or 32.
    @param Rmask the red mask for the format.
    @param Gmask the green mask for the format.
    @param Bmask the blue mask for the format.
    @param Amask the alpha mask for the format.

    @return the SDL_PixelFormat value corresponding to the format masks, or
SDL_PIXELFORMAT_UNKNOWN if there isn't a match.*)

val get_details : pixel_format_enum -> pixel_format_details Ctypes.ptr
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetPixelFormatDetails}SDL_GetPixelFormatDetails}: Create an SDL_PixelFormatDetails structure corresponding to a pixel format.

Returned structure may come from a shared global cache (i.e. not newly
allocated), and hence should not be modified, especially the palette. Weird
errors such as[Blit combination not supported]may occur.


    @param format one of the SDL_PixelFormat values.

    @return a pointer to a SDL_PixelFormatDetails structure or NULL on
failure; call SDL_GetError() for more information.*)

end

module Palette : sig

val create : int -> palette result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreatePalette}SDL_CreatePalette}: Create a palette structure with the specified number of color entries.

The palette entries are initialized to white.


    @param ncolors represents the number of color entries in the color palette.

    @return a new SDL_Palette structure on success or [Error] on failure (e.g. if
there wasn't enough memory); call SDL_GetError() for more
information.*)

val set_colors : palette -> color Ctypes.ptr -> int -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetPaletteColors}SDL_SetPaletteColors}: Set a range of colors in a palette.


    @param palette the SDL_Palette structure to modify.
    @param colors an array of SDL_Color structures to copy into the palette.
    @param firstcolor the index of the first palette entry to modify.
    @param ncolors the number of entries to modify.*)

val destroy : palette -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_DestroyPalette}SDL_DestroyPalette}: Free a palette created with SDL_CreatePalette().


    @param palette the SDL_Palette structure to be freed.
*)

include module type of Palette

end

module Global : sig

val map_rgb : pixel_format_details Ctypes.ptr -> palette option -> int -> int -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_MapRGB}SDL_MapRGB}: Map an RGB triple to an opaque pixel value for a given pixel format.

This function maps the RGB color value to the specified pixel format and
returns the pixel value best approximating the given RGB color value for
the given pixel format.

If the format has a palette (8-bit) the index of the closest matching color
in the palette will be returned.

If the specified pixel format has an alpha component it will be returned as
all 1 bits (fully opaque).

If the pixel format bpp (color depth) is less than 32-bpp then the unused
upper bits of the return value can safely be ignored (e.g., with a 16-bpp
format the return value can be assigned to a Uint16, and similarly a Uint8
for an 8-bpp format).


    @param format a pointer to SDL_PixelFormatDetails describing the pixel
format.
    @param palette an optional palette for indexed formats, may be [None].
    @param r the red component of the pixel in the range 0-255.
    @param g the green component of the pixel in the range 0-255.
    @param b the blue component of the pixel in the range 0-255.

    @return a pixel value.*)

val map_rgba : pixel_format_details Ctypes.ptr -> palette option -> int -> int -> int -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_MapRGBA}SDL_MapRGBA}: Map an RGBA quadruple to a pixel value for a given pixel format.

This function maps the RGBA color value to the specified pixel format and
returns the pixel value best approximating the given RGBA color value for
the given pixel format.

If the specified pixel format has no alpha component the alpha value will
be ignored (as it will be in formats with a palette).

If the format has a palette (8-bit) the index of the closest matching color
in the palette will be returned.

If the pixel format bpp (color depth) is less than 32-bpp then the unused
upper bits of the return value can safely be ignored (e.g., with a 16-bpp
format the return value can be assigned to a Uint16, and similarly a Uint8
for an 8-bpp format).


    @param format a pointer to SDL_PixelFormatDetails describing the pixel
format.
    @param palette an optional palette for indexed formats, may be [None].
    @param r the red component of the pixel in the range 0-255.
    @param g the green component of the pixel in the range 0-255.
    @param b the blue component of the pixel in the range 0-255.
    @param a the alpha component of the pixel in the range 0-255.

    @return a pixel value.*)

val get_rgb : int -> pixel_format_details Ctypes.ptr -> palette option -> int * int * int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetRGB}SDL_GetRGB}: Get RGB values from a pixel in the specified format.

This function uses the entire 8-bit \[0..255\] range when converting color
components from pixel formats with less than 8-bits per RGB component
(e.g., a completely white pixel in 16-bit RGB565 format would return \[0xff,
0xff, 0xff\] not \[0xf8, 0xfc, 0xf8\]).


    @param pixelvalue a pixel value.
    @param format a pointer to SDL_PixelFormatDetails describing the pixel
format.
    @param palette an optional palette for indexed formats, may be [None].*)

val get_rgba : int -> pixel_format_details Ctypes.ptr -> palette option -> int * int * int * int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetRGBA}SDL_GetRGBA}: Get RGBA values from a pixel in the specified format.

This function uses the entire 8-bit \[0..255\] range when converting color
components from pixel formats with less than 8-bits per RGB component
(e.g., a completely white pixel in 16-bit RGB565 format would return \[0xff,
0xff, 0xff\] not \[0xf8, 0xfc, 0xf8\]).

If the surface has no alpha component, the alpha will be returned as 0xff
(100% opaque).


    @param pixelvalue a pixel value.
    @param format a pointer to SDL_PixelFormatDetails describing the pixel
format.
    @param palette an optional palette for indexed formats, may be [None].*)

end
include module type of Global

