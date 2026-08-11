(* ocaml-SDL3 example *)
(* Adapted from examples/renderer/17-read-pixels from the SDL3 sources (public domain) *)

open Sdl3

let go = Result.get_ok
let do_option o f = Option.iter f o

type state = {
  renderer : T.renderer;
  texture : T.texture option;
  texture_width : int;
  texture_height : int;
  mutable converted_texture : T.texture option;
  mutable converted_texture_width : int;
  mutable converted_texture_height : int
}

let window_width = 640
let window_height = 480

(* In this OCaml version we use the special ("monadic") "let*" construction in
   order to deal with SDL errors. It's just a matter of taste/style; the direct
   syntax (with traditional "matches"), used in other examples, may be easier to
   read and even easier to write. *)

(* For the init function, the "let*" operator has two additional arguments: the
   error message in case of failure, and the current app state (used to cleanup
   before quitting.) *)
let ( let* ) (o, errmsg, state) f =
  match o with
  | Error (`Msg e) -> Sdl.App.log "%s: %s" errmsg e;
    T.APP_FAILURE, state
  | Ok x -> f x

(* This function runs once at startup and returns a fresh application state. *)
let init () =
  Sdl.set_app_metadata
    "Example Renderer Read Pixels" "1.0" "com.example.renderer-read-pixels" |> go;

  let* () = Sdl.init Sdl.init_video, "Couldn't initialize SDL", None in
  let* (_window, renderer) = Sdl.create_window_and_renderer "examples/renderer/read-pixels" window_width window_height
      Sdl.window_resizable, "Couldn't create window/renderer", None  in

  Sdl.Renderer.set_logical_presentation renderer window_width window_height
    Sdl.logical_presentation_letterbox |> go;
  Sdl.Renderer.set_v_sync renderer 1 |> go; (* not in the original SDL3 code but nice to your CPU! *)

  (* Textures are pixel data that we upload to the video hardware for fast
     drawing. Lots of 2D engines refer to these as "sprites." We'll do a static
     texture (upload once, draw many times) with data from a bitmap file. *)
  (* SDL_Surface is pixel data the CPU can access. SDL_Texture is pixel data the
     GPU can access. *)
  (* Load a .png into a surface, move it to a texture from there. *)
  let state = { renderer ;
                texture = None; texture_width = 0; texture_height = 0;
                converted_texture = None;
                converted_texture_width = 0; converted_texture_height = 0 } in
  let* surface = Sdl.load_png "logo-with-name.png",
                 "Couldn't load bitmap", Some state in
  let texture_height = Sdl.Surface.(get surface h) in
  let texture_width = Sdl.Surface.(get surface w) in
  let* texture = Sdl.Texture.create_from_surface renderer surface,
                 "Couldn't create static texture", Some state in
  let state = { state with texture = Some texture; texture_width; texture_height } in
  Sdl.Surface.destroy surface;
  T.APP_CONTINUE, Some state (* carry on with the program! *)

(* This function runs when a new event (mouse input, keypresses, etc) occurs. *)
let event _state e =
  let typ = Sdl.Event.(get e typ) in
  if typ = Sdl.event_quit
  then T.APP_SUCCESS (* end the program, reporting success to the OS. *)
  else T.APP_CONTINUE (* carry on with the program! *)

(* For the iterate function, the 'let*' operator just needs one additional
   argument (the error message). *)
let ( let* ) (o, errmsg) f =
  match o with
  | Error (`Msg e) -> Sdl.App.log "%s: %s" errmsg e;
    T.APP_FAILURE
  | Ok x -> f x
let result t = Ok t, ""

(* This function runs once per frame, and is the heart of the program. *)
let iterate state =
  let texture = Option.get state.texture in
  let now = Sdl.get_ticks () in
  let rotation = (float (Int64.to_int now mod 2000) /. 2000.) *. 360. in
  Sdl.Renderer.set_draw_color state.renderer 0 0 0 Sdl.alpha_opaque |> go;
  Sdl.Renderer.clear state.renderer |> go;
  let dst = T.FRect.create
      ~x:(float (window_width - state.texture_width) /. 2.)
      ~y:(float (window_height - state.texture_height) /. 2.)
      ~w:(float state.texture_width)
      ~h:(float state.texture_height) () in
  let center = T.FPoint.create
      (* other values (w and h) are zero by default *)
      ~x:(float state.texture_width /. 2.)
      ~y:(float state.texture_height /. 2.) () in
  Sdl.Renderer.render_texture_rotated state.renderer texture
    None (Some dst) rotation (Some center) Sdl.flip_none |> go;

  (* this next whole thing is _super_ expensive. Seriously, don't do this in real life. *)

  (* Download the pixels of what has just been rendered. This has to wait for the
     GPU to finish rendering it and everything before it, and then make an
     expensive copy from the GPU to system RAM! *)
  let surface = Sdl.Renderer.read_pixels state.renderer None |> go in

  (* This is also expensive, but easier: convert the pixels to a format we want. *)
  let surface = if Sdl.Surface.(get surface format) <> Sdl.pixelformat_rgba8888 &&
                   Sdl.Surface.(get surface format) <> Sdl.pixelformat_argb8888
    then let c = Sdl.Surface.convert surface Sdl.pixelformat_rgba8888 |> go in
      Sdl.Surface.destroy surface; c
    else surface in

  let w = Sdl.Surface.(get surface w) in
  let h = Sdl.Surface.(get surface h) in

  let ct () =
    Sdl.Texture.create state.renderer Sdl.pixelformat_rgba8888
      Sdl.textureaccess_streaming w h,
    "Couldn't (re)create conversion texture" in

  let changed = ref false in
  let* converted_texture = begin
    match state.converted_texture with
    | Some t ->
      if w <> state.converted_texture_width ||
         h <> state.converted_texture_height
      then begin
        changed := true;
        Sdl.Texture.destroy t;
        state.converted_texture_width <- w;
        state.converted_texture_height <- w;
        ct ()
      end
      else result t
    | None -> changed := true; ct ()
  end in
  if !changed then state.converted_texture <- Some converted_texture;

  let ba = Sdl.Surface.get_pixels_ba surface in
  let pitch = Sdl.Surface.(get surface pitch) in
  for y = 0 to h-1 do
    let pix_row = Bigarray.Array1.sub ba (y * pitch) pitch in
    for x = 0 to w-1 do
      let p = Bigarray.Array1.sub pix_row (4*x) 4 in
      let average = p.{1} + p.{2} + p.{3} in
      if average = 0
      then (p.{0} <- 0xFF; p.{3} <- 0xFF; p.{1} <- 0; p.{2} <- 0)
      else (let a = if average > 50 then 0xFF else 0 in
            p.{1} <- a; p.{2} <- a; p.{3} <- a)
    done
  done;

  Sdl.Texture.update converted_texture None Sdl.Surface.(get surface pixels) pitch |> go;
  Sdl.Surface.destroy surface;

  let dst = T.FRect.create (* values x and y are 0 by default *)
      ~w:(float window_width /. 4.)
      ~h:(float window_height /. 4.) () in
  Sdl.Renderer.render_texture state.renderer converted_texture None
    (Some dst) |> go;

  Sdl.Renderer.present state.renderer |> go;

  T.APP_CONTINUE (* carry on with the program! *)

(* This function runs once at shutdown. *)
let quit state _ret =
  do_option state (fun state ->
      do_option state.texture Sdl.Texture.destroy;
      do_option state.converted_texture Sdl.Texture.destroy);
  T.APP_SUCCESS

let () =
  let app = Sdl.App.create ~init ~event ~iterate ~quit () in
  Sdl.App.run app
