(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Sdl3_types
module Audio : sig

val get_num_drivers : unit -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetNumAudioDrivers}SDL_GetNumAudioDrivers}: Use this function to get the number of built-in audio drivers.

This function returns a hardcoded number. This never returns a negative
value; if there are no drivers compiled into this build of SDL, this
function returns zero. The presence of a driver in this list does not mean
it will function, it just means SDL is capable of interacting with that
interface. For example, a build of SDL might have esound support, but if
there's no esound server available, SDL's esound driver would fail if used.

By default, SDL tries all drivers, in its preferred order, until one is
found to be usable.


    @return the number of built-in audio drivers.*)

val get_driver : int -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetAudioDriver}SDL_GetAudioDriver}: Use this function to get the name of a built in audio driver.

The list of audio drivers is given in the order that they are normally
initialized by default; the drivers that seem more reasonable to choose
first (as far as the SDL developers believe) are earlier in the list.

The names of drivers are all simple, low-ASCII identifiers, like "alsa",
"coreaudio" or "wasapi". These never have Unicode characters, and are not
meant to be proper names.


    @param index the index of the audio driver; the value ranges from 0 to
SDL_GetNumAudioDrivers() - 1.

    @return the name of the audio driver at the requested index, or NULL if an
invalid index was specified.*)

val get_current_driver : unit -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetCurrentAudioDriver}SDL_GetCurrentAudioDriver}: Get the name of the current audio driver.

The names of drivers are all simple, low-ASCII identifiers, like "alsa",
"coreaudio" or "wasapi". These never have Unicode characters, and are not
meant to be proper names.


    @return the name of the current audio driver or NULL if no driver has been
initialized.*)

val get_playback_devices : unit -> int list
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetAudioPlaybackDevices}SDL_GetAudioPlaybackDevices}: Get a list of currently-connected audio playback devices.

This returns of list of available devices that play sound, perhaps to
speakers or headphones ("playback" devices). If you want devices that
record audio, like a microphone ("recording" devices), use
SDL_GetAudioRecordingDevices() instead.

This only returns a list of physical devices; it will not have any device
IDs returned by SDL_OpenAudioDevice().

If this function returns NULL, to signify an error,[*count]will be set to
zero.


    @return a list of device instance IDs or NULL on error; call
SDL_GetError() for more information. This should be freed with
SDL_free() when it is no longer needed.*)

val get_recording_devices : unit -> int list
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetAudioRecordingDevices}SDL_GetAudioRecordingDevices}: Get a list of currently-connected audio recording devices.

This returns of list of available devices that record audio, like a
microphone ("recording" devices). If you want devices that play sound,
perhaps to speakers or headphones ("playback" devices), use
SDL_GetAudioPlaybackDevices() instead.

This only returns a list of physical devices; it will not have any device
IDs returned by SDL_OpenAudioDevice().

If this function returns NULL, to signify an error,[*count]will be set to
zero.


    @return a list of device instance IDs,, may be empty on failure;
call SDL_GetError() for more information. This should be freed
with SDL_free() when it is no longer needed.*)

val bind_streams : int -> audio_stream list -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_BindAudioStreams}SDL_BindAudioStreams}: Bind a list of audio streams to an audio device.

Audio data will flow through any bound streams. For a playback device, data
for all bound streams will be mixed together and fed to the device. For a
recording device, a copy of recorded data will be provided to each bound
stream.

Audio streams can only be bound to an open device. This operation is
atomic--all streams bound in the same call will start processing at the
same time, so they can stay in sync. Also: either all streams will be bound
or none of them will be.

It is an error to bind an already-bound stream; it must be explicitly
unbound first.

Binding a stream to a device will set its output format for playback
devices, and its input format for recording devices, so they match the
device's settings. The caller is welcome to change the other end of the
stream's format at any time with SDL_SetAudioStreamFormat(). If the other
end of the stream's format has never been set (the audio stream was created
with a NULL audio spec), this function will set it to match the device
end's format.


    @param devid an audio device to bind a stream to.
    @param streams an array of audio streams to bind.*)

val bind_stream : int -> audio_stream -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_BindAudioStream}SDL_BindAudioStream}: Bind a single audio stream to an audio device.

This is a convenience function, equivalent to calling[SDL_BindAudioStreams(devid, &stream, 1)]


    @param devid an audio device to bind a stream to.
    @param stream an audio stream to bind to a device.*)

val unbind_streams : audio_stream list -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_UnbindAudioStreams}SDL_UnbindAudioStreams}: Unbind a list of audio streams from their audio devices.

The streams being unbound do not all have to be on the same device. All
streams on the same device will be unbound atomically (data will stop
flowing through all unbound streams on the same device at the same time).

Unbinding a stream that isn't bound to a device is a legal no-op.


    @param streams an array of audio streams to unbind. Can be NULL or contain
NULL.*)

val set_postmix_callback : int -> audio_postmix_callback option -> data -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetAudioPostmixCallback}SDL_SetAudioPostmixCallback}: Set a callback that fires when data is about to be fed to an audio device.

This is useful for accessing the final mix, perhaps for writing a
visualizer or applying a final effect to the audio data before playback.

The buffer is the final mix of all bound audio streams on an opened device;
this callback will fire regularly for any device that is both opened and
unpaused. If there is no new data to mix, either because no streams are
bound to the device or all the streams are empty, this callback will still
fire with the entire buffer set to silence.

This callback is allowed to make changes to the data; the contents of the
buffer after this call is what is ultimately passed along to the hardware.

The callback is always provided the data in float format (values from -1.0f
to 1.0f), but the number of channels or sample rate may be different than
the format the app requested when opening the device; SDL might have had to
manage a conversion behind the scenes, or the playback might have jumped to
new physical hardware when a system default changed, etc. These details may
change between calls. Accordingly, the size of the buffer might change
between calls as well.

This callback can run at any time, and from any thread; if you need to
serialize access to your app's data, you should provide and use a mutex or
other synchronization device.

