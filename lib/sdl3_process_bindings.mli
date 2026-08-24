(* This file is part of the SDL3 OCaml bindings. Auto-generated file. *)

open Sdl3_types
module Process : sig

val create : string Ctypes.ptr -> bool -> process result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateProcess}SDL_CreateProcess}: Create a new process.

The path to the executable is supplied in args\[0\]. args\[1..N\] are
additional arguments passed on the command line of the new process, and the
argument list should be terminated with a NULL, e.g.:

{[
const char *args\[\] = { "myprogram", "argument", NULL };
]}

Setting pipe_stdio to true is equivalent to setting[SDL_PROP_PROCESS_CREATE_STDIN_NUMBER]and[SDL_PROP_PROCESS_CREATE_STDOUT_NUMBER]to[SDL_PROCESS_STDIO_APP] and
will allow the use of SDL_ReadProcess() or SDL_GetProcessInput() and
SDL_GetProcessOutput().

See SDL_CreateProcessWithProperties() for more details.


    @param args the path and arguments for the new process.
    @param pipe_stdio true to create pipes to the process's standard input and
from the process's standard output, false for the process
to have no input and inherit the application's standard
output.

    @return the newly created and running process, or [Error] if the process
couldn't be created.*)

val create_with_properties : int -> process result
(** {{:https://wiki.libsdl.org/SDL3/SDL_CreateProcessWithProperties}SDL_CreateProcessWithProperties}: Create a new process with the specified properties.

These are the supported properties:

-[SDL_PROP_PROCESS_CREATE_ARGS_POINTER] an array of strings containing
  the program to run, any arguments, and a NULL pointer, e.g. const char
  *args\[\] = { "myprogram", "argument", NULL }. This is a required property.
-[SDL_PROP_PROCESS_CREATE_ENVIRONMENT_POINTER] an SDL_Environment
  pointer. If this property is set, it will be the entire environment for
  the process, otherwise the current environment is used.
-[SDL_PROP_PROCESS_CREATE_WORKING_DIRECTORY_STRING] a UTF-8 encoded
  string representing the working directory for the process, defaults to
  the current working directory.
-[SDL_PROP_PROCESS_CREATE_STDIN_NUMBER] an SDL_ProcessIO value describing
  where standard input for the process comes from, defaults to
 [SDL_PROCESS_STDIO_NULL]
-[SDL_PROP_PROCESS_CREATE_STDIN_POINTER] an SDL_IOStream pointer used for
  standard input when[SDL_PROP_PROCESS_CREATE_STDIN_NUMBER]is set to
 [SDL_PROCESS_STDIO_REDIRECT]
-[SDL_PROP_PROCESS_CREATE_STDOUT_NUMBER] an SDL_ProcessIO value
  describing where standard output for the process goes to, defaults to
 [SDL_PROCESS_STDIO_INHERITED]
-[SDL_PROP_PROCESS_CREATE_STDOUT_POINTER] an SDL_IOStream pointer used
  for standard output when[SDL_PROP_PROCESS_CREATE_STDOUT_NUMBER]is set
  to[SDL_PROCESS_STDIO_REDIRECT]
-[SDL_PROP_PROCESS_CREATE_STDERR_NUMBER] an SDL_ProcessIO value
  describing where standard error for the process goes to, defaults to
 [SDL_PROCESS_STDIO_INHERITED]
-[SDL_PROP_PROCESS_CREATE_STDERR_POINTER] an SDL_IOStream pointer used
  for standard error when[SDL_PROP_PROCESS_CREATE_STDERR_NUMBER]is set to
 [SDL_PROCESS_STDIO_REDIRECT]
-[SDL_PROP_PROCESS_CREATE_STDERR_TO_STDOUT_BOOLEAN] true if the error
  output of the process should be redirected into the standard output of
  the process. This property has no effect if
 [SDL_PROP_PROCESS_CREATE_STDERR_NUMBER]is set.
-[SDL_PROP_PROCESS_CREATE_BACKGROUND_BOOLEAN] true if the process should
  run in the background. In this case the default input and output is
 [SDL_PROCESS_STDIO_NULL]and the exitcode of the process is not
  available, and will always be 0.
-[SDL_PROP_PROCESS_CREATE_CMDLINE_STRING] a string containing the program
  to run and any parameters. This string is passed directly to
 [CreateProcess]on Windows, and does nothing on other platforms. This
  property is only important if you want to start programs that does
  non-standard command-line processing, and in most cases using
 [SDL_PROP_PROCESS_CREATE_ARGS_POINTER]is sufficient.

On POSIX platforms, wait() and waitpid(-1, ...) should not be called, and
SIGCHLD should not be ignored or handled because those would prevent SDL
from properly tracking the lifetime of the underlying process. You should
use SDL_WaitProcess() instead.


    @param props the properties to use.

    @return the newly created and running process, or [Error] if the process
couldn't be created.*)

val get_properties : process -> int
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetProcessProperties}SDL_GetProcessProperties}: Get the properties associated with a process.

The following read-only properties are provided by SDL:

-[SDL_PROP_PROCESS_PID_NUMBER] the process ID of the process.
-[SDL_PROP_PROCESS_STDIN_POINTER] an SDL_IOStream that can be used to
  write input to the process, if it was created with
 [SDL_PROP_PROCESS_CREATE_STDIN_NUMBER]set to[SDL_PROCESS_STDIO_APP]
-[SDL_PROP_PROCESS_STDOUT_POINTER] a non-blocking SDL_IOStream that can
  be used to read output from the process, if it was created with
 [SDL_PROP_PROCESS_CREATE_STDOUT_NUMBER]set to[SDL_PROCESS_STDIO_APP]
-[SDL_PROP_PROCESS_STDERR_POINTER] a non-blocking SDL_IOStream that can
  be used to read error output from the process, if it was created with
 [SDL_PROP_PROCESS_CREATE_STDERR_NUMBER]set to[SDL_PROCESS_STDIO_APP]
-[SDL_PROP_PROCESS_BACKGROUND_BOOLEAN] true if the process is running in
  the background.


    @param process the process to query.

    @return a valid property ID on success or 0 on failure; call
SDL_GetError() for more information.*)

