(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Sdl3_types
module Global : sig

val malloc : int -> data
(** {{:https://wiki.libsdl.org/SDL3/SDL_malloc}SDL_malloc}: Allocate uninitialized memory.

The allocated memory returned by this function must be freed with
SDL_free().

If[size]is 0, it will be set to 1.

If the allocation is successful, the returned pointer is guaranteed to be
aligned to either the *fundamental alignment* [alignof(max_align_t)]in
C11 and later) or[2 * sizeof(void * )] whichever is smaller. Use
SDL_aligned_alloc() if you need to allocate memory aligned to an alignment
greater than this guarantee.


    @param size the size to allocate.

    @return a pointer to the allocated memory, or NULL if allocation failed.*)

val calloc : int -> int -> data
(** {{:https://wiki.libsdl.org/SDL3/SDL_calloc}SDL_calloc}: Allocate a zero-initialized array.

The memory returned by this function must be freed with SDL_free().

If either of[nmemb]or[size]is 0, they will both be set to 1.

If the allocation is successful, the returned pointer is guaranteed to be
aligned to either the *fundamental alignment* [alignof(max_align_t)]in
C11 and later) or[2 * sizeof(void * )] whichever is smaller.


    @param nmemb the number of elements in the array.
    @param size the size of each element of the array.

    @return a pointer to the allocated array, or NULL if allocation failed.*)

val realloc : data -> int -> data
(** {{:https://wiki.libsdl.org/SDL3/SDL_realloc}SDL_realloc}: Change the size of allocated memory.

The memory returned by this function must be freed with SDL_free().

If[size]is 0, it will be set to 1. Note that this is unlike some other C
runtime[realloc]implementations, which may treat[realloc(mem, 0)]the
same way as[free(mem)]

If[mem]is NULL, the behavior of this function is equivalent to
SDL_malloc(). Otherwise, the function can have one of three possible
outcomes:

- If it returns the same pointer as[mem] it means that[mem]was resized
  in place without freeing.
- If it returns a different non-NULL pointer, it means that[mem]was freed
  and cannot be dereferenced anymore.
- If it returns NULL (indicating failure), then[mem]will remain valid and
  must still be freed with SDL_free().

If the allocation is successfully resized, the returned pointer is
guaranteed to be aligned to either the *fundamental alignment*
[alignof(max_align_t)]in C11 and later) or[2 * sizeof(void * )]
whichever is smaller.


    @param mem a pointer to allocated memory to reallocate, or NULL.
    @param size the new size of the memory.

    @return a pointer to the newly allocated memory, or NULL if allocation
failed.*)

val free : data -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_free}SDL_free}: Free allocated memory.

The pointer is no longer valid after this call and cannot be dereferenced
anymore.

If[mem]is NULL, this function does nothing.


    @param mem a pointer to allocated memory, or NULL.
*)

val get_original_memory_functions : malloc_func Ctypes.ptr -> calloc_func Ctypes.ptr -> realloc_func Ctypes.ptr -> free_func Ctypes.ptr -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetOriginalMemoryFunctions}SDL_GetOriginalMemoryFunctions}: Get the original set of SDL memory functions.

This is what SDL_malloc and friends will use by default, if there has been
no call to SDL_SetMemoryFunctions. This is not necessarily using the C
runtime's[malloc]functions behind the scenes! Different platforms and
build configurations might do any number of unexpected things.


    @param malloc_func filled with malloc function.
    @param calloc_func filled with calloc function.
    @param realloc_func filled with realloc function.
    @param free_func filled with free function.
*)

val get_memory_functions : malloc_func Ctypes.ptr -> calloc_func Ctypes.ptr -> realloc_func Ctypes.ptr -> free_func Ctypes.ptr -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetMemoryFunctions}SDL_GetMemoryFunctions}: Get the current set of SDL memory functions.


    @param malloc_func filled with malloc function.
    @param calloc_func filled with calloc function.
    @param realloc_func filled with realloc function.
    @param free_func filled with free function.
*)

val set_memory_functions : malloc_func -> calloc_func -> realloc_func -> free_func -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetMemoryFunctions}SDL_SetMemoryFunctions}: Replace SDL's memory allocation functions with a custom set.

It is not safe to call this function once any allocations have been made,
as future calls to SDL_free will use the new allocator, even if they came
from an SDL_malloc made with the old one!

If used, usually this needs to be the first call made into the SDL library,
if not the very first thing done at program startup time.


    @param malloc_func custom malloc function.
    @param calloc_func custom calloc function.
    @param realloc_func custom realloc function.
    @param free_func custom free function.*)

val aligned_alloc : int -> int -> data
(** {{:https://wiki.libsdl.org/SDL3/SDL_aligned_alloc}SDL_aligned_alloc}: Allocate memory aligned to a specific alignment.

The memory returned by this function must be freed with SDL_aligned_free(),
_not_ SDL_free().

If[alignment]is less than the size of[void *] it will be increased to
match that.

The returned memory address will be a multiple of the alignment value, and
the size of the memory allocated will be a multiple of the alignment value.


    @param alignment the alignment of the memory.
    @param size the size to allocate.

    @return a pointer to the aligned memory, or NULL if allocation failed.*)

val aligned_free : data -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_aligned_free}SDL_aligned_free}: Free memory allocated by SDL_aligned_alloc().

The pointer is no longer valid after this call and cannot be dereferenced
anymore.

If[mem]is NULL, this function does nothing.


    @param mem a pointer previously returned by SDL_aligned_alloc(), or NULL.
*)

val get_num_allocations : unit -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetNumAllocations}SDL_GetNumAllocations}: Get the number of outstanding (unfreed) allocations.


    @return the number of allocations or -1 if allocation counting is
disabled.*)

val getenv : string -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_getenv}SDL_getenv}: Get the value of a variable in the environment.

The name of the variable is case sensitive on all platforms.

This function uses SDL's cached copy of the environment and is thread-safe.


    @param name the name of the variable to get.

    @return a pointer to the value of the variable or NULL if it can't be
found.*)

val getenv_unsafe : string -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_getenv_unsafe}SDL_getenv_unsafe}: Get the value of a variable in the environment.

This function bypasses SDL's cached copy of the environment and is not
thread-safe.

On some platforms, this may make case-insensitive matches, while other
platforms are case-sensitive. It is best to be precise with strings used
for queries through this interface. SDL_getenv is always case-sensitive,
however.


    @param name the name of the variable to get.

    @return a pointer to the value of the variable or NULL if it can't be
found.*)

val setenv_unsafe : string -> string -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_setenv_unsafe}SDL_setenv_unsafe}: Set the value of a variable in the environment.


    @param name the name of the variable to set.
    @param value the value of the variable to set.
    @param overwrite 1 to overwrite the variable if it exists, 0 to return
success without setting the variable if it already exists.

    @return 0 on success, -1 on error.*)

val unsetenv_unsafe : string -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_unsetenv_unsafe}SDL_unsetenv_unsafe}: Clear a variable from the environment.


    @param name the name of the variable to unset.

    @return 0 on success, -1 on error.*)

val qsort : data -> int -> int -> compare_callback -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_qsort}SDL_qsort}: Sort an array.

For example:

{[
typedef struct {
    int key;
    const char *string;
} data;

int SDLCALL compare(const void *a, const void *b)
{
    const data *A = (const data * )a;
    const data *B = (const data * )b;

    if (A->n < B->n) {
        return -1;
    } else if (B->n < A->n) {
        return 1;
    } else {
        return 0;
    }
}

data values\[\] = {
    { 3, "third" }, { 1, "first" }, { 2, "second" }
};

SDL_qsort(values, SDL_arraysize(values), sizeof(values\[0\]), compare);
]}


    @param base a pointer to the start of the array.
    @param nmemb the number of elements in the array.
    @param size the size of the elements in the array.
    @param compare a function used to compare elements in the array.
*)

val bsearch : data -> data -> int -> int -> compare_callback -> data
(** {{:https://wiki.libsdl.org/SDL3/SDL_bsearch}SDL_bsearch}: Perform a binary search on a previously sorted array.

For example:

{[
typedef struct {
    int key;
    const char *string;
} data;

int SDLCALL compare(const void *a, const void *b)
{
    const data *A = (const data * )a;
    const data *B = (const data * )b;

    if (A->n < B->n) {
        return -1;
    } else if (B->n < A->n) {
        return 1;
    } else {
        return 0;
    }
}

data values\[\] = {
    { 1, "first" }, { 2, "second" }, { 3, "third" }
};
data key = { 2, NULL };

data *result = SDL_bsearch(&key, values, SDL_arraysize(values), sizeof(values\[0\]), compare);
]}


    @param key a pointer to a key equal to the element being searched for.
    @param base a pointer to the start of the array.
    @param nmemb the number of elements in the array.
    @param size the size of the elements in the array.
    @param compare a function used to compare elements in the array.

    @return a pointer to the matching element in the array, or NULL if not
found.*)

val qsort_r : data -> int -> int -> compare_callback_r -> data -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_qsort_r}SDL_qsort_r}: Sort an array, passing a userdata pointer to the compare function.

For example:

{[
typedef enum {
    sort_increasing,
    sort_decreasing,
} sort_method;

typedef struct {
    int key;
    const char *string;
} data;

int SDLCALL compare(const void *userdata, const void *a, const void *b)
{
    sort_method method = (sort_method)(uintptr_t)userdata;
    const data *A = (const data * )a;
    const data *B = (const data * )b;

    if (A->key < B->key) {
        return (method == sort_increasing) ? -1 : 1;
    } else if (B->key < A->key) {
        return (method == sort_increasing) ? 1 : -1;
    } else {
        return 0;
    }
}

data values\[\] = {
    { 3, "third" }, { 1, "first" }, { 2, "second" }
};

SDL_qsort_r(values, SDL_arraysize(values), sizeof(values\[0\]), compare, (const void * )(uintptr_t)sort_increasing);
]}


    @param base a pointer to the start of the array.
    @param nmemb the number of elements in the array.
    @param size the size of the elements in the array.
    @param compare a function used to compare elements in the array.
    @param userdata a pointer to pass to the compare function.
*)

val bsearch_r : data -> data -> int -> int -> compare_callback_r -> data -> data
(** {{:https://wiki.libsdl.org/SDL3/SDL_bsearch_r}SDL_bsearch_r}: Perform a binary search on a previously sorted array, passing a userdata
pointer to the compare function.

For example:

{[
typedef enum {
    sort_increasing,
    sort_decreasing,
} sort_method;

typedef struct {
    int key;
    const char *string;
} data;

int SDLCALL compare(const void *userdata, const void *a, const void *b)
{
    sort_method method = (sort_method)(uintptr_t)userdata;
    const data *A = (const data * )a;
    const data *B = (const data * )b;

    if (A->key < B->key) {
        return (method == sort_increasing) ? -1 : 1;
    } else if (B->key < A->key) {
        return (method == sort_increasing) ? 1 : -1;
    } else {
        return 0;
    }
}

data values\[\] = {
    { 1, "first" }, { 2, "second" }, { 3, "third" }
};
data key = { 2, NULL };

data *result = SDL_bsearch_r(&key, values, SDL_arraysize(values), sizeof(values\[0\]), compare, (const void * )(uintptr_t)sort_increasing);
]}


    @param key a pointer to a key equal to the element being searched for.
    @param base a pointer to the start of the array.
    @param nmemb the number of elements in the array.
    @param size the size of the elements in the array.
    @param compare a function used to compare elements in the array.
    @param userdata a pointer to pass to the compare function.

    @return a pointer to the matching element in the array, or NULL if not
found.*)

val abs : int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_abs}SDL_abs}: Compute the absolute value of[x]


    @param x an integer value.

    @return the absolute value of x.*)

