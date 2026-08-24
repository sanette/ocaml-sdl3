(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Sdl3_types
module Metal : sig

val _create_view : window -> metal_view
(** {{:https://wiki.libsdl.org/SDL3/SDL_Metal_CreateView}SDL_Metal_CreateView}: Create a CAMetalLayer-backed NSView/UIView and attach it to the specified
window.

On macOS, this does *not* associate a MTLDevice with the CAMetalLayer on
its own. It is up to user code to do that.

The returned handle can be casted directly to a NSView or UIView. To access
the backing CAMetalLayer, call SDL_Metal_GetLayer().


    @param window the window.

    @return handle NSView or UIView.*)

val _destroy_view : metal_view -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_Metal_DestroyView}SDL_Metal_DestroyView}: Destroy an existing SDL_MetalView object.

This should be called before SDL_DestroyWindow, if SDL_Metal_CreateView was
called after SDL_CreateWindow.


    @param view the SDL_MetalView object.
*)

val _get_layer : metal_view -> data
(** {{:https://wiki.libsdl.org/SDL3/SDL_Metal_GetLayer}SDL_Metal_GetLayer}: Get a pointer to the backing CAMetalLayer for the given view.


    @param view the SDL_MetalView object.

    @return a pointer.*)

end

