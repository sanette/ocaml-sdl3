(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Sdl3_types
open Helpers

let ff = Load.foreign

module Rect = struct
let has_intersection = ff "SDL_HasRectIntersection"
  (ptr rect @-> ptr rect @-> returning bool)

let get_intersection = ff "SDL_GetRectIntersection"
  (ptr rect @-> ptr rect @-> ptr rect @-> returning true_to_ok)

let get_union = ff "SDL_GetRectUnion"
  (ptr rect @-> ptr rect @-> ptr rect @-> returning true_to_ok)

let get_and_line_intersection = ff "SDL_GetRectAndLineIntersection"
  (ptr rect @-> ptr int @-> ptr int @-> ptr int @-> ptr int @-> returning bool)
let get_and_line_intersection rect x1 y1 x2 y2 =
  let x1 = allocate int x1 in
  let y1 = allocate int y1 in
  let x2 = allocate int x2 in
  let y2 = allocate int y2 in
  if get_and_line_intersection rect x1 y1 x2 y2
  then Ok (!@ x1, !@ y1, !@ x2, !@ y2) else error ()

let has_intersection_float = ff "SDL_HasRectIntersectionFloat"
  (ptr f_rect @-> ptr f_rect @-> returning bool)

let get_intersection_float = ff "SDL_GetRectIntersectionFloat"
  (ptr f_rect @-> ptr f_rect @-> ptr f_rect @-> returning true_to_ok)

let get_union_float = ff "SDL_GetRectUnionFloat"
  (ptr f_rect @-> ptr f_rect @-> ptr f_rect @-> returning true_to_ok)

let get_enclosing_points_float = ff "SDL_GetRectEnclosingPointsFloat"
  (ptr f_point @-> int @-> f_rect_opt @-> ptr f_rect @-> returning true_to_ok)
let get_enclosing_points_float points clip result =
  let points, count = carray_of_list f_point points in
  get_enclosing_points_float points count clip result

let get_and_line_intersection_float = ff "SDL_GetRectAndLineIntersectionFloat"
  (ptr f_rect @-> ptr float @-> ptr float @-> ptr float @-> ptr float @-> returning bool)
let get_and_line_intersection_float rect x1 y1 x2 y2 =
  let x1 = allocate float x1 in
  let y1 = allocate float y1 in
  let x2 = allocate float x2 in
  let y2 = allocate float y2 in
  if get_and_line_intersection_float rect x1 y1 x2 y2
  then Ok (!@ x1, !@ y1, !@ x2, !@ y2) else error ()

end

module Point = struct
let get_rect_enclosings = ff "SDL_GetRectEnclosingPoints"
  (ptr point @-> int @-> rect_opt @-> ptr rect @-> returning true_to_ok)
let get_rect_enclosings points clip result =
  let points, count = carray_of_list point points in
  get_rect_enclosings points count clip result

end