val isalpha : int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_isalpha}SDL_isalpha}: Query if a character is alphabetic (a letter).

**WARNING**: Regardless of system locale, this will only treat ASCII values
for English 'a-z' and 'A-Z' as true.


    @param x character value to check.

    @return non-zero if x falls within the character class, zero otherwise.*)

val isalnum : int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_isalnum}SDL_isalnum}: Query if a character is alphabetic (a letter) or a number.

**WARNING**: Regardless of system locale, this will only treat ASCII values
for English 'a-z', 'A-Z', and '0-9' as true.


    @param x character value to check.

    @return non-zero if x falls within the character class, zero otherwise.*)

val isblank : int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_isblank}SDL_isblank}: Report if a character is blank (a space or tab).

**WARNING**: Regardless of system locale, this will only treat ASCII values
0x20 (space) or 0x9 (tab) as true.


    @param x character value to check.

    @return non-zero if x falls within the character class, zero otherwise.*)

val iscntrl : int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_iscntrl}SDL_iscntrl}: Report if a character is a control character.

**WARNING**: Regardless of system locale, this will only treat ASCII values
0 through 0x1F, and 0x7F, as true.


    @param x character value to check.

    @return non-zero if x falls within the character class, zero otherwise.*)

val isdigit : int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_isdigit}SDL_isdigit}: Report if a character is a numeric digit.

**WARNING**: Regardless of system locale, this will only treat ASCII values
'0' (0x30) through '9' (0x39), as true.


    @param x character value to check.

    @return non-zero if x falls within the character class, zero otherwise.*)

val isxdigit : int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_isxdigit}SDL_isxdigit}: Report if a character is a hexadecimal digit.

**WARNING**: Regardless of system locale, this will only treat ASCII values
'A' through 'F', 'a' through 'f', and '0' through '9', as true.


    @param x character value to check.

    @return non-zero if x falls within the character class, zero otherwise.*)

val ispunct : int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_ispunct}SDL_ispunct}: Report if a character is a punctuation mark.

**WARNING**: Regardless of system locale, this is equivalent to[((SDL_isgraph(x)) && (!SDL_isalnum(x)))]


    @param x character value to check.

    @return non-zero if x falls within the character class, zero otherwise.*)

val isspace : int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_isspace}SDL_isspace}: Report if a character is whitespace.

**WARNING**: Regardless of system locale, this will only treat the
following ASCII values as true:

- space (0x20)
- tab (0x09)
- newline (0x0A)
- vertical tab (0x0B)
- form feed (0x0C)
- return (0x0D)


    @param x character value to check.

    @return non-zero if x falls within the character class, zero otherwise.*)

val isupper : int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_isupper}SDL_isupper}: Report if a character is upper case.

**WARNING**: Regardless of system locale, this will only treat ASCII values
'A' through 'Z' as true.


    @param x character value to check.

    @return non-zero if x falls within the character class, zero otherwise.*)

val islower : int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_islower}SDL_islower}: Report if a character is lower case.

**WARNING**: Regardless of system locale, this will only treat ASCII values
'a' through 'z' as true.


    @param x character value to check.

    @return non-zero if x falls within the character class, zero otherwise.*)

val isprint : int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_isprint}SDL_isprint}: Report if a character is "printable".

Be advised that "printable" has a definition that goes back to text
terminals from the dawn of computing, making this a sort of special case
function that is not suitable for Unicode (or most any) text management.

**WARNING**: Regardless of system locale, this will only treat ASCII values
' ' (0x20) through '~' (0x7E) as true.


    @param x character value to check.

    @return non-zero if x falls within the character class, zero otherwise.*)

val isgraph : int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_isgraph}SDL_isgraph}: Report if a character is any "printable" except space.

Be advised that "printable" has a definition that goes back to text
terminals from the dawn of computing, making this a sort of special case
function that is not suitable for Unicode (or most any) text management.

**WARNING**: Regardless of system locale, this is equivalent to[(SDL_isprint(x)) && ((x) != ' ')]


    @param x character value to check.

    @return non-zero if x falls within the character class, zero otherwise.*)

val toupper : int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_toupper}SDL_toupper}: Convert low-ASCII English letters to uppercase.

**WARNING**: Regardless of system locale, this will only convert ASCII
values 'a' through 'z' to uppercase.

This function returns the uppercase equivalent of[x] If a character
cannot be converted, or is already uppercase, this function returns[x]


    @param x character value to check.

    @return capitalized version of x, or x if no conversion available.*)

val tolower : int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_tolower}SDL_tolower}: Convert low-ASCII English letters to lowercase.

**WARNING**: Regardless of system locale, this will only convert ASCII
values 'A' through 'Z' to lowercase.

This function returns the lowercase equivalent of[x] If a character
cannot be converted, or is already lowercase, this function returns[x]


    @param x character value to check.

    @return lowercase version of x, or x if no conversion available.*)

val crc16 : int -> data -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_crc16}SDL_crc16}: Calculate a CRC-16 value.

https://en.wikipedia.org/wiki/Cyclic_redundancy_check

This function can be called multiple times, to stream data to be
checksummed in blocks. Each call must provide the previous CRC-16 return
value to be updated with the next block. The first call to this function
for a set of blocks should pass in a zero CRC value.


    @param crc the current checksum for this data set, or 0 for a new data set.
    @param data a new block of data to add to the checksum.
    @param len the size, in bytes, of the new block of data.

    @return a CRC-16 checksum value of all blocks in the data set.*)

val crc32 : int -> data -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_crc32}SDL_crc32}: Calculate a CRC-32 value.

https://en.wikipedia.org/wiki/Cyclic_redundancy_check

This function can be called multiple times, to stream data to be
checksummed in blocks. Each call must provide the previous CRC-32 return
value to be updated with the next block. The first call to this function
for a set of blocks should pass in a zero CRC value.


    @param crc the current checksum for this data set, or 0 for a new data set.
    @param data a new block of data to add to the checksum.
    @param len the size, in bytes, of the new block of data.

    @return a CRC-32 checksum value of all blocks in the data set.*)

val murmur3_32 : data -> int -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_murmur3_32}SDL_murmur3_32}: Calculate a 32-bit MurmurHash3 value for a block of data.

https://en.wikipedia.org/wiki/MurmurHash

A seed may be specified, which changes the final results consistently, but
this does not work like SDL_crc16 and SDL_crc32: you can't feed a previous
result from this function back into itself as the next seed value to
calculate a hash in chunks; it won't produce the same hash as it would if
the same data was provided in a single call.

If you aren't sure what to provide for a seed, zero is fine. Murmur3 is not
cryptographically secure, so it shouldn't be used for hashing top-secret
data.


    @param data the data to be hashed.
    @param len the size of data, in bytes.
    @param seed a value that alters the final hash value.

    @return a Murmur3 32-bit hash value.*)

val memcpy : data -> data -> int -> data
(** {{:https://wiki.libsdl.org/SDL3/SDL_memcpy}SDL_memcpy}: Copy non-overlapping memory.

The memory regions must not overlap. If they do, use SDL_memmove() instead.


    @param dst The destination memory region. Must not be NULL, and must not
overlap with[src]
    @param src The source memory region. Must not be NULL, and must not overlap
with[dst]
    @param len The length in bytes of both[dst]and[src]

    @return `dst`.*)

val memmove : data -> data -> int -> data
(** {{:https://wiki.libsdl.org/SDL3/SDL_memmove}SDL_memmove}: Copy memory ranges that might overlap.

It is okay for the memory regions to overlap. If you are confident that the
regions never overlap, using SDL_memcpy() may improve performance.


    @param dst The destination memory region. Must not be NULL.
    @param src The source memory region. Must not be NULL.
    @param len The length in bytes of both[dst]and[src]

    @return `dst`.*)

val memset : data -> int -> int -> data
(** {{:https://wiki.libsdl.org/SDL3/SDL_memset}SDL_memset}: Initialize all bytes of buffer of memory to a specific value.

This function will set[len]bytes, pointed to by[dst] to the value
specified in[c]

Despite[c]being an[int]instead of a[char] this only operates on
bytes;[c]must be a value between 0 and 255, inclusive.


    @param dst the destination memory region. Must not be NULL.
    @param c the byte value to set.
    @param len the length, in bytes, to set in[dst]

    @return `dst`.*)

val memset4 : data -> int -> int -> data
(** {{:https://wiki.libsdl.org/SDL3/SDL_memset4}SDL_memset4}: Initialize all 32-bit words of buffer of memory to a specific value.

This function will set a buffer of[dwords]Uint32 values, pointed to by[dst] to the value specified in[val]

Unlike SDL_memset, this sets 32-bit values, not bytes, so it's not limited
to a range of 0-255.


    @param dst the destination memory region. Must not be NULL.
    @param val the Uint32 value to set.
    @param dwords the number of Uint32 values to set in[dst]

    @return `dst`.*)

val memcmp : data -> data -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_memcmp}SDL_memcmp}: Compare two buffers of memory.


    @param s1 the first buffer to compare. NULL is not permitted!
    @param s2 the second buffer to compare. NULL is not permitted!
    @param len the number of bytes to compare between the buffers.

    @return less than zero if s1 is "less than" s2, greater than zero if s1 is
"greater than" s2, and zero if the buffers match exactly for[len]bytes.*)

val wcslen : int32 Ctypes.ptr option -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_wcslen}SDL_wcslen}: This works exactly like wcslen() but doesn't require access to a C runtime.

Counts the number of wchar_t values in[wstr] excluding the null
terminator.

Like SDL_strlen only counts bytes and not codepoints in a UTF-8 string,
this counts wchar_t values in a string, even if the string's encoding is of
variable width, like UTF-16.

Also be aware that wchar_t is different sizes on different platforms (4
bytes on Linux, 2 on Windows, etc).


    @param wstr The null-terminated wide string to read. Must not be [None].

    @return the length (in wchar_t values, excluding the null terminator) of[wstr]*)

val wcsnlen : int32 Ctypes.ptr option -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_wcsnlen}SDL_wcsnlen}: This works exactly like wcsnlen() but doesn't require access to a C
runtime.

Counts up to a maximum of[maxlen]wchar_t values in[wstr] excluding the
null terminator.

Like SDL_strnlen only counts bytes and not codepoints in a UTF-8 string,
this counts wchar_t values in a string, even if the string's encoding is of
variable width, like UTF-16.

Also be aware that wchar_t is different sizes on different platforms (4
bytes on Linux, 2 on Windows, etc).

Also,[maxlen]is a count of wide characters, not bytes!


    @param wstr The null-terminated wide string to read. Must not be [None].
    @param maxlen The maximum amount of wide characters to count.

    @return the length (in wide characters, excluding the null terminator) of[wstr]but never more than[maxlen]*)

val wcslcpy : int32 Ctypes.ptr option -> int32 Ctypes.ptr option -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_wcslcpy}SDL_wcslcpy}: Copy a wide string.

This function copies[maxlen]- 1 wide characters from[src]to[dst] then
appends a null terminator.
[src]and[dst]must not overlap.

If[maxlen]is 0, no wide characters are copied and no null terminator is
written.


    @param dst The destination buffer. Must not be [None], and must not overlap
