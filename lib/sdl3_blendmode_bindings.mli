(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Sdl3_types
module Global : sig

val compose_custom_blend_mode : blend_factor_enum -> blend_factor_enum -> blend_operation_enum -> blend_factor_enum -> blend_factor_enum -> blend_operation_enum -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_ComposeCustomBlendMode}SDL_ComposeCustomBlendMode}: Compose a custom blend mode for renderers.

The functions SDL_SetRenderDrawBlendMode and SDL_SetTextureBlendMode accept
the SDL_BlendMode returned by this function if the renderer supports it.

A blend mode controls how the pixels from a drawing operation (source) get
combined with the pixels from the render target (destination). First, the
components of the source and destination pixels get multiplied with their
blend factors. Then, the blend operation takes the two products and
calculates the result that will get stored in the render target.

Expressed in pseudocode, it would look like this:

{[
dstRGB = colorOperation(srcRGB * srcColorFactor, dstRGB * dstColorFactor);
dstA = alphaOperation(srcA * srcAlphaFactor, dstA * dstAlphaFactor);
]}

Where the functions[colorOperation(src, dst)]and[alphaOperation(src,
dst)]can return one of the following:

-[src + dst]-[src - dst]-[dst - src]-[min(src, dst)]-[max(src, dst)]
The red, green, and blue components are always multiplied with the first,
second, and third components of the SDL_BlendFactor, respectively. The
fourth component is not used.

The alpha component is always multiplied with the fourth component of the
SDL_BlendFactor. The other components are not used in the alpha
calculation.

Support for these blend modes varies for each renderer. To check if a
specific SDL_BlendMode is supported, create a renderer and pass it to
either SDL_SetRenderDrawBlendMode or SDL_SetTextureBlendMode. They will
return with an error if the blend mode is not supported.

This list describes the support of custom blend modes for each renderer.
All renderers support the four blend modes listed in the SDL_BlendMode
enumeration.

- **direct3d**: Supports all operations with all factors. However, some
  factors produce unexpected results with[SDL_BLENDOPERATION_MINIMUM]and
 [SDL_BLENDOPERATION_MAXIMUM]
- **direct3d11**: Same as Direct3D 9.
- **opengl**: Supports the[SDL_BLENDOPERATION_ADD]operation with all
  factors. OpenGL versions 1.1, 1.2, and 1.3 do not work correctly here.
- **opengles2**: Supports the[SDL_BLENDOPERATION_ADD]
 [SDL_BLENDOPERATION_SUBTRACT][SDL_BLENDOPERATION_REV_SUBTRACT]  operations with all factors.
- **psp**: No custom blend mode support.
- **software**: No custom blend mode support.

Some renderers do not provide an alpha component for the default render
target. The[SDL_BLENDFACTOR_DST_ALPHA]and[SDL_BLENDFACTOR_ONE_MINUS_DST_ALPHA]factors do not have an effect in this
case.


    @param srcColorFactor the SDL_BlendFactor applied to the red, green, and
blue components of the source pixels.
    @param dstColorFactor the SDL_BlendFactor applied to the red, green, and
blue components of the destination pixels.
    @param colorOperation the SDL_BlendOperation used to combine the red,
green, and blue components of the source and
destination pixels.
    @param srcAlphaFactor the SDL_BlendFactor applied to the alpha component of
the source pixels.
    @param dstAlphaFactor the SDL_BlendFactor applied to the alpha component of
the destination pixels.
    @param alphaOperation the SDL_BlendOperation used to combine the alpha
component of the source and destination pixels.

    @return an SDL_BlendMode that represents the chosen factors and
operations.*)

end
include module type of Global

