(* ocaml-SDL3 example *)
(* Adapted from examples/renderer/04-points from the SDL3 sources (public domain) *)

open Sdl3

let go = Result.get_ok

type state = {
  renderer : T.renderer;
  points : T.FPoint.t list;
  point_array : T.FPoint.t array;
  point_speeds : float array;
  mutable last_time : Int64.t;
}

let window_width = 640
let window_height = 480

let num_points = 500
let min_pixels_per_second = 30.
let max_pixels_per_second = 60.

(* This function runs once at startup and returns a fresh application state. *)
let init () =
  Sdl.set_app_metadata "Example Renderer Points" "1.0" "com.example.renderer-points"
  |> go;
  match Sdl.init Sdl.init_video with
  | Error (`Msg e) -> Sdl.App.log "Couldn't initialize SDL: %s" e;
    T.APP_FAILURE, None
  | Ok () ->
    match Sdl.create_window_and_renderer "examples/renderer/points"
            window_width window_height Sdl.window_resizable with
    | Error (`Msg e) -> Sdl.App.log "Couldn't create window/renderer: %s" e;
      T.APP_FAILURE, None
    | Ok (_window, renderer) ->
      Sdl.Renderer.set_logical_presentation renderer window_width window_height
        Sdl.logical_presentation_letterbox |> go;
      Sdl.Renderer.set_v_sync renderer 1 |> go;


      let point_speeds = Array.create_float num_points in
      let point_array = Array.init num_points (fun i ->
          point_speeds.(i) <- min_pixels_per_second +. Sdl.randf() *. (max_pixels_per_second -. min_pixels_per_second);
          (* Were fully testing the bindings here, but of course we could use
             the OCaml Random functions instead! *)
          T.FPoint.create
            ~x:(Sdl.randf () *. (float window_width))
            ~y:(Sdl.randf () *. (float window_height)) ()) in
      let points = Array.to_list point_array in
      let last_time = Sdl.get_ticks () in
      let state = { renderer; points; point_array; point_speeds; last_time } in

      T.APP_CONTINUE, Some state

let event _state e =
  match Sdl.Event.(get e typ) |> T.event_type_of_enum with
  | T.EVENT_QUIT -> T.APP_SUCCESS
  | _ -> T.APP_CONTINUE (* carry on with the program! *)

(* This function runs once per frame, and is the heart of the program. *)
let iterate state =
  let now = Sdl.get_ticks () in
  let elapsed = Int64.to_float (Int64.sub now  state.last_time) /. 1000. in
  state.point_array |> Array.iteri (fun i p ->
      let distance = elapsed *. state.point_speeds.(i) in
      T.FPoint.(set p x (get p x +. distance));
      T.FPoint.(set p y (get p y +. distance));
      if T.FPoint.(get p x) >= float window_width ||
         T.FPoint.(get p y) >= float window_height
      then begin
        if Sdl.rand 2 = 1 then begin
          T.FPoint.(set p x (Sdl.randf () *. (float window_width)));
          T.FPoint.(set p y 0.);
        end else begin
          T.FPoint.(set p x 0.);
          T.FPoint.(set p y (Sdl.randf () *. (float window_height)))
        end;
        state.point_speeds.(i) <- min_pixels_per_second +. Sdl.randf() *. (max_pixels_per_second -. min_pixels_per_second)
      end
    );

  state.last_time <- now;

  let renderer = state.renderer in
  Sdl.Renderer.set_draw_color renderer 0 0 0 Sdl.alpha_opaque |> go;
  Sdl.Renderer.clear renderer |> go;
  Sdl.Renderer.set_draw_color renderer 255 255 255 Sdl.alpha_opaque |> go;
  Sdl.render_points renderer state.points |> go;
  (* This version of Sdl.render_points is not very efficient because it
     recreates an array of points to pass to the C function at every call. *)
  Sdl.Renderer.present renderer |> go;
  T.APP_CONTINUE

let quit _state _ret =
  T.APP_SUCCESS

let () =
  let app = Sdl.App.create ~init ~event ~iterate ~quit () in
  Sdl.App.run app

(* 0.8% CPU memory growing 400ko/min *)
