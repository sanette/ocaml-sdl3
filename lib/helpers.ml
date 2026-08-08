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

let carray_of_list_opt typ = function
  | [] -> None, 0
  | list -> let p, n = carray_of_list typ list in Some p, n

(* let int64_as_long = *)
(*   view ~read:Signed.Long.to_int64 ~write:Signed.Long.of_int64 long *)

(* let int64_as_ulong = *)
(*   view ~read:Unsigned.ULong.to_int64 ~write:Unsigned.ULong.of_int64 ulong *)

(* not used *)
let opt_as_ptr t =
  let read p = if Ctypes_memory.is_null p then None else Some (!@ p) in
  let write = function None -> null | Some f -> allocate t f in
  (* NOT GOOD: who owns the allocation? *)
  view ~read ~write (ptr t)

let value_opt_as_ptr t =
  let read p = if Ctypes_memory.is_null p then None else Some (!@ p) in
  let write = function None -> from_voidp t null | Some f -> addr f in
  view ~read ~write (ptr t)

let hadd tbl ((k : int), v) = Hashtbl.add tbl k v
