(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Sdl3_types
open Helpers

let ff = Load.foreign

module PixelFormat = struct
let get_name = ff "SDL_GetPixelFormatName"
  (pixel_format @-> returning string)

let get_masks_for = ff "SDL_GetMasksForPixelFormat"
  (pixel_format @-> ptr int @-> ptr uint32 @-> ptr uint32 @-> ptr uint32 @-> ptr uint32 @-> returning true_to_ok)

let get_for_masks = ff "SDL_GetPixelFormatForMasks"
  (int @-> uint32 @-> uint32 @-> uint32 @-> uint32 @-> returning pixel_format)
let get_for_masks bpp rmask gmask bmask amask =
  get_for_masks bpp (Unsigned.UInt.of_int rmask) (Unsigned.UInt.of_int gmask) (Unsigned.UInt.of_int bmask) (Unsigned.UInt.of_int amask)

let get_details = ff "SDL_GetPixelFormatDetails"
  (pixel_format @-> returning (ptr pixel_format_details))

end

module Palette = struct
let create = ff "SDL_CreatePalette"
  (int @-> returning (some_to_ok palette_opt))

let set_colors = ff "SDL_SetPaletteColors"
  (palette @-> ptr color @-> int @-> int @-> returning true_to_ok)

let destroy = ff "SDL_DestroyPalette"
  (palette @-> returning void)

include Palette

end

module PixelFormatDetails = struct
let map_rgb = ff "SDL_MapRGB"
  (ptr pixel_format_details @-> palette_opt @-> uint8 @-> uint8 @-> uint8 @-> returning uint32)
let map_rgb format palette r g b =
  map_rgb format palette (Unsigned.UChar.of_int r) (Unsigned.UChar.of_int g) (Unsigned.UChar.of_int b)

let map_rgba = ff "SDL_MapRGBA"
  (ptr pixel_format_details @-> palette_opt @-> uint8 @-> uint8 @-> uint8 @-> uint8 @-> returning uint32)
let map_rgba format palette r g b a =
  map_rgba format palette (Unsigned.UChar.of_int r) (Unsigned.UChar.of_int g) (Unsigned.UChar.of_int b) (Unsigned.UChar.of_int a)

include PixelFormatDetails

end

module Global = struct
let get_rgb = ff "SDL_GetRGB"
  (uint32 @-> ptr pixel_format_details @-> palette_opt @-> ptr uint8 @-> ptr uint8 @-> ptr uint8 @-> returning void)
let get_rgb pixelvalue format palette =
  let r = allocate uchar (Unsigned.UChar.of_int 0) in
  let g = allocate uchar (Unsigned.UChar.of_int 0) in
  let b = allocate uchar (Unsigned.UChar.of_int 0) in
  get_rgb (Unsigned.UInt.of_int pixelvalue) format palette r g b;
  (Unsigned.UChar.to_int (!@ r), Unsigned.UChar.to_int (!@ g), Unsigned.UChar.to_int (!@ b))

let get_rgba = ff "SDL_GetRGBA"
  (uint32 @-> ptr pixel_format_details @-> palette_opt @-> ptr uint8 @-> ptr uint8 @-> ptr uint8 @-> ptr uint8 @-> returning void)
let get_rgba pixelvalue format palette =
  let r = allocate uchar (Unsigned.UChar.of_int 0) in
  let g = allocate uchar (Unsigned.UChar.of_int 0) in
  let b = allocate uchar (Unsigned.UChar.of_int 0) in
  let a = allocate uchar (Unsigned.UChar.of_int 0) in
  get_rgba (Unsigned.UInt.of_int pixelvalue) format palette r g b a;
  (Unsigned.UChar.to_int (!@ r), Unsigned.UChar.to_int (!@ g), Unsigned.UChar.to_int (!@ b), Unsigned.UChar.to_int (!@ a))

end
include Global

