Some parts of the API allow you to do bad things!  (C programmers know
this, it's always the case... But OCaml programmers tend to think that
everything that the API allows is safe and good --- which is why we
love OCaml!  Here in OCaml-sdl3, we are kind of in-between, but quite
close to C...)

# Callbacks

Some SDL functions take a function as an argument, to be called later
(sometimes in a different thread). However the lifetime of the
function is governed by OCaml, who has no clue as to when it will
really be safe to kill it. Therefore you should "save" the function,
that is to say, register it in a variable that you know will be kept
alive by the OCaml GC long enough. (See for instance the
`audio/simple-playback` example.)

# Structured stucture fields

Some structure types (like `Vertex`) have fields that are themselves
structures (like "position" which is an `f_point`). When you create a
Vertex with the `T.Vertex.create` function, all fields are
initialized. In particular, the "position" field is created. Therefore

1. When creating a Vertex, you should not use the `~position`
   parameter with an `f_point` value of your own, as in `Vertex.create
   ~position ...`, because the initially created "position" will
   probably never be freed. (Here, it's not very important because the
   additional memory usage is quite small). Instead, modify the field
   after creation:

   ```ocaml
   let v = T.Vertex.create () in
   let position = T.Vertex.(get v position) in
   T.FPoint.(set position x 150.)  (* etc... *)
   ```

2. More importantly, you should never update the structure field (like
   "position") with a new one using `Vertex.(set position
   new_position)` because the old position will never be freed, and if
   you do this in a loop you will have a memory leak. Instead, mutate
   the position 'in-place' as before.

# Atomic

Do not access directly the "value" field of an `AtomicInt` or `AtomicU32`.