with[src]
    @param src The null-terminated wide string to copy. Must not be [None], and
must not overlap with[dst]
    @param maxlen The length (in wide characters) of the destination buffer.

    @return the length (in wide characters, excluding the null terminator) of[src]*)

val wcslcat : int32 Ctypes.ptr option -> int32 Ctypes.ptr option -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_wcslcat}SDL_wcslcat}: Concatenate wide strings.

This function appends up to[maxlen]- SDL_wcslen(dst) - 1 wide characters
from[src]to the end of the wide string in[dst] then appends a null
terminator.
[src]and[dst]must not overlap.

If[maxlen]- SDL_wcslen(dst) - 1 is less than or equal to 0, then[dst]is
unmodified.


    @param dst The destination buffer already containing the first
null-terminated wide string. Must not be [None] and must not
overlap with[src]
    @param src The second null-terminated wide string. Must not be [None], and
must not overlap with[dst]
    @param maxlen The length (in wide characters) of the destination buffer.

    @return the length (in wide characters, excluding the null terminator) of
the string in[dst]plus the length of[src]*)

val wcsdup : int32 Ctypes.ptr -> int32 Ctypes.ptr
(** {{:https://wiki.libsdl.org/SDL3/SDL_wcsdup}SDL_wcsdup}: Allocate a copy of a wide string.

This allocates enough space for a null-terminated copy of[wstr] using
SDL_malloc, and then makes a copy of the string into this space.

The returned string is owned by the caller, and should be passed to
SDL_free when no longer needed.


    @param wstr the string to copy.

    @return a pointer to the newly-allocated wide string.*)

val wcsstr : int32 Ctypes.ptr option -> int32 Ctypes.ptr option -> int32 Ctypes.ptr
(** {{:https://wiki.libsdl.org/SDL3/SDL_wcsstr}SDL_wcsstr}: Search a wide string for the first instance of a specific substring.

The search ends once it finds the requested substring, or a null terminator
byte to end the string.

Note that this looks for strings of _wide characters_, not _codepoints_, so
it's legal to search for malformed and incomplete UTF-16 sequences.


    @param haystack the wide string to search. Must not be [None].
    @param needle the wide string to search for. Must not be [None].

    @return a pointer to the first instance of[needle]in the string, or NULL
if not found.*)

val wcsnstr : int32 Ctypes.ptr option -> int32 Ctypes.ptr option -> int -> int32 Ctypes.ptr
(** {{:https://wiki.libsdl.org/SDL3/SDL_wcsnstr}SDL_wcsnstr}: Search a wide string, up to n wide chars, for the first instance of a
specific substring.

The search ends once it finds the requested substring, or a null terminator
value to end the string, or[maxlen]wide character have been examined. It
is possible to use this function on a wide string without a null
terminator.

Note that this looks for strings of _wide characters_, not _codepoints_, so
it's legal to search for malformed and incomplete UTF-16 sequences.


    @param haystack the wide string to search. Must not be [None].
    @param needle the wide string to search for. Must not be [None].
    @param maxlen the maximum number of wide characters to search in[haystack]

    @return a pointer to the first instance of[needle]in the string, or NULL
if not found.*)

val wcscmp : int32 Ctypes.ptr option -> int32 Ctypes.ptr option -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_wcscmp}SDL_wcscmp}: Compare two null-terminated wide strings.

This only compares wchar_t values until it hits a null-terminating
character; it does not care if the string is well-formed UTF-16 (or UTF-32,
depending on your platform's wchar_t size), or uses valid Unicode values.


    @param str1 the first string to compare. [None] is not permitted!
    @param str2 the second string to compare. [None] is not permitted!

    @return less than zero if str1 is "less than" str2, greater than zero if
str1 is "greater than" str2, and zero if the strings match
exactly.*)

val wcsncmp : int32 Ctypes.ptr option -> int32 Ctypes.ptr option -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_wcsncmp}SDL_wcsncmp}: Compare two wide strings up to a number of wchar_t values.

This only compares wchar_t values; it does not care if the string is
well-formed UTF-16 (or UTF-32, depending on your platform's wchar_t size),
or uses valid Unicode values.

Note that while this function is intended to be used with UTF-16 (or
UTF-32, depending on your platform's definition of wchar_t), it is
comparing raw wchar_t values and not Unicode codepoints:[maxlen]specifies
a wchar_t limit! If the limit lands in the middle of a multi-wchar UTF-16
sequence, it will only compare a portion of the final character.
[maxlen]specifies a maximum number of wchar_t to compare; if the strings
match to this number of wide chars (or both have matched to a
null-terminator character before this count), they will be considered
equal.


    @param str1 the first string to compare. [None] is not permitted!
    @param str2 the second string to compare. [None] is not permitted!
    @param maxlen the maximum number of wchar_t to compare.

    @return less than zero if str1 is "less than" str2, greater than zero if
str1 is "greater than" str2, and zero if the strings match
exactly.*)

val wcscasecmp : int32 Ctypes.ptr option -> int32 Ctypes.ptr option -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_wcscasecmp}SDL_wcscasecmp}: Compare two null-terminated wide strings, case-insensitively.

This will work with Unicode strings, using a technique called
"case-folding" to handle the vast majority of case-sensitive human
languages regardless of system locale. It can deal with expanding values: a
German Eszett character can compare against two ASCII 's' chars and be
considered a match, for example. A notable exception: it does not handle
the Turkish 'i' character; human language is complicated!

Depending on your platform, "wchar_t" might be 2 bytes, and expected to be
UTF-16 encoded (like Windows), or 4 bytes in UTF-32 format. Since this
handles Unicode, it expects the string to be well-formed and not a
null-terminated string of arbitrary bytes. Characters that are not valid
UTF-16 (or UTF-32) are treated as Unicode character U+FFFD (REPLACEMENT
CHARACTER), which is to say two strings of random bits may turn out to
match if they convert to the same amount of replacement characters.


    @param str1 the first string to compare. [None] is not permitted!
    @param str2 the second string to compare. [None] is not permitted!

    @return less than zero if str1 is "less than" str2, greater than zero if
str1 is "greater than" str2, and zero if the strings match
exactly.*)

val wcsncasecmp : int32 Ctypes.ptr option -> int32 Ctypes.ptr option -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_wcsncasecmp}SDL_wcsncasecmp}: Compare two wide strings, case-insensitively, up to a number of wchar_t.

This will work with Unicode strings, using a technique called
"case-folding" to handle the vast majority of case-sensitive human
languages regardless of system locale. It can deal with expanding values: a
German Eszett character can compare against two ASCII 's' chars and be
considered a match, for example. A notable exception: it does not handle
the Turkish 'i' character; human language is complicated!

Depending on your platform, "wchar_t" might be 2 bytes, and expected to be
UTF-16 encoded (like Windows), or 4 bytes in UTF-32 format. Since this
handles Unicode, it expects the string to be well-formed and not a
null-terminated string of arbitrary bytes. Characters that are not valid
UTF-16 (or UTF-32) are treated as Unicode character U+FFFD (REPLACEMENT
CHARACTER), which is to say two strings of random bits may turn out to
match if they convert to the same amount of replacement characters.

Note that while this function might deal with variable-sized characters,[maxlen]specifies a _wchar_ limit! If the limit lands in the middle of a
multi-byte UTF-16 sequence, it may convert a portion of the final character
to one or more Unicode character U+FFFD (REPLACEMENT CHARACTER) so as not
to overflow a buffer.
[maxlen]specifies a maximum number of wchar_t values to compare; if the
strings match to this number of wchar_t (or both have matched to a
null-terminator character before this number of bytes), they will be
considered equal.


    @param str1 the first string to compare. [None] is not permitted!
    @param str2 the second string to compare. [None] is not permitted!
    @param maxlen the maximum number of wchar_t values to compare.

    @return less than zero if str1 is "less than" str2, greater than zero if
str1 is "greater than" str2, and zero if the strings match
exactly.*)

val wcstol : int32 Ctypes.ptr option -> (int32 Ctypes.ptr) Ctypes.ptr option -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_wcstol}SDL_wcstol}: Parse a[long]from a wide string.

If[str]starts with whitespace, then those whitespace characters are
skipped before attempting to parse the number.

If the parsed number does not fit inside a[long] the result is clamped to
the minimum and maximum representable[long]values.


    @param str The null-terminated wide string to read. Must not be [None].
    @param endp If not [None], the address of the first invalid wide character
(i.e. the next character after the parsed number) will be
written to this pointer.
    @param base The base of the integer to read. Supported values are 0 and 2
to 36 inclusive. If 0, the base will be inferred from the
number's prefix (0x for hexadecimal, 0 for octal, decimal
otherwise).

    @return the parsed[long] or 0 if no number could be parsed.*)

val strlen : string -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_strlen}SDL_strlen}: This works exactly like strlen() but doesn't require access to a C runtime.

Counts the bytes in[str] excluding the null terminator.

If you need the length of a UTF-8 string, consider using SDL_utf8strlen().


    @param str The null-terminated string to read. Must not be NULL.

    @return the length (in bytes, excluding the null terminator) of[src]*)

val strnlen : string -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_strnlen}SDL_strnlen}: This works exactly like strnlen() but doesn't require access to a C
runtime.

Counts up to a maximum of[maxlen]bytes in[str] excluding the null
terminator.

If you need the length of a UTF-8 string, consider using SDL_utf8strnlen().


    @param str The null-terminated string to read. Must not be NULL.
    @param maxlen The maximum amount of bytes to count.

    @return the length (in bytes, excluding the null terminator) of[src]but
never more than[maxlen]*)

val strlcpy : string -> string -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_strlcpy}SDL_strlcpy}: Copy a string.

This function copies up to[maxlen]- 1 characters from[src]to[dst]
then appends a null terminator.

If[maxlen]is 0, no characters are copied and no null terminator is
written.

If you want to copy an UTF-8 string but need to ensure that multi-byte
sequences are not truncated, consider using SDL_utf8strlcpy().


    @param dst The destination buffer. Must not be NULL, and must not overlap
with[src]
    @param src The null-terminated string to copy. Must not be NULL, and must
not overlap with[dst]
    @param maxlen The length (in characters) of the destination buffer.

    @return the length (in characters, excluding the null terminator) of[src]*)

val utf8strlcpy : string -> string -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_utf8strlcpy}SDL_utf8strlcpy}: Copy an UTF-8 string.

This function copies up to[dst_bytes]- 1 bytes from[src]to[dst]while
also ensuring that the string written to[dst]does not end in a truncated
multi-byte sequence. Finally, it appends a null terminator.
[src]and[dst]must not overlap.

Note that unlike SDL_strlcpy(), this function returns the number of bytes
written, not the length of[src]


    @param dst The destination buffer. Must not be NULL, and must not overlap
with[src]
    @param src The null-terminated UTF-8 string to copy. Must not be NULL, and
must not overlap with[dst]
    @param dst_bytes The length (in bytes) of the destination buffer. Must not
be 0.

    @return the number of bytes written, excluding the null terminator.*)

val strlcat : string -> string -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_strlcat}SDL_strlcat}: Concatenate strings.

This function appends up to[maxlen]- SDL_strlen(dst) - 1 characters from[src]to the end of the string in[dst] then appends a null terminator.
[src]and[dst]must not overlap.

If[maxlen]- SDL_strlen(dst) - 1 is less than or equal to 0, then[dst]is
unmodified.


    @param dst The destination buffer already containing the first
