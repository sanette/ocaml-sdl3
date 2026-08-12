(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Sdl3_types
open Helpers

let ff = Load.foreign

module Time = struct
let get_date_locale_preferences = ff "SDL_GetDateTimeLocalePreferences"
  (ptr_opt date_format @-> ptr_opt time_format @-> returning true_to_ok)

let get_current = ff "SDL_GetCurrentTime"
  (ptr time @-> returning bool)
let get_current () =
  let ticks = allocate long (Signed.Long.of_int 0) in
  if get_current ticks then Ok (Signed.Long.to_int (!@ ticks)) else error ()

let to_date_time = ff "SDL_TimeToDateTime"
  (time @-> ptr date_time @-> bool @-> returning true_to_ok)
let to_date_time ticks dt local_time =
  to_date_time (Signed.Long.of_int ticks) dt local_time

let to_windows = ff "SDL_TimeToWindows"
  (time @-> ptr uint32 @-> ptr uint32 @-> returning void)
let to_windows ticks =
  let dw_low_date_time = allocate uint (Unsigned.UInt.of_int 0) in
  let dw_high_date_time = allocate uint (Unsigned.UInt.of_int 0) in
  to_windows (Signed.Long.of_int ticks) dw_low_date_time dw_high_date_time;
  (Unsigned.UInt.to_int (!@ dw_low_date_time), Unsigned.UInt.to_int (!@ dw_high_date_time))

let from_windows = ff "SDL_TimeFromWindows"
  (uint32 @-> uint32 @-> returning time)
let from_windows dw_low_date_time dw_high_date_time =
  from_windows (Unsigned.UInt.of_int dw_low_date_time) (Unsigned.UInt.of_int dw_high_date_time)

end

module DateTime = struct
let to_time = ff "SDL_DateTimeToTime"
  (ptr date_time @-> ptr time @-> returning bool)
let to_time dt =
  let ticks = allocate long (Signed.Long.of_int 0) in
  if to_time dt ticks then Ok (Signed.Long.to_int (!@ ticks)) else error ()

include DateTime

end

module Global = struct
let get_days_in_month = ff "SDL_GetDaysInMonth"
  (int @-> int @-> returning int)

let get_day_of_year = ff "SDL_GetDayOfYear"
  (int @-> int @-> int @-> returning int)

let get_day_of_week = ff "SDL_GetDayOfWeek"
  (int @-> int @-> int @-> returning int)

end
include Global