All of this to say: there are specific needs this callback can fulfill, but
it is not the simplest interface. Apps should generally provide audio in
their preferred format through an SDL_AudioStream and let SDL handle the
difference.

This function is extremely time-sensitive; the callback should do the least
amount of work possible and return as quickly as it can. The longer the
callback runs, the higher the risk of audio dropouts or other problems.

This function will block until the audio device is in between iterations,
so any existing callback that might be running will finish before this
function sets the new callback and returns.

Setting a NULL callback function disables any previously-set callback.


    @param devid the ID of an opened audio device.
    @param callback a callback function to be called. Can be [None].
    @param userdata app-controlled pointer passed to callback. Can be NULL.*)

val mix : Unsigned.uchar Ctypes.ptr -> Unsigned.uchar Ctypes.ptr -> audio_format_enum -> int -> float -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_MixAudio}SDL_MixAudio}: Mix audio data in a specified format.

This takes an audio buffer[src]of[len]bytes of[format]data and mixes
it into[dst] performing addition, volume adjustment, and overflow
clipping. The buffer pointed to by[dst]must also be[len]bytes of[format]data.

This is provided for convenience -- you can mix your own audio data.

Do not use this function for mixing together more than two streams of
sample data. The output from repeated application of this function may be
distorted by clipping, because there is no accumulator with greater range
than the input (not to mention this being an inefficient way of doing it).

It is a common misconception that this function is required to write audio
data to an output stream in an audio callback. While you can do that,
SDL_MixAudio() is really only needed when you're mixing a single audio
stream with a volume adjustment.


    @param dst the destination for the mixed audio.
    @param src the source audio buffer to be mixed.
    @param format the SDL_AudioFormat structure representing the desired audio
format.
    @param len the length of the audio buffer in bytes.
    @param volume ranges from 0.0 - 1.0, and should be set to 1.0 for full
audio volume.*)

val convert_samples : audio_spec -> Unsigned.uchar Ctypes.ptr -> int -> audio_spec -> (Unsigned.uchar Ctypes.ptr) Ctypes.ptr option -> int result
(** {{:https://wiki.libsdl.org/SDL3/SDL_ConvertAudioSamples}SDL_ConvertAudioSamples}: Convert some audio data of one format to another format.

Please note that this function is for convenience, but should not be used
to resample audio in blocks, as it will introduce audio artifacts on the
boundaries. You should only use this function if you are converting audio
data in its entirety in one call. If you want to convert audio in smaller
chunks, use an SDL_AudioStream, which is designed for this situation.

Internally, this function creates and destroys an SDL_AudioStream on each
use, so it's also less efficient than using one directly, if you need to
convert multiple times.


    @param src_spec the format details of the input audio.
    @param src_data the audio data to be converted.
    @param src_len the len of src_data.
    @param dst_spec the format details of the output audio.
    @param dst_data will be filled with converted audio data,
which should be freed with SDL_free(). On error, it will be
[None].

    @return will be filled with the len of dst_data.*)

end

module AudioDevice : sig

val get_name : int -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetAudioDeviceName}SDL_GetAudioDeviceName}: Get the human-readable name of a specific audio device.

**WARNING**: this function will work with SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK
and SDL_AUDIO_DEVICE_DEFAULT_RECORDING, returning the current default
physical devices' names. However, as the default device may change at any
time, it is likely better to show a generic name to the user, like "System
default audio device" or perhaps "default \[currently %s\]". Do not store
this name to disk to reidentify the device in a later run of the program,
as the default might change in general, and the string will be the name of
a specific device and not the abstract system default.


    @param devid the instance ID of the device to query.

    @return the name of the audio device, or NULL on failure; call
SDL_GetError() for more information.*)

val get_format : int -> audio_spec -> int result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetAudioDeviceFormat}SDL_GetAudioDeviceFormat}: Get the current audio format of a specific audio device.

For an opened device, this will report the format the device is currently
using. If the device isn't yet opened, this will report the device's
preferred format (or a reasonable default if this can't be determined).

You may also specify SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK or
SDL_AUDIO_DEVICE_DEFAULT_RECORDING here, which is useful for getting a
reasonable recommendation before opening the system-recommended default
device.

You can also use this to request the current device buffer size. This is
specified in sample frames and represents the amount of data SDL will feed
to the physical hardware in each chunk. This can be converted to
milliseconds of audio with the following equation:
[ms = (int) ((((Sint64) frames) * 1000) / spec.freq);]
Buffer size is only important if you need low-level control over the audio
playback timing. Most apps do not need this.


    @param devid the instance ID of the device to query.
    @param spec on return, will be filled with device details.

    @return pointer to store device buffer size, in sample frames.
Can be [Error].*)

val get_channel_map : int -> int list
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetAudioDeviceChannelMap}SDL_GetAudioDeviceChannelMap}: Get the current channel map of an audio device.

Channel maps are optional; most things do not need them, instead passing
data in the \[order that SDL expects\](CategoryAudio#channel-layouts).

Audio devices usually have no remapping applied. This is represented by
returning NULL, and does not signify an error.


    @param devid the instance ID of the device to query.

    @return an array of the current channel mapping, with as many elements as
the current output spec's channels, or NULL if default. This
should be freed with SDL_free() when it is no longer needed.*)

val open_ : int -> audio_spec option -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_OpenAudioDevice}SDL_OpenAudioDevice}: Open a specific audio device.

You can open both playback and recording devices through this function.
Playback devices will take data from bound audio streams, mix it, and send
it to the hardware. Recording devices will feed any bound audio streams
with a copy of any incoming data.

An opened audio device starts out with no audio streams bound. To start
audio playing, bind a stream and supply audio data to it. Unlike SDL2,
there is no audio callback; you only bind audio streams and make sure they
have data flowing into them (however, you can simulate SDL2's semantics
fairly closely by using SDL_OpenAudioDeviceStream instead of this
function).