null-terminated string. Must not be NULL and must not overlap
with[src]
    @param src The second null-terminated string. Must not be NULL, and must
not overlap with[dst]
    @param maxlen The length (in characters) of the destination buffer.

    @return the length (in characters, excluding the null terminator) of the
string in[dst]plus the length of[src]*)

val strdup : string -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_strdup}SDL_strdup}: Allocate a copy of a string.

This allocates enough space for a null-terminated copy of[str] using
SDL_malloc, and then makes a copy of the string into this space.

The returned string is owned by the caller, and should be passed to
SDL_free when no longer needed.


    @param str the string to copy.

    @return a pointer to the newly-allocated string.*)

val strndup : string -> int -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_strndup}SDL_strndup}: Allocate a copy of a string, up to n characters.

This allocates enough space for a null-terminated copy of[str] up to[maxlen]bytes, using SDL_malloc, and then makes a copy of the string into
this space.

If the string is longer than[maxlen]bytes, the returned string will be[maxlen]bytes long, plus a null-terminator character that isn't included
in the count.

The returned string is owned by the caller, and should be passed to
SDL_free when no longer needed.


    @param str the string to copy.
    @param maxlen the maximum length of the copied string, not counting the
null-terminator character.

    @return a pointer to the newly-allocated string.*)

val strrev : string -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_strrev}SDL_strrev}: Reverse a string's contents.

This reverses a null-terminated string in-place. Only the content of the
string is reversed; the null-terminator character remains at the end of the
reversed string.

**WARNING**: This function reverses the _bytes_ of the string, not the
codepoints. If[str]is a UTF-8 string with Unicode codepoints > 127, this
will ruin the string data. You should only use this function on strings
that are completely comprised of low ASCII characters.


    @param str the string to reverse.

    @return `str`.*)

val strupr : string -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_strupr}SDL_strupr}: Convert a string to uppercase.

**WARNING**: Regardless of system locale, this will only convert ASCII
values 'A' through 'Z' to uppercase.

This function operates on a null-terminated string of bytes--even if it is
malformed UTF-8!--and converts ASCII characters 'a' through 'z' to their
uppercase equivalents in-place, returning the original[str]pointer.


    @param str the string to convert in-place. Can not be NULL.

    @return the[str]pointer passed into this function.*)

val strlwr : string -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_strlwr}SDL_strlwr}: Convert a string to lowercase.

**WARNING**: Regardless of system locale, this will only convert ASCII
values 'A' through 'Z' to lowercase.

This function operates on a null-terminated string of bytes--even if it is
malformed UTF-8!--and converts ASCII characters 'A' through 'Z' to their
lowercase equivalents in-place, returning the original[str]pointer.


    @param str the string to convert in-place. Can not be NULL.

    @return the[str]pointer passed into this function.*)

val strchr : string -> int -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_strchr}SDL_strchr}: Search a string for the first instance of a specific byte.

The search ends once it finds the requested byte value, or a null
terminator byte to end the string.

Note that this looks for _bytes_, not _characters_, so you cannot match
against a Unicode codepoint > 255, regardless of character encoding.


    @param str the string to search. Must not be NULL.
    @param c the byte value to search for.

    @return a pointer to the first instance of[c]in the string, or NULL if
not found.*)

val strrchr : string -> int -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_strrchr}SDL_strrchr}: Search a string for the last instance of a specific byte.

The search must go until it finds a null terminator byte to end the string.

Note that this looks for _bytes_, not _characters_, so you cannot match
against a Unicode codepoint > 255, regardless of character encoding.


    @param str the string to search. Must not be NULL.
    @param c the byte value to search for.

    @return a pointer to the last instance of[c]in the string, or NULL if
not found.*)

val strstr : string -> string -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_strstr}SDL_strstr}: Search a string for the first instance of a specific substring.

The search ends once it finds the requested substring, or a null terminator
byte to end the string.

Note that this looks for strings of _bytes_, not _characters_, so it's
legal to search for malformed and incomplete UTF-8 sequences.


    @param haystack the string to search. Must not be NULL.
    @param needle the string to search for. Must not be NULL.

    @return a pointer to the first instance of[needle]in the string, or NULL
if not found.*)

val strnstr : string -> string -> int -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_strnstr}SDL_strnstr}: Search a string, up to n bytes, for the first instance of a specific
substring.

The search ends once it finds the requested substring, or a null terminator
byte to end the string, or[maxlen]bytes have been examined. It is
possible to use this function on a string without a null terminator.

Note that this looks for strings of _bytes_, not _characters_, so it's
legal to search for malformed and incomplete UTF-8 sequences.


    @param haystack the string to search. Must not be NULL.
    @param needle the string to search for. Must not be NULL.
    @param maxlen the maximum number of bytes to search in[haystack]

    @return a pointer to the first instance of[needle]in the string, or NULL
if not found.*)

val strcasestr : string -> string -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_strcasestr}SDL_strcasestr}: Search a UTF-8 string for the first instance of a specific substring,
case-insensitively.

This will work with Unicode strings, using a technique called
"case-folding" to handle the vast majority of case-sensitive human
languages regardless of system locale. It can deal with expanding values: a
German Eszett character can compare against two ASCII 's' chars and be
considered a match, for example. A notable exception: it does not handle
the Turkish 'i' character; human language is complicated!

Since this handles Unicode, it expects the strings to be well-formed UTF-8
and not a null-terminated string of arbitrary bytes. Bytes that are not
valid UTF-8 are treated as Unicode character U+FFFD (REPLACEMENT
CHARACTER), which is to say two strings of random bits may turn out to
match if they convert to the same amount of replacement characters.


    @param haystack the string to search. Must not be NULL.
    @param needle the string to search for. Must not be NULL.

    @return a pointer to the first instance of[needle]in the string, or NULL
if not found.*)

val strtok_r : string -> string -> string Ctypes.ptr -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_strtok_r}SDL_strtok_r}: This works exactly like strtok_r() but doesn't require access to a C
runtime.

Break a string up into a series of tokens.

To start tokenizing a new string,[str]should be the non-NULL address of
the string to start tokenizing. Future calls to get the next token from the
same string should specify a NULL.

Note that this function will overwrite pieces of[str]with null chars to
split it into tokens. This function cannot be used with const/read-only
strings!
[saveptr]just needs to point to a[char *]that can be overwritten; SDL
will use this to save tokenizing state between calls. It is initialized if[str]is non-NULL, and used to resume tokenizing when[str]is NULL.


    @param str the string to tokenize, or NULL to continue tokenizing.
    @param delim the delimiter string that separates tokens.
    @param saveptr pointer to a char *, used for ongoing state.

    @return A pointer to the next token, or NULL if no tokens remain.*)

val utf8strlen : string -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_utf8strlen}SDL_utf8strlen}: Count the number of codepoints in a UTF-8 string.

Counts the _codepoints_, not _bytes_, in[str] excluding the null
terminator.

If you need to count the bytes in a string instead, consider using
SDL_strlen().

Since this handles Unicode, it expects the strings to be well-formed UTF-8
and not a null-terminated string of arbitrary bytes. Bytes that are not
valid UTF-8 are treated as Unicode character U+FFFD (REPLACEMENT
CHARACTER), so a malformed or incomplete UTF-8 sequence might increase the
count by several replacement characters.


    @param str The null-terminated UTF-8 string to read. Must not be NULL.

    @return The length (in codepoints, excluding the null terminator) of[src]*)

val utf8strnlen : string -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_utf8strnlen}SDL_utf8strnlen}: Count the number of codepoints in a UTF-8 string, up to n bytes.

Counts the _codepoints_, not _bytes_, in[str] excluding the null
terminator.

If you need to count the bytes in a string instead, consider using
SDL_strnlen().

The counting stops at[bytes]bytes (not codepoints!). This seems
counterintuitive, but makes it easy to express the total size of the
string's buffer.

Since this handles Unicode, it expects the strings to be well-formed UTF-8
and not a null-terminated string of arbitrary bytes. Bytes that are not
valid UTF-8 are treated as Unicode character U+FFFD (REPLACEMENT
CHARACTER), so a malformed or incomplete UTF-8 sequence might increase the
count by several replacement characters.


    @param str The null-terminated UTF-8 string to read. Must not be NULL.
    @param bytes The maximum amount of bytes to count.

    @return The length (in codepoints, excluding the null terminator) of[src]but never more than[maxlen]*)

val itoa : int -> string -> int -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_itoa}SDL_itoa}: Convert an integer into a string.

This requires a radix to specified for string format. Specifying 10
produces a decimal number, 16 hexadecimal, etc. Must be in the range of 2
to 36.

Note that this function will overflow a buffer if[str]is not large enough
to hold the output! It may be safer to use SDL_snprintf to clamp output, or
SDL_asprintf to allocate a buffer. Otherwise, it doesn't hurt to allocate
much more space than you expect to use (and don't forget possible negative
signs, null terminator bytes, etc).


    @param value the integer to convert.
    @param str the buffer to write the string into.
    @param radix the radix to use for string generation.

    @return `str`.*)

val uitoa : int -> string -> int -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_uitoa}SDL_uitoa}: Convert an unsigned integer into a string.

This requires a radix to specified for string format. Specifying 10
produces a decimal number, 16 hexadecimal, etc. Must be in the range of 2
to 36.

Note that this function will overflow a buffer if[str]is not large enough
to hold the output! It may be safer to use SDL_snprintf to clamp output, or
SDL_asprintf to allocate a buffer. Otherwise, it doesn't hurt to allocate
much more space than you expect to use (and don't forget null terminator
bytes, etc).


    @param value the unsigned integer to convert.
    @param str the buffer to write the string into.
    @param radix the radix to use for string generation.

    @return `str`.*)

val ltoa : int -> string -> int -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_ltoa}SDL_ltoa}: Convert a long integer into a string.

This requires a radix to specified for string format. Specifying 10
produces a decimal number, 16 hexadecimal, etc. Must be in the range of 2
to 36.

Note that this function will overflow a buffer if[str]is not large enough
to hold the output! It may be safer to use SDL_snprintf to clamp output, or
SDL_asprintf to allocate a buffer. Otherwise, it doesn't hurt to allocate
much more space than you expect to use (and don't forget possible negative
signs, null terminator bytes, etc).


    @param value the long integer to convert.
    @param str the buffer to write the string into.
    @param radix the radix to use for string generation.

    @return `str`.*)

val ultoa : int64 -> string -> int -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_ultoa}SDL_ultoa}: Convert an unsigned long integer into a string.

This requires a radix to specified for string format. Specifying 10
produces a decimal number, 16 hexadecimal, etc. Must be in the range of 2
to 36.

Note that this function will overflow a buffer if[str]is not large enough
to hold the output! It may be safer to use SDL_snprintf to clamp output, or
SDL_asprintf to allocate a buffer. Otherwise, it doesn't hurt to allocate
much more space than you expect to use (and don't forget null terminator
bytes, etc).


    @param value the unsigned long integer to convert.
    @param str the buffer to write the string into.
    @param radix the radix to use for string generation.

    @return `str`.*)

val lltoa : Signed.llong -> string -> int -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_lltoa}SDL_lltoa}: Convert a long long integer into a string.

This requires a radix to specified for string format. Specifying 10
produces a decimal number, 16 hexadecimal, etc. Must be in the range of 2
to 36.

