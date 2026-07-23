let go = Result.get_ok
module C = Sdl3.Categories

let () =
  print_endline "Hello, World!";
  go (Sdl3.init (Sdl3.Sdl.init_events));
  let win = C.Video.Window.create "Hello SDL3" 800 600 0L in
  ignore (win);
  let _ = C.Joystick.ff in
  C.Init.quit ()
