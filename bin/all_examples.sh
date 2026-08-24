#!/bin/bash

cd /home/san/prog/ocaml/sdl/sdl3/dune-version/bin
export SDL3_LIBRARY=/home/san/prog/ocaml/sdl/sdl3/vendored/SDL/build/libSDL3.so

echo "main"
dune exec ./main.exe
read
echo "test"
dune exec ./test.exe
read
echo "example"
dune exec ./example.exe

cd examples/audio/01-simple-playback/
dune exec ./simple_playback.exe
cd ../02-simple-playback-callback
dune exec ./simple_playback_callback.exe
cd ../04-multiple-streams
dune exec ./multiple_streams.exe

cd ../../renderer/01-clear
dune exec ./clear.exe
cd ../04-points
dune exec ./points.exe
cd ../10-geometry/
dune exec ./geometry.exe
cd ../17-read-pixels
dune exec ./read_pixels.exe
cd ../19-affine-textures
dune exec ./affine_textures.exe

cd ../../camera/01-read-and-draw
dune exec ./read_and_draw.exe

cd ../../storage/01-user
dune exec ./user.exe
