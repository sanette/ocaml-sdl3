# This example works but is quite subtle:

(it's easier to use the non-callback version)

+ SDL owns the audio thread: therefore when SDL execute the callback,
  it must be registered in an unknown to OCaml thread: needs th Ctypes

  "funptr ~thread_registration:true ~runtime_lock:true "

  optional parameter (otherwise fails with

  "Fatal error: no domain lock held
  Abandon (core dumped)
  ")

+ On the other hand a few other time-consuming SDL functions should
  _release_ the runtime lock otherwise they leave no space for the SDL
  thread to execute -> program hangs, callback not executed at all

  For instance it seems that SDL_DestroyAudioStream needs it, or the program won't exit.
  In the original SDL code they don't call SDL_DestroyAudioStream, probably it's done by SDL_Quit, but then we need  ~release_runtime_lock:true for SDL_Quit

+ we reuse the "sample" array to avoid creating a new one each frame,
  this is safe because the API of SDL_PutAudioStreamData guarantees
  that the data is copied first.
