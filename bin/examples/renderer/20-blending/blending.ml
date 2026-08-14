(* ocaml-SDL3 example *)
(* Adapted from examples/renderer/20-blending from the SDL3 sources (public domain) *)

open Sdl3

let go = Result.get_ok
let ( |?> ) o f = Option.iter f o
let matrix_to_list m =  m |> Array.to_list |> List.concat_map Array.to_list

type state = {
  renderer : T.renderer;
  red_rect_texture : T.texture option;
  green_rect_texture : T.texture option;
  blue_rect_texture : T.texture option;
  panels : T.f_rect list;
  blend_modes : int array;
  mutable alpha : int;
}

let window_width = 640
let window_height = 480

let rows = 2
let cols = 3
let grid_size = float (window_width - 1) /. 18.
let panel_size = grid_size *. 4.
let row_offset = float ((window_height - rows * int_of_float panel_size) / 4)
let col_offset = grid_size *. float cols
let rect_size = 50.0
let red_offset = grid_size
let green_offset = rect_size /. 3. +. grid_size
let blue_offset = rect_size *. 2. /. 3. +. grid_size

let blend_mode_names = [| "NONE"; "BLEND"; "ADD"; "MOD"; "MUL"; "SCREEN \"CUSTOM\"" |]

(* This function runs once at startup and returns a fresh application state. *)
let init () =
  Sdl.set_app_metadata "Example Blending" "1.0" "com.example.blending" |> go;
  match Sdl.init Sdl.init_video with
  | Error (`Msg e) -> Sdl.App.log "Couldn't initialize SDL: %s" e;
    T.APP_FAILURE, None
  | Ok () ->
    match Sdl.create_window_and_renderer "examples/renderer/blending"
            window_width window_height Sdl.window_resizable with
    | Error (`Msg e) -> Sdl.App.log "Couldn't create window/renderer: %s" e;
      T.APP_FAILURE, None
    | Ok (_window, renderer) ->
      Sdl.Renderer.set_logical_presentation renderer window_width window_height
        Sdl.logical_presentation_letterbox |> go;
      Sdl.Renderer.set_v_sync renderer 1 |> go; (* not in the original SDL3 code but nice to your CPU! *)

      let panels = Array.init_matrix rows cols (fun row col ->
          T.FRect.create ~x:(float col *. panel_size +. float col *. col_offset)
            ~y:(float row *. panel_size +. float (row+1) *. row_offset)
            ~w:panel_size ~h:panel_size ())
        |> matrix_to_list in
      let custom = Sdl.compose_custom_blend_mode
          Sdl.blendfactor_one_minus_dst_color
          Sdl.blendfactor_one
          Sdl.blendoperation_add
          Sdl.blendfactor_zero
          Sdl.blendfactor_one
          Sdl.blendoperation_add in

      let blend_modes = [|
        Sdl.blendmode_none;
        Sdl.blendmode_blend;
        Sdl.blendmode_add;
        Sdl.blendmode_mod;
        Sdl.blendmode_mul;
        custom
      |] in

      let state = { renderer; panels; alpha = 255; blend_modes;
                    red_rect_texture = None;
                    blue_rect_texture = None;
                    green_rect_texture = None } in
      let r = int_of_float rect_size in
      match Sdl.Surface.create r r Sdl.pixelformat_rgba8888 with
      | Error (`Msg e) -> Sdl.App.log "Couldn't create surface: %s" e;
        T.APP_FAILURE, None
      | Ok surface ->
        Sdl.Surface.fill_rect surface None 0xFF0000FF |> go;
        match Sdl.Texture.create_from_surface state.renderer surface with
        | Error (`Msg e) -> Sdl.App.log "Couldn't create texture: %s" e;
          T.APP_FAILURE, None
        | Ok t ->
          let state = { state with red_rect_texture = Some t} in

          Sdl.Surface.fill_rect surface None 0x00FF00FF |> go;
          match Sdl.Texture.create_from_surface state.renderer surface with
          | Error (`Msg e) -> Sdl.App.log "Couldn't create texture: %s" e;
            T.APP_FAILURE, Some state
          | Ok t ->
            let state = { state with green_rect_texture = Some t} in

            Sdl.Surface.fill_rect surface None 0x0000FFFF |> go;
            match Sdl.Texture.create_from_surface state.renderer surface with
            | Error (`Msg e) -> Sdl.App.log "Couldn't create texture: %s" e;
              T.APP_FAILURE, Some state
            | Ok t ->
              let state = { state with blue_rect_texture = Some t} in

              Sdl.Surface.destroy surface;
              T.APP_CONTINUE, Some state

let event state e =
  match Sdl.Event.(get e typ) |> T.event_type_of_enum with
  | T.EVENT_QUIT -> T.APP_SUCCESS
  | T.EVENT_KEY_DOWN ->
    let the_key = Sdl.Event.(get e key) in
    let () = match T.KeyboardEvent.(get the_key key) with
      | k when k = Sdl.k_up && state.alpha <= 255-8 ->
        state.alpha <- state.alpha + 8
      | k when k = Sdl.k_down && state.alpha >= 8 ->
        state.alpha <- state.alpha - 8
      | _ -> () in
    T.APP_CONTINUE (* carry on with the program! *)
  | _ -> T.APP_CONTINUE

