(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Sdl3_types
module Global : sig

val get_base_path : unit -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetBasePath}SDL_GetBasePath}: Get the directory where the application was run from.

SDL caches the result of this call internally, but the first call to this
function is not necessarily fast, so plan accordingly.

**macOS and iOS Specific Functionality**: If the application is in a ".app"
bundle, this function returns the Resource directory (e.g.
MyApp.app/Contents/Resources/). This behaviour can be overridden by adding
a property to the Info.plist file. Adding a string key with the name
SDL_FILESYSTEM_BASE_DIR_TYPE with a supported value will change the
behaviour.

Supported values for the SDL_FILESYSTEM_BASE_DIR_TYPE property (Given an
application in /Applications/SDLApp/MyApp.app):

-[resource] bundle resource directory (the default). For example:
 [/Applications/SDLApp/MyApp.app/Contents/Resources]-[bundle] the Bundle directory. For example:
 [/Applications/SDLApp/MyApp.app/]-[parent] the containing directory of the bundle. For example:
 [/Applications/SDLApp/]
**Android Specific Functionality**: This function returns "./", which
allows filesystem operations to use internal storage and the asset system.

**Nintendo 3DS Specific Functionality**: This function returns "romfs"
directory of the application as it is uncommon to store resources outside
the executable. As such it is not a writable directory.

The returned path is guaranteed to end with a path separator ('\\' on
Windows, '/' on most other platforms).


    @return an absolute path in UTF-8 encoding to the application data
directory. NULL will be returned on error or when the platform
doesn't implement this functionality, call SDL_GetError() for more
information.*)

val get_pref_path : string -> string -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetPrefPath}SDL_GetPrefPath}: Get the user-and-app-specific path where files can be written.

Get the "pref dir". This is meant to be where users can write personal
files (preferences and save games, etc) that are specific to your
application. This directory is unique per user, per application.

This function will decide the appropriate location in the native
filesystem, create the directory if necessary, and return a string of the
absolute path to the directory in UTF-8 encoding.

On Windows, the string might look like:
[C:\\Users\\bob\\AppData\\Roaming\\My Company\\My Program Name\\ ]
On Linux, the string might look like:
[/home/bob/.local/share/My Program Name/]
On macOS, the string might look like:
[/Users/bob/Library/Application Support/My Program Name/]
You should assume the path returned by this function is the only safe place
to write files (and that SDL_GetBasePath(), while it might be writable, or
even the parent of the returned path, isn't where you should be writing
things).

Both the org and app strings may become part of a directory name, so please
follow these rules:

- Try to use the same org string (_including case-sensitivity_) for all
  your applications that use this function.
- Always use a unique app string for each one, and make sure it never
  changes for an app once you've decided on it.
- Unicode characters are legal, as long as they are UTF-8 encoded, but...
- ...only use letters, numbers, and spaces. Avoid punctuation like "Game
  Name 2: Bad Guy's Revenge!" ... "Game Name 2" is sufficient.

Due to historical mistakes,[org]is allowed to be NULL or "". In such
cases, SDL will omit the org subdirectory, including on platforms where it
shouldn't, and including on platforms where this would make your app fail
certification for an app store. New apps should definitely specify a real
string for[org]

The returned path is guaranteed to end with a path separator ('\\' on
Windows, '/' on most other platforms).


    @param org the name of your organization.
    @param app the name of your application.

    @return a UTF-8 string of the user directory in platform-dependent
notation. NULL if there's a problem (creating directory failed,
etc.). This should be freed with SDL_free() when it is no longer
needed.*)

val create_directory : string -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateDirectory}SDL_CreateDirectory}: Create a directory, and any missing parent directories.

This reports success if[path]already exists as a directory.

If parent directories are missing, it will also create them. Note that if
this fails, it will not remove any parent directories it already made.


    @param path the path of the directory to create.*)

val enumerate_directory : string -> enumerate_directory_callback -> data -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_EnumerateDirectory}SDL_EnumerateDirectory}: Enumerate a directory through a callback function.

This function provides every directory entry through an app-provided
callback, called once for each directory entry, until all results have been
provided or the callback returns either SDL_ENUM_SUCCESS or
SDL_ENUM_FAILURE.

This will return false if there was a system problem in general, or if a
callback returns SDL_ENUM_FAILURE. A successful return means a callback
returned SDL_ENUM_SUCCESS to halt enumeration, or all directory entries
were enumerated.


    @param path the path of the directory to enumerate.
    @param callback a function that is called for each entry in the directory.
    @param userdata a pointer that is passed to[callback]*)

val remove_path : string -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_RemovePath}SDL_RemovePath}: Remove a file or an empty directory.

Directories that are not empty will fail; this function will not recursely
delete directory trees.


    @param path the path to remove from the filesystem.*)

val rename_path : string -> string -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_RenamePath}SDL_RenamePath}: Rename a file or directory.