If you don't care about opening a specific device, pass a[devid]of either[SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK]or[SDL_AUDIO_DEVICE_DEFAULT_RECORDING] In this case, SDL will try to pick
the most reasonable default, and may also switch between physical devices
seamlessly later, if the most reasonable default changes during the
lifetime of this opened device (user changed the default in the OS's system
preferences, the default got unplugged so the system jumped to a new
default, the user plugged in headphones on a mobile device, etc). Unless
you have a good reason to choose a specific device, this is probably what
you want.

You may request a specific format for the audio device, but there is no
promise the device will honor that request for several reasons. As such,
it's only meant to be a hint as to what data your app will provide. Audio
streams will accept data in whatever format you specify and manage
conversion for you as appropriate. SDL_GetAudioDeviceFormat can tell you
the preferred format for the device before opening and the actual format
the device is using after opening.

It's legal to open the same device ID more than once; each successful open
will generate a new logical SDL_AudioDeviceID that is managed separately
from others on the same physical device. This allows libraries to open a
device separately from the main app and bind its own streams without
conflicting.

It is also legal to open a device ID returned by a previous call to this
function; doing so just creates another logical device on the same physical
device. This may be useful for making logical groupings of audio streams.

This function returns the opened device ID on success. This is a new,
unique SDL_AudioDeviceID that represents a logical device.

Some backends might offer arbitrary devices (for example, a networked audio
protocol that can connect to an arbitrary server). For these, as a change
from SDL2, you should open a default device ID and use an SDL hint to
specify the target if you care, or otherwise let the backend figure out a
reasonable default. Most backends don't offer anything like this, and often
this would be an end user setting an environment variable for their custom
need, and not something an application should specifically manage.

When done with an audio device, possibly at the end of the app's life, one
should call SDL_CloseAudioDevice() on the returned device id.


    @param devid the device instance id to open, or
SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK or
SDL_AUDIO_DEVICE_DEFAULT_RECORDING for the most reasonable
default device.
    @param spec the requested device configuration. Can be [None] to use
reasonable defaults.

    @return the device ID on success or 0 on failure; call SDL_GetError() for
more information.*)

val is_physical : int -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_IsAudioDevicePhysical}SDL_IsAudioDevicePhysical}: Determine if an audio device is physical (instead of logical).

An SDL_AudioDeviceID that represents physical hardware is a physical
device; there is one for each piece of hardware that SDL can see. Logical
devices are created by calling SDL_OpenAudioDevice or
SDL_OpenAudioDeviceStream, and while each is associated with a physical
device, there can be any number of logical devices on one physical device.

For the most part, logical and physical IDs are interchangeable--if you try
to open a logical device, SDL understands to assign that effort to the
underlying physical device, etc. However, it might be useful to know if an
arbitrary device ID is physical or logical. This function reports which.

This function may return either true or false for invalid device IDs.


    @param devid the device ID to query.

    @return true if devid is a physical device, false if it is logical.*)

val is_playback : int -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_IsAudioDevicePlayback}SDL_IsAudioDevicePlayback}: Determine if an audio device is a playback device (instead of recording).

This function may return either true or false for invalid device IDs.


    @param devid the device ID to query.

    @return true if devid is a playback device, false if it is recording.*)

val pause : int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_PauseAudioDevice}SDL_PauseAudioDevice}: Use this function to pause audio playback on a specified device.

This function pauses audio processing for a given device. Any bound audio
streams will not progress, and no audio will be generated. Pausing one
device does not prevent other unpaused devices from running.

Unlike in SDL2, audio devices start in an _unpaused_ state, since an app
has to bind a stream before any audio will flow. Pausing a paused device is
a legal no-op.

Pausing a device can be useful to halt all audio without unbinding all the
audio streams. This might be useful while a game is paused, or a level is
loading, etc.

Physical devices can not be paused or unpaused, only logical devices
created through SDL_OpenAudioDevice() can be.


    @param devid a device opened by SDL_OpenAudioDevice().*)

val resume : int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_ResumeAudioDevice}SDL_ResumeAudioDevice}: Use this function to unpause audio playback on a specified device.

This function unpauses audio processing for a given device that has
previously been paused with SDL_PauseAudioDevice(). Once unpaused, any
bound audio streams will begin to progress again, and audio can be
generated.

Unlike in SDL2, audio devices start in an _unpaused_ state, since an app
has to bind a stream before any audio will flow. Unpausing an unpaused
device is a legal no-op.

Physical devices can not be paused or unpaused, only logical devices
created through SDL_OpenAudioDevice() can be.


    @param devid a device opened by SDL_OpenAudioDevice().*)

val paused : int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_AudioDevicePaused}SDL_AudioDevicePaused}: Use this function to query if an audio device is paused.

Unlike in SDL2, audio devices start in an _unpaused_ state, since an app
has to bind a stream before any audio will flow.

Physical devices can not be paused or unpaused, only logical devices
created through SDL_OpenAudioDevice() can be. Physical and invalid device
IDs will report themselves as unpaused here.


    @param devid a device opened by SDL_OpenAudioDevice().*)

val get_gain : int -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetAudioDeviceGain}SDL_GetAudioDeviceGain}: Get the gain of an audio device.

The gain of a device is its volume; a larger gain means a louder output,
with a gain of zero being silence.

Audio devices default to a gain of 1.0f (no change in output).

Physical devices may not have their gain changed, only logical devices, and
this function will always return -1.0f when used on physical devices.


    @param devid the audio device to query.

    @return the gain of the device or -1.0f on failure; call SDL_GetError()
for more information.*)

val set_gain : int -> float -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetAudioDeviceGain}SDL_SetAudioDeviceGain}: Change the gain of an audio device.

The gain of a device is its volume; a larger gain means a louder output,
with a gain of zero being silence.

Audio devices default to a gain of 1.0f (no change in output).

Physical devices may not have their gain changed, only logical devices, and
this function will always return false when used on physical devices. While
it might seem attractive to adjust several logical devices at once in this
way, it would allow an app or library to interfere with another portion of
the program's otherwise-isolated devices.

