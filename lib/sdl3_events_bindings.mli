(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Sdl3_types
module Event : sig

val pumps : unit -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_PumpEvents}SDL_PumpEvents}: Pump the event loop, gathering events from the input devices.

This function updates the event queue and internal input device state.

SDL_PumpEvents() gathers all the pending input information from devices and
places it in the event queue. Without calls to SDL_PumpEvents() no events
would ever be placed on the queue. Often the need for calls to
SDL_PumpEvents() is hidden from the user since SDL_PollEvent() and
SDL_WaitEvent() implicitly call SDL_PumpEvents(). However, if you are not
polling or waiting for events (e.g. you are filtering them), then you must
call SDL_PumpEvents() to force an event queue update.
*)

val peeps : event option -> int -> event_action_enum -> int -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_PeepEvents}SDL_PeepEvents}: Check the event queue for messages and optionally return them.
[action]may be any of the following:

-[SDL_ADDEVENT] up to[numevents]events will be added to the back of the
  event queue.
-[SDL_PEEKEVENT][numevents]events at the front of the event queue,
  within the specified minimum and maximum type, will be returned to the
  caller and will _not_ be removed from the queue. If you pass NULL for
 [events] then[numevents]is ignored and the total number of matching
  events will be returned.
-[SDL_GETEVENT] up to[numevents]events at the front of the event queue,
  within the specified minimum and maximum type, will be returned to the
  caller and will be removed from the queue.

You may have to call SDL_PumpEvents() before calling this function.
Otherwise, the events may not be ready to be filtered when you call
SDL_PeepEvents().


    @param events destination buffer for the retrieved events, may be [None] to
leave the events in the queue and return the number of events
that would have been stored.
    @param numevents if action is SDL_ADDEVENT, the number of events to add
back to the event queue; if action is SDL_PEEKEVENT or
SDL_GETEVENT, the maximum number of events to retrieve.
    @param action action to take; see \[Remarks\](#remarks) for details.
    @param minType minimum value of the event type to be considered;
SDL_EVENT_FIRST is a safe choice.
    @param maxType maximum value of the event type to be considered;
SDL_EVENT_LAST is a safe choice.

    @return the number of events actually stored or -1 on failure; call
SDL_GetError() for more information.*)

val has : int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_HasEvent}SDL_HasEvent}: Check for the existence of a certain event type in the event queue.

If you need to check for a range of event types, use SDL_HasEvents()
instead.


    @param type the type of event to be queried; see SDL_EventType for details.*)

val hass : int -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_HasEvents}SDL_HasEvents}: Check for the existence of certain event types in the event queue.

If you need to check for a single event type, use SDL_HasEvent() instead.


    @param minType the low end of event type to be queried, inclusive; see
SDL_EventType for details.
    @param maxType the high end of event type to be queried, inclusive; see
SDL_EventType for details.*)

val flush : int -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_FlushEvent}SDL_FlushEvent}: Clear events of a specific type from the event queue.

This will unconditionally remove any events from the queue that match[type] If you need to remove a range of event types, use SDL_FlushEvents()
instead.

It's also normal to just ignore events you don't care about in your event
loop without calling this function.

This function only affects currently queued events. If you want to make
sure that all pending OS events are flushed, you can call SDL_PumpEvents()
on the main thread immediately before the flush call.

If you have user events with custom data that needs to be freed, you should
use SDL_PeepEvents() to remove and clean up those events before calling
this function.


    @param type the type of event to be cleared; see SDL_EventType for details.
*)

val flushs : int -> int -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_FlushEvents}SDL_FlushEvents}: Clear events of a range of types from the event queue.

This will unconditionally remove any events from the queue that are in the
range of[minType]to[maxType] inclusive. If you need to remove a single
event type, use SDL_FlushEvent() instead.

It's also normal to just ignore events you don't care about in your event
loop without calling this function.

This function only affects currently queued events. If you want to make
sure that all pending OS events are flushed, you can call SDL_PumpEvents()
on the main thread immediately before the flush call.


    @param minType the low end of event type to be cleared, inclusive; see
SDL_EventType for details.
    @param maxType the high end of event type to be cleared, inclusive; see
