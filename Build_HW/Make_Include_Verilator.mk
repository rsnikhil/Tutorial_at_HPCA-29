###  -*-Makefile-*-
# Copyright (c) 2023 Rishiyur S. Nikhil and Bluespec, Inc.  All Rights Reserved
# Author: Rishiyur S. Nikhil

# This file is included in the main Makefile.

# Please refer to parent 'Makefile' for definitions of Makefile
# variables representing directories from which these files are
# copied.

# ****************************************************************
# ****************************************************************
# ****************************************************************
# SECTION: collect RTL, C, C++ source files for Verilator

# This is the final resulting simulation executable file
SIM_EXE_FILE ?= exe_HW_AWSF1_sim

# Copy all RTL, C, C++ sources for Verilator into this dir
# for explicitness and convenience (instead of using many -I flags)
VERILATOR_SRCS = Verilator_Srcs

.PHONY: collect_Verilator_srcs
collect_Verilator_srcs:
	mkdir -p $(VERILATOR_SRCS)
	mkdir -p $(VERILATOR_SRCS)/common_cells
# From CVA6 repo
	@echo "INFO: Copying RTL files from $(CVA6_REPO_DIR)/"
	cp -p  $(CVA6_REPO_DIR)/common/local/util/sram.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/common/local/util/tc_sram_wrapper.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/alu.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/amo_buffer.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/ariane_regfile_ff.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/ariane_regfile_fpga.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/axi_shim.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/branch_unit.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/cache_subsystem/cva6_icache.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/cache_subsystem/wt_axi_adapter.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/cache_subsystem/wt_cache_subsystem.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/cache_subsystem/wt_dcache.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/cache_subsystem/wt_dcache_ctrl.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/cache_subsystem/wt_dcache_mem.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/cache_subsystem/wt_dcache_missunit.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/cache_subsystem/wt_dcache_wbuffer.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/commit_stage.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/compressed_decoder.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/controller.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/csr_buffer.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/csr_regfile.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/cva6.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/cvxif_fu.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/decoder.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/dromajo_ram.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/ex_stage.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/fpu_wrap.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/frontend/bht.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/frontend/btb.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/frontend/frontend.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/frontend/instr_queue.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/frontend/instr_scan.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/frontend/ras.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/id_stage.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/include/ariane_axi_pkg.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/include/ariane_dm_pkg.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/include/ariane_pkg.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/include/cvxif_pkg.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/include/riscv_pkg.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/include/std_cache_pkg.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/include/wt_cache_pkg.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/instr_realign.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/issue_read_operands.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/issue_stage.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/load_store_unit.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/load_unit.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/lsu_bypass.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/mmu_sv39/mmu.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/mmu_sv39/ptw.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/mmu_sv39/tlb.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/mult.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/multiplier.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/perf_counters.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/pmp/src/pmp.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/pmp/src/pmp_entry.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/re_name.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/scoreboard.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/serdiv.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/store_buffer.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/core/store_unit.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/corev_apu/tb/ariane_axi_soc_pkg.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/corev_apu/tb/ariane_soc_pkg.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/axi/src/axi_pkg.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/common_cells/include/common_cells/registers.svh  $(VERILATOR_SRCS)/common_cells/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/common_cells/src/exp_backoff.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/common_cells/src/fifo_v3.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/common_cells/src/lfsr.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/common_cells/src/cf_math_pkg.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/common_cells/src/lzc.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/common_cells/src/popcount.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/common_cells/src/rr_arb_tree.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/common_cells/src/shift_reg.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/common_cells/src/unread.sv  $(VERILATOR_SRCS)/
