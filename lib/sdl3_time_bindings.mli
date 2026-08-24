(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Sdl3_types
module Time : sig

val get_date_locale_preferences : date_format_enum Ctypes.ptr option -> time_format_enum Ctypes.ptr option -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetDateTimeLocalePreferences}SDL_GetDateTimeLocalePreferences}: Gets the current preferred date and time format for the system locale.

This might be a "slow" call that has to query the operating system. It's
best to ask for this once and save the results. However, the preferred
formats can change, usually because the user has changed a system
preference outside of your program.


    @param dateFormat the SDL_DateFormat to hold the returned date
format, may be [None].
    @param timeFormat the SDL_TimeFormat to hold the returned time
format, may be [None].*)

val get_current : unit -> int result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetCurrentTime}SDL_GetCurrentTime}: Gets the current value of the system realtime clock in nanoseconds since
Jan 1, 1970 in Universal Coordinated Time (UTC).


    @return the SDL_Time to hold the returned tick count.*)

val to_date_time : int -> date_time Ctypes.ptr -> bool -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_TimeToDateTime}SDL_TimeToDateTime}: Converts an SDL_Time in nanoseconds since the epoch to a calendar time in
the SDL_DateTime format.


    @param ticks the SDL_Time to be converted.
    @param dt the resulting SDL_DateTime.
    @param localTime the resulting SDL_DateTime will be expressed in local time
if true, otherwise it will be in Universal Coordinated
Time (UTC).*)

val to_windows : int -> int * int
(** {{:https://wiki.libsdl.org/SDL3/SDL_TimeToWindows}SDL_TimeToWindows}: Converts an SDL time into a Windows FILETIME (100-nanosecond intervals
since January 1, 1601).

This function fills in the two 32-bit values of the FILETIME structure.


    @param ticks the time to convert.*)

val from_windows : int -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_TimeFromWindows}SDL_TimeFromWindows}: Converts a Windows FILETIME (100-nanosecond intervals since January 1,
1601) to an SDL time.

This function takes the two 32-bit values of the FILETIME structure as
parameters.


    @param dwLowDateTime the low portion of the Windows FILETIME value.
    @param dwHighDateTime the high portion of the Windows FILETIME value.

    @return the converted SDL time.*)

end

module DateTime : sig

val to_time : date_time Ctypes.ptr -> int result
(** {{:https://wiki.libsdl.org/SDL3/SDL_DateTimeToTime}SDL_DateTimeToTime}: Converts a calendar time to an SDL_Time in nanoseconds since the epoch.

This function ignores the day_of_week member of the SDL_DateTime struct, so
it may remain unset.


    @param dt the source SDL_DateTime.

    @return the resulting SDL_Time.*)

include module type of DateTime

end

module Global : sig

val get_days_in_month : int -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetDaysInMonth}SDL_GetDaysInMonth}: Get the number of days in a month for a given year.


    @param year the year.
    @param month the month \[1-12\].

    @return the number of days in the requested month or -1 on failure; call
SDL_GetError() for more information.*)

val get_day_of_year : int -> int -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetDayOfYear}SDL_GetDayOfYear}: Get the day of year for a calendar date.


    @param year the year component of the date.
    @param month the month component of the date.
    @param day the day component of the date.

    @return the day of year \[0-365\] if the date is valid or -1 on failure;
call SDL_GetError() for more information.*)

val get_day_of_week : int -> int -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetDayOfWeek}SDL_GetDayOfWeek}: Get the day of week for a calendar date.


    @param year the year component of the date.
    @param month the month component of the date.
    @param day the day component of the date.

    @return a value between 0 and 6 (0 being Sunday) if the date is valid or
-1 on failure; call SDL_GetError() for more information.*)

end
include module type of Global