SDL_EventType for details.
*)

val poll : event option -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_PollEvent}SDL_PollEvent}: Poll for currently pending events.

If[event]is not NULL, the next event is removed from the queue and stored
in the SDL_Event structure pointed to by[event]

If[event]is NULL, it simply returns true if there is an event in the
queue, but will not remove it from the queue.

As this function may implicitly call SDL_PumpEvents(), you can only call
this function in the thread that initialized the video subsystem.

SDL_PollEvent() is the favored way of receiving system events since it can
be done from the main loop and does not suspend the main loop while waiting
on an event to be posted.

The common practice is to fully process the event queue once every frame,
usually as a first step before updating the game's state:

{[
while (game_is_still_running) {
    SDL_Event event;
    while (SDL_PollEvent(&event)) {  // poll until all events are handled!
        // decide what to do with this event.
    }

    // update game state, draw the current frame
}
]}

Note that Windows (and possibly other platforms) has a quirk about how it
handles events while dragging/resizing a window, which can cause this
function to block for significant amounts of time. Technical explanations
and solutions are discussed on the wiki:

https://wiki.libsdl.org/SDL3/AppFreezeDuringDrag


    @param event the SDL_Event structure to be filled with the next event from
the queue, or [None].

    @return true if this got an event or false if there are none available.*)

val wait : event option -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_WaitEvent}SDL_WaitEvent}: Wait indefinitely for the next available event.

If[event]is not NULL, the next event is removed from the queue and stored
in the SDL_Event structure pointed to by[event]

As this function may implicitly call SDL_PumpEvents(), you can only call
this function in the thread that initialized the video subsystem.


    @param event the SDL_Event structure to be filled in with the next event
from the queue, or [None].*)

val wait_timeout : event option -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_WaitEventTimeout}SDL_WaitEventTimeout}: Wait until the specified timeout (in milliseconds) for the next available
event.

If[event]is not NULL, the next event is removed from the queue and stored
in the SDL_Event structure pointed to by[event]

As this function may implicitly call SDL_PumpEvents(), you can only call
this function in the thread that initialized the video subsystem.

The timeout is not guaranteed, the actual wait time could be longer due to
system scheduling.


    @param event the SDL_Event structure to be filled in with the next event
from the queue, or [None].
    @param timeoutMS the maximum number of milliseconds to wait for the next
available event.*)

val push : event -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_PushEvent}SDL_PushEvent}: Add an event to the event queue.

The event queue can actually be used as a two way communication channel.
Not only can events be read from the queue, but the user can also push
their own events onto it.[event]is a pointer to the event structure you
wish to push onto the queue. The event is copied into the queue, and the
caller may dispose of the memory pointed to after SDL_PushEvent() returns.

Note: Pushing device input events onto the queue doesn't modify the state
of the device within SDL.

Note: Events pushed onto the queue with SDL_PushEvent() get passed through
the event filter but events added with SDL_PeepEvents() do not.

For pushing application-specific events, please use SDL_RegisterEvents() to
get an event type that does not conflict with other code that also wants
its own custom event types.


    @param event the SDL_Event to be added to the queue.*)

val set_filter : event_filter -> data -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetEventFilter}SDL_SetEventFilter}: Set up a filter to process all events before they are added to the internal
event queue.

If you just want to see events without modifying them or preventing them
from being queued, you should use SDL_AddEventWatch() instead.

If the filter function returns true when called, then the event will be
added to the internal queue. If it returns false, then the event will be
dropped from the queue, but the internal state will still be updated. This
allows selective filtering of dynamically arriving events.

**WARNING**: Be very careful of what you do in the event filter function,
as it may run in a different thread! The exception is handling of
SDL_EVENT_WINDOW_EXPOSED, which is guaranteed to be sent from the OS on the
main thread and you are expected to redraw your window in response to this
event.

On platforms that support it, if the quit event is generated by an
interrupt signal (e.g. pressing Ctrl-C), it will be delivered to the
application at the next event poll.

Note: Disabled events never make it to the event filter function; see
SDL_SetEventEnabled().