Note that this function will overflow a buffer if[str]is not large enough
to hold the output! It may be safer to use SDL_snprintf to clamp output, or
SDL_asprintf to allocate a buffer. Otherwise, it doesn't hurt to allocate
much more space than you expect to use (and don't forget possible negative
signs, null terminator bytes, etc).


    @param value the long long integer to convert.
    @param str the buffer to write the string into.
    @param radix the radix to use for string generation.

    @return `str`.*)

val ulltoa : Unsigned.ullong -> string -> int -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_ulltoa}SDL_ulltoa}: Convert an unsigned long long integer into a string.

This requires a radix to specified for string format. Specifying 10
produces a decimal number, 16 hexadecimal, etc. Must be in the range of 2
to 36.

Note that this function will overflow a buffer if[str]is not large enough
to hold the output! It may be safer to use SDL_snprintf to clamp output, or
SDL_asprintf to allocate a buffer. Otherwise, it doesn't hurt to allocate
much more space than you expect to use (and don't forget null terminator
bytes, etc).


    @param value the unsigned long long integer to convert.
    @param str the buffer to write the string into.
    @param radix the radix to use for string generation.

    @return `str`.*)

val atoi : string -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_atoi}SDL_atoi}: Parse an[int]from a string.

The result of calling[SDL_atoi(str)]is equivalent to[(int)SDL_strtol(str, NULL, 10)]


    @param str The null-terminated string to read. Must not be NULL.

    @return the parsed[int]*)

val atof : string -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_atof}SDL_atof}: Parse a[double]from a string.

The result of calling[SDL_atof(str)]is equivalent to[SDL_strtod(str,
NULL)]


    @param str The null-terminated string to read. Must not be NULL.

    @return the parsed[double]*)

val strtol : string -> string Ctypes.ptr option -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_strtol}SDL_strtol}: Parse a[long]from a string.

If[str]starts with whitespace, then those whitespace characters are
skipped before attempting to parse the number.

If the parsed number does not fit inside a[long] the result is clamped to
the minimum and maximum representable[long]values.


    @param str The null-terminated string to read. Must not be NULL.
    @param endp If not [None], the address of the first invalid character (i.e.
the next character after the parsed number) will be written to
this pointer.
    @param base The base of the integer to read. Supported values are 0 and 2
to 36 inclusive. If 0, the base will be inferred from the
number's prefix (0x for hexadecimal, 0 for octal, decimal
otherwise).

    @return the parsed[long] or 0 if no number could be parsed.*)

val strtoul : string -> string Ctypes.ptr option -> int -> int64
(** {{:https://wiki.libsdl.org/SDL3/SDL_strtoul}SDL_strtoul}: Parse an[unsigned long]from a string.

If[str]starts with whitespace, then those whitespace characters are
skipped before attempting to parse the number.

If the parsed number does not fit inside an[unsigned long] the result is
clamped to the maximum representable[unsigned long]value.


    @param str The null-terminated string to read. Must not be NULL.
    @param endp If not [None], the address of the first invalid character (i.e.
the next character after the parsed number) will be written to
this pointer.
    @param base The base of the integer to read. Supported values are 0 and 2
to 36 inclusive. If 0, the base will be inferred from the
number's prefix (0x for hexadecimal, 0 for octal, decimal
otherwise).

    @return the parsed[unsigned long] or 0 if no number could be parsed.*)

val strtoll : string -> string Ctypes.ptr option -> int -> int64
(** {{:https://wiki.libsdl.org/SDL3/SDL_strtoll}SDL_strtoll}: Parse a[long long]from a string.

If[str]starts with whitespace, then those whitespace characters are
skipped before attempting to parse the number.

If the parsed number does not fit inside a[long long] the result is
clamped to the minimum and maximum representable[long long]values.


    @param str The null-terminated string to read. Must not be NULL.
    @param endp If not [None], the address of the first invalid character (i.e.
the next character after the parsed number) will be written to
this pointer.
    @param base The base of the integer to read. Supported values are 0 and 2
to 36 inclusive. If 0, the base will be inferred from the
number's prefix (0x for hexadecimal, 0 for octal, decimal
otherwise).

    @return the parsed[long long] or 0 if no number could be parsed.*)

val strtoull : string -> string Ctypes.ptr option -> int -> int64
(** {{:https://wiki.libsdl.org/SDL3/SDL_strtoull}SDL_strtoull}: Parse an[unsigned long long]from a string.

If[str]starts with whitespace, then those whitespace characters are
skipped before attempting to parse the number.

If the parsed number does not fit inside an[unsigned long long] the
result is clamped to the maximum representable[unsigned long long]value.


    @param str The null-terminated string to read. Must not be NULL.
    @param endp If not [None], the address of the first invalid character (i.e.
the next character after the parsed number) will be written to
this pointer.
    @param base The base of the integer to read. Supported values are 0 and 2
to 36 inclusive. If 0, the base will be inferred from the
number's prefix (0x for hexadecimal, 0 for octal, decimal
otherwise).

    @return the parsed[unsigned long long] or 0 if no number could be
parsed.*)

val strtod : string -> string Ctypes.ptr option -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_strtod}SDL_strtod}: Parse a[double]from a string.

This function makes fewer guarantees than the C runtime[strtod]

- Only decimal notation is guaranteed to be supported. The handling of
  scientific and hexadecimal notation is unspecified.
- Whether or not INF and NAN can be parsed is unspecified.
- The precision of the result is unspecified.


    @param str the null-terminated string to read. Must not be NULL.
    @param endp if not [None], the address of the first invalid character (i.e.
the next character after the parsed number) will be written to
this pointer.

    @return the parsed[double] or 0 if no number could be parsed.*)

val strcmp : string -> string -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_strcmp}SDL_strcmp}: Compare two null-terminated UTF-8 strings.

Due to the nature of UTF-8 encoding, this will work with Unicode strings,
since effectively this function just compares bytes until it hits a
null-terminating character. Also due to the nature of UTF-8, this can be
used with SDL_qsort() to put strings in (roughly) alphabetical order.


    @param str1 the first string to compare. NULL is not permitted!
    @param str2 the second string to compare. NULL is not permitted!

    @return less than zero if str1 is "less than" str2, greater than zero if
str1 is "greater than" str2, and zero if the strings match
exactly.*)

val strncmp : string -> string -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_strncmp}SDL_strncmp}: Compare two UTF-8 strings up to a number of bytes.

Due to the nature of UTF-8 encoding, this will work with Unicode strings,
since effectively this function just compares bytes until it hits a
null-terminating character. Also due to the nature of UTF-8, this can be
used with SDL_qsort() to put strings in (roughly) alphabetical order.

Note that while this function is intended to be used with UTF-8, it is
doing a bytewise comparison, and[maxlen]specifies a _byte_ limit! If the
limit lands in the middle of a multi-byte UTF-8 sequence, it will only
compare a portion of the final character.
[maxlen]specifies a maximum number of bytes to compare; if the strings
match to this number of bytes (or both have matched to a null-terminator
character before this number of bytes), they will be considered equal.


    @param str1 the first string to compare. NULL is not permitted!
    @param str2 the second string to compare. NULL is not permitted!
    @param maxlen the maximum number of _bytes_ to compare.

    @return less than zero if str1 is "less than" str2, greater than zero if
str1 is "greater than" str2, and zero if the strings match
exactly.*)

val strcasecmp : string -> string -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_strcasecmp}SDL_strcasecmp}: Compare two null-terminated UTF-8 strings, case-insensitively.

This will work with Unicode strings, using a technique called
"case-folding" to handle the vast majority of case-sensitive human
languages regardless of system locale. It can deal with expanding values: a
German Eszett character can compare against two ASCII 's' chars and be
considered a match, for example. A notable exception: it does not handle
the Turkish 'i' character; human language is complicated!

Since this handles Unicode, it expects the string to be well-formed UTF-8
and not a null-terminated string of arbitrary bytes. Bytes that are not
valid UTF-8 are treated as Unicode character U+FFFD (REPLACEMENT
CHARACTER), which is to say two strings of random bits may turn out to
match if they convert to the same amount of replacement characters.


    @param str1 the first string to compare. NULL is not permitted!
    @param str2 the second string to compare. NULL is not permitted!

    @return less than zero if str1 is "less than" str2, greater than zero if
str1 is "greater than" str2, and zero if the strings match
exactly.*)

val strncasecmp : string -> string -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_strncasecmp}SDL_strncasecmp}: Compare two UTF-8 strings, case-insensitively, up to a number of bytes.

This will work with Unicode strings, using a technique called
"case-folding" to handle the vast majority of case-sensitive human
languages regardless of system locale. It can deal with expanding values: a
German Eszett character can compare against two ASCII 's' chars and be
considered a match, for example. A notable exception: it does not handle
the Turkish 'i' character; human language is complicated!

Since this handles Unicode, it expects the string to be well-formed UTF-8
and not a null-terminated string of arbitrary bytes. Bytes that are not
valid UTF-8 are treated as Unicode character U+FFFD (REPLACEMENT
CHARACTER), which is to say two strings of random bits may turn out to
match if they convert to the same amount of replacement characters.

Note that while this function is intended to be used with UTF-8,[maxlen]specifies a _byte_ limit! If the limit lands in the middle of a multi-byte
UTF-8 sequence, it may convert a portion of the final character to one or
more Unicode character U+FFFD (REPLACEMENT CHARACTER) so as not to overflow
a buffer.
[maxlen]specifies a maximum number of bytes to compare; if the strings
match to this number of bytes (or both have matched to a null-terminator
character before this number of bytes), they will be considered equal.


    @param str1 the first string to compare. NULL is not permitted!
    @param str2 the second string to compare. NULL is not permitted!
    @param maxlen the maximum number of bytes to compare.

    @return less than zero if str1 is "less than" str2, greater than zero if
str1 is "greater than" str2, and zero if the strings match
exactly.*)

val strpbrk : string -> string -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_strpbrk}SDL_strpbrk}: Searches a string for the first occurrence of any character contained in a
breakset, and returns a pointer from the string to that character.


    @param str The null-terminated string to be searched. Must not be NULL, and
must not overlap with[breakset]
    @param breakset A null-terminated string containing the list of characters
to look for. Must not be NULL, and must not overlap with[str]

    @return A pointer to the location, in str, of the first occurrence of a
character present in the breakset, or NULL if none is found.*)

val step_utf8 : string Ctypes.ptr -> Unsigned.size_t Ctypes.ptr option -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_StepUTF8}SDL_StepUTF8}: Decode a UTF-8 string, one Unicode codepoint at a time.

This will return the first Unicode codepoint in the UTF-8 encoded string in[*pstr] and then advance[*pstr]past any consumed bytes before returning.

It will not access more than[*pslen]bytes from the string.[*pslen]will
be adjusted, as well, subtracting the number of bytes consumed.
[pslen]is allowed to be NULL, in which case the string _must_ be
NULL-terminated, as the function will blindly read until it sees the NULL
char.

if[*pslen]is zero, it assumes the end of string is reached and returns a
zero codepoint regardless of the contents of the string buffer.

If the resulting codepoint is zero (a NULL terminator), or[*pslen]is
zero, it will not advance[*pstr]or[*pslen]at all.

Generally this function is called in a loop until it returns zero,
adjusting its parameters each iteration.

If an invalid UTF-8 sequence is encountered, this function returns
SDL_INVALID_UNICODE_CODEPOINT and advances the string/length by one byte
(which is to say, a multibyte sequence might produce several
SDL_INVALID_UNICODE_CODEPOINT returns before it syncs to the next valid
UTF-8 sequence).