val read : process -> Unsigned.size_t Ctypes.ptr option -> data * int
(** {{:https://wiki.libsdl.org/SDL3/SDL_ReadProcess}SDL_ReadProcess}: Read all the output from a process.

If a process was created with I/O enabled, you can use this function to
read the output. This function blocks until the process is complete,
capturing all output, and providing the process exit code.

The data is allocated with a zero byte at the end (null terminated) for
convenience. This extra byte is not included in the value reported via[datasize]

The data should be freed with SDL_free().


    @param process The process to read.
    @param datasize a pointer filled in with the number of bytes read, may be
[None].

    @return a pointer filled in with the process exit code if the
process has exited, may be NULL.*)

val get_input : process -> io_stream result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetProcessInput}SDL_GetProcessInput}: Get the SDL_IOStream associated with process standard input.

The process must have been created with SDL_CreateProcess() and pipe_stdio
set to true, or with SDL_CreateProcessWithProperties() and[SDL_PROP_PROCESS_CREATE_STDIN_NUMBER]set to[SDL_PROCESS_STDIO_APP]

Writing to this stream can return less data than expected if the process
hasn't read its input. It may be blocked waiting for its output to be read,
if so you may need to call SDL_GetProcessOutput() and read the output in
parallel with writing input.


    @param process The process to get the input stream for.

    @return the input stream or [Error] on failure; call SDL_GetError() for more
information.*)

val get_output : process -> io_stream result
(** {{:https://wiki.libsdl.org/SDL3/SDL_GetProcessOutput}SDL_GetProcessOutput}: Get the SDL_IOStream associated with process standard output.

The process must have been created with SDL_CreateProcess() and pipe_stdio
set to true, or with SDL_CreateProcessWithProperties() and[SDL_PROP_PROCESS_CREATE_STDOUT_NUMBER]set to[SDL_PROCESS_STDIO_APP]

Reading from this stream can return 0 with SDL_GetIOStatus() returning
SDL_IO_STATUS_NOT_READY if no output is available yet.


    @param process The process to get the output stream for.

    @return the output stream or [Error] on failure; call SDL_GetError() for more
information.*)

val kill : process -> bool -> unit result
(** {{:https://wiki.libsdl.org/SDL3/SDL_KillProcess}SDL_KillProcess}: Stop a process.


    @param process The process to stop.
    @param force true to terminate the process immediately, false to try to
stop the process gracefully. In general you should try to stop
the process gracefully first as terminating a process may
leave it with half-written data or in some other unstable
state.*)

val wait : process -> bool -> int result
(** {{:https://wiki.libsdl.org/SDL3/SDL_WaitProcess}SDL_WaitProcess}: Wait for a process to finish.

This can be called multiple times to get the status of a process.

The exit code will be the exit code of the process if it terminates
normally, a negative signal if it terminated due to a signal, or -255
otherwise. It will not be changed if the process is still running.

If you create a process with standard output piped to the application
[pipe_stdio]being true) then you should read all of the process output
before calling SDL_WaitProcess(). If you don't do this the process might be
blocked indefinitely waiting for output to be read and SDL_WaitProcess()
will never return true;


    @param process The process to wait for.
    @param block If true, block until the process finishes; otherwise, report
on the process' status.

    @return a pointer filled in with the process exit code if the
process has exited, may be [Error].*)

val destroy : process -> unit
(** {{:https://wiki.libsdl.org/SDL3/SDL_DestroyProcess}SDL_DestroyProcess}: Destroy a previously created process object.

Note that this does not stop the process, just destroys the SDL object used
to track it. If you want to stop the process you should use
SDL_KillProcess().


    @param process The process object to destroy.
*)

end