Note: Events pushed onto the queue with SDL_PushEvent() get passed through
the event filter, but events pushed onto the queue with SDL_PeepEvents() do
not.


    @param filter a function to call when an event happens.
    @param userdata a pointer that is passed to[filter]
*)

val get_filter : event_filter Ctypes.ptr -> data Ctypes.ptr -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetEventFilter}SDL_GetEventFilter}: Query the current event filter.

This function can be used to "chain" filters, by saving the existing filter
before replacing it with a function that will call that saved filter.


    @param filter the current callback function will be stored here.
    @param userdata the pointer that is passed to the current event filter will
be stored here.*)

val add_watch : event_filter -> data -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_AddEventWatch}SDL_AddEventWatch}: Add a callback to be triggered when an event is added to the event queue.
[filter]will be called when an event happens, and its return value is
ignored.

**WARNING**: Be very careful of what you do in the event filter function,
as it may run in a different thread!

If the quit event is generated by a signal (e.g. SIGINT), it will bypass
the internal queue and be delivered to the watch callback immediately, and
arrive at the next event poll.

Note: the callback is called for events posted by the user through
SDL_PushEvent(), but not for disabled events, nor for events by a filter
callback set with SDL_SetEventFilter(), nor for events posted by the user
through SDL_PeepEvents().


    @param filter an SDL_EventFilter function to call when an event happens.
    @param userdata a pointer that is passed to[filter]*)

val remove_watch : event_filter -> data -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_RemoveEventWatch}SDL_RemoveEventWatch}: Remove an event watch callback added with SDL_AddEventWatch().

This function takes the same input as SDL_AddEventWatch() to identify and
delete the corresponding callback.


    @param filter the function originally passed to SDL_AddEventWatch().
    @param userdata the pointer originally passed to SDL_AddEventWatch().
*)

val filters : event_filter -> data -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_FilterEvents}SDL_FilterEvents}: Run a specific filter function on the current event queue, removing any
events for which the filter returns false.

See SDL_SetEventFilter() for more information. Unlike SDL_SetEventFilter(),
this function does not change the filter permanently, it only uses the
supplied filter until this function returns.


    @param filter the SDL_EventFilter function to call when an event happens.
    @param userdata a pointer that is passed to[filter]
*)

val set_enabled : int -> bool -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetEventEnabled}SDL_SetEventEnabled}: Set the state of processing events by type.


    @param type the type of event; see SDL_EventType for details.
    @param enabled whether to process the event or not.
*)

val enabled : int -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_EventEnabled}SDL_EventEnabled}: Query the state of processing events by type.


    @param type the type of event; see SDL_EventType for details.

    @return true if the event is being processed, false otherwise.*)

val registers : int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_RegisterEvents}SDL_RegisterEvents}: Allocate a set of user-defined events, and return the beginning event
number for that set of events.


    @param numevents the number of events to be allocated.

    @return the beginning event number, or 0 if numevents is invalid or if
there are not enough user-defined events left.*)

val get_description : event option -> string -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetEventDescription}SDL_GetEventDescription}: Generate an English description of an event.

This will fill[buf]with a null-terminated string that might look
something like this:

]}
SDL_EVENT_MOUSE_MOTION (timestamp=1140256324 windowid=2 which=0 state=0 x=492.99 y=139.09 xrel=52 yrel=6)
]}

The exact format of the string is not guaranteed; it is intended for
logging purposes, to be read by a human, and not parsed by a computer.

The returned value follows the same rules as SDL_snprintf():[buf]will
always be NULL-terminated (unless[buflen]is zero), and will be truncated
if[buflen]is too small. The return code is the number of bytes needed for
the complete string, not counting the NULL-terminator, whether the string
was truncated or not. Unlike SDL_snprintf(), though, this function never
returns -1.


    @param event an event to describe. May be [None].
    @param buf the buffer to fill with the description string. May be NULL.
    @param buflen the maximum bytes that can be written to[buf]

    @return number of bytes needed for the full string, not counting the
null-terminator byte.*)

include module type of Event

end

module Window : sig

val get_from_event : event -> window result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetWindowFromEvent}SDL_GetWindowFromEvent}: Get window associated with an event.


    @param event an event containing a[windowID]

    @return the associated window on success or [Error] if there is none.*)

end

