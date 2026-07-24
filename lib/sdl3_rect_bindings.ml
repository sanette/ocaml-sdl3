(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Helpers
open Sdl3_types

let ff = Load.foreign

module Rect = struct
let has_intersection = ff "SDL_HasRectIntersection"
  (rect @-> rect @-> returning bool)

let get_intersection = ff "SDL_GetRectIntersection"
  (rect @-> rect @-> rect @-> returning true_to_ok)

let get_union = ff "SDL_GetRectUnion"
  (rect @-> rect @-> rect @-> returning true_to_ok)

let get_and_line_intersection = ff "SDL_GetRectAndLineIntersection"
  (rect @-> ptr int @-> ptr int @-> ptr int @-> ptr int @-> returning bool)
let get_and_line_intersection rect x1 y1 x2 y2 =
let x1 = allocate int x1 in
let y1 = allocate int y1 in
let x2 = allocate int x2 in
let y2 = allocate int y2 in
if get_and_line_intersection rect x1 y1 x2 y2 then Ok (!@ x1, !@ y1, !@ x2, !@ y2) else error ()

end

module Point = struct
let get_rect_enclosings = ff "SDL_GetRectEnclosingPoints"
  (point @-> int @-> rect_opt @-> rect @-> returning true_to_ok)
let get_rect_enclosings points clip result =
  let points, count = carray_of_list point_raw points in
  get_rect_enclosings points count clip result

end

module FRect = struct
let has_rect_intersection_float = ff "SDL_HasRectIntersectionFloat"
  (f_rect @-> f_rect @-> returning bool)

let get_rect_intersection_float = ff "SDL_GetRectIntersectionFloat"
  (f_rect @-> f_rect @-> f_rect @-> returning true_to_ok)

let get_rect_union_float = ff "SDL_GetRectUnionFloat"
  (f_rect @-> f_rect @-> f_rect @-> returning true_to_ok)

let get_rect_and_line_intersection_float = ff "SDL_GetRectAndLineIntersectionFloat"
  (f_rect @-> ptr float @-> ptr float @-> ptr float @-> ptr float @-> returning bool)
let get_rect_and_line_intersection_float rect x1 y1 x2 y2 =
  let x1 = allocate float x1 in
  let y1 = allocate float y1 in
  let x2 = allocate float x2 in
  let y2 = allocate float y2 in
  if get_rect_and_line_intersection_float rect x1 y1 x2 y2 then Ok (!@ x1, !@ y1, !@ x2, !@ y2) else error ()
include FRect

end

module FPoint = struct
let get_rect_enclosing_points_float = ff "SDL_GetRectEnclosingPointsFloat"
  (f_point @-> int @-> f_rect_opt @-> f_rect @-> returning true_to_ok)
let get_rect_enclosing_points_float points clip result =
  let points, count = carray_of_list f_point_raw points in
  get_rect_enclosing_points_float points count clip result

include FPoint

end