(* This function runs once per frame, and is the heart of the program. *)
let iterate state =
  let renderer = state.renderer in
  Sdl.Renderer.set_draw_color renderer 0 0 0 Sdl.alpha_opaque |> go;
  Sdl.Renderer.clear renderer |> go;

  state.panels |> List.iteri (fun i rect ->
      let x0 = T.FRect.(get rect x) in
      let y0 = T.FRect.(get rect y) in
      let rec loop_y y =
        if y < panel_size +. y0
        then begin
          let rec loop_x x =
            if x < panel_size +. x0 then begin
              let grid = T.FRect.create ~x ~y ~w:grid_size ~h:grid_size () in
              let dark = int_of_float (x /. grid_size +. y /. grid_size)
                         mod 2 <> 0 in
              if dark then Sdl.Renderer.set_draw_color renderer 70 70 70 255 |> go
              else Sdl.Renderer.set_draw_color renderer 110 110 110 255 |> go;
              Sdl.Renderer.render_fill_rect renderer (Some grid) |> go;
              loop_x (x +. grid_size)
            end in
          loop_x x0;
          loop_y (y +. grid_size)
        end in
      loop_y y0;

      Sdl.Renderer.set_draw_color renderer 255 255 255 Sdl.alpha_opaque |> go;
      Sdl.Renderer.render_debug_text renderer x0 (y0 -. 15.) blend_mode_names.(i) |> go
    );

  Sdl.Renderer.render_rects renderer state.panels |> go;
  Sdl.Renderer.render_debug_text renderer (float ((window_width - 176) / 2))
    (float (window_height - 30)) "UP/DOWN: CHANGE ALPHA" |> go;
  Sdl.Renderer.render_debug_text renderer (float ((window_width - 80) / 2))
    (float (window_height - 20)) (Printf.sprintf "ALPHA: %d" state.alpha) |> go;

  let red_rect_texture = Option.get state.red_rect_texture in
  let green_rect_texture = Option.get state.green_rect_texture in
  let blue_rect_texture = Option.get state.blue_rect_texture in

  Sdl.Texture.set_alpha_mod red_rect_texture state.alpha |> go;
  Sdl.Texture.set_alpha_mod green_rect_texture state.alpha |> go;
  Sdl.Texture.set_alpha_mod blue_rect_texture state.alpha |> go;

  state.panels |> List.iteri (fun i rect ->
      let b = state.blend_modes.(i) in
      let x0 = T.FRect.(get rect x) in
      let y0 = T.FRect.(get rect y) in
      let w = rect_size in
      let h = rect_size in
      let red_dst = T.FRect.create ~x:(x0 +. red_offset) ~y:(y0 +. red_offset)
          ~w ~h () in
      let green_dst = T.FRect.create ~x:(x0 +. green_offset) ~y:(y0 +. green_offset)
          ~w ~h () in
      let blue_dst = T.FRect.create ~x:(x0 +. blue_offset) ~y:(y0 +. blue_offset)
          ~w ~h () in

      let supported = Sdl.Texture.set_blend_mode red_rect_texture b |> Result.is_ok in
      Sdl.Texture.set_blend_mode green_rect_texture b |> go;
      Sdl.Texture.set_blend_mode blue_rect_texture b |> go;

      Sdl.Renderer.render_texture renderer red_rect_texture None (Some red_dst) |> go;
      Sdl.Renderer.render_texture renderer green_rect_texture None (Some green_dst) |> go;
      Sdl.Renderer.render_texture renderer blue_rect_texture None (Some blue_dst) |> go;

      if not supported then begin
        let textwidth = 104. in
        let dst = T.FRect.create
            ~x:(x0 +. (T.FRect.(get rect w) -. textwidth) /. 2.)
            ~y:(y0 +. (T.FRect.(get rect h) -. 8.)) ~w:textwidth ~h:9. () in
        Sdl.Renderer.set_draw_color renderer 0 0 0 Sdl.alpha_opaque |> go;
        Sdl.Renderer.render_debug_text renderer T.FRect.(get dst x) T.FRect.(get dst y)
          "[UNSUPPORTED]" |> go
      end
    );

  Sdl.Renderer.present renderer |> go;
  T.APP_CONTINUE

let quit state _ret =
  state |?> (fun state ->
      state.red_rect_texture |?> Sdl.Texture.destroy;
      state.green_rect_texture |?> Sdl.Texture.destroy;
      state.blue_rect_texture |?> Sdl.Texture.destroy);
  T.APP_SUCCESS

let () =
  let app = Sdl.App.create ~init ~event ~iterate ~quit () in
  Sdl.App.run app
