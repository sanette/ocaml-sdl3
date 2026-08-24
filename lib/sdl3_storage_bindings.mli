(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Sdl3_types
module Storage : sig

val open_title : string -> int -> storage result
(** {{:https://wiki.libsdl.org/SDL3/SDL_OpenTitleStorage}SDL_OpenTitleStorage}: Opens up a read-only container for the application's filesystem.

By default, SDL_OpenTitleStorage uses the generic storage implementation.
When the path override is not provided, the generic implementation will use
the output of SDL_GetBasePath as the base path.


    @param override a path to override the backend's default title root.
    @param props a property list that may contain backend-specific information.

    @return a title storage container on success or [Error] on failure; call
SDL_GetError() for more information.*)

val open_user : string -> string -> int -> storage result
(** {{:https://wiki.libsdl.org/SDL3/SDL_OpenUserStorage}SDL_OpenUserStorage}: Opens up a container for a user's unique read/write filesystem.

While title storage can generally be kept open throughout runtime, user
storage should only be opened when the client is ready to read/write files.
This allows the backend to properly batch file operations and flush them
when the container has been closed; ensuring safe and optimal save I/O.


    @param org the name of your organization.
    @param app the name of your application.
    @param props a property list that may contain backend-specific information.

    @return a user storage container on success or [Error] on failure; call
SDL_GetError() for more information.*)

val open_file : string -> storage result
(** {{:https://wiki.libsdl.org/SDL3/SDL_OpenFileStorage}SDL_OpenFileStorage}: Opens up a container for local filesystem storage.

This is provided for development and tools. Portable applications should
use SDL_OpenTitleStorage() for access to game data and
SDL_OpenUserStorage() for access to user data.


    @param path the base path prepended to all storage paths, or NULL for no
base path.

    @return a filesystem storage container on success or [Error] on failure; call
SDL_GetError() for more information.*)

val open_ : storage_interface Ctypes.ptr -> data -> storage result
(** {{:https://wiki.libsdl.org/SDL3/SDL_OpenStorage}SDL_OpenStorage}: Opens up a container using a client-provided storage interface.

Applications do not need to use this function unless they are providing
their own SDL_Storage implementation. If you just need an SDL_Storage, you
should use the built-in implementations in SDL, like SDL_OpenTitleStorage()
or SDL_OpenUserStorage().

This function makes a copy of[iface]and the caller does not need to keep
it around after this call.


    @param iface the interface that implements this storage, initialized using
SDL_INIT_INTERFACE().
    @param userdata the pointer that will be passed to the interface functions.

    @return a storage container on success or [Error] on failure; call
SDL_GetError() for more information.*)

val close : storage -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CloseStorage}SDL_CloseStorage}: Closes and frees a storage container.


    @param storage a storage container to close.*)

val ready : storage -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_StorageReady}SDL_StorageReady}: Checks if the storage container is ready to use.

This function should be called in regular intervals until it returns true -
however, it is not recommended to spinwait on this call, as the backend may
depend on a synchronous message loop. You might instead poll this in your
game's main loop while processing events and drawing a loading screen.


    @param storage a storage container to query.*)

val get_file_size : storage -> string -> int64 result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetStorageFileSize}SDL_GetStorageFileSize}: Query the size of a file within a storage container.


    @param storage a storage container to query.
    @param path the relative path of the file to query.

    @return be filled with the file's length.*)

val read_file : storage -> string -> ('a, 'b, 'c) Bigarray.Array1.t -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_ReadStorageFile}SDL_ReadStorageFile}: Synchronously read a file from a storage container into a client-provided
buffer.

The value of[length]must match the length of the file exactly; call
SDL_GetStorageFileSize() to get this value. This behavior may be relaxed in
a future release.


    @param storage a storage container to read from.
    @param path the relative path of the file to read.

    @return 2 values:
(
  + destination : a client-provided buffer to read the file into.,
  + length : the length of the destination buffer.
)*)

val write_file : storage -> string -> ('a, 'b, 'c) Bigarray.Array1.t -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_WriteStorageFile}SDL_WriteStorageFile}: Synchronously write a file from client memory into a storage container.


    @param storage a storage container to write to.
    @param path the relative path of the file to write.

    @return 2 values:
(
  + source : a client-provided buffer to write from.,
  + length : the length of the source buffer.
)*)

val create_directory : storage -> string -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateStorageDirectory}SDL_CreateStorageDirectory}: Create a directory in a writable storage container.


    @param storage a storage container.
    @param path the path of the directory to create.*)

