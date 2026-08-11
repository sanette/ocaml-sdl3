(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

module T = Sdl3_types

(* Access by SDL Categories: *)
module Categories = struct
module Assert = Sdl3_assert_bindings
module Asyncio = Sdl3_asyncio_bindings
module Atomic = Sdl3_atomic_bindings
module Audio = Sdl3_audio_bindings
module Blendmode = Sdl3_blendmode_bindings
module Camera = Sdl3_camera_bindings
module Clipboard = Sdl3_clipboard_bindings
module Cpuinfo = Sdl3_cpuinfo_bindings
module Dialog = Sdl3_dialog_bindings
module Error = Sdl3_error_bindings
module Events = Sdl3_events_bindings
module Filesystem = Sdl3_filesystem_bindings
module Gamepad = Sdl3_gamepad_bindings
module Gpu = Sdl3_gpu_bindings
module Guid = Sdl3_guid_bindings
module Haptic = Sdl3_haptic_bindings
module Hidapi = Sdl3_hidapi_bindings
module Hints = Sdl3_hints_bindings
module Init = Sdl3_init_bindings
module Iostream = Sdl3_iostream_bindings
module Joystick = Sdl3_joystick_bindings
module Keyboard = Sdl3_keyboard_bindings
module Loadso = Sdl3_loadso_bindings
module Locale = Sdl3_locale_bindings
module Log = Sdl3_log_bindings
module Messagebox = Sdl3_messagebox_bindings
module Metal = Sdl3_metal_bindings
module Misc = Sdl3_misc_bindings
module Mouse = Sdl3_mouse_bindings
module Mutex = Sdl3_mutex_bindings
module Pen = Sdl3_pen_bindings
module Pixels = Sdl3_pixels_bindings
module Platform = Sdl3_platform_bindings
module Power = Sdl3_power_bindings
module Process = Sdl3_process_bindings
module Properties = Sdl3_properties_bindings
module Rect = Sdl3_rect_bindings
module Render = Sdl3_render_bindings
module Sensor = Sdl3_sensor_bindings
module Stdinc = Sdl3_stdinc_bindings
module Storage = Sdl3_storage_bindings
module Surface = Sdl3_surface_bindings
module System = Sdl3_system_bindings
module Thread = Sdl3_thread_bindings
module Time = Sdl3_time_bindings
module Timer = Sdl3_timer_bindings
module Touch = Sdl3_touch_bindings
module Tray = Sdl3_tray_bindings
module Version = Sdl3_version_bindings
module Video = Sdl3_video_bindings
end

(* Access by SDL types: *)
module Sdl = struct
  include Sdl3_constants  module Assertion = Categories.Assert.Assertion

  module AssertionHandler = Categories.Assert.AssertionHandler

  module AsyncIO = Categories.Asyncio.AsyncIO

  module AsyncIOQueue = Categories.Asyncio.AsyncIOQueue

  module Atomic = Categories.Atomic.Atomic

  module AtomicInt = Categories.Atomic.AtomicInt

  module AtomicU32 = Categories.Atomic.AtomicU32

  module Audio = Categories.Audio.Audio

  module AudioDevice = Categories.Audio.AudioDevice

  module AudioFormat = Categories.Audio.AudioFormat

  module AudioStream = Categories.Audio.AudioStream

  module Camera = Categories.Camera.Camera

  module Clipboard = Categories.Clipboard.Clipboard

  module Condition = Categories.Mutex.Condition

  module Cursor = Categories.Mouse.Cursor

  module DateTime = Categories.Time.DateTime

  module Dialog = Categories.Dialog.Dialog

  module Display = Categories.Video.Display

  module DisplayMode = Categories.Video.DisplayMode

  module DisplayOrientation = Categories.Video.DisplayOrientation

  module Environment = Categories.Stdinc.Environment

  module Error = Categories.Error.Error

  module Event = Categories.Events.Event

  module EventFilter = Categories.Events.EventFilter

  module Events = Categories.Events.Events

  module Folder = Categories.Filesystem.Folder

  module GPUBuffer = Categories.Gpu.GPUBuffer

  module GPUCommandBuffer = Categories.Gpu.GPUCommandBuffer

  module GPUComputePass = Categories.Gpu.GPUComputePass

  module GPUComputePipeline = Categories.Gpu.GPUComputePipeline

  module GPUCopyPass = Categories.Gpu.GPUCopyPass

  module GPUDevice = Categories.Gpu.GPUDevice

  module GPUGraphicsPipeline = Categories.Gpu.GPUGraphicsPipeline

  module GPURenderPass = Categories.Gpu.GPURenderPass

  module GPURenderState = Categories.Render.GPURenderState

  module GPUSampler = Categories.Gpu.GPUSampler

  module GPUShader = Categories.Gpu.GPUShader

  module GPUTexture = Categories.Gpu.GPUTexture

  module GPUTextureFormat = Categories.Gpu.GPUTextureFormat

  module GPUTransferBuffer = Categories.Gpu.GPUTransferBuffer

  module GUID = struct
    include Categories.Gamepad.GUID
    include Categories.Guid.GUID
    include Categories.Joystick.GUID
    include T.GUID
end

  module Gamepad = Categories.Gamepad.Gamepad

  module GamepadAxis = Categories.Gamepad.GamepadAxis

  module GamepadButton = Categories.Gamepad.GamepadButton

  module GamepadButtonLabel = Categories.Gamepad.GamepadButtonLabel

  module GamepadType = Categories.Gamepad.GamepadType

  module Haptic = Categories.Haptic.Haptic

  module Hints = Categories.Hints.Hints

  module IOStatus = Categories.Iostream.IOStatus

  module Joystick = struct
    include Categories.Haptic.Joystick
    include Categories.Joystick.Joystick
end

  module Keyboard = Categories.Keyboard.Keyboard

  module Locale = Categories.Locale.Locale

  module Log = Categories.Log.Log

  module LogOutputFunction = Categories.Log.LogOutputFunction

  module LogPriority = Categories.Log.LogPriority

  module Metal = Categories.Metal.Metal

  module Mouse = Categories.Mouse.Mouse

  module Mutex = Categories.Mutex.Mutex

  module Palette = Categories.Pixels.Palette

  module Pen = Categories.Pen.Pen

  module PixelFormat = struct
    include Categories.Gpu.PixelFormat
    include Categories.Pixels.PixelFormat
end

  module Platform = Categories.Platform.Platform

  module Point = struct
    include Categories.Rect.Point
    include Categories.Video.Point
    include T.Point
end

  module Power = Categories.Power.Power

  module Process = Categories.Process.Process

  module Properties = struct
    include Categories.Gpu.Properties
    include Categories.Properties.Properties
end

  module PropertyType = Categories.Properties.PropertyType

  module RWLock = Categories.Mutex.RWLock

  module Rect = struct
    include Categories.Rect.Rect
    include Categories.Video.Rect
    include T.Rect
end

  module Renderer = Categories.Render.Renderer

  module Sandbox = Categories.System.Sandbox

  module Scancode = Categories.Keyboard.Scancode

  module Semaphore = Categories.Mutex.Semaphore

  module Sensor = Categories.Sensor.Sensor

  module Storage = Categories.Storage.Storage

  module Surface = Categories.Surface.Surface

  module SystemCursor = Categories.Mouse.SystemCursor

  module SystemTheme = Categories.Video.SystemTheme

  module Texture = Categories.Render.Texture

  module Thread = Categories.Thread.Thread

  module ThreadPriority = Categories.Thread.ThreadPriority

  module Time = Categories.Time.Time

  module Timer = Categories.Timer.Timer

  module Touch = Categories.Touch.Touch

  module Tray = Categories.Tray.Tray

  module TrayEntry = Categories.Tray.TrayEntry

  module TrayMenu = Categories.Tray.TrayMenu

  module Version = Categories.Version.Version

  module Video = Categories.Video.Video

  module Window = struct
    include Categories.Events.Window
    include Categories.Mouse.Window
    include Categories.Video.Window
end

(* Access global functions: *)
  include Categories.Asyncio.Global
  include Categories.Atomic.Global
  include Categories.Audio.Global
  include Categories.Blendmode.Global
  include Categories.Clipboard.Global
  include Categories.Cpuinfo.Global
  include Categories.Error.Global
  include Categories.Events.Global
  include Categories.Filesystem.Global
  include Categories.Gpu.Global
  include Categories.Hidapi.Global
  include Categories.Hints.Global
  include Categories.Init.Global
  include Categories.Iostream.Global
  include Categories.Keyboard.Global
  include Categories.Loadso.Global
  include Categories.Messagebox.Global
  include Categories.Misc.Global
  include Categories.Mouse.Global
  include Categories.Mutex.Global
  include Categories.Pixels.Global
  include Categories.Properties.Global
  include Categories.Render.Global
  include Categories.Stdinc.Global
  include Categories.Surface.Global
  include Categories.System.Global
  include Categories.Thread.Global
  include Categories.Time.Global
  include Categories.Timer.Global
  include Categories.Version.Global
  include Categories.Video.Global
  module App = App
end
