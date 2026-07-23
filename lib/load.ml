(* Manually generated... *)

let () = print_endline "load"

let debug = Sys.getenv_opt "OCAMLCI" = Some "true"
let _pre = if debug then print_endline else ignore


(* We try to load SDL3 dynamically - should work on Windows, macOS, Linux, and
   maybe more *)

let sdl3_candidates =
  match Sys.os_type with
  | "Win32" | "Cygwin" -> [ "SDL2.dll" ]
  | "Unix" -> [ (* Linux *)"libSDL3.so"; "libSDL3.so.0";(* MacOS *)"libSDL3.dylib"]
  | _ -> []

let lib_sdl3 =
  Dynlib.load ~env:"SDL3_LIBRARY" ~debug ~name:"SDL3" sdl3_candidates

let stub = not debug
(* In debug mode, we fail as soon as a function is unbound; otherwise, we fail
   only when the function is called with an argument. *)
let foreign = Foreign.foreign ?from:lib_sdl3 ~stub