val enumerate_directory : storage -> string -> enumerate_directory_callback -> data -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_EnumerateStorageDirectory}SDL_EnumerateStorageDirectory}: Enumerate a directory in a storage container through a callback function.

This function provides every directory entry through an app-provided
callback, called once for each directory entry, until all results have been
provided or the callback returns either SDL_ENUM_SUCCESS or
SDL_ENUM_FAILURE.

This will return false if there was a system problem in general, or if a
callback returns SDL_ENUM_FAILURE. A successful return means a callback
returned SDL_ENUM_SUCCESS to halt enumeration, or all directory entries
were enumerated.

If[path]is NULL, this is treated as a request to enumerate the root of
the storage container's tree. An empty string also works for this.


    @param storage a storage container.
    @param path the path of the directory to enumerate, or NULL for the root.
    @param callback a function that is called for each entry in the directory.
    @param userdata a pointer that is passed to[callback]*)

val remove_path : storage -> string -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_RemoveStoragePath}SDL_RemoveStoragePath}: Remove a file or an empty directory in a writable storage container.


    @param storage a storage container.
    @param path the path to remove from the filesystem.*)

val rename_path : storage -> string -> string -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_RenameStoragePath}SDL_RenameStoragePath}: Rename a file or directory in a writable storage container.


    @param storage a storage container.
    @param oldpath the old path.
    @param newpath the new path.*)

val copy_file : storage -> string -> string -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CopyStorageFile}SDL_CopyStorageFile}: Copy a file in a writable storage container.


    @param storage a storage container.
    @param oldpath the old path.
    @param newpath the new path.*)

val get_path_info : storage -> string -> path_info option -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetStoragePathInfo}SDL_GetStoragePathInfo}: Get information about a filesystem path in a storage container.


    @param storage a storage container.
    @param path the path to query.
    @param info a pointer filled in with information about the path, or [None] to
check for the existence of a file.*)

val get_space_remaining : storage -> int64
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetStorageSpaceRemaining}SDL_GetStorageSpaceRemaining}: Queries the remaining space in a storage container.


    @param storage a storage container to query.

    @return the amount of remaining space, in bytes.*)

val glob_directory : storage -> string -> string -> int -> string list
(** {{:https://wiki.libsdl.org/SDL3/SDL_GlobStorageDirectory}SDL_GlobStorageDirectory}: Enumerate a directory tree, filtered by pattern, and return a list.

Files are filtered out if they don't match the string in[pattern] which
may contain wildcard characters[*](match everything) and[?](match one
character). If pattern is NULL, no filtering is done and all results are
returned. Subdirectories are permitted, and are specified with a path
separator of '/'. Wildcard characters[*]and[?]never match a path
separator.
[flags]may be set to SDL_GLOB_CASEINSENSITIVE to make the pattern matching
case-insensitive.

The returned array is always NULL-terminated, for your iterating
convenience, but if[count]is non-NULL, on return it will contain the
number of items in the array, not counting the NULL terminator.

If[path]is NULL, this is treated as a request to enumerate the root of
the storage container's tree. An empty string also works for this.


    @param storage a storage container.
    @param path the path of the directory to enumerate, or NULL for the root.
    @param pattern the pattern that files in the directory must match. Can be
NULL.
    @param flags `SDL_GLOB_*` bitflags that affect this search.

    @return an array of strings on success, may be empty on failure; call
SDL_GetError() for more information. The caller should pass the
returned pointer to SDL_free when done with it. This is a single
allocation that should be freed with SDL_free() when it is no
longer needed.*)

end

