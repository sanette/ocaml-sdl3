(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Helpers
open Sdl3_types

let ff = Load.foreign

module Surface = struct
let create = ff "SDL_CreateSurface"
  (int @-> int @-> pixel_format @-> returning (some_to_ok surface_opt))

let create_from = ff "SDL_CreateSurfaceFrom"
  (int @-> int @-> pixel_format @-> ptr void @-> int @-> returning (some_to_ok surface_opt))

let destroy = ff "SDL_DestroySurface"
  (surface @-> returning void)

let get_properties = ff "SDL_GetSurfaceProperties"
  (surface @-> returning properties_id)

let set_colorspace = ff "SDL_SetSurfaceColorspace"
  (surface @-> colorspace @-> returning true_to_ok)

let get_colorspace = ff "SDL_GetSurfaceColorspace"
  (surface @-> returning colorspace)

let create_palette = ff "SDL_CreateSurfacePalette"
  (surface @-> returning (some_to_ok palette_opt))

let set_palette = ff "SDL_SetSurfacePalette"
  (surface @-> palette @-> returning true_to_ok)

let get_palette = ff "SDL_GetSurfacePalette"
  (surface @-> returning (some_to_ok palette_opt))

let add_alternate_image = ff "SDL_AddSurfaceAlternateImage"
  (surface @-> surface @-> returning true_to_ok)

let has_alternate_images = ff "SDL_SurfaceHasAlternateImages"
  (surface @-> returning bool)

let get_images = ff "SDL_GetSurfaceImages"
  (surface @-> ptr int @-> returning (ptr surface))
(* Wrapper for returning surface list *)
let get_images surface =
  let count = allocate int 0 in
  let p = get_images surface count in
  if is_null p then []
  else let n =  (!@ count) in
    Fun.protect ~finally:(fun () -> Sdl3_stdinc_bindings.free (to_voidp p))
      (fun () ->
        CArray.from_ptr p n
        |> CArray.to_list)

let remove_alternate_images = ff "SDL_RemoveSurfaceAlternateImages"
  (surface @-> returning void)

let lock = ff "SDL_LockSurface"
  (surface @-> returning true_to_ok)

let unlock = ff "SDL_UnlockSurface"
  (surface @-> returning void)

let load_io = ff "SDL_LoadSurface_IO"
  (io_stream @-> bool @-> returning (some_to_ok surface_opt))

let load = ff "SDL_LoadSurface"
  (string @-> returning (some_to_ok surface_opt))

let load_bmp_io = ff "SDL_LoadBMP_IO"
  (io_stream @-> bool @-> returning (some_to_ok surface_opt))

let load_bmp = ff "SDL_LoadBMP"
  (string @-> returning (some_to_ok surface_opt))

let save_bmp_io = ff "SDL_SaveBMP_IO"
  (surface @-> io_stream @-> bool @-> returning true_to_ok)

let save_bmp = ff "SDL_SaveBMP"
  (surface @-> string @-> returning true_to_ok)

let load_png_io = ff "SDL_LoadPNG_IO"
  (io_stream @-> bool @-> returning (some_to_ok surface_opt))

let load_png = ff "SDL_LoadPNG"
  (string @-> returning (some_to_ok surface_opt))

let save_png_io = ff "SDL_SavePNG_IO"
  (surface @-> io_stream @-> bool @-> returning true_to_ok)

let save_png = ff "SDL_SavePNG"
  (surface @-> string @-> returning true_to_ok)

let set_rle = ff "SDL_SetSurfaceRLE"
  (surface @-> bool @-> returning true_to_ok)

let has_rle = ff "SDL_SurfaceHasRLE"
  (surface @-> returning bool)

let set_color_key = ff "SDL_SetSurfaceColorKey"
  (surface @-> bool @-> uint32 @-> returning true_to_ok)
let set_color_key surface enabled key =
  set_color_key surface enabled (Unsigned.UInt.of_int key)

let has_color_key = ff "SDL_SurfaceHasColorKey"
  (surface @-> returning bool)

let get_color_key = ff "SDL_GetSurfaceColorKey"
  (surface @-> ptr uint32 @-> returning true_to_ok)

let set_color_mod = ff "SDL_SetSurfaceColorMod"
  (surface @-> uint8 @-> uint8 @-> uint8 @-> returning true_to_ok)
let set_color_mod surface r g b =
  set_color_mod surface (Unsigned.UChar.of_int r) (Unsigned.UChar.of_int g) (Unsigned.UChar.of_int b)

let get_color_mod = ff "SDL_GetSurfaceColorMod"
  (surface @-> ptr uint8 @-> ptr uint8 @-> ptr uint8 @-> returning bool)
let get_color_mod surface =
  let r = allocate uchar (Unsigned.UChar.of_int 0) in
  let g = allocate uchar (Unsigned.UChar.of_int 0) in
  let b = allocate uchar (Unsigned.UChar.of_int 0) in
  if get_color_mod surface r g b then Ok (Unsigned.UChar.to_int (!@ r), Unsigned.UChar.to_int (!@ g), Unsigned.UChar.to_int (!@ b)) else error ()

let set_alpha_mod = ff "SDL_SetSurfaceAlphaMod"
  (surface @-> uint8 @-> returning true_to_ok)
let set_alpha_mod surface alpha =
  set_alpha_mod surface (Unsigned.UChar.of_int alpha)

let get_alpha_mod = ff "SDL_GetSurfaceAlphaMod"
  (surface @-> ptr uint8 @-> returning bool)
let get_alpha_mod surface =
  let alpha = allocate uchar (Unsigned.UChar.of_int 0) in
  if get_alpha_mod surface alpha then Ok (Unsigned.UChar.to_int (!@ alpha)) else error ()

let set_blend_mode = ff "SDL_SetSurfaceBlendMode"
  (surface @-> blend_mode @-> returning true_to_ok)
let set_blend_mode surface blend_mode =
  set_blend_mode surface (Unsigned.UInt.of_int blend_mode)

let get_blend_mode = ff "SDL_GetSurfaceBlendMode"
  (surface @-> ptr blend_mode @-> returning true_to_ok)

let set_clip_rect = ff "SDL_SetSurfaceClipRect"
  (surface @-> rect_opt @-> returning true_to_ok)

let get_clip_rect = ff "SDL_GetSurfaceClipRect"
  (surface @-> rect @-> returning true_to_ok)

let flip = ff "SDL_FlipSurface"
  (surface @-> flip_mode @-> returning true_to_ok)

let rotate = ff "SDL_RotateSurface"
  (surface @-> float @-> returning (some_to_ok surface_opt))

let duplicate = ff "SDL_DuplicateSurface"
  (surface @-> returning (some_to_ok surface_opt))

let scale = ff "SDL_ScaleSurface"
  (surface @-> int @-> int @-> scale_mode @-> returning (some_to_ok surface_opt))

let convert = ff "SDL_ConvertSurface"
  (surface @-> pixel_format @-> returning (some_to_ok surface_opt))

let convert_and_colorspace = ff "SDL_ConvertSurfaceAndColorspace"
  (surface @-> pixel_format @-> palette_opt @-> colorspace @-> properties_id @-> returning (some_to_ok surface_opt))
let convert_and_colorspace surface format palette colorspace props =
  convert_and_colorspace surface format palette colorspace (Unsigned.UInt.of_int props)

let premultiply_alpha = ff "SDL_PremultiplySurfaceAlpha"
  (surface @-> bool @-> returning true_to_ok)

let clear = ff "SDL_ClearSurface"
  (surface @-> float @-> float @-> float @-> float @-> returning true_to_ok)

let fill_rect = ff "SDL_FillSurfaceRect"
  (surface @-> rect_opt @-> uint32 @-> returning true_to_ok)
let fill_rect dst rect color =
  fill_rect dst rect (Unsigned.UInt.of_int color)

let fill_rects = ff "SDL_FillSurfaceRects"
  (surface @-> rect @-> int @-> uint32 @-> returning true_to_ok)
let fill_rects dst rects color =
  let rects, count = carray_of_list rect_raw rects in
  fill_rects dst rects count (Unsigned.UInt.of_int color)

let blit = ff "SDL_BlitSurface"
  (surface @-> rect_opt @-> surface @-> rect_opt @-> returning true_to_ok)

let blit_unchecked = ff "SDL_BlitSurfaceUnchecked"
  (surface @-> rect_opt @-> surface @-> rect_opt @-> returning true_to_ok)

let blit_scaled = ff "SDL_BlitSurfaceScaled"
  (surface @-> rect_opt @-> surface @-> rect_opt @-> scale_mode @-> returning true_to_ok)

let blit_unchecked_scaled = ff "SDL_BlitSurfaceUncheckedScaled"
  (surface @-> rect_opt @-> surface @-> rect_opt @-> scale_mode @-> returning true_to_ok)

let stretch = ff "SDL_StretchSurface"
  (surface @-> rect_opt @-> surface @-> rect_opt @-> scale_mode @-> returning true_to_ok)

let blit_tiled = ff "SDL_BlitSurfaceTiled"
  (surface @-> rect_opt @-> surface @-> rect_opt @-> returning true_to_ok)

let blit_tiled_with_scale = ff "SDL_BlitSurfaceTiledWithScale"
  (surface @-> rect_opt @-> float @-> scale_mode @-> surface @-> rect_opt @-> returning true_to_ok)

let blit9_grid = ff "SDL_BlitSurface9Grid"
  (surface @-> rect_opt @-> int @-> int @-> int @-> int @-> float @-> scale_mode @-> surface @-> rect_opt @-> returning true_to_ok)

let map_rgb = ff "SDL_MapSurfaceRGB"
  (surface @-> uint8 @-> uint8 @-> uint8 @-> returning uint32)
let map_rgb surface r g b =
  map_rgb surface (Unsigned.UChar.of_int r) (Unsigned.UChar.of_int g) (Unsigned.UChar.of_int b)

let map_rgba = ff "SDL_MapSurfaceRGBA"
  (surface @-> uint8 @-> uint8 @-> uint8 @-> uint8 @-> returning uint32)
let map_rgba surface r g b a =
  map_rgba surface (Unsigned.UChar.of_int r) (Unsigned.UChar.of_int g) (Unsigned.UChar.of_int b) (Unsigned.UChar.of_int a)

let read_pixel = ff "SDL_ReadSurfacePixel"
  (surface @-> int @-> int @-> ptr uint8 @-> ptr uint8 @-> ptr uint8 @-> ptr uint8 @-> returning bool)
let read_pixel surface x y =
  let r = allocate uchar (Unsigned.UChar.of_int 0) in
  let g = allocate uchar (Unsigned.UChar.of_int 0) in
  let b = allocate uchar (Unsigned.UChar.of_int 0) in
  let a = allocate uchar (Unsigned.UChar.of_int 0) in
  if read_pixel surface x y r g b a then Ok (Unsigned.UChar.to_int (!@ r), Unsigned.UChar.to_int (!@ g), Unsigned.UChar.to_int (!@ b), Unsigned.UChar.to_int (!@ a)) else error ()

let read_pixel_float = ff "SDL_ReadSurfacePixelFloat"
  (surface @-> int @-> int @-> ptr float @-> ptr float @-> ptr float @-> ptr float @-> returning bool)
let read_pixel_float surface x y =
  let r = allocate float 0. in
  let g = allocate float 0. in
  let b = allocate float 0. in
  let a = allocate float 0. in
  if read_pixel_float surface x y r g b a then Ok (!@ r, !@ g, !@ b, !@ a) else error ()

let write_pixel = ff "SDL_WriteSurfacePixel"
  (surface @-> int @-> int @-> uint8 @-> uint8 @-> uint8 @-> uint8 @-> returning true_to_ok)
let write_pixel surface x y r g b a =
  write_pixel surface x y (Unsigned.UChar.of_int r) (Unsigned.UChar.of_int g) (Unsigned.UChar.of_int b) (Unsigned.UChar.of_int a)

let write_pixel_float = ff "SDL_WriteSurfacePixelFloat"
  (surface @-> int @-> int @-> float @-> float @-> float @-> float @-> returning true_to_ok)

end

module Global = struct
let convert_pixels = ff "SDL_ConvertPixels"
  (int @-> int @-> pixel_format @-> ptr void @-> int @-> pixel_format @-> ptr void @-> int @-> returning true_to_ok)

let convert_pixels_and_colorspace = ff "SDL_ConvertPixelsAndColorspace"
  (int @-> int @-> pixel_format @-> colorspace @-> properties_id @-> ptr void @-> int @-> pixel_format @-> colorspace @-> properties_id @-> ptr void @-> int @-> returning true_to_ok)
let convert_pixels_and_colorspace width height src_format src_colorspace src_properties src src_pitch dst_format dst_colorspace dst_properties dst dst_pitch =
  convert_pixels_and_colorspace width height src_format src_colorspace (Unsigned.UInt.of_int src_properties) src src_pitch dst_format dst_colorspace (Unsigned.UInt.of_int dst_properties) dst dst_pitch

let premultiply_alpha = ff "SDL_PremultiplyAlpha"
  (int @-> int @-> pixel_format @-> ptr void @-> int @-> pixel_format @-> ptr void @-> int @-> bool @-> returning true_to_ok)

end
include Global