This is applied, along with any per-audiostream gain, during playback to
the hardware, and can be continuously changed to create various effects. On
recording devices, this will adjust the gain before passing the data into
an audiostream; that recording audiostream can then adjust its gain further
when outputting the data elsewhere, if it likes, but that second gain is
not applied until the data leaves the audiostream again.


    @param devid the audio device on which to change gain.
    @param gain the gain. 1.0f is no change, 0.0f is silence.*)

val close : int -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_CloseAudioDevice}SDL_CloseAudioDevice}: Close a previously-opened audio device.

The application should close open audio devices once they are no longer
needed.

This function may block briefly while pending audio data is played by the
hardware, so that applications don't drop the last buffer of data they
supplied if terminating immediately afterwards.


    @param devid an audio device id previously returned by
SDL_OpenAudioDevice().
*)

val open_stream : int -> audio_spec option -> audio_stream_callback option -> data -> audio_stream result
(** {{:https://wiki.libsdl.org/SDL3/SDL_OpenAudioDeviceStream}SDL_OpenAudioDeviceStream}: Convenience function for straightforward audio init for the common case.

If all your app intends to do is provide a single source of PCM audio, this
function allows you to do all your audio setup in a single call.

This is also intended to be a clean means to migrate apps from SDL2.

This function will open an audio device, create a stream and bind it.
Unlike other methods of setup, the audio device will be closed when this
stream is destroyed, so the app can treat the returned SDL_AudioStream as
the only object needed to manage audio playback.

Also unlike other functions, the audio device begins paused. This is to map
more closely to SDL2-style behavior, since there is no extra step here to
bind a stream to begin audio flowing. The audio device should be resumed
with SDL_ResumeAudioStreamDevice().

This function works with both playback and recording devices.

The[spec]parameter represents the app's side of the audio stream. That
is, for recording audio, this will be the output format, and for playing
audio, this will be the input format. If spec is NULL, the system will
choose the format, and the app can use SDL_GetAudioStreamFormat() to obtain
this information later.

If you don't care about opening a specific audio device, you can (and
probably _should_), use SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK for playback and
SDL_AUDIO_DEVICE_DEFAULT_RECORDING for recording.

One can optionally provide a callback function; if NULL, the app is
expected to queue audio data for playback (or unqueue audio data if
capturing). Otherwise, the callback will begin to fire once the device is
unpaused.

Destroying the returned stream with SDL_DestroyAudioStream will also close
the audio device associated with this stream.


    @param devid an audio device to open, or SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK
or SDL_AUDIO_DEVICE_DEFAULT_RECORDING.
    @param spec the audio stream's data format. Can be [None].
    @param callback a callback where the app will provide new data for
playback, or receive new data for recording. Can be [None],
in which case the app will need to call
SDL_PutAudioStreamData or SDL_GetAudioStreamData as
necessary.
    @param userdata app-controlled pointer passed to callback. Can be NULL.
Ignored if callback is NULL.

    @return an audio stream on success, ready to use, or [Error] on failure; call
SDL_GetError() for more information. When done with this stream,
call SDL_DestroyAudioStream to free resources and close the
device.*)

end

module AudioStream : sig

val unbind : audio_stream option -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_UnbindAudioStream}SDL_UnbindAudioStream}: Unbind a single audio stream from its audio device.

This is a convenience function, equivalent to calling[SDL_UnbindAudioStreams(&stream, 1)]


    @param stream an audio stream to unbind from a device. Can be [None].
*)

val get_device : audio_stream -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamDevice}SDL_GetAudioStreamDevice}: Query an audio stream for its currently-bound device.

This reports the logical audio device that an audio stream is currently
bound to.

If not bound, or invalid, this returns zero, which is not a valid device
ID.


    @param stream the audio stream to query.

    @return the bound audio device, or 0 if not bound or invalid.*)

val create : audio_spec option -> audio_spec option -> audio_stream result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateAudioStream}SDL_CreateAudioStream}: Create a new audio stream.

Note that[src_spec]or[dst_spec]may be NULL, but any attempts to
put or get data from an audio stream will fail until it has valid
specs assigned to both ends of the stream. Specs can be assigned later
through SDL_SetAudioStreamFormat(), or binding the stream to an audio
device (which will set the format of only the input or output,
depending on what kind of device the stream was bound to).


    @param src_spec the format details of the input audio. May be [None].
    @param dst_spec the format details of the output audio. May be [None].

    @return a new audio stream on success or [Error] on failure; call
SDL_GetError() for more information.*)

val get_properties : audio_stream -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamProperties}SDL_GetAudioStreamProperties}: Get the properties associated with an audio stream.

The application can hang any data it wants here, but the following
properties are understood by SDL:

-[SDL_PROP_AUDIOSTREAM_AUTO_CLEANUP_BOOLEAN] if true (the default), the
  stream be automatically cleaned up when the audio subsystem quits. If set
  to false, the streams will persist beyond that. This property is ignored
  for streams created through SDL_OpenAudioDeviceStream(), and will always
  be cleaned up. Streams that are not cleaned up will still be unbound from
  devices when the audio subsystem quits. This property was added in SDL
  3.4.0.


    @param stream the SDL_AudioStream to query.

    @return a valid property ID on success or 0 on failure; call
SDL_GetError() for more information.*)

val get_format : audio_stream -> audio_spec option -> audio_spec option -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamFormat}SDL_GetAudioStreamFormat}: Query the current format of an audio stream.


    @param stream the SDL_AudioStream to query.
    @param src_spec where to store the input audio format; ignored if [None].
    @param dst_spec where to store the output audio format; ignored if [None].*)

val set_format : audio_stream -> audio_spec option -> audio_spec option -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetAudioStreamFormat}SDL_SetAudioStreamFormat}: Change the input and output formats of an audio stream.

Future calls to and SDL_GetAudioStreamAvailable and SDL_GetAudioStreamData
will reflect the new format, and future calls to SDL_PutAudioStreamData
must provide data in the new input formats.

