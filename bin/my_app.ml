open Sdl3

let go = Result.get_ok

let () =
  match Sdl.init Sdl.init_video with
  | Error (`Msg e) -> Sdl.App.log "Couldn't initialize SDL: %s" e
  | Ok () -> match Sdl.Renderer.create_window_and "my_app" 640 480
                     Sdl.window_resizable with
  | Error (`Msg e) -> Sdl.App.log "Couldn't create window/renderer: %s" e
  | Ok (window, renderer) ->
    Sdl.Renderer.set_draw_color renderer 0xEE 0x77 0x06 Sdl.alpha_opaque |> go;
    Sdl.Renderer.clear renderer |> go;
    Sdl.Renderer.present renderer |> go;
    Sdl.delay 1000;
    Sdl.Renderer.destroy renderer;
    Sdl.Window.destroy window;
    Sdl.quit()



(* ocamlfind ocamlopt -package sdl3 -thread -linkpkg -o my_app my_app.ml *)
