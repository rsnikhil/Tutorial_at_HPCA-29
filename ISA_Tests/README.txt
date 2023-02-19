These are the complete set of standard RISC-V ISA tests from:
    https://github.com/riscv-software-src/riscv-tests
here modified to run in Catamaran.

This directory is unmodified from the above repo,
and contains the source code of all the tests:
    isa/

This directory has modified files:
    env/

Each test concludes by writing a PASS/FAIL code to a location called 'tohost'.

The changes here (from the original repo) are because we treat
'tohost' differently.  There are two aspects to this:

// ================================================================
(1) Address of 'tohost'

In the original, the linker scripts map 'tohost' to 0x_8000_1000 (and
in at least one case, to 0x_8000_2000).  Note that this is in code
space, which starts at 0x_8000_0000.

In our version here, we change the linker scripts so 'tohost' is
mapped to 0x_6FFF_0010, which is in uncached, MMIO space.

We want it to be in MMIO space so we can field it in the hardware and
take appropriate action.

// ================================================================
(2) How 'tohost' is written, for virtual-memory builds of the tests

Many of the tests are built in two ways:
- to run in machine mode with physical memory (rv32/64-p-*)
- to run in user mode with virtual memory (rv32/64-v-*)

In the original, for virtual-memory builds, each test runs in user
mode; at the end of the test, it ECALLs into supervisor mode, with the
PASS/FAIL code in a particular register; a routine 'do_tohost()' in
env/v/vm.c writes to the 'tohost' location, which goes through normal
VM->PA translation (virt mem address to phys mem address).

This VM->PA translation relies on 'tohost's PA (phys addr) being >=
0x_8000_0000, which is the region for which a small page table is
built in the standard prelude of the virtual tests, and does not work
for our choice of address 0x6FFF_0010, which is effectively in
negative virtual space.

We have replaced the 'do_tohost()' routine from env/v/vm.c to an asm
routine in env/v/entry.S which merely performs an ECALL, this time
going from Supervisor mode to Machine mode.

In env/v/entry.S, we've modified 'trap_vector:' to catch this
SUPERVISOR_ECALL and go to 'write_tohost'.

In env/v/entry.S, we've added 'write_tohost' to perform the final
write to the 'tohost' location.  This executes in Machine mode without
virtual translation.

// ================================================================
To build:

Set RISCV to point at your RISC-V Gnu toolchain installation

    $ tree $RISCV
    ├── bin
    ├── include
    ├── lib
    ├── libexec
    ├── riscv64-unknown-elf
    └── share

Then:
    $ cd isa
    $ make

This will populate the isa/ dir with all the tests (ELF and objdump files):
    rv32-p-*    rv32-p-*.dump
    rv32-v-*    rv32-v-*.dump
    rv64-p-*    rv64-p-*.dump
    rv64-v-*    rv64-v-*.dump

We have copied these into the directory:    isa/elfs/

// ================================================================
