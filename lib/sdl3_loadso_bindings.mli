(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Sdl3_types
module Global : sig

val load_object : string -> shared_object result
(** {{:https://wiki.libsdl.org/SDL3/SDL_LoadObject}SDL_LoadObject}: Dynamically load a shared object.


    @param sofile a system-dependent name of the object file.

    @return an opaque pointer to the object handle or [Error] on failure; call
SDL_GetError() for more information.*)

val load_function : shared_object -> string -> function_pointer
(** {{:https://wiki.libsdl.org/SDL3/SDL_LoadFunction}SDL_LoadFunction}: Look up the address of the named function in a shared object.

This function pointer is no longer valid after calling SDL_UnloadObject().

This function can only look up C function names. Other languages may have
name mangling and intrinsic language support that varies from compiler to
compiler.

Make sure you declare your function pointers with the same calling
convention as the actual library function. Your code will crash
mysteriously if you do not do this.

If the requested function doesn't exist, NULL is returned.


    @param handle a valid shared object handle returned by SDL_LoadObject().
    @param name the name of the function to look up.

    @return a pointer to the function or NULL on failure; call SDL_GetError()
for more information.*)

val unload_object : shared_object -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_UnloadObject}SDL_UnloadObject}: Unload a shared object from memory.

Note that any pointers from this object looked up through
SDL_LoadFunction() will no longer be valid.


    @param handle a valid shared object handle returned by SDL_LoadObject().
*)

end
include module type of Global

