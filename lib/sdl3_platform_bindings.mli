(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

module Platform : sig

val get : unit -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetPlatform}SDL_GetPlatform}: Get the name of the platform.

Here are the names returned for some (but not all) supported platforms:

- "Windows"
- "macOS"
- "Linux"
- "iOS"
- "Android"


    @return the name of the platform. If the correct platform name is not
available, returns a string beginning with the text "Unknown".*)

end