Data that was previously queued in the stream will still be operated on in
the format that was current when it was added, which is to say you can put
the end of a sound file in one format to a stream, change formats for the
next sound file, and start putting that new data while the previous sound
file is still queued, and everything will still play back correctly.

If a stream is bound to a device, then the format of the side of the stream
bound to a device cannot be changed (src_spec for recording devices,
dst_spec for playback devices). Attempts to make a change to this side will
be ignored, but this will not report an error. The other side's format can
be changed.
[src_spec]and[dst_spec]may each be NULL; a NULL spec signals not to
change the current format for that side of the stream.


    @param stream the stream the format is being changed.
    @param src_spec the new format of the audio input; if [None], it is not
changed.
    @param dst_spec the new format of the audio output; if [None], it is not
changed.*)

val get_frequency_ratio : audio_stream -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamFrequencyRatio}SDL_GetAudioStreamFrequencyRatio}: Get the frequency ratio of an audio stream.


    @param stream the SDL_AudioStream to query.

    @return the frequency ratio of the stream or 0.0 on failure; call
SDL_GetError() for more information.*)

val set_frequency_ratio : audio_stream -> float -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetAudioStreamFrequencyRatio}SDL_SetAudioStreamFrequencyRatio}: Change the frequency ratio of an audio stream.

The frequency ratio is used to adjust the rate at which input data is
consumed. Changing this effectively modifies the speed and pitch of the
audio. A value greater than 1.0f will play the audio faster, and at a
higher pitch. A value less than 1.0f will play the audio slower, and at a
lower pitch. 1.0f means play at normal speed.

This is applied during SDL_GetAudioStreamData, and can be continuously
changed to create various effects.


    @param stream the stream on which the frequency ratio is being changed.
    @param ratio the frequency ratio. 1.0 is normal speed. Must be between 0.01
and 100.*)

val get_gain : audio_stream -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamGain}SDL_GetAudioStreamGain}: Get the gain of an audio stream.

The gain of a stream is its volume; a larger gain means a louder output,
with a gain of zero being silence.

Audio streams default to a gain of 1.0f (no change in output).


    @param stream the SDL_AudioStream to query.

    @return the gain of the stream or -1.0f on failure; call SDL_GetError()
for more information.*)

val set_gain : audio_stream -> float -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetAudioStreamGain}SDL_SetAudioStreamGain}: Change the gain of an audio stream.

The gain of a stream is its volume; a larger gain means a louder output,
with a gain of zero being silence.

Audio streams default to a gain of 1.0f (no change in output).

This is applied during SDL_GetAudioStreamData, and can be continuously
changed to create various effects.


    @param stream the stream on which the gain is being changed.
    @param gain the gain. 1.0f is no change, 0.0f is silence.*)

val get_input_channel_map : audio_stream -> int list
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamInputChannelMap}SDL_GetAudioStreamInputChannelMap}: Get the current input channel map of an audio stream.

Channel maps are optional; most things do not need them, instead passing
data in the \[order that SDL expects\](CategoryAudio#channel-layouts).

Audio streams default to no remapping applied. This is represented by
returning NULL, and does not signify an error.


    @param stream the SDL_AudioStream to query.

    @return an array of the current channel mapping, with as many elements as
the current output spec's channels, or NULL if default. This
should be freed with SDL_free() when it is no longer needed.*)

val get_output_channel_map : audio_stream -> int list
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamOutputChannelMap}SDL_GetAudioStreamOutputChannelMap}: Get the current output channel map of an audio stream.

Channel maps are optional; most things do not need them, instead passing
data in the \[order that SDL expects\](CategoryAudio#channel-layouts).

Audio streams default to no remapping applied. This is represented by
returning NULL, and does not signify an error.


    @param stream the SDL_AudioStream to query.

    @return an array of the current channel mapping, with as many elements as
the current output spec's channels, or NULL if default. This
should be freed with SDL_free() when it is no longer needed.*)

val set_input_channel_map : audio_stream -> int Ctypes.ptr option -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetAudioStreamInputChannelMap}SDL_SetAudioStreamInputChannelMap}: Set the current input channel map of an audio stream.

Channel maps are optional; most things do not need them, instead passing
data in the \[order that SDL expects\](CategoryAudio#channel-layouts).

The input channel map reorders data that is added to a stream via
SDL_PutAudioStreamData. Future calls to SDL_PutAudioStreamData must provide
data in the new channel order.

Each item in the array represents an input channel, and its value is the
channel that it should be remapped to. To reverse a stereo signal's left
and right values, you'd have an array of[{ 1, 0 }] It is legal to remap
multiple channels to the same thing, so[{ 1, 1 }]would duplicate the
right channel to both channels of a stereo signal. An element in the
channel map set to -1 instead of a valid channel will mute that channel,
setting it to a silence value.

You cannot change the number of channels through a channel map, just
reorder/mute them.

Data that was previously queued in the stream will still be operated on in
the order that was current when it was added, which is to say you can put
the end of a sound file in one order to a stream, change orders for the
next sound file, and start putting that new data while the previous sound
file is still queued, and everything will still play back correctly.

Audio streams default to no remapping applied. Passing a NULL channel map
is legal, and turns off remapping.

SDL will copy the channel map; the caller does not have to save this array
after this call.

If[count]is not equal to the current number of channels in the audio
stream's format, this will fail. This is a safety measure to make sure a
race condition hasn't changed the format while this call is setting the
channel map.

Unlike attempting to change the stream's format, the input channel map on a
stream bound to a recording device is permitted to change at any time; any
data added to the stream from the device after this call will have the new
mapping, but previously-added data will still have the prior mapping.


    @param stream the SDL_AudioStream to change.
    @param chmap the new channel map, [None] to reset to default.
    @param count The number of channels in the map.*)

val set_output_channel_map : audio_stream -> int Ctypes.ptr option -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetAudioStreamOutputChannelMap}SDL_SetAudioStreamOutputChannelMap}: Set the current output channel map of an audio stream.