Several things can generate invalid UTF-8 sequences, including overlong
encodings, the use of UTF-16 surrogate values, and truncated data. Please
refer to
\[RFC3629\](https://www.ietf.org/rfc/rfc3629.txt)
for details.


    @param pstr a pointer to a UTF-8 string pointer to be read and adjusted.
    @param pslen the number of bytes in the string, to be read and
adjusted. [None] is allowed.

    @return the first Unicode codepoint in the string.*)

val step_back_utf8 : string -> string Ctypes.ptr -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_StepBackUTF8}SDL_StepBackUTF8}: Decode a UTF-8 string in reverse, one Unicode codepoint at a time.

This will go to the start of the previous Unicode codepoint in the string,
move[*pstr]to that location and return that codepoint.

If[*pstr]is already at the start of the string), it will not advance[*pstr]at all.

Generally this function is called in a loop until it returns zero,
adjusting its parameter each iteration.

If an invalid UTF-8 sequence is encountered, this function returns
SDL_INVALID_UNICODE_CODEPOINT.

Several things can generate invalid UTF-8 sequences, including overlong
encodings, the use of UTF-16 surrogate values, and truncated data. Please
refer to
\[RFC3629\](https://www.ietf.org/rfc/rfc3629.txt)
for details.


    @param start a pointer to the beginning of the UTF-8 string.
    @param pstr a pointer to a UTF-8 string pointer to be read and adjusted.

    @return the previous Unicode codepoint in the string.*)

val ucs4_to_utf8 : int -> string -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_UCS4ToUTF8}SDL_UCS4ToUTF8}: Convert a single Unicode codepoint to UTF-8.

The buffer pointed to by[dst]must be at least 4 bytes long, as this
function may generate between 1 and 4 bytes of output.

This function returns the first byte _after_ the newly-written UTF-8
sequence, which is useful for encoding multiple codepoints in a loop, or
knowing where to write a NULL-terminator character to end the string (in
either case, plan to have a buffer of _more_ than 4 bytes!).

If[codepoint]is an invalid value (outside the Unicode range, or a UTF-16
surrogate value, etc), this will use U+FFFD (REPLACEMENT CHARACTER) for the
codepoint instead, and not set an error.

If[dst]is NULL, this returns NULL immediately without writing to the
pointer and without setting an error.


    @param codepoint a Unicode codepoint to convert to UTF-8.
    @param dst the location to write the encoded UTF-8. Must point to at least
4 bytes!

    @return the first byte past the newly-written UTF-8 sequence.*)

val srand : int64 -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_srand}SDL_srand}: Seeds the pseudo-random number generator.

Reusing the seed number will cause SDL_rand() to repeat the same stream of
'random' numbers.


    @param seed the value to use as a random number seed, or 0 to use
SDL_GetPerformanceCounter().
*)

val rand : int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_rand}SDL_rand}: Generate a pseudo-random number less than n for positive n

The method used is faster and of better quality than[rand() % n] Odds are
roughly 99.9% even for n = 1 million. Evenness is better for smaller n, and
much worse as n gets bigger.

Example: to simulate a d6 use[SDL_rand(6) + 1]The +1 converts 0..5 to
1..6

If you want to generate a pseudo-random number in the full range of Sint32,
you should use: (Sint32)SDL_rand_bits()

If you want reproducible output, be sure to initialize with SDL_srand()
first.

There are no guarantees as to the quality of the random sequence produced,
and this should not be used for security (cryptography, passwords) or where
money is on the line (loot-boxes, casinos). There are many random number
libraries available with different characteristics and you should pick one
of those to meet any serious needs.


    @param n the number of possible outcomes. n must be positive.

    @return a random value in the range of \[0 .. n-1\].*)

val randf : unit -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_randf}SDL_randf}: Generate a uniform pseudo-random floating point number less than 1.0

If you want reproducible output, be sure to initialize with SDL_srand()
first.

There are no guarantees as to the quality of the random sequence produced,
and this should not be used for security (cryptography, passwords) or where
money is on the line (loot-boxes, casinos). There are many random number
libraries available with different characteristics and you should pick one
of those to meet any serious needs.


    @return a random value in the range of \[0.0, 1.0).*)

val rand_bits : unit -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_rand_bits}SDL_rand_bits}: Generate 32 pseudo-random bits.

You likely want to use SDL_rand() to get a psuedo-random number instead.

There are no guarantees as to the quality of the random sequence produced,
and this should not be used for security (cryptography, passwords) or where
money is on the line (loot-boxes, casinos). There are many random number
libraries available with different characteristics and you should pick one
of those to meet any serious needs.


    @return a random value in the range of \[0-SDL_MAX_UINT32\].*)

val rand_r : Unsigned.ulong Ctypes.ptr -> int -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_rand_r}SDL_rand_r}: Generate a pseudo-random number less than n for positive n

The method used is faster and of better quality than[rand() % n] Odds are
roughly 99.9% even for n = 1 million. Evenness is better for smaller n, and
much worse as n gets bigger.

Example: to simulate a d6 use[SDL_rand_r(state, 6) + 1]The +1 converts
0..5 to 1..6

If you want to generate a pseudo-random number in the full range of Sint32,
you should use: (Sint32)SDL_rand_bits_r(state)

There are no guarantees as to the quality of the random sequence produced,
and this should not be used for security (cryptography, passwords) or where
money is on the line (loot-boxes, casinos). There are many random number
libraries available with different characteristics and you should pick one
of those to meet any serious needs.


    @param state a pointer to the current random number state, this may not be
NULL.
    @param n the number of possible outcomes. n must be positive.

    @return a random value in the range of \[0 .. n-1\].*)

val randf_r : unit -> float * int64
(** {{:https://wiki.libsdl.org/SDL3/SDL_randf_r}SDL_randf_r}: Generate a uniform pseudo-random floating point number less than 1.0

If you want reproducible output, be sure to initialize with SDL_srand()
first.

There are no guarantees as to the quality of the random sequence produced,
and this should not be used for security (cryptography, passwords) or where
money is on the line (loot-boxes, casinos). There are many random number
libraries available with different characteristics and you should pick one
of those to meet any serious needs.


    @return a pointer to the current random number state, this may not be
NULL.*)

val rand_bits_r : unit -> int * int64
(** {{:https://wiki.libsdl.org/SDL3/SDL_rand_bits_r}SDL_rand_bits_r}: Generate 32 pseudo-random bits.

You likely want to use SDL_rand_r() to get a psuedo-random number instead.

There are no guarantees as to the quality of the random sequence produced,
and this should not be used for security (cryptography, passwords) or where
money is on the line (loot-boxes, casinos). There are many random number
libraries available with different characteristics and you should pick one
of those to meet any serious needs.


    @return a pointer to the current random number state, this may not be
NULL.*)

val acos : float -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_acos}SDL_acos}: Compute the arc cosine of[x]

The definition of[y = acos(x)]is[x = cos(y)]

Domain:[-1 <= x <= 1]
Range:[0 <= y <= Pi]
This function operates on double-precision floating point values, use
SDL_acosf for single-precision floats.

This function may use a different approximation across different versions,
platforms and configurations. i.e, it can return a different value given
the same input on different machines or operating systems, or if SDL is
updated.


    @param x floating point value.

    @return arc cosine of[x] in radians.*)

val acosf : float -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_acosf}SDL_acosf}: Compute the arc cosine of[x]

The definition of[y = acos(x)]is[x = cos(y)]

Domain:[-1 <= x <= 1]
Range:[0 <= y <= Pi]
This function operates on single-precision floating point values, use
SDL_acos for double-precision floats.

This function may use a different approximation across different versions,
platforms and configurations. i.e, it can return a different value given
the same input on different machines or operating systems, or if SDL is
updated.


    @param x floating point value.

    @return arc cosine of[x] in radians.*)

val asin : float -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_asin}SDL_asin}: Compute the arc sine of[x]

The definition of[y = asin(x)]is[x = sin(y)]

Domain:[-1 <= x <= 1]
Range:[-Pi/2 <= y <= Pi/2]
This function operates on double-precision floating point values, use
SDL_asinf for single-precision floats.

This function may use a different approximation across different versions,
platforms and configurations. i.e, it can return a different value given
the same input on different machines or operating systems, or if SDL is
updated.


    @param x floating point value.

    @return arc sine of[x] in radians.*)

val asinf : float -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_asinf}SDL_asinf}: Compute the arc sine of[x]

The definition of[y = asin(x)]is[x = sin(y)]

Domain:[-1 <= x <= 1]
Range:[-Pi/2 <= y <= Pi/2]
This function operates on single-precision floating point values, use
SDL_asin for double-precision floats.

This function may use a different approximation across different versions,
platforms and configurations. i.e, it can return a different value given
the same input on different machines or operating systems, or if SDL is
updated.


    @param x floating point value.

    @return arc sine of[x] in radians.*)

val atan : float -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_atan}SDL_atan}: Compute the arc tangent of[x]

The definition of[y = atan(x)]is[x = tan(y)]

Domain:[-INF <= x <= INF]
Range:[-Pi/2 <= y <= Pi/2]
This function operates on double-precision floating point values, use
SDL_atanf for single-precision floats.

To calculate the arc tangent of y / x, use SDL_atan2.

This function may use a different approximation across different versions,
platforms and configurations. i.e, it can return a different value given
the same input on different machines or operating systems, or if SDL is
updated.


    @param x floating point value.

    @return arc tangent of of[x]in radians, or 0 if[x = 0]*)

val atanf : float -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_atanf}SDL_atanf}: Compute the arc tangent of[x]

The definition of[y = atan(x)]is[x = tan(y)]

Domain:[-INF <= x <= INF]
Range:[-Pi/2 <= y <= Pi/2]
This function operates on single-precision floating point values, use
SDL_atan for dboule-precision floats.

To calculate the arc tangent of y / x, use SDL_atan2f.

This function may use a different approximation across different versions,
platforms and configurations. i.e, it can return a different value given
the same input on different machines or operating systems, or if SDL is
updated.


    @param x floating point value.

    @return arc tangent of of[x]in radians, or 0 if[x = 0]*)

val atan2 : float -> float -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_atan2}SDL_atan2}: Compute the arc tangent of[y / x] using the signs of x and y to adjust
the result's quadrant.

The definition of[z = atan2(x, y)]is[y = x tan(z)] where the quadrant
of z is determined based on the signs of x and y.

Domain:[-INF <= x <= INF][-INF <= y <= INF]
Range:[-Pi <= y <= Pi]
This function operates on double-precision floating point values, use
SDL_atan2f for single-precision floats.

To calculate the arc tangent of a single value, use SDL_atan.

This function may use a different approximation across different versions,
platforms and configurations. i.e, it can return a different value given
the same input on different machines or operating systems, or if SDL is
updated.


    @param y floating point value of the numerator (y coordinate).
    @param x floating point value of the denominator (x coordinate).

    @return arc tangent of of[y / x]in radians, or, if[x = 0] either[-Pi/2][0] or[Pi/2] depending on the value of[y]*)

val atan2f : float -> float -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_atan2f}SDL_atan2f}: Compute the arc tangent of[y / x] using the signs of x and y to adjust
the result's quadrant.

The definition of[z = atan2(x, y)]is[y = x tan(z)] where the quadrant
of z is determined based on the signs of x and y.

Domain:[-INF <= x <= INF][-INF <= y <= INF]
Range:[-Pi <= y <= Pi]
This function operates on single-precision floating point values, use
SDL_atan2 for double-precision floats.

