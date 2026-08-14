(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Helpers
open Sdl3_types

let ff = Load.foreign

module Event = struct
let pumps = ff "SDL_PumpEvents"
  (void @-> returning void)

let peeps = ff "SDL_PeepEvents"
  (event_opt @-> int @-> event_action @-> uint32 @-> uint32 @-> returning int)
let peeps events numevents action min_type max_type =
  peeps events numevents action (Unsigned.UInt.of_int min_type) (Unsigned.UInt.of_int max_type)

let has = ff "SDL_HasEvent"
  (uint32 @-> returning true_to_ok)
let has typ =
  has (Unsigned.UInt.of_int typ)

let hass = ff "SDL_HasEvents"
  (uint32 @-> uint32 @-> returning true_to_ok)
let hass min_type max_type =
  hass (Unsigned.UInt.of_int min_type) (Unsigned.UInt.of_int max_type)

let flush = ff "SDL_FlushEvent"
  (uint32 @-> returning void)
let flush typ =
  flush (Unsigned.UInt.of_int typ)

let flushs = ff "SDL_FlushEvents"
  (uint32 @-> uint32 @-> returning void)
let flushs min_type max_type =
  flushs (Unsigned.UInt.of_int min_type) (Unsigned.UInt.of_int max_type)

let poll = ff ~release_runtime_lock:true "SDL_PollEvent"
  (event_opt @-> returning bool)

let wait = ff ~release_runtime_lock:true "SDL_WaitEvent"
  (event_opt @-> returning true_to_ok)

let wait_timeout = ff ~release_runtime_lock:true "SDL_WaitEventTimeout"
  (event_opt @-> sint32 @-> returning true_to_ok)

let push = ff "SDL_PushEvent"
  (event @-> returning true_to_ok)

let set_filter = ff "SDL_SetEventFilter"
  (event_filter @-> ptr void @-> returning void)

let get_filter = ff "SDL_GetEventFilter"
  (ptr event_filter @-> ptr (ptr void) @-> returning true_to_ok)

let add_watch = ff "SDL_AddEventWatch"
  (event_filter @-> ptr void @-> returning true_to_ok)

let remove_watch = ff "SDL_RemoveEventWatch"
  (event_filter @-> ptr void @-> returning void)

let filters = ff "SDL_FilterEvents"
  (event_filter @-> ptr void @-> returning void)

let set_enabled = ff "SDL_SetEventEnabled"
  (uint32 @-> bool @-> returning void)
let set_enabled typ enabled =
  set_enabled (Unsigned.UInt.of_int typ) enabled

let enabled = ff "SDL_EventEnabled"
  (uint32 @-> returning bool)
let enabled typ =
  enabled (Unsigned.UInt.of_int typ)

let registers = ff "SDL_RegisterEvents"
  (int @-> returning int_as_uint)

let get_description = ff "SDL_GetEventDescription"
  (event_opt @-> string @-> int @-> returning int)

include Event

end

module Window = struct
let get_from_event = ff "SDL_GetWindowFromEvent"
  (event @-> returning (some_to_ok window_opt))

end

