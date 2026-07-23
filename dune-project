(lang dune 3.20)

(name sdl3)
(version "0.0.1--alpha")

(generate_opam_files true)

(license ISC)
(maintainers "Vu Ngoc San <san.vu-ngoc@laposte.net>")
(authors "Vu Ngoc San <san.vu-ngoc@laposte.net>")
(source (github sanette/ocaml-sdl3))

(package
 (name sdl3)
 (synopsis "OCaml bindings to SDL3")
 (description "The bindings cover the core SDL3 library")
 (depends
   ocaml
   ctypes
   ctypes-foreign)

 (tags
  (sdl sdl3 graphics events devices)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/reference/dune-project/index.html