#	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/common_cells/src/exp_backoff.sv  $(VERILATOR_SRCS)/
#	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/common_cells/src/fifo_v3.sv  $(VERILATOR_SRCS)/
#	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/common_cells/src/lfsr.sv  $(VERILATOR_SRCS)/
#	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/common_cells/src/lzc.sv  $(VERILATOR_SRCS)/
#	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/common_cells/src/popcount.sv  $(VERILATOR_SRCS)/
#	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/common_cells/src/rr_arb_tree.sv  $(VERILATOR_SRCS)/
#	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/common_cells/src/shift_reg.sv  $(VERILATOR_SRCS)/
#	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/common_cells/src/unread.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpnew_cast_multi.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpnew_classifier.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpnew_divsqrt_multi.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpnew_fma.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpnew_fma_multi.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpnew_noncomp.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpnew_opgroup_block.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpnew_opgroup_fmt_slice.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpnew_opgroup_multifmt_slice.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpnew_pkg.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpnew_rounding.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpnew_top.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpu_div_sqrt_mvp/hdl/control_mvp.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpu_div_sqrt_mvp/hdl/defs_div_sqrt_mvp.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpu_div_sqrt_mvp/hdl/div_sqrt_top_mvp.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpu_div_sqrt_mvp/hdl/iteration_div_sqrt_mvp.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpu_div_sqrt_mvp/hdl/norm_div_sqrt_mvp.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpu_div_sqrt_mvp/hdl/nrbd_nrsc_mvp.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpu_div_sqrt_mvp/hdl/preprocess_mvp.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpga-support/rtl/SyncDpRam.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpga-support/rtl/AsyncDpRam.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpga-support/rtl/AsyncThreePortRam.sv  $(VERILATOR_SRCS)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/tech_cells_generic/src/rtl/tc_sram.sv  $(VERILATOR_SRCS)/
# From Core_CVA6_Wrapper_RTL
	@echo "INFO: Copying Verilog files from $(CORE_RTL)/"
	cp -p  $(CORE_CVA6_WRAPPER_RTL)/*  $(VERILATOR_SRCS)/
# From Catamaran_RTL
	@echo "INFO: Copying Verilog files from $(CATAMARAN_RTL)/"
	cp -p  $(CATAMARAN_RTL)/*.v  $(VERILATOR_SRCS)/
# From Bluespec bsc lib RTL
	@echo "INFO: Copying Verilog files from $(BSC_LIB_RTL)/"
	cp -p  $(BSC_LIB_RTL)/*.v  $(VERILATOR_SRCS)/
# From Catamaran_C
	@echo "INFO: Copying Verilog files from $(BSC_LIB_RTL)/"
	cp -p  $(CATAMARAN_C)/*.h    $(VERILATOR_SRCS)/
	cp -p  $(CATAMARAN_C)/*.c    $(VERILATOR_SRCS)/
	cp -p  $(CATAMARAN_C)/*.cpp  $(VERILATOR_SRCS)/

# ****************************************************************
# ****************************************************************
# ****************************************************************
# SECTION: Generate simulation executable using Verilator

TOPMODULE = mkTop_HW_Side

# Directory in which Verilator does its work,
# and which contains the final executable
VERILATOR_WORKING_DIR  = Verilator_Working_Dir

# This flag tells CVA6 to use the WT (write-through) cache
# instead of the WB (write-back) cache
VERILATOR_FLAGS += -DWT_DCACHE

# ----------------
# General Verilator flags

#   Working directory in which Verilator does its work
#     --Mdir <dir>
VERILATOR_FLAGS += -Mdir $(VERILATOR_WORKING_DIR)

#   The following are recommended in verilator manual for best performance
#     -O3                          Verilator optimization level
#     --x-assign fast              Optimize X value
#     --x-initial fast             Optimize uninitialized value
#     --noassert                   Disable all assertions
VERILATOR_FLAGS += -O3 --x-assign fast --x-initial fast --noassert

#   C++ compiler flags
#     -CFLAGS -O3
VERILATOR_FLAGS += -CFLAGS -O3 -CFLAGS -DVL_DEBUG

#   Dump stats on the design, in file {prefix}__stats.txt
VERILATOR_FLAGS += --stats

#   ld flags
#     -LDFLAGS -static
# VERILATOR_FLAGS += -LDFLAGS -static

VERILATOR_FLAGS += -Wno-COMBDLY
VERILATOR_FLAGS += -Wno-TIMESCALEMOD

# This flag is because bsc-generated RTL has #0 statements
# and CVA6 RTL has various #<delay> statements
VERILATOR_FLAGS += --no-timing

# The following is for cva6, which has blocking and non-blocking assignments to many vars
VERILATOR_FLAGS += -Wno-BLKANDNBLK
VERILATOR_FLAGS += --threads  1
VERILATOR_FLAGS += --unroll-count  256
# -Wno-PINMISSING 
VERILATOR_FLAGS += -Werror-PINMISSING
VERILATOR_FLAGS += -Werror-IMPLICIT
VERILATOR_FLAGS += -Wno-fatal
VERILATOR_FLAGS += -Wno-PINCONNECTEMPTY
VERILATOR_FLAGS += -Wno-ASSIGNDLY
VERILATOR_FLAGS += -Wno-DECLFILENAME
VERILATOR_FLAGS += -Wno-UNUSED
VERILATOR_FLAGS += -Wno-UNOPTFLAT
VERILATOR_FLAGS += -Wno-BLKANDNBLK
VERILATOR_FLAGS += -Wno-style

# ----------------

.PHONY: $(SIM_EXE_FILE)
$(SIM_EXE_FILE):  collect_Verilator_srcs
	@echo "----------------"
	@echo "INFO: Verilating RTL/C/C++ files in $(VERILATOR_SRCS)"
	@echo "      using working directory $(VERILATOR_WORKING_DIR)"
	verilator \
		$(VERILATOR_FLAGS) \
		--cc  --exe --build -j 4 \
		--top-module $(TOPMODULE) \
		-I$(VERILATOR_SRCS) \
		$(VERILATOR_SRCS)/$(TOPMODULE).v  \
		$(VERILATOR_SRCS)/sim_main.cpp  \
		$(VERILATOR_SRCS)/C_Imported_Functions.c \
		 -o $(SIM_EXE_FILE)
	cp -p  $(VERILATOR_WORKING_DIR)/$(SIM_EXE_FILE)  .
	@echo "----------------"
	@echo "INFO: Created verilator simulation executable:    $(SIM_EXE_FILE)"

# ****************************************************************

.PHONY: clean_Veriator
clean_Verilator:
	rm -r -f  $(VERILATOR_SRCS)  $(VERILATOR_WORKING_DIR)

.PHONY: full_clean_Verilator
full_clean_Verilator: clean_Verilator
	rm -r -f  $(SIM_EXE_FILE)    trace_*
