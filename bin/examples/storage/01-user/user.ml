(* ocaml-SDL3 example *)
(* Adapted from examples/storage/01-user from the SDL3 sources (public domain) *)

(* On my linux, this example will save the data in the file:
   "$HOME/.local/share/libsdl/User Storage Example/save.sav"
*)

open Sdl3

let go = Result.get_ok
let ( |?> ) o f = Option.iter f o

let save_state_unstarted = 1 (* blue *)
let save_state_processing_game_world = 2 (* yellow *)
let save_state_preparing_storage = 3 (* cyan *)
let save_state_processing_storage_file = 4 (* magenta *)
let save_state_final_check = 5 (* green if success, red if failed *)

let save_file_name = "save.sav"

type 'a state = {
  renderer : T.renderer;
  mutable save_result : int;
  current_save_state : T.atomic_int;
  mutable save_thread : T.thread option;
  storage_ready : T.semaphore;
  mutable save_storage : T.storage option;
  mutable thread_function : 'a option
}

let set_save state value =
  Sdl.AtomicInt.set state.current_save_state value |> ignore

let write_save_data state = fun _ ->
  set_save state save_state_processing_game_world;
  let game_world = Bigarray.(Array1.create int64 c_layout 1) in
  game_world.{0} <- Sdl.get_performance_counter ();
  match Sdl.Storage.open_user "libsdl" "User Storage Example" 0 with
  | Error _ -> set_save state save_state_final_check; -1
  | Ok save_storage ->
    state.save_storage <- Some save_storage;
    set_save state save_state_preparing_storage;
    Sdl.Semaphore.wait state.storage_ready;
    let write_result = match Sdl.Storage.write_file save_storage
                               save_file_name game_world with
    | Error (`Msg e) -> Sdl.App.log "Cannot write storage file: %s" e; false
    | Ok () -> true in
    Sdl.Storage.close save_storage |> go;
    set_save state save_state_final_check;
    if not write_result then -1 else 0

let read_save_data state = fun _ ->
  let game_world = Bigarray.(Array1.create int64 c_layout 1) in
  match Sdl.Storage.open_user "libsdl" "User Storage Example" 0 with
  | Error _ -> set_save state save_state_final_check; -1
  | Ok save_storage ->
    state.save_storage <- Some save_storage;
    set_save state save_state_preparing_storage;
    Sdl.Semaphore.wait state.storage_ready;
    match Sdl.Storage.get_file_size save_storage save_file_name with
    | Error _ ->
      Sdl.Storage.close save_storage |> go;
      set_save state save_state_final_check;
      Sdl.App.log "Save data was not found";
      -1
    | Ok save_len when
        Int64.to_int save_len <> Bigarray.Array1.size_in_bytes game_world ->
      Sdl.Storage.close save_storage |> go;
      set_save state save_state_final_check;
      Sdl.App.log "Save data size is incorrect, was the file corrupted?";
      -1
    | Ok _ ->
      let read_result = Sdl.Storage.read_file save_storage save_file_name game_world
        |> Result.is_ok in
      Sdl.Storage.close save_storage |> go;
      set_save state save_state_processing_game_world;
      if read_result then Sdl.App.log "Game World loaded, value was %i"
          (Int64.to_int game_world.{0});
      set_save state save_state_final_check;
      if not read_result then -1 else 0


(* This function runs once at startup and returns a fresh application state. *)
let init () =
  Sdl.set_app_metadata
    "User Storage Example" "1.0" "com.example.storage-user" |> go;
  match Sdl.(init init_video) with
  | Error (`Msg e) -> Sdl.App.log "Couldn't initialize SDL: %s" e;
    T.APP_FAILURE, None
  | Ok () ->
    match Sdl.create_window_and_renderer "examples/storage/user" 640 480
            Sdl.window_resizable with
    | Error (`Msg e) -> Sdl.App.log "Couldn't create window/renderer: %s" e;
      T.APP_FAILURE, None
    | Ok (_window, renderer) ->
      Sdl.Renderer.set_v_sync renderer 1 |> go; (* not in the original SDL3 code but nice to your CPU! *)

      let current_save_state = Sdl.AtomicInt.create () in
      let storage_ready = Sdl.Semaphore.create 0 |> go in
      let state = { renderer; save_result = -1;
                    current_save_state; storage_ready; save_storage = None;
                    save_thread = None; thread_function = None } in
      set_save state save_state_unstarted;
      print_endline "init ok";

      T.APP_CONTINUE, Some state (* carry on with the program! *)

(* This function runs when a new event (mouse input, keypresses, etc) occurs. *)
let event state e =
  match Sdl.Event.(get e typ) |> T.event_type_of_enum with
  | T.EVENT_QUIT -> T.APP_SUCCESS (* end the program, reporting success to the OS. *)
  | T.EVENT_MOUSE_BUTTON_DOWN -> begin
      let () = match state.save_thread with
        | Some _ -> Sdl.App.log "Ignoring interaction, save/load is in progress";
        | None ->
          set_save state save_state_unstarted;
          let the_button = Sdl.Event.(get e button) in
          if T.MouseButtonEvent.(Ctypes.getf the_button button) = 1
          then let f = write_save_data state in
            state.thread_function <- Some f;
            (* we save it so that OCaml does not GC it*)
            state.save_thread <- Some (Sdl.Thread.create_linux f "Save Write Thread" |> go)
          else let f = read_save_data state in
            state.thread_function <- Some f;
            state.save_thread <- Some (Sdl.Thread.create_linux f "Save Read Thread" |> go)
      in T.APP_CONTINUE
    end
  | _ -> T.APP_CONTINUE (* carry on with the program! *)

(* This function runs once per frame, and is the heart of the program. *)
let iterate state =
  let save_state = Sdl.AtomicInt.get state.current_save_state in
  (* the main thread does not have to do much other than help the thread wait
     for storage to be ready and read the result when the thread is finished *)
  if save_state = save_state_preparing_storage then begin
    let save_storage = Option.get state.save_storage in
    match Sdl.Storage.ready save_storage with
    | Ok () ->
      set_save state save_state_processing_storage_file;
      Sdl.Semaphore.signal state.storage_ready
    | Error _ -> ()
  end
  else if save_state = save_state_final_check then begin
    state.save_thread |?> (fun save_thread ->
        state.save_result <- Sdl.Thread.wait save_thread;
        state.save_thread <- None;
        if state.save_result = 0
        then Sdl.App.log "Save/Load complete!"
        else Sdl.App.log "Save/Load failed: %s" (Sdl.Error.get ()));
  end;

  let red, green, blue = match save_state with
    | s when s = save_state_unstarted -> 0., 0., 1.
    | s when s = save_state_processing_game_world -> 1., 1., 0.
    | s when s = save_state_preparing_storage -> 0., 1., 1.
    | s when s = save_state_processing_storage_file -> 1., 0., 1.
    | s when s = save_state_final_check ->
      if state.save_result = 0 then 0., 1., 0. else 1., 0., 0.
    | _ -> assert ("Unrecognized save state" == "");
      0., 0., 0. in

  Sdl.Renderer.set_draw_color_float state.renderer red green blue
    Sdl.alpha_opaque_float |> go;
  Sdl.Renderer.clear state.renderer |> go;
  Sdl.Renderer.present state.renderer |> go;

  T.APP_CONTINUE (* carry on with the program! *)

(* This function runs once at shutdown. *)
let quit state _ret =
  state |?> (fun state ->
      (* If saving/loading is still in progress, force the thread not to wait *)
      Sdl.Semaphore.signal state.storage_ready;
      state.save_thread |?> (fun thread -> ignore (Sdl.Thread.wait thread));
      Sdl.Semaphore.destroy state.storage_ready;
      ignore (state.thread_function));
  (* SDL will clean up the window/renderer for us. *)
  T.APP_SUCCESS (* we really want to exit *)

let () =
  let app = Sdl.App.create ~init ~event ~iterate ~quit () in
  Sdl.App.run app
(* If [quit] returns APP_SUCCESS, the program will exit here, nothing beyond
   this point will be executed. *)