If the file at[newpath]already exists, it will be replaced.

Note that this will not copy files across filesystems/drives/volumes, as
that is a much more complicated (and possibly time-consuming) operation.

Which is to say, if this function fails, SDL_CopyFile() to a temporary file
in the same directory as[newpath] then SDL_RenamePath() from the
temporary file to[newpath]and SDL_RemovePath() on[oldpath]might work
for files. Renaming a non-empty directory across filesystems is
dramatically more complex, however.


    @param oldpath the old path.
    @param newpath the new path.*)

val copy_file : string -> string -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CopyFile}SDL_CopyFile}: Copy a file.

If the file at[newpath]already exists, it will be overwritten with the
contents of the file at[oldpath]

This function will block until the copy is complete, which might be a
significant time for large files on slow disks. On some platforms, the copy
can be handed off to the OS itself, but on others SDL might just open both
paths, and read from one and write to the other.

Note that this is not an atomic operation! If something tries to read from[newpath]while the copy is in progress, it will see an incomplete copy of
the data, and if the calling thread terminates (or the power goes out)
during the copy,[newpath]s previous contents will be gone, replaced with
an incomplete copy of the data. To avoid this risk, it is recommended that
the app copy to a temporary file in the same directory as[newpath] and if
the copy is successful, use SDL_RenamePath() to replace[newpath]with the
temporary file. This will ensure that reads of[newpath]will either see a
complete copy of the data, or it will see the pre-copy state of[newpath]

This function attempts to synchronize the newly-copied data to disk before
returning, if the platform allows it, so that the renaming trick will not
have a problem in a system crash or power failure, where the file could be
renamed but the contents never made it from the system file cache to the
physical disk.

If the copy fails for any reason, the state of[newpath]is undefined. It
might be half a copy, it might be the untouched data of what was already
there, or it might be a zero-byte file, etc.


    @param oldpath the old path.
    @param newpath the new path.*)

val get_path_info : string -> path_info option -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetPathInfo}SDL_GetPathInfo}: Get information about a filesystem path.

Symlinks, on filesystems that support them, are always followed, so you
will always get information on what the symlink eventually points to, and
not the symlink itself.


    @param path the path to query.
    @param info a pointer filled in with information about the path, or [None] to
check for the existence of a file.*)

val glob_directory : string -> string -> int -> string list
(** {{:https://wiki.libsdl.org/SDL3/SDL_GlobDirectory}SDL_GlobDirectory}: Enumerate a directory tree, filtered by pattern, and return a list.

Files are filtered out if they don't match the string in[pattern] which
may contain wildcard characters[*](match everything) and[?](match one
character). If pattern is NULL, no filtering is done and all results are
returned. Subdirectories are permitted, and are specified with a path
separator of[/] Wildcard characters[*]and[?]never match a path
separator.
[flags]may be set to SDL_GLOB_CASEINSENSITIVE to make the pattern matching
case-insensitive.

The returned array is always NULL-terminated, for your iterating
convenience, but if[count]is non-NULL, on return it will contain the
number of items in the array, not counting the NULL terminator.


    @param path the path of the directory to enumerate.
    @param pattern the pattern that files in the directory must match. Can be
NULL.
    @param flags `SDL_GLOB_*` bitflags that affect this search.

    @return an array of strings on success, may be empty on failure; call
SDL_GetError() for more information. This is a single allocation
that should be freed with SDL_free() when it is no longer needed.*)

val get_current_directory : unit -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetCurrentDirectory}SDL_GetCurrentDirectory}: Get what the system believes is the "current working directory."

For systems without a concept of a current working directory, this will
still attempt to provide something reasonable.

SDL does not provide a means to _change_ the current working directory; for
platforms without this concept, this would cause surprises with file access
outside of SDL.

The returned path is guaranteed to end with a path separator ('\\' on
Windows, '/' on most other platforms).


    @return a UTF-8 string of the current working directory in
platform-dependent notation. NULL if there's a problem. This
should be freed with SDL_free() when it is no longer needed.*)

end
include module type of Global

module Folder : sig

val get_user : folder_enum -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetUserFolder}SDL_GetUserFolder}: Finds the most suitable user folder for a specific purpose.

Many OSes provide certain standard folders for certain purposes, such as
storing pictures, music or videos for a certain user. This function gives
the path for many of those special locations.

This function is specifically for _user_ folders, which are meant for the
user to access and manage. For application-specific folders, meant to hold
data for the application to manage, see SDL_GetBasePath() and
SDL_GetPrefPath().

The returned path is guaranteed to end with a path separator ('\\' on
Windows, '/' on most other platforms).

If NULL is returned, the error may be obtained with SDL_GetError().


    @param folder the type of folder to find.

    @return either a null-terminated C string containing the full path to the
folder, or NULL if an error happened.*)

end

