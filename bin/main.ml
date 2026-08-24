(* Access SDL functions by "Categories" *)

open Sdl3
let go = Result.get_ok
module C = Categories

let () =
  print_endline "Hello, World!";
  go (C.Init.init (Sdl.init_events));
  let win = C.Video.Window.create "Hello SDL3" 800 600 0L in
  ignore (win);
  let _ = C.Joystick.GUID.get_joystick_info in
  C.Init.quit ()