Channel maps are optional; most things do not need them, instead passing
data in the \[order that SDL expects\](CategoryAudio#channel-layouts).

The output channel map reorders data that is leaving a stream via
SDL_GetAudioStreamData.

Each item in the array represents an input channel, and its value is the
channel that it should be remapped to. To reverse a stereo signal's left
and right values, you'd have an array of[{ 1, 0 }] It is legal to remap
multiple channels to the same thing, so[{ 1, 1 }]would duplicate the
right channel to both channels of a stereo signal. An element in the
channel map set to -1 instead of a valid channel will mute that channel,
setting it to a silence value.

You cannot change the number of channels through a channel map, just
reorder/mute them.

The output channel map can be changed at any time, as output remapping is
applied during SDL_GetAudioStreamData.

Audio streams default to no remapping applied. Passing a NULL channel map
is legal, and turns off remapping.

SDL will copy the channel map; the caller does not have to save this array
after this call.

If[count]is not equal to the current number of channels in the audio
stream's format, this will fail. This is a safety measure to make sure a
race condition hasn't changed the format while this call is setting the
channel map.

Unlike attempting to change the stream's format, the output channel map on
a stream bound to a recording device is permitted to change at any time;
any data added to the stream after this call will have the new mapping, but
previously-added data will still have the prior mapping. When the channel
map doesn't match the hardware's channel layout, SDL will convert the data
before feeding it to the device for playback.


    @param stream the SDL_AudioStream to change.
    @param chmap the new channel map, [None] to reset to default.
    @param count The number of channels in the map.*)

val put_data : ?count:int -> audio_stream -> ('a, 'b, 'c) Bigarray.Array1.t -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_PutAudioStreamData}SDL_PutAudioStreamData}: Add data to the stream.

This data must match the format/channels/samplerate specified in the latest
call to SDL_SetAudioStreamFormat, or the format specified when creating the
stream if it hasn't been changed.

Note that this call simply copies the unconverted data for later. This is
different than SDL2, where data was converted during the Put call and the
Get call would just dequeue the previously-converted data.


    @param stream the stream the audio data is being added to.
    @param buf a pointer to the audio data to add.*)

val put_data_no_copy : audio_stream -> data -> int -> audio_stream_data_complete_callback option -> data -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_PutAudioStreamDataNoCopy}SDL_PutAudioStreamDataNoCopy}: Add external data to an audio stream without copying it.

Unlike SDL_PutAudioStreamData(), this function does not make a copy of the
provided data, instead storing the provided pointer. This means that the
put operation does not need to allocate and copy the data, but the original
data must remain available until the stream is done with it, either by
being read from the stream in its entirety, or a call to
SDL_ClearAudioStream() or SDL_DestroyAudioStream().

The data must match the format/channels/samplerate specified in the latest
call to SDL_SetAudioStreamFormat, or the format specified when creating the
stream if it hasn't been changed.

An optional callback may be provided, which is called when the stream no
longer needs the data. Once this callback fires, the stream will not access
the data again. This callback will fire for any reason the data is no
longer needed, including clearing or destroying the stream.

Note that there is still an allocation to store tracking information, so
this function is more efficient for larger blocks of data. If you're
planning to put a few samples at a time, it will be more efficient to use
SDL_PutAudioStreamData(), which allocates and buffers in blocks.


    @param stream the stream the audio data is being added to.
    @param buf a pointer to the audio data to add.
    @param len the number of bytes to add to the stream.
    @param callback the callback function to call when the data is no longer
needed by the stream. May be [None].
    @param userdata an opaque pointer provided to the callback for its own
personal use.*)

val put_planar_data : audio_stream -> data Ctypes.ptr -> int -> int -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_PutAudioStreamPlanarData}SDL_PutAudioStreamPlanarData}: Add data to the stream with each channel in a separate array.

This data must match the format/channels/samplerate specified in the latest
call to SDL_SetAudioStreamFormat, or the format specified when creating the
stream if it hasn't been changed.

The data will be interleaved and queued. Note that SDL_AudioStream only
operates on interleaved data, so this is simply a convenience function for
easily queueing data from sources that provide separate arrays. There is no
equivalent function to retrieve planar data.

The arrays in[channel_buffers]are ordered as they are to be interleaved;
the first array will be the first sample in the interleaved data. Any
individual array may be NULL; in this case, silence will be interleaved for
that channel.
[num_channels]specifies how many arrays are in[channel_buffers] This can
be used as a safety to prevent overflow, in case the stream format has
changed elsewhere. If more channels are specified than the current input
spec, they are ignored. If less channels are specified, the missing arrays
are treated as if they are NULL (silence is written to those channels). If
the count is -1, SDL will assume the array count matches the current input
spec.

Note that[num_samples]is the number of _samples per array_. This can also
be thought of as the number of _sample frames_ to be queued. A value of 1
with stereo arrays will queue two samples to the stream. This is different
than SDL_PutAudioStreamData, which wants the size of a single array in
bytes.


    @param stream the stream the audio data is being added to.
    @param channel_buffers a pointer to an array of arrays, one array per
channel.
    @param num_channels the number of arrays in[channel_buffers]or -1.
    @param num_samples the number of _samples_ per array to write to the
stream.*)

val get_data : audio_stream -> data -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamData}SDL_GetAudioStreamData}: Get converted/resampled data from the stream.

The input/output data format/channels/samplerate is specified when creating
the stream, and can be changed after creation by calling
SDL_SetAudioStreamFormat.

Note that any conversion and resampling necessary is done during this call,
and SDL_PutAudioStreamData simply queues unconverted data for later. This
is different than SDL2, where that work was done while inputting new data
to the stream and requesting the output just copied the converted data.


    @param stream the stream the audio is being requested from.
    @param buf a buffer to fill with audio data.
    @param len the maximum number of bytes to fill.

    @return the number of bytes read from the stream or -1 on failure; call
SDL_GetError() for more information.*)

