(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Sdl3_types
open Helpers

let ff = Load.foreign

module Global = struct
let pump_events = ff "SDL_PumpEvents"
  (void @-> returning void)

let has_event = ff "SDL_HasEvent"
  (uint32 @-> returning bool)
let has_event typ =
  has_event (Unsigned.UInt.of_int typ)

let has_events = ff "SDL_HasEvents"
  (uint32 @-> uint32 @-> returning bool)
let has_events min_type max_type =
  has_events (Unsigned.UInt.of_int min_type) (Unsigned.UInt.of_int max_type)

let flush_event = ff "SDL_FlushEvent"
  (uint32 @-> returning void)
let flush_event typ =
  flush_event (Unsigned.UInt.of_int typ)

let flush_events = ff "SDL_FlushEvents"
  (uint32 @-> uint32 @-> returning void)
let flush_events min_type max_type =
  flush_events (Unsigned.UInt.of_int min_type) (Unsigned.UInt.of_int max_type)

let set_event_filter = ff "SDL_SetEventFilter"
  (event_filter @-> ptr void @-> returning void)

let get_event_filter = ff "SDL_GetEventFilter"
  (ptr event_filter @-> ptr (ptr void) @-> returning true_to_ok)

let add_event_watch = ff "SDL_AddEventWatch"
  (event_filter @-> ptr void @-> returning true_to_ok)

let remove_event_watch = ff "SDL_RemoveEventWatch"
  (event_filter @-> ptr void @-> returning void)

let filter_events = ff "SDL_FilterEvents"
  (event_filter @-> ptr void @-> returning void)

let set_event_enabled = ff "SDL_SetEventEnabled"
  (uint32 @-> bool @-> returning void)
let set_event_enabled typ enabled =
  set_event_enabled (Unsigned.UInt.of_int typ) enabled

let event_enabled = ff "SDL_EventEnabled"
  (uint32 @-> returning bool)
let event_enabled typ =
  event_enabled (Unsigned.UInt.of_int typ)

let register_events = ff "SDL_RegisterEvents"
  (int @-> returning uint32)

end
include Global

module Event = struct
let peeps = ff "SDL_PeepEvents"
  (event_opt @-> int @-> event_action @-> uint32 @-> uint32 @-> returning int)
let peeps events numevents action min_type max_type =
  peeps events numevents action (Unsigned.UInt.of_int min_type) (Unsigned.UInt.of_int max_type)

let poll = ff "SDL_PollEvent"
  (event_opt @-> returning bool)

let wait = ff "SDL_WaitEvent"
  (event_opt @-> returning true_to_ok)

let wait_timeout = ff "SDL_WaitEventTimeout"
  (event_opt @-> sint32 @-> returning true_to_ok)

let push = ff "SDL_PushEvent"
  (event @-> returning true_to_ok)

let get_description = ff "SDL_GetEventDescription"
  (event_opt @-> string @-> int @-> returning int)

include Event

end

module Window = struct
let get_from_event = ff "SDL_GetWindowFromEvent"
  (event @-> returning (some_to_ok window_opt))

end

