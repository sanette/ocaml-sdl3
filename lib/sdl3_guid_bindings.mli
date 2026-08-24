(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Sdl3_types
module GUID : sig

val to_string : guid -> string -> int -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_GUIDToString}SDL_GUIDToString}: Get an ASCII string representation for a given SDL_GUID.


    @param guid the SDL_GUID you wish to convert to string.
    @param pszGUID buffer in which to write the ASCII string.
    @param cbGUID the size of pszGUID, should be at least 33 bytes.
*)

val string_to : string -> guid
(** {{:https://wiki.libsdl.org/SDL3/SDL_StringToGUID}SDL_StringToGUID}: Convert a GUID string into a SDL_GUID structure.

Performs no error checking. If this function is given a string containing
an invalid GUID, the function will silently succeed, but the GUID generated
will not be useful.


    @param pchGUID string containing an ASCII representation of a GUID.

    @return a SDL_GUID structure.*)

end

