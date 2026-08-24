(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

module Version : sig

val get : unit -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetVersion}SDL_GetVersion}: Get the version of SDL that is linked against your program.

If you are linking to SDL dynamically, then it is possible that the current
version will be different than the version you compiled against. This
function returns the current version, while SDL_VERSION is the version you
compiled with.

This function may be called safely at any time, even before SDL_Init().


    @return the version of the linked library.*)

end

module Global : sig

val get_revision : unit -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetRevision}SDL_GetRevision}: Get the code revision of the SDL library that is linked against your
program.

This value is the revision of the code you are linking against and may be
different from the code you are compiling with, which is found in the
constant SDL_REVISION if you explicitly include SDL_revision.h

The revision is an arbitrary string (a hash value) uniquely identifying the
exact revision of the SDL library in use, and is only useful in comparing
against other revisions. It is NOT an incrementing number.

If SDL wasn't built from a git repository with the appropriate tools, this
will return an empty string.

You shouldn't use this function for anything but logging it for debugging
purposes. The string is not intended to be reliable in any way.


    @return an arbitrary string, uniquely identifying the exact revision of
the SDL library in use.*)

end
include module type of Global