val get_available : audio_stream -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamAvailable}SDL_GetAudioStreamAvailable}: Get the number of converted/resampled bytes available.

The stream may be buffering data behind the scenes until it has enough to
resample correctly, so this number might be lower than what you expect, or
even be zero. Add more data or flush the stream if you need the data now.

If the stream has so much data that it would overflow an int, the return
value is clamped to a maximum value, but no queued data is lost; if there
are gigabytes of data queued, the app might need to read some of it with
SDL_GetAudioStreamData before this function's return value is no longer
clamped.


    @param stream the audio stream to query.

    @return the number of converted/resampled bytes available or -1 on
failure; call SDL_GetError() for more information.*)

val get_queued : audio_stream -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetAudioStreamQueued}SDL_GetAudioStreamQueued}: Get the number of bytes currently queued.

This is the number of bytes put into a stream as input, not the number that
can be retrieved as output. Because of several details, it's not possible
to calculate one number directly from the other. If you need to know how
much usable data can be retrieved right now, you should use
SDL_GetAudioStreamAvailable() and not this function.

Note that audio streams can change their input format at any time, even if
there is still data queued in a different format, so the returned byte
count will not necessarily match the number of _sample frames_ available.
Users of this API should be aware of format changes they make when feeding
a stream and plan accordingly.

Queued data is not converted until it is consumed by
SDL_GetAudioStreamData, so this value should be representative of the exact
data that was put into the stream.

If the stream has so much data that it would overflow an int, the return
value is clamped to a maximum value, but no queued data is lost; if there
are gigabytes of data queued, the app might need to read some of it with
SDL_GetAudioStreamData before this function's return value is no longer
clamped.


    @param stream the audio stream to query.

    @return the number of bytes queued or -1 on failure; call SDL_GetError()
for more information.*)

val flush : audio_stream -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_FlushAudioStream}SDL_FlushAudioStream}: Tell the stream that you're done sending data, and anything being buffered
should be converted/resampled and made available immediately.

It is legal to add more data to a stream after flushing, but there may be
audio gaps in the output. Generally this is intended to signal the end of
input, so the complete output becomes available.


    @param stream the audio stream to flush.*)

val clear : audio_stream -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_ClearAudioStream}SDL_ClearAudioStream}: Clear any pending data in the stream.

This drops any queued data, so there will be nothing to read from the
stream until more is added.


    @param stream the audio stream to clear.*)

val pause_device : audio_stream -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_PauseAudioStreamDevice}SDL_PauseAudioStreamDevice}: Use this function to pause audio playback on the audio device associated
with an audio stream.

This function pauses audio processing for a given device. Any bound audio
streams will not progress, and no audio will be generated. Pausing one
device does not prevent other unpaused devices from running.

Pausing a device can be useful to halt all audio without unbinding all the
audio streams. This might be useful while a game is paused, or a level is
loading, etc.


    @param stream the audio stream associated with the audio device to pause.*)

val resume_device : audio_stream -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_ResumeAudioStreamDevice}SDL_ResumeAudioStreamDevice}: Use this function to unpause audio playback on the audio device associated
with an audio stream.

This function unpauses audio processing for a given device that has
previously been paused. Once unpaused, any bound audio streams will begin
to progress again, and audio can be generated.

SDL_OpenAudioDeviceStream opens audio devices in a paused state, so this
function call is required for audio playback to begin on such devices.


    @param stream the audio stream associated with the audio device to resume.*)

val device_paused : audio_stream -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_AudioStreamDevicePaused}SDL_AudioStreamDevicePaused}: Use this function to query if an audio device associated with a stream is
paused.

Unlike in SDL2, audio devices start in an _unpaused_ state, since an app
has to bind a stream before any audio will flow.


    @param stream the audio stream associated with the audio device to query.*)

val lock : audio_stream -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_LockAudioStream}SDL_LockAudioStream}: Lock an audio stream for serialized access.

Each SDL_AudioStream has an internal mutex it uses to protect its data
structures from threading conflicts. This function allows an app to lock
that mutex, which could be useful if registering callbacks on this stream.

One does not need to lock a stream to use in it most cases, as the stream
manages this lock internally. However, this lock is held during callbacks,
which may run from arbitrary threads at any time, so if an app needs to
protect shared data during those callbacks, locking the stream guarantees
that the callback is not running while the lock is held.

As this is just a wrapper over SDL_LockMutex for an internal lock; it has
all the same attributes (recursive locks are allowed, etc).


    @param stream the audio stream to lock.*)

val unlock : audio_stream -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_UnlockAudioStream}SDL_UnlockAudioStream}: Unlock an audio stream for serialized access.

This unlocks an audio stream after a call to SDL_LockAudioStream.


    @param stream the audio stream to unlock.*)

val set_get_callback : audio_stream -> audio_stream_callback -> data -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetAudioStreamGetCallback}SDL_SetAudioStreamGetCallback}: Set a callback that runs when data is requested from an audio stream.

This callback is called _before_ data is obtained from the stream, giving
the callback the chance to add more on-demand.

The callback can (optionally) call SDL_PutAudioStreamData() to add more
audio to the stream during this call; if needed, the request that triggered
this callback will obtain the new data immediately.

The callback's[additional_amount]argument is roughly how many bytes of
_unconverted_ data (in the stream's input format) is needed by the caller,
although this may overestimate a little for safety. This takes into account
how much is already in the stream and only asks for any extra necessary to
resolve the request, which means the callback may be asked for zero bytes,
and a different amount on each call.

The callback is not required to supply exact amounts; it is allowed to
supply too much or too little or none at all. The caller will get what's
available, up to the amount they requested, regardless of this callback's
outcome.

Clearing or flushing an audio stream does not call this callback.

This function obtains the stream's lock, which means any existing callback
(get or put) in progress will finish running before setting the new
callback.

Setting a NULL function turns off the callback.


    @param stream the audio stream to set the new callback on.
    @param callback the new callback function to call when data is requested
from the stream.
    @param userdata an opaque pointer provided to the callback for its own
personal use.*)

