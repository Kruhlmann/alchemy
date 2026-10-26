# Memory and Syscalls

These interfaces target Linux x86-64. Stack effects below list the top of the
stack on the right. Subroutines preserve values below their arguments.

## Syscalls

`syscall0` through `syscall6` consume a syscall number and zero through six
arguments, then push the raw kernel result:

```text
syscall0  ( number -- result )
syscall1  ( arg1 number -- result )
syscall2  ( arg2 arg1 number -- result )
syscall3  ( arg3 arg2 arg1 number -- result )
syscall4  ( arg4 arg3 arg2 arg1 number -- result )
syscall5  ( arg5 arg4 arg3 arg2 arg1 number -- result )
syscall6  ( arg6 arg5 arg4 arg3 arg2 arg1 number -- result )
```

Arguments use the Linux syscall registers `rdi`, `rsi`, `rdx`, `r10`, `r8`,
and `r9`, respectively. Errors are returned directly as negative errno values
(-1 through -4095); there is no separate `errno` variable. Successful results
depend on the syscall, for example a descriptor, pointer, or byte count.
Nonreturning calls such as `SYS_EXIT` do not leave a result.

Unlike the earlier interface, returning syscalls always leave one stack value.
Use `drop` when intentionally ignoring it. `std.io` printing helpers already
discard their write results and retain their existing stack effects.

## Allocation

`include std.mem` provides:

```text
mem_alloc  ( size -- pointer-or-negative-errno )
mem_free   ( pointer size -- zero-or-negative-errno )
writeb     ( address value -- )
write      ( address value -- )
*          ( address -- unsigned-byte )
```

`mem_alloc` creates a private, anonymous, read/write mapping with `mmap`.
Each allocation is independent, initially zero-filled, and page-aligned.
The kernel rounds its storage to whole pages. No executable permission is
requested. A zero size fails with `-22` (`EINVAL`); other invalid or excessive
sizes return the kernel's error. Check the result before dereferencing it.

`mem_free` calls `munmap`. Pass the original allocation pointer and requested
size, and free it exactly once. The library does not track allocation metadata,
validate ownership, or prevent double frees. Views into an allocation become
invalid when it is freed. There is no reallocation API or automatic cleanup.
This is a minimal mapping-backed allocator, not a small-object heap: even a
one-byte allocation consumes a mapping and at least one page of virtual memory.

`writeb` stores the low eight bits of its value. `write` stores eight bytes;
neither checks bounds. `*` reads one byte. Access only the requested size,
even if the underlying mapping has been rounded up.

```alc
include std.mem
include std.io

sub main
    16 mem_alloc
    clone 0 < if
        drop 1 exit
    endif
    clone 65 writeb
    clone * printxln
    16 mem_free drop
marine
```

This prints `0x41` and releases the buffer. Callers remain responsible for
handling allocation, I/O, and cleanup failures.
