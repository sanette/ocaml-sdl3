(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes

let ff = Load.foreign

module Global = struct
let get_num_logical_cpu_cores = ff "SDL_GetNumLogicalCPUCores"
  (void @-> returning int)

let get_cpu_cache_line_size = ff "SDL_GetCPUCacheLineSize"
  (void @-> returning int)

let has_alti_vec = ff "SDL_HasAltiVec"
  (void @-> returning bool)

let has_mmx = ff "SDL_HasMMX"
  (void @-> returning bool)

let has_sse = ff "SDL_HasSSE"
  (void @-> returning bool)

let has_sse2 = ff "SDL_HasSSE2"
  (void @-> returning bool)

let has_sse3 = ff "SDL_HasSSE3"
  (void @-> returning bool)

let has_sse41 = ff "SDL_HasSSE41"
  (void @-> returning bool)

let has_sse42 = ff "SDL_HasSSE42"
  (void @-> returning bool)

let has_avx = ff "SDL_HasAVX"
  (void @-> returning bool)

let has_avx2 = ff "SDL_HasAVX2"
  (void @-> returning bool)

let has_avx512_f = ff "SDL_HasAVX512F"
  (void @-> returning bool)

let has_armsimd = ff "SDL_HasARMSIMD"
  (void @-> returning bool)

let has_neon = ff "SDL_HasNEON"
  (void @-> returning bool)

let has_lsx = ff "SDL_HasLSX"
  (void @-> returning bool)

let has_lasx = ff "SDL_HasLASX"
  (void @-> returning bool)

let get_system_ram = ff "SDL_GetSystemRAM"
  (void @-> returning int)

let get_simd_alignment = ff "SDL_GetSIMDAlignment"
  (void @-> returning size_t)

let get_system_page_size = ff "SDL_GetSystemPageSize"
  (void @-> returning int)

end
include Global

