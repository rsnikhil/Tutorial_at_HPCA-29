RV ?= RV64

ifeq ($(RV),RV64)
    M_FLAGS ?= -march=rv64imafd
else ifeq ($(RV),RV32)
    M_FLAGS ?= -march=rv32im -mabi=ilp32
else
  $(error ERROR: please provide RV=RV64 or RV=RV32)
endif

# ================================================================
# Cross-compiler and output file names for bare-metal

RISCV_GCC_BARE=riscv64-unknown-elf-gcc
RISCV_OBJDUMP_BARE=riscv64-unknown-elf-objdump

BARE_ELF     ?= $(TARGET_ROOT).$(RV).bare.elf
BARE_MAP     ?= $(TARGET_ROOT).$(RV).bare.map
BARE_OBJDUMP ?= $(TARGET_ROOT).$(RV).bare.objdump

# ----------------
# Cross-compiler and output file names for Linux

RISCV_GCC_LINUX=riscv64-unknown-linux-gnu-gcc
RISCV_OBJDUMP_LINUX=riscv64-unknown-linux-gnu-objdump

LINUX_ELF     ?= $(TARGET_ROOT).$(RV).linux.elf
LINUX_MAP     ?= $(TARGET_ROOT).$(RV).linux.map
LINUX_OBJDUMP ?= $(TARGET_ROOT).$(RV).linux.objdump

# ================================================================
.PHONY: help
help:
	@echo "Current variable settings:"
	@echo "    RV=$(RV)"
	@echo "  Override with RV=RV64 or RV=RV32 on make command line"
	@echo "    M_FLAGS=$(M_FLAGS)"
	@echo "  Override with M_FLAGS=... on make command line"
	@echo ""
	@echo "Targets:"
	@echo "  all                   Make all_bare and all_linux"
	@echo "  all_bare              Make bare-metal targets (below)"
	@echo "  all_linux             Make linux targets (below)"
	@echo ""
	@echo "  $(BARE_ELF)"
	@echo "                        Elf executable for bare-metal"
	@echo "                        (also creates link map: $(BARE_MAP)"
	@echo "  $(BARE_OBJDUMP)"
	@echo "                        Objdump (disassembly) for bare-metal"
	@echo ""
	@echo "  $(LINUX_ELF)"
	@echo "                        Elf executable for bare-metal"
	@echo "                        (also creates link map: $(LINUX_MAP)"
	@echo "  $(LINUX_OBJDUMP)"
	@echo "                        Objdump (disassembly) for bare-metal"
	@echo ""
	@echo "  clean                 Remove editor- and compiler-intermediate files"
	@echo "  full_clean            Also remove elf, map, objdump files"

.PHONY: all
all: all_bare  all_linux

# ================================================================
# For bare-metal

.PHONY: all_bare
all_bare: $(BARE_ELF)  $(BARE_OBJDUMP)

CFLAGS_BARE = -g -I../lib $(M_FLAGS)  -specs=../lib/bare.specs \
	-D $(RV) -DCONSOLE_UART -mcmodel=medany \
	-L../lib -Wl,-e,_reset -Wl,-T../lib/bare.lds -Wl,-Ttext-segment=0x80002000 -lm

startup.o: ../lib/startup.S
	$(RISCV_GCC_BARE) -g $(M_FLAGS)  -Wa,-Ilegacy   -c  -o $@   $<

LIBS = ../lib/syscalls.c  ../lib/ns16550.c  ../lib/riscv_counters.c

$(BARE_ELF): $(TARGET_SRCS)  startup.o
	$(RISCV_GCC_BARE) $(CFLAGS_BARE) -Wl,-Map,$(BARE_MAP)  $<  startup.o  $(LIBS)  -o $@
	rm -f startup.o

%.bare.objdump : %.bare.elf
	$(RISCV_OBJDUMP_BARE) --all-headers --disassemble --source $< > $@

# ================================================================
# For Linux

.PHONY: all_linux
all_linux: $(LINUX_ELF)  $(LINUX_OBJDUMP)

CFLAGS_LINUX = -g $(M_FLAGS)  -D $(RV)  -lm

$(LINUX_ELF): $(TARGET_SRCS)
	$(RISCV_GCC_LINUX) $(CFLAGS_LINUX) -Wl,-Map,$(LINUX_MAP)  $<  -o $@

%.linux.objdump : %.linux.elf
	$(RISCV_OBJDUMP_LINUX) --all-headers --disassemble --source $< > $@

# ================================================================

.PHONY: clean
clean:
	rm -r -f  *~  *.o

.PHONY: full_clean
full_clean: clean
	rm -r -f  *.elf  *.map  *.objdump