val set_put_callback : audio_stream -> audio_stream_callback -> data -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetAudioStreamPutCallback}SDL_SetAudioStreamPutCallback}: Set a callback that runs when data is added to an audio stream.

This callback is called _after_ the data is added to the stream, giving the
callback the chance to obtain it immediately.

The callback can (optionally) call SDL_GetAudioStreamData() to obtain audio
from the stream during this call.

The callback's[additional_amount]argument is how many bytes of
_converted_ data (in the stream's output format) was provided by the
caller, although this may underestimate a little for safety. This value
might be less than what is currently available in the stream, if data was
already there, and might be less than the caller provided if the stream
needs to keep a buffer to aid in resampling. Which means the callback may
be provided with zero bytes, and a different amount on each call.

The callback may call SDL_GetAudioStreamAvailable to see the total amount
currently available to read from the stream, instead of the total provided
by the current call.

The callback is not required to obtain all data. It is allowed to read less
or none at all. Anything not read now simply remains in the stream for
later access.

Clearing or flushing an audio stream does not call this callback.

This function obtains the stream's lock, which means any existing callback
(get or put) in progress will finish running before setting the new
callback.

Setting a NULL function turns off the callback.


    @param stream the audio stream to set the new callback on.
    @param callback the new callback function to call when data is added to the
stream.
    @param userdata an opaque pointer provided to the callback for its own
personal use.*)

val destroy : audio_stream -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_DestroyAudioStream}SDL_DestroyAudioStream}: Free an audio stream.

This will release all allocated data, including any audio that is still
queued. You do not need to manually clear the stream first.

If this stream was bound to an audio device, it is unbound during this
call. If this stream was created with SDL_OpenAudioDeviceStream, the audio
device that was opened alongside this stream's creation will be closed,
too.


    @param stream the audio stream to destroy.
*)

end

module Global : sig

val load_wav_io : io_stream -> bool -> audio_spec -> (Unsigned.uchar Ctypes.ptr) Ctypes.ptr -> int result
(** {{:https://wiki.libsdl.org/SDL3/SDL_LoadWAV_IO}SDL_LoadWAV_IO}: Load the audio data of a WAVE file into memory.

Loading a WAVE file requires[src][spec][audio_buf]and[audio_len]to
be valid pointers. The entire data portion of the file is then loaded into
memory and decoded if necessary.

Supported formats are RIFF WAVE files with the formats PCM (8, 16, 24, and
32 bits), IEEE Float (32 bits), Microsoft ADPCM and IMA ADPCM (4 bits), and
A-law and mu-law (8 bits). Other formats are currently unsupported and
cause an error.

If this function succeeds, the return value is zero and the pointer to the
audio data allocated by the function is written to[audio_buf]and its
length in bytes to[audio_len] The SDL_AudioSpec members[freq][channels] and[format]are set to the values of the audio data in the
buffer.

It's necessary to use SDL_free() to free the audio data returned in[audio_buf]when it is no longer used.

Because of the underspecification of the .WAV format, there are many
problematic files in the wild that cause issues with strict decoders. To
provide compatibility with these files, this decoder is lenient in regards
to the truncation of the file, the fact chunk, and the size of the RIFF
chunk. The hints[SDL_HINT_WAVE_RIFF_CHUNK_SIZE][SDL_HINT_WAVE_TRUNCATION] and[SDL_HINT_WAVE_FACT_CHUNK]can be used to
tune the behavior of the loading process.

Any file that is invalid (due to truncation, corruption, or wrong values in
the headers), too big, or unsupported causes an error. Additionally, any
critical I/O error from the data source will terminate the loading process
with an error. The function returns NULL on error and in all cases (with
the exception of[src]being NULL), an appropriate error message will be
set.

It is required that the data source supports seeking.

Example:

{[
SDL_LoadWAV_IO(SDL_IOFromFile("sample.wav", "rb"), true, &spec, &buf, &len);
]}

Note that the SDL_LoadWAV function does this same thing for you, but in a
less messy way:

{[
SDL_LoadWAV("sample.wav", &spec, &buf, &len);
]}


    @param src the data source for the WAVE data.
    @param closeio if true, calls SDL_CloseIO() on[src]before returning, even
in the case of an error.
    @param spec a pointer to an SDL_AudioSpec that will be set to the WAVE
data's format details on successful return.
    @param audio_buf a pointer filled with the audio data, allocated by the
function.

    @return a pointer filled with the length of the audio data buffer
in bytes.*)

val load_wav : string -> (audio_spec * (int, Bigarray.int8_unsigned_elt, Bigarray.c_layout) Bigarray.Array1.t) result
(** {{:https://wiki.libsdl.org/SDL3/SDL_LoadWAV}SDL_LoadWAV}: Loads a WAV from a file path.

This is a convenience function that is effectively the same as:

{[
SDL_LoadWAV_IO(SDL_IOFromFile(path, "rb"), true, spec, audio_buf, audio_len);
]}


    @param path the file path of the WAV file to open.
    @param spec a pointer to an SDL_AudioSpec that will be set to the WAVE
data's format details on successful return.

    @return 2 values:
(
  + audio_buf : a pointer filled with the audio data, allocated by the
function.,
  + audio_len : a pointer filled with the length of the audio data buffer
in bytes.
)*)

val get_silence_value_for_format : audio_format_enum -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetSilenceValueForFormat}SDL_GetSilenceValueForFormat}: Get the appropriate memset value for silencing an audio format.

The value returned by this function can be used as the second argument to
memset (or SDL_memset) to set an audio buffer in a specific format to
silence.


    @param format the audio data format to query.

    @return a byte value that can be passed to memset.*)

end
include module type of Global

module AudioFormat : sig

val get_name : audio_format_enum -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetAudioFormatName}SDL_GetAudioFormatName}: Get the human readable name of an audio format.


    @param format the audio format to query.

    @return the human readable name of the specified audio format or
"SDL_AUDIO_UNKNOWN" if the format isn't recognized.*)

end