To calculate the arc tangent of a single value, use SDL_atanf.

This function may use a different approximation across different versions,
platforms and configurations. i.e, it can return a different value given
the same input on different machines or operating systems, or if SDL is
updated.


    @param y floating point value of the numerator (y coordinate).
    @param x floating point value of the denominator (x coordinate).

    @return arc tangent of of[y / x]in radians, or, if[x = 0] either[-Pi/2][0] or[Pi/2] depending on the value of[y]*)

val ceil : float -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_ceil}SDL_ceil}: Compute the ceiling of[x]

The ceiling of[x]is the smallest integer[y]such that[y >= x] i.e[x]rounded up to the nearest integer.

Domain:[-INF <= x <= INF]
Range:[-INF <= y <= INF] y integer

This function operates on double-precision floating point values, use
SDL_ceilf for single-precision floats.


    @param x floating point value.

    @return the ceiling of[x]*)

val ceilf : float -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_ceilf}SDL_ceilf}: Compute the ceiling of[x]

The ceiling of[x]is the smallest integer[y]such that[y >= x] i.e[x]rounded up to the nearest integer.

Domain:[-INF <= x <= INF]
Range:[-INF <= y <= INF] y integer

This function operates on single-precision floating point values, use
SDL_ceil for double-precision floats.


    @param x floating point value.

    @return the ceiling of[x]*)

val copysign : float -> float -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_copysign}SDL_copysign}: Copy the sign of one floating-point value to another.

The definition of copysign is that ``copysign(x, y) = abs(x) * sign(y)``.

Domain:[-INF <= x <= INF] ``-INF <= y <= f``

Range:[-INF <= z <= INF]
This function operates on double-precision floating point values, use
SDL_copysignf for single-precision floats.


    @param x floating point value to use as the magnitude.
    @param y floating point value to use as the sign.

    @return the floating point value with the sign of y and the magnitude of
x.*)

val copysignf : float -> float -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_copysignf}SDL_copysignf}: Copy the sign of one floating-point value to another.

The definition of copysign is that ``copysign(x, y) = abs(x) * sign(y)``.

Domain:[-INF <= x <= INF] ``-INF <= y <= f``

Range:[-INF <= z <= INF]
This function operates on single-precision floating point values, use
SDL_copysign for double-precision floats.


    @param x floating point value to use as the magnitude.
    @param y floating point value to use as the sign.

    @return the floating point value with the sign of y and the magnitude of
x.*)

val cos : float -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_cos}SDL_cos}: Compute the cosine of[x]

Domain:[-INF <= x <= INF]
Range:[-1 <= y <= 1]
This function operates on double-precision floating point values, use
SDL_cosf for single-precision floats.

This function may use a different approximation across different versions,
platforms and configurations. i.e, it can return a different value given
the same input on different machines or operating systems, or if SDL is
updated.


    @param x floating point value, in radians.

    @return cosine of[x]*)

val cosf : float -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_cosf}SDL_cosf}: Compute the cosine of[x]

Domain:[-INF <= x <= INF]
Range:[-1 <= y <= 1]
This function operates on single-precision floating point values, use
SDL_cos for double-precision floats.

This function may use a different approximation across different versions,
platforms and configurations. i.e, it can return a different value given
the same input on different machines or operating systems, or if SDL is
updated.


    @param x floating point value, in radians.

    @return cosine of[x]*)

val exp : float -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_exp}SDL_exp}: Compute the exponential of[x]

The definition of[y = exp(x)]is[y = e^x] where[e]is the base of the
natural logarithm. The inverse is the natural logarithm, SDL_log.

Domain:[-INF <= x <= INF]
Range:[0 <= y <= INF]
The output will overflow if[exp(x)]is too large to be represented.

This function operates on double-precision floating point values, use
SDL_expf for single-precision floats.

This function may use a different approximation across different versions,
platforms and configurations. i.e, it can return a different value given
the same input on different machines or operating systems, or if SDL is
updated.


    @param x floating point value.

    @return value of[e^x]*)

val expf : float -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_expf}SDL_expf}: Compute the exponential of[x]

The definition of[y = exp(x)]is[y = e^x] where[e]is the base of the
natural logarithm. The inverse is the natural logarithm, SDL_logf.

Domain:[-INF <= x <= INF]
Range:[0 <= y <= INF]
The output will overflow if[exp(x)]is too large to be represented.

This function operates on single-precision floating point values, use
SDL_exp for double-precision floats.

This function may use a different approximation across different versions,
platforms and configurations. i.e, it can return a different value given
the same input on different machines or operating systems, or if SDL is
updated.


    @param x floating point value.

    @return value of[e^x]*)

val fabs : float -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_fabs}SDL_fabs}: Compute the absolute value of[x]
Domain:[-INF <= x <= INF]
Range:[0 <= y <= INF]
This function operates on double-precision floating point values, use
SDL_fabsf for single-precision floats.


    @param x floating point value to use as the magnitude.

    @return the absolute value of[x]*)

val fabsf : float -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_fabsf}SDL_fabsf}: Compute the absolute value of[x]
Domain:[-INF <= x <= INF]
Range:[0 <= y <= INF]
This function operates on single-precision floating point values, use
SDL_fabs for double-precision floats.


    @param x floating point value to use as the magnitude.

    @return the absolute value of[x]*)

val floor : float -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_floor}SDL_floor}: Compute the floor of[x]

The floor of[x]is the largest integer[y]such that[y <= x] i.e[x]rounded down to the nearest integer.

Domain:[-INF <= x <= INF]
Range:[-INF <= y <= INF] y integer

This function operates on double-precision floating point values, use
SDL_floorf for single-precision floats.


    @param x floating point value.

    @return the floor of[x]*)

val floorf : float -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_floorf}SDL_floorf}: Compute the floor of[x]

The floor of[x]is the largest integer[y]such that[y <= x] i.e[x]rounded down to the nearest integer.

Domain:[-INF <= x <= INF]
Range:[-INF <= y <= INF] y integer

This function operates on single-precision floating point values, use
SDL_floor for double-precision floats.


    @param x floating point value.

    @return the floor of[x]*)

val trunc : float -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_trunc}SDL_trunc}: Truncate[x]to an integer.

Rounds[x]to the next closest integer to 0. This is equivalent to removing
the fractional part of[x] leaving only the integer part.

Domain:[-INF <= x <= INF]
Range:[-INF <= y <= INF] y integer

This function operates on double-precision floating point values, use
SDL_truncf for single-precision floats.


    @param x floating point value.

    @return `x` truncated to an integer.*)

val truncf : float -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_truncf}SDL_truncf}: Truncate[x]to an integer.

Rounds[x]to the next closest integer to 0. This is equivalent to removing
the fractional part of[x] leaving only the integer part.

Domain:[-INF <= x <= INF]
Range:[-INF <= y <= INF] y integer

This function operates on single-precision floating point values, use
SDL_trunc for double-precision floats.


    @param x floating point value.

    @return `x` truncated to an integer.*)

val fmod : float -> float -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_fmod}SDL_fmod}: Return the floating-point remainder of[x / y]
Divides[x]by[y] and returns the remainder.

Domain:[-INF <= x <= INF][-INF <= y <= INF][y != 0]
Range:[-y <= z <= y]
This function operates on double-precision floating point values, use
SDL_fmodf for single-precision floats.


    @param x the numerator.
    @param y the denominator. Must not be 0.

    @return the remainder of[x / y]*)

val fmodf : float -> float -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_fmodf}SDL_fmodf}: Return the floating-point remainder of[x / y]
Divides[x]by[y] and returns the remainder.

Domain:[-INF <= x <= INF][-INF <= y <= INF][y != 0]
Range:[-y <= z <= y]
This function operates on single-precision floating point values, use
SDL_fmod for double-precision floats.


    @param x the numerator.
    @param y the denominator. Must not be 0.

    @return the remainder of[x / y]*)

val isinf : float -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_isinf}SDL_isinf}: Return whether the value is infinity.


    @param x double-precision floating point value.

    @return non-zero if the value is infinity, 0 otherwise.*)

val isinff : float -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_isinff}SDL_isinff}: Return whether the value is infinity.


    @param x floating point value.

    @return non-zero if the value is infinity, 0 otherwise.*)

val isnan : float -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_isnan}SDL_isnan}: Return whether the value is NaN.


    @param x double-precision floating point value.

    @return non-zero if the value is NaN, 0 otherwise.*)

val isnanf : float -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_isnanf}SDL_isnanf}: Return whether the value is NaN.


    @param x floating point value.

    @return non-zero if the value is NaN, 0 otherwise.*)

val log : float -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_log}SDL_log}: Compute the natural logarithm of[x]

Domain:[0 < x <= INF]
Range:[-INF <= y <= INF]
It is an error for[x]to be less than or equal to 0.

This function operates on double-precision floating point values, use
SDL_logf for single-precision floats.

This function may use a different approximation across different versions,
platforms and configurations. i.e, it can return a different value given
the same input on different machines or operating systems, or if SDL is
updated.


    @param x floating point value. Must be greater than 0.

    @return the natural logarithm of[x]*)

val logf : float -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_logf}SDL_logf}: Compute the natural logarithm of[x]

Domain:[0 < x <= INF]
Range:[-INF <= y <= INF]
It is an error for[x]to be less than or equal to 0.

This function operates on single-precision floating point values, use
SDL_log for double-precision floats.

This function may use a different approximation across different versions,
platforms and configurations. i.e, it can return a different value given
the same input on different machines or operating systems, or if SDL is
updated.


    @param x floating point value. Must be greater than 0.

    @return the natural logarithm of[x]*)

val log10 : float -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_log10}SDL_log10}: Compute the base-10 logarithm of[x]

Domain:[0 < x <= INF]
Range:[-INF <= y <= INF]
It is an error for[x]to be less than or equal to 0.

This function operates on double-precision floating point values, use
SDL_log10f for single-precision floats.

This function may use a different approximation across different versions,
platforms and configurations. i.e, it can return a different value given
the same input on different machines or operating systems, or if SDL is
updated.


    @param x floating point value. Must be greater than 0.

    @return the logarithm of[x]*)

val log10f : float -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_log10f}SDL_log10f}: Compute the base-10 logarithm of[x]

Domain:[0 < x <= INF]
Range:[-INF <= y <= INF]
It is an error for[x]to be less than or equal to 0.

This function operates on single-precision floating point values, use
SDL_log10 for double-precision floats.

This function may use a different approximation across different versions,
platforms and configurations. i.e, it can return a different value given
the same input on different machines or operating systems, or if SDL is
updated.


    @param x floating point value. Must be greater than 0.

    @return the logarithm of[x]*)

val modf : float -> float Ctypes.ptr -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_modf}SDL_modf}: Split[x]into integer and fractional parts

This function operates on double-precision floating point values, use
SDL_modff for single-precision floats.


    @param x floating point value.
    @param y output pointer to store the integer part of[x]

    @return the fractional part of[x]*)

val modff : float -> float * float
(** {{:https://wiki.libsdl.org/SDL3/SDL_modff}SDL_modff}: Split[x]into integer and fractional parts

This function operates on single-precision floating point values, use
SDL_modf for double-precision floats.


    @param x floating point value.

    @return output pointer to store the integer part of[x]*)

val pow : float -> float -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_pow}SDL_pow}: Raise[x]to the power[y]
Domain:[-INF <= x <= INF][-INF <= y <= INF]
Range:[-INF <= z <= INF]
If[y]is the base of the natural logarithm (e), consider using SDL_exp
instead.

