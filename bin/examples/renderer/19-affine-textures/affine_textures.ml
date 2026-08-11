(* ocaml-SDL3 example *)
(* Adapted from examples/renderer/19-affine-textures from the SDL3 sources (public domain) *)

open Sdl3

let go = Result.get_ok
let do_option o f = Option.iter f o

type state = {
  renderer : T.renderer;
  texture : T.texture option;
}

let window_width = 640
let window_height = 480

(* This function runs once at startup and returns a fresh application state. *)
let init () =
  Sdl.set_app_metadata
    "Example Renderer Affine Textures" "1.0" "com.example.renderer-affine-textures" |> go;
  match Sdl.init Sdl.init_video with
  | Error (`Msg e) -> Sdl.App.log "Couldn't initialize SDL: %s" e;
    T.APP_FAILURE, None
  | Ok () ->
    match Sdl.create_window_and_renderer "examples/renderer/affine-textures" window_width window_height
            Sdl.window_resizable with
    | Error (`Msg e) -> Sdl.App.log "Couldn't create window/renderer: %s" e;
      T.APP_FAILURE, None
    | Ok (_window, renderer) ->
      Sdl.Renderer.set_logical_presentation renderer 640 480
        Sdl.logical_presentation_letterbox |> go;
      Sdl.Renderer.set_v_sync renderer 1 |> go; (* not in the original SDL3 code but nice to your CPU! *)
      let state = { renderer; texture = None } in

      let png_path = Filename.concat (Sdl.get_base_path ()) "logo-with-name-bkg.png" in
      match Sdl.load_png png_path with
      | Error (`Msg e) -> Sdl.App.log "Couldn't load bitmap: %s" e;
        T.APP_FAILURE, Some state
      | Ok surface ->
        match Sdl.Texture.create_from_surface state.renderer surface with
        | Error (`Msg e) -> Sdl.App.log "Couldn't create static texture: %s" e;
          T.APP_FAILURE, Some state
        | Ok texture -> let state = { state with texture = Some texture } in
          Sdl.Surface.destroy surface;
          T.APP_CONTINUE, Some state (* carry on with the program! *)

(* This function runs when a new event (mouse input, keypresses, etc) occurs. *)
let event _state e =
  let typ = Sdl.Event.(get e typ) in
  if typ = Sdl.event_quit
  then T.APP_SUCCESS (* end the program, reporting success to the OS. *)
  else T.APP_CONTINUE (* carry on with the program! *)

(* This function runs once per frame, and is the heart of the program. *)
let iterate state =
  let texture = Option.get state.texture in
  let x0 = 0.5 *. float window_width in
  let y0 = 0.5 *. float window_height in
  let px = float (min window_width window_height) /. Sdl.sqrtf 3. in
  let now = Sdl.get_ticks () |> Int64.to_int in
  let rad = (float (now mod 2000) /. 2000.) *. Sdl.pi_f *. 2. in
  let cos = Sdl.cosf rad in
  let sin = Sdl.sinf rad in
  let k = [| 3. /. Sdl.sqrtf 50.; 4. /. Sdl.sqrtf 50.; 5. /. Sdl.sqrtf 50. |] in
  let mat = [|
    cos +. (1. -. cos) *. k.(0) *. k.(0);  -. sin *. k.(2) +. (1. -. cos) *. k.(0) *. k.(1);  sin *. k.(1) +. (1. -. cos) *. k.(0) *. k.(2);
    sin *. k.(2) +. (1. -. cos) *. k.(0) *. k.(1);  cos      +. (1. -. cos) *. k.(1) *. k.(1);  -. sin *. k.(0) +. (1. -. cos) *. k.(1) *. k.(2);
    -. sin *. k.(1) +. (1. -. cos) *. k.(0) *. k.(2);  sin *. k.(0) +. (1. -. cos) *. k.(1) *. k.(2);  cos +. (1. -. cos) *. k.(2) *. k.(2)
  |] in
  let corners = Array.create_float 16 in
  for i = 0 to 7 do
    let x = if i land 1 <> 0 then -. 0.5 else 0.5 in
    let y = if i land 2 <> 0 then -. 0.5 else 0.5 in
    let z = if i land 4 <> 0 then -. 0.5 else 0.5 in
    corners.(0 + 2*i) <- mat.(0) *. x +. mat.(1) *. y +. mat.(2) *. z;
    corners.(1 + 2*i) <- mat.(3) *. x +. mat.(4) *. y +. mat.(5) *. z
  done;

  Sdl.Renderer.set_draw_color state.renderer 0x42 0x87 0xf5 Sdl.alpha_opaque |> go;
  Sdl.Renderer.clear state.renderer |> go;

  for i = 0 to 6 do
    let dir = 3 land (if (i land 4) <> 0 then lnot i else i) in
    let odd = (i land 1) lxor ((i land 2) lsr 1) lxor ((i land 4) lsr 2) in
    if 0.0 < (if odd <> 0 then 1.0 else -1.0) *. mat.(5 + dir) then () else
      begin
        let origin_idx = 1 lsl ((dir - 1) mod 3) in
        let right_idx = (1 lsl ((dir + odd) mod 3)) lor origin_idx in
        let down_idx = (1 lsl ((dir + (odd lxor 1)) mod 3)) lor origin_idx in
        let (origin_index, right_index, down_index) =
          if odd = 0 then
            (origin_idx lxor 7, right_idx lxor 7, down_idx lxor 7)
          else
            (origin_idx, right_idx, down_idx) in
        let origin = T.FPoint.create
            ~x:(x0 +. px *. corners.(0 + 2*origin_index))
            ~y:(y0 +. px *. corners.(1 + 2*origin_index)) () in
        let right = T.FPoint.create
            ~x:(x0 +. px *. corners.(0 + 2*right_index))
            ~y:(y0 +. px *. corners.(1 + 2*right_index)) () in
        let down = T.FPoint.create
            ~x:(x0 +. px *. corners.(0 + 2*down_index))
            ~y:(y0 +. px *. corners.(1 + 2*down_index)) () in
        Sdl.Renderer.render_texture_affine state.renderer texture None (Some origin) (Some right) (Some down) |> go
      end
      done;

  Sdl.Renderer.present state.renderer |> go;
  T.APP_CONTINUE (* carry on with the program! *)

(* This function runs once at shutdown. *)
let quit state _ret =
  (* SDL will clean up the window/renderer for us. *)
  do_option state (fun state ->
      do_option state.texture Sdl.Texture.destroy);
  T.APP_SUCCESS

let () =
  let app = Sdl.App.create ~init ~event ~iterate ~quit () in
  Sdl.App.run app;
  (* Because [quit] returns APP_SUCCESS, the program exits here, nothing beyonod
     this point will be executed. *)
  print_endline "This is never reached"
