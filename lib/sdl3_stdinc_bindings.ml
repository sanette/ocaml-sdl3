(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Ctypes
open Helpers
open Sdl3_types

let ff = Load.foreign

module Global = struct
let malloc = ff "SDL_malloc"
  (size_t @-> returning (ptr void))
let malloc size =
  malloc (Unsigned.Size_t.of_int size)

let calloc = ff "SDL_calloc"
  (size_t @-> size_t @-> returning (ptr void))
let calloc nmemb size =
  calloc (Unsigned.Size_t.of_int nmemb) (Unsigned.Size_t.of_int size)

let realloc = ff "SDL_realloc"
  (ptr void @-> size_t @-> returning (ptr void))
let realloc mem size =
  realloc mem (Unsigned.Size_t.of_int size)

let free = ff "SDL_free"
  (ptr void @-> returning void)

let get_original_memory_functions = ff "SDL_GetOriginalMemoryFunctions"
  (ptr malloc_func @-> ptr calloc_func @-> ptr realloc_func @-> ptr free_func @-> returning void)

let get_memory_functions = ff "SDL_GetMemoryFunctions"
  (ptr malloc_func @-> ptr calloc_func @-> ptr realloc_func @-> ptr free_func @-> returning void)

let set_memory_functions = ff "SDL_SetMemoryFunctions"
  (malloc_func @-> calloc_func @-> realloc_func @-> free_func @-> returning true_to_ok)

let aligned_alloc = ff "SDL_aligned_alloc"
  (size_t @-> size_t @-> returning (ptr void))
let aligned_alloc alignment size =
  aligned_alloc (Unsigned.Size_t.of_int alignment) (Unsigned.Size_t.of_int size)

let aligned_free = ff "SDL_aligned_free"
  (ptr void @-> returning void)

let get_num_allocations = ff "SDL_GetNumAllocations"
  (void @-> returning int)

let getenv = ff "SDL_getenv"
  (string @-> returning string)

let getenv_unsafe = ff "SDL_getenv_unsafe"
  (string @-> returning string)

let setenv_unsafe = ff "SDL_setenv_unsafe"
  (string @-> string @-> int @-> returning int)

let unsetenv_unsafe = ff "SDL_unsetenv_unsafe"
  (string @-> returning int)

let qsort = ff "SDL_qsort"
  (ptr void @-> size_t @-> size_t @-> compare_callback @-> returning void)
let qsort base nmemb size compare =
  qsort base (Unsigned.Size_t.of_int nmemb) (Unsigned.Size_t.of_int size) compare

let bsearch = ff "SDL_bsearch"
  (ptr void @-> ptr void @-> size_t @-> size_t @-> compare_callback @-> returning (ptr void))
let bsearch key base nmemb size compare =
  bsearch key base (Unsigned.Size_t.of_int nmemb) (Unsigned.Size_t.of_int size) compare

let qsort_r = ff "SDL_qsort_r"
  (ptr void @-> size_t @-> size_t @-> compare_callback_r @-> ptr void @-> returning void)
let qsort_r base nmemb size compare userdata =
  qsort_r base (Unsigned.Size_t.of_int nmemb) (Unsigned.Size_t.of_int size) compare userdata

let bsearch_r = ff "SDL_bsearch_r"
  (ptr void @-> ptr void @-> size_t @-> size_t @-> compare_callback_r @-> ptr void @-> returning (ptr void))
let bsearch_r key base nmemb size compare userdata =
  bsearch_r key base (Unsigned.Size_t.of_int nmemb) (Unsigned.Size_t.of_int size) compare userdata

let abs = ff "SDL_abs"
  (int @-> returning int)

let isalpha = ff "SDL_isalpha"
  (int @-> returning int)

let isalnum = ff "SDL_isalnum"
  (int @-> returning int)

let isblank = ff "SDL_isblank"
  (int @-> returning int)

let iscntrl = ff "SDL_iscntrl"
  (int @-> returning int)

let isdigit = ff "SDL_isdigit"
  (int @-> returning int)

let isxdigit = ff "SDL_isxdigit"
  (int @-> returning int)

let ispunct = ff "SDL_ispunct"
  (int @-> returning int)

let isspace = ff "SDL_isspace"
  (int @-> returning int)

let isupper = ff "SDL_isupper"
  (int @-> returning int)

let islower = ff "SDL_islower"
  (int @-> returning int)

let isprint = ff "SDL_isprint"
  (int @-> returning int)

let isgraph = ff "SDL_isgraph"
  (int @-> returning int)

let toupper = ff "SDL_toupper"
  (int @-> returning int)

let tolower = ff "SDL_tolower"
  (int @-> returning int)

let crc16 = ff "SDL_crc16"
  (uint16 @-> ptr void @-> size_t @-> returning uint16)
let crc16 crc data len =
  crc16 (Unsigned.UShort.of_int crc) data (Unsigned.Size_t.of_int len)

let crc32 = ff "SDL_crc32"
  (uint32 @-> ptr void @-> size_t @-> returning uint32)
let crc32 crc data len =
  crc32 (Unsigned.UInt.of_int crc) data (Unsigned.Size_t.of_int len)

let murmur3_32 = ff "SDL_murmur3_32"
  (ptr void @-> size_t @-> uint32 @-> returning uint32)
let murmur3_32 data len seed =
  murmur3_32 data (Unsigned.Size_t.of_int len) (Unsigned.UInt.of_int seed)

let memcpy = ff "SDL_memcpy"
  (ptr void @-> ptr void @-> size_t @-> returning (ptr void))
let memcpy dst src len =
  memcpy dst src (Unsigned.Size_t.of_int len)

let memmove = ff "SDL_memmove"
  (ptr void @-> ptr void @-> size_t @-> returning (ptr void))
let memmove dst src len =
  memmove dst src (Unsigned.Size_t.of_int len)

let memset = ff "SDL_memset"
  (ptr void @-> int @-> size_t @-> returning (ptr void))
let memset dst c len =
  memset dst c (Unsigned.Size_t.of_int len)

let memset4 = ff "SDL_memset4"
  (ptr void @-> uint32 @-> size_t @-> returning (ptr void))
let memset4 dst val_ dwords =
  memset4 dst (Unsigned.UInt.of_int val_) (Unsigned.Size_t.of_int dwords)

let memcmp = ff "SDL_memcmp"
  (ptr void @-> ptr void @-> size_t @-> returning int)
let memcmp s1 s2 len =
  memcmp s1 s2 (Unsigned.Size_t.of_int len)

let wcslen = ff "SDL_wcslen"
  (ptr int32_t @-> returning size_t)

let wcsnlen = ff "SDL_wcsnlen"
  (ptr int32_t @-> size_t @-> returning size_t)
let wcsnlen wstr maxlen =
  wcsnlen wstr (Unsigned.Size_t.of_int maxlen)

let wcslcpy = ff "SDL_wcslcpy"
  (ptr int32_t @-> ptr int32_t @-> size_t @-> returning size_t)
let wcslcpy dst src maxlen =
  wcslcpy dst src (Unsigned.Size_t.of_int maxlen)

let wcslcat = ff "SDL_wcslcat"
  (ptr int32_t @-> ptr int32_t @-> size_t @-> returning size_t)
let wcslcat dst src maxlen =
  wcslcat dst src (Unsigned.Size_t.of_int maxlen)

let wcsdup = ff "SDL_wcsdup"
  (ptr int32_t @-> returning (ptr int32_t))

let wcsstr = ff "SDL_wcsstr"
  (ptr int32_t @-> ptr int32_t @-> returning (ptr int32_t))

let wcsnstr = ff "SDL_wcsnstr"
  (ptr int32_t @-> ptr int32_t @-> size_t @-> returning (ptr int32_t))
let wcsnstr haystack needle maxlen =
  wcsnstr haystack needle (Unsigned.Size_t.of_int maxlen)

let wcscmp = ff "SDL_wcscmp"
  (ptr int32_t @-> ptr int32_t @-> returning int)

let wcsncmp = ff "SDL_wcsncmp"
  (ptr int32_t @-> ptr int32_t @-> size_t @-> returning int)
let wcsncmp str1 str2 maxlen =
  wcsncmp str1 str2 (Unsigned.Size_t.of_int maxlen)

let wcscasecmp = ff "SDL_wcscasecmp"
  (ptr int32_t @-> ptr int32_t @-> returning int)

let wcsncasecmp = ff "SDL_wcsncasecmp"
  (ptr int32_t @-> ptr int32_t @-> size_t @-> returning int)
let wcsncasecmp str1 str2 maxlen =
  wcsncasecmp str1 str2 (Unsigned.Size_t.of_int maxlen)

let wcstol = ff "SDL_wcstol"
  (ptr int32_t @-> ptr (ptr int32_t) @-> int @-> returning long)

let strlen = ff "SDL_strlen"
  (string @-> returning size_t)

let strnlen = ff "SDL_strnlen"
  (string @-> size_t @-> returning size_t)
let strnlen str maxlen =
  strnlen str (Unsigned.Size_t.of_int maxlen)

let strlcpy = ff "SDL_strlcpy"
  (string @-> string @-> size_t @-> returning size_t)
let strlcpy dst src maxlen =
  strlcpy dst src (Unsigned.Size_t.of_int maxlen)

let utf8strlcpy = ff "SDL_utf8strlcpy"
  (string @-> string @-> size_t @-> returning size_t)
let utf8strlcpy dst src dst_bytes =
  utf8strlcpy dst src (Unsigned.Size_t.of_int dst_bytes)

let strlcat = ff "SDL_strlcat"
  (string @-> string @-> size_t @-> returning size_t)
let strlcat dst src maxlen =
  strlcat dst src (Unsigned.Size_t.of_int maxlen)

let strdup = ff "SDL_strdup"
  (string @-> returning string)

let strndup = ff "SDL_strndup"
  (string @-> size_t @-> returning string)
let strndup str maxlen =
  strndup str (Unsigned.Size_t.of_int maxlen)

let strrev = ff "SDL_strrev"
  (string @-> returning string)

let strupr = ff "SDL_strupr"
  (string @-> returning string)

let strlwr = ff "SDL_strlwr"
  (string @-> returning string)

let strchr = ff "SDL_strchr"
  (string @-> int @-> returning string)

let strrchr = ff "SDL_strrchr"
  (string @-> int @-> returning string)

let strstr = ff "SDL_strstr"
  (string @-> string @-> returning string)

let strnstr = ff "SDL_strnstr"
  (string @-> string @-> size_t @-> returning string)
let strnstr haystack needle maxlen =
  strnstr haystack needle (Unsigned.Size_t.of_int maxlen)

let strcasestr = ff "SDL_strcasestr"
  (string @-> string @-> returning string)

let strtok_r = ff "SDL_strtok_r"
  (string @-> string @-> ptr string @-> returning string)

let utf8strlen = ff "SDL_utf8strlen"
  (string @-> returning size_t)

let utf8strnlen = ff "SDL_utf8strnlen"
  (string @-> size_t @-> returning size_t)
let utf8strnlen str bytes =
  utf8strnlen str (Unsigned.Size_t.of_int bytes)

let itoa = ff "SDL_itoa"
  (int @-> string @-> int @-> returning string)

let uitoa = ff "SDL_uitoa"
  (uint @-> string @-> int @-> returning string)
let uitoa value str radix =
  uitoa (Unsigned.UInt.of_int value) str radix

let ltoa = ff "SDL_ltoa"
  (long @-> string @-> int @-> returning string)
let ltoa value str radix =
  ltoa (Signed.Long.of_int value) str radix

let ultoa = ff "SDL_ultoa"
  (ulong @-> string @-> int @-> returning string)
let ultoa value str radix =
  ultoa (Unsigned.ULong.of_int64 value) str radix

let lltoa = ff "SDL_lltoa"
  (llong @-> string @-> int @-> returning string)

let ulltoa = ff "SDL_ulltoa"
  (ullong @-> string @-> int @-> returning string)

let atoi = ff "SDL_atoi"
  (string @-> returning int)

let atof = ff "SDL_atof"
  (string @-> returning double)

let strtol = ff "SDL_strtol"
  (string @-> ptr string @-> int @-> returning long)

let strtoul = ff "SDL_strtoul"
  (string @-> ptr string @-> int @-> returning ulong)

let strtoll = ff "SDL_strtoll"
  (string @-> ptr string @-> int @-> returning llong)

let strtoull = ff "SDL_strtoull"
  (string @-> ptr string @-> int @-> returning ullong)

let strtod = ff "SDL_strtod"
  (string @-> ptr string @-> returning double)

let strcmp = ff "SDL_strcmp"
  (string @-> string @-> returning int)

let strncmp = ff "SDL_strncmp"
  (string @-> string @-> size_t @-> returning int)
let strncmp str1 str2 maxlen =
  strncmp str1 str2 (Unsigned.Size_t.of_int maxlen)

let strcasecmp = ff "SDL_strcasecmp"
  (string @-> string @-> returning int)

let strncasecmp = ff "SDL_strncasecmp"
  (string @-> string @-> size_t @-> returning int)
let strncasecmp str1 str2 maxlen =
  strncasecmp str1 str2 (Unsigned.Size_t.of_int maxlen)

let strpbrk = ff "SDL_strpbrk"
  (string @-> string @-> returning string)

let step_utf8 = ff "SDL_StepUTF8"
  (ptr string @-> ptr size_t @-> returning uint32)

let step_back_utf8 = ff "SDL_StepBackUTF8"
  (string @-> ptr string @-> returning uint32)

let ucs4_to_utf8 = ff "SDL_UCS4ToUTF8"
  (uint32 @-> string @-> returning string)
let ucs4_to_utf8 codepoint dst =
  ucs4_to_utf8 (Unsigned.UInt.of_int codepoint) dst

let srand = ff "SDL_srand"
  (uint64 @-> returning void)
let srand seed =
  srand (Unsigned.ULong.of_int64 seed)

let rand = ff "SDL_rand"
  (sint32 @-> returning sint32)

let randf = ff "SDL_randf"
  (void @-> returning float)

let rand_bits = ff "SDL_rand_bits"
  (void @-> returning uint32)

let rand_r = ff "SDL_rand_r"
  (ptr uint64 @-> sint32 @-> returning sint32)

let randf_r = ff "SDL_randf_r"
  (ptr uint64 @-> returning float)
let randf_r () =
  let state = allocate ulong (Unsigned.ULong.of_int 0) in
  let ret = randf_r state in
(ret, Unsigned.ULong.to_int64 (!@ state))

let rand_bits_r = ff "SDL_rand_bits_r"
  (ptr uint64 @-> returning uint32)
let rand_bits_r () =
  let state = allocate ulong (Unsigned.ULong.of_int 0) in
  let ret = rand_bits_r state in
(ret, Unsigned.ULong.to_int64 (!@ state))

let acos = ff "SDL_acos"
  (double @-> returning double)

let acosf = ff "SDL_acosf"
  (float @-> returning float)

let asin = ff "SDL_asin"
  (double @-> returning double)

let asinf = ff "SDL_asinf"
  (float @-> returning float)

let atan = ff "SDL_atan"
  (double @-> returning double)

let atanf = ff "SDL_atanf"
  (float @-> returning float)

let atan2 = ff "SDL_atan2"
  (double @-> double @-> returning double)

let atan2f = ff "SDL_atan2f"
  (float @-> float @-> returning float)

let ceil = ff "SDL_ceil"
  (double @-> returning double)

let ceilf = ff "SDL_ceilf"
  (float @-> returning float)

let copysign = ff "SDL_copysign"
  (double @-> double @-> returning double)

let copysignf = ff "SDL_copysignf"
  (float @-> float @-> returning float)

let cos = ff "SDL_cos"
  (double @-> returning double)

let cosf = ff "SDL_cosf"
  (float @-> returning float)

let exp = ff "SDL_exp"
  (double @-> returning double)

let expf = ff "SDL_expf"
  (float @-> returning float)

let fabs = ff "SDL_fabs"
  (double @-> returning double)

let fabsf = ff "SDL_fabsf"
  (float @-> returning float)

let floor = ff "SDL_floor"
  (double @-> returning double)

let floorf = ff "SDL_floorf"
  (float @-> returning float)

let trunc = ff "SDL_trunc"
  (double @-> returning double)

let truncf = ff "SDL_truncf"
  (float @-> returning float)

let fmod = ff "SDL_fmod"
  (double @-> double @-> returning double)

let fmodf = ff "SDL_fmodf"
  (float @-> float @-> returning float)

let isinf = ff "SDL_isinf"
  (double @-> returning int)

let isinff = ff "SDL_isinff"
  (float @-> returning int)

let isnan = ff "SDL_isnan"
  (double @-> returning int)

let isnanf = ff "SDL_isnanf"
  (float @-> returning int)

let log = ff "SDL_log"
  (double @-> returning double)

let logf = ff "SDL_logf"
  (float @-> returning float)

let log10 = ff "SDL_log10"
  (double @-> returning double)

let log10f = ff "SDL_log10f"
  (float @-> returning float)

let modf = ff "SDL_modf"
  (double @-> ptr double @-> returning double)

let modff = ff "SDL_modff"
  (float @-> ptr float @-> returning float)
let modff x =
  let y = allocate float 0. in
  let ret = modff x y in
(ret, !@ y)

let pow = ff "SDL_pow"
  (double @-> double @-> returning double)

let powf = ff "SDL_powf"
  (float @-> float @-> returning float)

let round = ff "SDL_round"
  (double @-> returning double)

let roundf = ff "SDL_roundf"
  (float @-> returning float)

let lround = ff "SDL_lround"
  (double @-> returning long)

let lroundf = ff "SDL_lroundf"
  (float @-> returning long)

let scalbn = ff "SDL_scalbn"
  (double @-> int @-> returning double)

let scalbnf = ff "SDL_scalbnf"
  (float @-> int @-> returning float)

let sin = ff "SDL_sin"
  (double @-> returning double)

let sinf = ff "SDL_sinf"
  (float @-> returning float)

let sqrt = ff "SDL_sqrt"
  (double @-> returning double)

let sqrtf = ff "SDL_sqrtf"
  (float @-> returning float)

let tan = ff "SDL_tan"
  (double @-> returning double)

let tanf = ff "SDL_tanf"
  (float @-> returning float)

let iconv_string = ff "SDL_iconv_string"
  (string @-> string @-> string @-> size_t @-> returning string)
let iconv_string tocode fromcode inbuf inbytesleft =
  iconv_string tocode fromcode inbuf (Unsigned.Size_t.of_int inbytesleft)

end
include Global

module Environment = struct
let get = ff "SDL_GetEnvironment"
  (void @-> returning (some_to_ok environment_opt))

let create = ff "SDL_CreateEnvironment"
  (bool @-> returning (some_to_ok environment_opt))

let get_variable = ff "SDL_GetEnvironmentVariable"
  (environment @-> string @-> returning string)

let get_variables = ff "SDL_GetEnvironmentVariables"
  (environment @-> returning (ptr string))

let set_variable = ff "SDL_SetEnvironmentVariable"
  (environment @-> string @-> string @-> bool @-> returning true_to_ok)

let unset_variable = ff "SDL_UnsetEnvironmentVariable"
  (environment @-> string @-> returning true_to_ok)

let destroy = ff "SDL_DestroyEnvironment"
  (environment @-> returning void)

end

module Iconv_data_t = struct
let iconv_open = ff "SDL_iconv_open"
  (string @-> string @-> returning iconv_t)

let iconv_close = ff "SDL_iconv_close"
  (iconv_t @-> returning int)

let iconv = ff "SDL_iconv"
  (iconv_t @-> ptr string @-> ptr size_t @-> ptr string @-> ptr size_t @-> returning size_t)

end