This function operates on double-precision floating point values, use
SDL_powf for single-precision floats.

This function may use a different approximation across different versions,
platforms and configurations. i.e, it can return a different value given
the same input on different machines or operating systems, or if SDL is
updated.


    @param x the base.
    @param y the exponent.

    @return `[ raised to the power ]`.*)

val powf : float -> float -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_powf}SDL_powf}: Raise[x]to the power[y]
Domain:[-INF <= x <= INF][-INF <= y <= INF]
Range:[-INF <= z <= INF]
If[y]is the base of the natural logarithm (e), consider using SDL_exp
instead.

This function operates on single-precision floating point values, use
SDL_pow for double-precision floats.

This function may use a different approximation across different versions,
platforms and configurations. i.e, it can return a different value given
the same input on different machines or operating systems, or if SDL is
updated.


    @param x the base.
    @param y the exponent.

    @return `[ raised to the power ]`.*)

val round : float -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_round}SDL_round}: Round[x]to the nearest integer.

Rounds[x]to the nearest integer. Values halfway between integers will be
rounded away from zero.

Domain:[-INF <= x <= INF]
Range:[-INF <= y <= INF] y integer

This function operates on double-precision floating point values, use
SDL_roundf for single-precision floats. To get the result as an integer
type, use SDL_lround.


    @param x floating point value.

    @return the nearest integer to[x]*)

val roundf : float -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_roundf}SDL_roundf}: Round[x]to the nearest integer.

Rounds[x]to the nearest integer. Values halfway between integers will be
rounded away from zero.

Domain:[-INF <= x <= INF]
Range:[-INF <= y <= INF] y integer

This function operates on single-precision floating point values, use
SDL_round for double-precision floats. To get the result as an integer
type, use SDL_lroundf.


    @param x floating point value.

    @return the nearest integer to[x]*)

val lround : float -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_lround}SDL_lround}: Round[x]to the nearest integer representable as a long

Rounds[x]to the nearest integer. Values halfway between integers will be
rounded away from zero.

Domain:[-INF <= x <= INF]
Range:[MIN_LONG <= y <= MAX_LONG]
This function operates on double-precision floating point values, use
SDL_lroundf for single-precision floats. To get the result as a
floating-point type, use SDL_round.


    @param x floating point value.

    @return the nearest integer to[x]*)

val lroundf : float -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_lroundf}SDL_lroundf}: Round[x]to the nearest integer representable as a long

Rounds[x]to the nearest integer. Values halfway between integers will be
rounded away from zero.

Domain:[-INF <= x <= INF]
Range:[MIN_LONG <= y <= MAX_LONG]
This function operates on single-precision floating point values, use
SDL_lround for double-precision floats. To get the result as a
floating-point type, use SDL_roundf.


    @param x floating point value.

    @return the nearest integer to[x]*)

val scalbn : float -> int -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_scalbn}SDL_scalbn}: Scale[x]by an integer power of two.

Multiplies[x]by the[n]h power of the floating point radix (always 2).

Domain:[-INF <= x <= INF][n]integer

Range:[-INF <= y <= INF]
This function operates on double-precision floating point values, use
SDL_scalbnf for single-precision floats.


    @param x floating point value to be scaled.
    @param n integer exponent.

    @return `x * 2^n`.*)

val scalbnf : float -> int -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_scalbnf}SDL_scalbnf}: Scale[x]by an integer power of two.

Multiplies[x]by the[n]h power of the floating point radix (always 2).

Domain:[-INF <= x <= INF][n]integer

Range:[-INF <= y <= INF]
This function operates on single-precision floating point values, use
SDL_scalbn for double-precision floats.


    @param x floating point value to be scaled.
    @param n integer exponent.

    @return `x * 2^n`.*)

val sin : float -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_sin}SDL_sin}: Compute the sine of[x]

Domain:[-INF <= x <= INF]
Range:[-1 <= y <= 1]
This function operates on double-precision floating point values, use
SDL_sinf for single-precision floats.

This function may use a different approximation across different versions,
platforms and configurations. i.e, it can return a different value given
the same input on different machines or operating systems, or if SDL is
updated.


    @param x floating point value, in radians.

    @return sine of[x]*)

val sinf : float -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_sinf}SDL_sinf}: Compute the sine of[x]

Domain:[-INF <= x <= INF]
Range:[-1 <= y <= 1]
This function operates on single-precision floating point values, use
SDL_sin for double-precision floats.

This function may use a different approximation across different versions,
platforms and configurations. i.e, it can return a different value given
the same input on different machines or operating systems, or if SDL is
updated.


    @param x floating point value, in radians.

    @return sine of[x]*)

val sqrt : float -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_sqrt}SDL_sqrt}: Compute the square root of[x]

Domain:[0 <= x <= INF]
Range:[0 <= y <= INF]
This function operates on double-precision floating point values, use
SDL_sqrtf for single-precision floats.

This function may use a different approximation across different versions,
platforms and configurations. i.e, it can return a different value given
the same input on different machines or operating systems, or if SDL is
updated.


    @param x floating point value. Must be greater than or equal to 0.

    @return square root of[x]*)

val sqrtf : float -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_sqrtf}SDL_sqrtf}: Compute the square root of[x]

Domain:[0 <= x <= INF]
Range:[0 <= y <= INF]
This function operates on single-precision floating point values, use
SDL_sqrt for double-precision floats.

This function may use a different approximation across different versions,
platforms and configurations. i.e, it can return a different value given
the same input on different machines or operating systems, or if SDL is
updated.


    @param x floating point value. Must be greater than or equal to 0.

    @return square root of[x]*)

val tan : float -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_tan}SDL_tan}: Compute the tangent of[x]

Domain:[-INF <= x <= INF]
Range:[-INF <= y <= INF]
This function operates on double-precision floating point values, use
SDL_tanf for single-precision floats.

This function may use a different approximation across different versions,
platforms and configurations. i.e, it can return a different value given
the same input on different machines or operating systems, or if SDL is
updated.


    @param x floating point value, in radians.

    @return tangent of[x]*)

val tanf : float -> float
(** {{:https://wiki.libsdl.org/SDL3/SDL_tanf}SDL_tanf}: Compute the tangent of[x]

Domain:[-INF <= x <= INF]
Range:[-INF <= y <= INF]
This function operates on single-precision floating point values, use
SDL_tan for double-precision floats.

This function may use a different approximation across different versions,
platforms and configurations. i.e, it can return a different value given
the same input on different machines or operating systems, or if SDL is
updated.


    @param x floating point value, in radians.

    @return tangent of[x]*)

val iconv_open : string -> string -> iconv_data_t result
(** {{:https://wiki.libsdl.org/SDL3/SDL_iconv_open}SDL_iconv_open}: This function allocates a context for the specified character set
conversion.


    @param tocode The target character encoding, must not be NULL.
    @param fromcode The source character encoding, must not be NULL.

    @return a handle that must be freed with SDL_iconv_close, or
SDL_ICONV_ERROR on failure.*)

val iconv_close : iconv_t -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_iconv_close}SDL_iconv_close}: This function frees a context used for character set conversion.


    @param cd The character set conversion handle.

    @return 0 on success, or -1 on failure.*)

val iconv : iconv_t -> string Ctypes.ptr -> Unsigned.size_t Ctypes.ptr -> string Ctypes.ptr -> Unsigned.size_t Ctypes.ptr -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_iconv}SDL_iconv}: This function converts text between encodings, reading from and writing to
a buffer.

It returns the number of successful conversions on success. On error,
SDL_ICONV_E2BIG is returned when the output buffer is too small, or
SDL_ICONV_EILSEQ is returned when an invalid input sequence is encountered,
or SDL_ICONV_EINVAL is returned when an incomplete input sequence is
encountered.

On exit:

- inbuf will point to the beginning of the next multibyte sequence. On
  error, this is the location of the problematic input sequence. On
  success, this is the end of the input sequence.
- inbytesleft will be set to the number of bytes left to convert, which
  will be 0 on success.
- outbuf will point to the location where to store the next output byte.
- outbytesleft will be set to the number of bytes left in the output
  buffer.


    @param cd The character set conversion context, created in
SDL_iconv_open().
    @param inbuf Address of variable that points to the first character of the
input sequence.
    @param inbytesleft The number of bytes in the input buffer.
    @param outbuf Address of variable that points to the output buffer.
    @param outbytesleft The number of bytes in the output buffer.

    @return the number of conversions on success, or a negative error code.*)

val iconv_string : string -> string -> string -> int -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_iconv_string}SDL_iconv_string}: Helper function to convert a string's encoding in one call.

This function converts a buffer or string between encodings in one pass.

The string does not need to be NULL-terminated; this function operates on
the number of bytes specified in[inbytesleft]whether there is a NULL
character anywhere in the buffer.

The returned string is owned by the caller, and should be passed to
SDL_free when no longer needed.


    @param tocode the character encoding of the output string. Examples are
"UTF-8", "UCS-4", etc.
    @param fromcode the character encoding of data in[inbuf]
    @param inbuf the string to convert to a different encoding.
    @param inbytesleft the size of the input string _in bytes_.

    @return a new string, converted to the new encoding, or NULL on error.*)

end
include module type of Global

module Environment : sig

val get : unit -> environment result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetEnvironment}SDL_GetEnvironment}: Get the process environment.

This is initialized at application start and is not affected by setenv()
and unsetenv() calls after that point. Use SDL_SetEnvironmentVariable() and
SDL_UnsetEnvironmentVariable() if you want to modify this environment, or
SDL_setenv_unsafe() or SDL_unsetenv_unsafe() if you want changes to persist
in the C runtime environment after SDL_Quit().


    @return the environment for the process or [Error] on failure;
call SDL_GetError() for more information.*)

val create : bool -> environment result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateEnvironment}SDL_CreateEnvironment}: Create a set of environment variables


    @param populated true to initialize it from the C runtime environment,
false to create an empty environment.

    @return the new environment or [Error] on failure; call
SDL_GetError() for more information.*)

val get_variable : environment -> string -> string
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetEnvironmentVariable}SDL_GetEnvironmentVariable}: Get the value of a variable in the environment.


    @param env the environment to query.
    @param name the name of the variable to get.

    @return a pointer to the value of the variable or NULL if it can't be
found.*)

val get_variables : environment -> string Ctypes.ptr
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetEnvironmentVariables}SDL_GetEnvironmentVariables}: Get all variables in the environment.


    @param env the environment to query.

    @return a NULL terminated array of pointers to environment variables in
the form "variable=value" or NULL on failure; call SDL_GetError()
for more information. This is a single allocation that should be
freed with SDL_free() when it is no longer needed.*)

val set_variable : environment -> string -> string -> bool -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_SetEnvironmentVariable}SDL_SetEnvironmentVariable}: Set the value of a variable in the environment.


    @param env the environment to modify.
    @param name the name of the variable to set.
    @param value the value of the variable to set.
    @param overwrite true to overwrite the variable if it exists, false to
return success without setting the variable if it already
exists.*)

val unset_variable : environment -> string -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_UnsetEnvironmentVariable}SDL_UnsetEnvironmentVariable}: Clear a variable from the environment.


    @param env the environment to modify.
    @param name the name of the variable to unset.*)

val destroy : environment -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_DestroyEnvironment}SDL_DestroyEnvironment}: Destroy a set of environment variables.


    @param env the environment to destroy.
*)

end

