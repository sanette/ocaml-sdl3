(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Sdl3_types
module Rect : sig

val has_intersection : rect Ctypes.ptr -> rect Ctypes.ptr -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_HasRectIntersection}SDL_HasRectIntersection}: Determine whether two rectangles intersect.

If either pointer is NULL the function will return false.


    @param A an SDL_Rect structure representing the first rectangle.
    @param B an SDL_Rect structure representing the second rectangle.

    @return true if there is an intersection, false otherwise.*)

val get_intersection : rect Ctypes.ptr -> rect Ctypes.ptr -> rect Ctypes.ptr -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetRectIntersection}SDL_GetRectIntersection}: Calculate the intersection of two rectangles.

If[result]is NULL then this function will return false.


    @param A an SDL_Rect structure representing the first rectangle.
    @param B an SDL_Rect structure representing the second rectangle.
    @param result an SDL_Rect structure filled in with the intersection of
rectangles[A]and[B]*)

val get_union : rect Ctypes.ptr -> rect Ctypes.ptr -> rect Ctypes.ptr -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetRectUnion}SDL_GetRectUnion}: Calculate the union of two rectangles.


    @param A an SDL_Rect structure representing the first rectangle.
    @param B an SDL_Rect structure representing the second rectangle.
    @param result an SDL_Rect structure filled in with the union of rectangles[A]and[B]*)

val get_and_line_intersection : rect -> int -> int -> int -> int -> (int * int * int * int) result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetRectAndLineIntersection}SDL_GetRectAndLineIntersection}: Calculate the intersection of a rectangle and line segment.

This function is used to clip a line segment to a rectangle. A line segment
contained entirely within the rectangle or that does not intersect will
remain unchanged. A line segment that crosses the rectangle at either or
both ends will be clipped to the boundary of the rectangle and the new
coordinates saved in[X1][Y1][X2] and/or[Y2]as necessary.


    @param rect an SDL_Rect structure representing the rectangle to intersect.
    @param X1 a pointer to the starting X-coordinate of the line.
    @param Y1 a pointer to the starting Y-coordinate of the line.
    @param X2 a pointer to the ending X-coordinate of the line.
    @param Y2 a pointer to the ending Y-coordinate of the line.

    @return 4 values:
(
  + X1 : the starting X-coordinate of the line.,
  + Y1 : the starting Y-coordinate of the line.,
  + X2 : the ending X-coordinate of the line.,
  + Y2 : the ending Y-coordinate of the line.
)*)

val has_intersection_float : f_rect Ctypes.ptr -> f_rect Ctypes.ptr -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_HasRectIntersectionFloat}SDL_HasRectIntersectionFloat}: Determine whether two rectangles intersect with float precision.

If either pointer is NULL the function will return false.


    @param A an SDL_FRect structure representing the first rectangle.
    @param B an SDL_FRect structure representing the second rectangle.

    @return true if there is an intersection, false otherwise.*)

val get_intersection_float : f_rect Ctypes.ptr -> f_rect Ctypes.ptr -> f_rect Ctypes.ptr -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetRectIntersectionFloat}SDL_GetRectIntersectionFloat}: Calculate the intersection of two rectangles with float precision.

If[result]is NULL then this function will return false.


    @param A an SDL_FRect structure representing the first rectangle.
    @param B an SDL_FRect structure representing the second rectangle.
    @param result an SDL_FRect structure filled in with the intersection of
rectangles[A]and[B]*)

val get_union_float : f_rect Ctypes.ptr -> f_rect Ctypes.ptr -> f_rect Ctypes.ptr -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetRectUnionFloat}SDL_GetRectUnionFloat}: Calculate the union of two rectangles with float precision.


    @param A an SDL_FRect structure representing the first rectangle.
    @param B an SDL_FRect structure representing the second rectangle.
    @param result an SDL_FRect structure filled in with the union of rectangles[A]and[B]*)

val get_enclosing_points_float : f_point list -> f_rect option -> f_rect Ctypes.ptr -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetRectEnclosingPointsFloat}SDL_GetRectEnclosingPointsFloat}: Calculate a minimal rectangle enclosing a set of points with float
precision.

If[clip]is not NULL then only points inside of the clipping rectangle are
considered.


    @param points an array of SDL_FPoint structures representing points to be
enclosed.
    @param clip an SDL_FRect used for clipping or NULL to enclose all points.
    @param result an SDL_FRect structure filled in with the minimal enclosing
rectangle.*)

val get_and_line_intersection_float : f_rect -> float -> float -> float -> float -> (float * float * float * float) result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetRectAndLineIntersectionFloat}SDL_GetRectAndLineIntersectionFloat}: Calculate the intersection of a rectangle and line segment with float
precision.

This function is used to clip a line segment to a rectangle. A line segment
contained entirely within the rectangle or that does not intersect will
remain unchanged. A line segment that crosses the rectangle at either or
both ends will be clipped to the boundary of the rectangle and the new
coordinates saved in[X1][Y1][X2] and/or[Y2]as necessary.


    @param rect an SDL_FRect structure representing the rectangle to intersect.
    @param X1 a pointer to the starting X-coordinate of the line.
    @param Y1 a pointer to the starting Y-coordinate of the line.
    @param X2 a pointer to the ending X-coordinate of the line.
    @param Y2 a pointer to the ending Y-coordinate of the line.

    @return 4 values:
(
  + X1 : the starting X-coordinate of the line.,
  + Y1 : the starting Y-coordinate of the line.,
  + X2 : the ending X-coordinate of the line.,
  + Y2 : the ending Y-coordinate of the line.
)*)

end

module Point : sig

val get_rect_enclosings : point list -> rect option -> rect Ctypes.ptr -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetRectEnclosingPoints}SDL_GetRectEnclosingPoints}: Calculate a minimal rectangle enclosing a set of points.

If[clip]is not NULL then only points inside of the clipping rectangle are
considered.


    @param points an array of SDL_Point structures representing points to be
enclosed.
    @param clip an SDL_Rect used for clipping or NULL to enclose all points.
    @param result an SDL_Rect structure filled in with the minimal enclosing
rectangle.*)

end

