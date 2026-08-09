# The marvellous Simple DirectMedia Layer

Since you're reading this, it means you want to have fun with OCaml!
Indeed [SDL](https://www.libsdl.org/) has many features to play
with. Graphics, of course, but not only: do you want to fiddle with
your web cam? Do you want to save your program data in the user's
directory without worrying about the platform? To play wav files on
any available audio device? To control your app with your joystick?
Yes we can ;)

# SDL3 and OCaml

In 2025, SDL underwent a major makeover, transiting from SDL2 to
SDL3. There are several OCaml bindings for SDL2
([tsdl](https://erratique.ch/software/tsdl) -- or the
["compat"](https://github.com/sanette/tsdl) version for better Windows
compatibility, and
[ocamlsdl2](https://github.com/fccm2/OCamlSDL2)). But to my knowledge
`ocaml-sdl3` is currently the only one, and is still a work in
progress.  If you keep reading after this point, you must be very
adventurous and want to give it a try. Welcome!

# Results

Most SDL functions don't throw an exception when they fail, the simply
return NULL or false, so that the programmer can easily deal with
it. Indeed, since SDL is a device library, an error does not mean your
program is necessarily bogus, it may just be that the device is not
reachable. You don't want your beautiful music player to crash when
the user switches to another audio device!

Like `tsdl`, `sdl3` uses exensively the OCaml `Result` module to
nicely collect the result value of all all these functions in a safe
way. For instance, when creating a window and a renderer, you can do

```ocaml
	match Sdl.create_window_and_renderer "my_app" 640 480
            Sdl.window_resizable with
    | Error (`Msg e) -> Sdl.App.log "Couldn't create window/renderer: %s" e
    | Ok (window, renderer) -> (* do something which returns [unit] *)
```

Of course, this may seem a bit heavy. If you look at the official SDL
examples in C, a very similar code (with error logs) is used for this
function (`SDL_CreateWindowAndRenderer`), but for less critical
functions, like `Sdl_Renderpresent`, the error result is often simply
ignored. You can achieve this "unsafe" behaviour thanks to
`Result.get_ok`. For instance, define

```ocaml
	let go = Result.get_ok
```

and then use it like this:

```ocaml
	  Sdl.Renderer.render_present renderer |> go;
```

Note, this OCaml version is "safer" than the C code since it will
throw an exception in case of error.

You may also obtain less "heavy" constructions (depending on your
taste), even when you explicitely check for error, by using OCaml
"let-binding" operators. For instance, first define:

```ocaml
	let ( let* ) (o, errmsg) f =
		match o with
		| Error (`Msg e) -> Sdl.App.log "%s: %s" errmsg e
		| Ok x -> f x
```

and then you can use

```ocaml
	let* (window, renderer) = Sdl.create_window_and_renderer "my_app"
      640 480 Sdl.window_resizable, "Couldn't create window/renderer" in
	  (* do something which returns [unit].*)
```
