(* Manually generated... *)
open Ctypes

(* let ff = Load.foreign *)

(* let get_error =  ff "SDL_GetError"  (void @-> returning string) *)

(* let error () = Error (`Msg (get_error ())) *)

module Error = Sdl3_error_bindings.Global

let error () = Error (`Msg (Error.get_error ()))

let write_never _ = assert false

let some_to_ok t =
  let read = function Some v -> Ok v | None -> error () in
  view ~read ~write:write_never t

let true_to_ok : (unit, [ `Msg of string ]) result typ =
  let read = function true -> Ok () | false -> error () in
  view ~read ~write:write_never bool

let carray_of_list typ list =
  let open CArray in
  let n = List.length list in
  let arr = make typ n in
  List.iteri (set arr) list;
  start arr, n
