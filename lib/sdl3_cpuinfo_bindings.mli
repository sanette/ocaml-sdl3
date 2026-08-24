(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

module Global : sig

val get_num_logical_cpu_cores : unit -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetNumLogicalCPUCores}SDL_GetNumLogicalCPUCores}: Get the number of logical CPU cores available.


    @return the total number of logical CPU cores. On CPUs that include
technologies such as hyperthreading, the number of logical cores
may be more than the number of physical cores.*)

val get_cpu_cache_line_size : unit -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetCPUCacheLineSize}SDL_GetCPUCacheLineSize}: Determine the L1 cache line size of the CPU.

This is useful for determining multi-threaded structure padding or SIMD
prefetch sizes.


    @return the L1 cache line size of the CPU, in bytes.*)

val has_alti_vec : unit -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_HasAltiVec}SDL_HasAltiVec}: Determine whether the CPU has AltiVec features.

This always returns false on CPUs that aren't using PowerPC instruction
sets.


    @return true if the CPU has AltiVec features or false if not.*)

val has_mmx : unit -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_HasMMX}SDL_HasMMX}: Determine whether the CPU has MMX features.

This always returns false on CPUs that aren't using Intel instruction sets.


    @return true if the CPU has MMX features or false if not.*)

val has_sse : unit -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_HasSSE}SDL_HasSSE}: Determine whether the CPU has SSE features.

This always returns false on CPUs that aren't using Intel instruction sets.


    @return true if the CPU has SSE features or false if not.*)

val has_sse2 : unit -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_HasSSE2}SDL_HasSSE2}: Determine whether the CPU has SSE2 features.

This always returns false on CPUs that aren't using Intel instruction sets.


    @return true if the CPU has SSE2 features or false if not.*)

val has_sse3 : unit -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_HasSSE3}SDL_HasSSE3}: Determine whether the CPU has SSE3 features.

This always returns false on CPUs that aren't using Intel instruction sets.


    @return true if the CPU has SSE3 features or false if not.*)

val has_sse41 : unit -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_HasSSE41}SDL_HasSSE41}: Determine whether the CPU has SSE4.1 features.

This always returns false on CPUs that aren't using Intel instruction sets.


    @return true if the CPU has SSE4.1 features or false if not.*)

val has_sse42 : unit -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_HasSSE42}SDL_HasSSE42}: Determine whether the CPU has SSE4.2 features.

This always returns false on CPUs that aren't using Intel instruction sets.


    @return true if the CPU has SSE4.2 features or false if not.*)

val has_avx : unit -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_HasAVX}SDL_HasAVX}: Determine whether the CPU has AVX features.

This always returns false on CPUs that aren't using Intel instruction sets.


    @return true if the CPU has AVX features or false if not.*)

val has_avx2 : unit -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_HasAVX2}SDL_HasAVX2}: Determine whether the CPU has AVX2 features.

This always returns false on CPUs that aren't using Intel instruction sets.


    @return true if the CPU has AVX2 features or false if not.*)

val has_avx512_f : unit -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_HasAVX512F}SDL_HasAVX512F}: Determine whether the CPU has AVX-512F (foundation) features.

This always returns false on CPUs that aren't using Intel instruction sets.


    @return true if the CPU has AVX-512F features or false if not.*)

val has_armsimd : unit -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_HasARMSIMD}SDL_HasARMSIMD}: Determine whether the CPU has ARM SIMD (ARMv6) features.

This is different from ARM NEON, which is a different instruction set.

This always returns false on CPUs that aren't using ARM instruction sets.


    @return true if the CPU has ARM SIMD features or false if not.*)

val has_neon : unit -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_HasNEON}SDL_HasNEON}: Determine whether the CPU has NEON (ARM SIMD) features.

This always returns false on CPUs that aren't using ARM instruction sets.


    @return true if the CPU has ARM NEON features or false if not.*)

val has_lsx : unit -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_HasLSX}SDL_HasLSX}: Determine whether the CPU has LSX (LOONGARCH SIMD) features.

This always returns false on CPUs that aren't using LOONGARCH instruction
sets.


    @return true if the CPU has LOONGARCH LSX features or false if not.*)

val has_lasx : unit -> bool
(** {{:https://wiki.libsdl.org/SDL3/SDL_HasLASX}SDL_HasLASX}: Determine whether the CPU has LASX (LOONGARCH SIMD) features.

This always returns false on CPUs that aren't using LOONGARCH instruction
sets.


    @return true if the CPU has LOONGARCH LASX features or false if not.*)

val get_system_ram : unit -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetSystemRAM}SDL_GetSystemRAM}: Get the amount of RAM configured in the system.


    @return the amount of RAM configured in the system in MiB.*)

val get_simd_alignment : unit -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetSIMDAlignment}SDL_GetSIMDAlignment}: Report the alignment this system needs for SIMD allocations.

This will return the minimum number of bytes to which a pointer must be
aligned to be compatible with SIMD instructions on the current machine. For
example, if the machine supports SSE only, it will return 16, but if it
supports AVX-512F, it'll return 64 (etc). This only reports values for
instruction sets SDL knows about, so if your SDL build doesn't have
SDL_HasAVX512F(), then it might return 16 for the SSE support it sees and
not 64 for the AVX-512 instructions that exist but SDL doesn't know about.
Plan accordingly.


    @return the alignment in bytes needed for available, known SIMD
instructions.*)

val get_system_page_size : unit -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetSystemPageSize}SDL_GetSystemPageSize}: Report the size of a page of memory.

Different platforms might have different memory page sizes. In current
times, 4 kilobytes is not unusual, but newer systems are moving to larger
page sizes, and esoteric platforms might have any unexpected size.

Note that this function can return 0, which means SDL can't determine the
page size on this platform. It will _not_ set an error string to be
retrieved with SDL_GetError() in this case! In this case, defaulting to
4096 is often a reasonable option.


    @return the size of a single page of memory, in bytes, or 0 if SDL can't
determine this information.*)

end
include module type of Global

