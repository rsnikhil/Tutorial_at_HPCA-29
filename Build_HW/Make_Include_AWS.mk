###  -*-Makefile-*-
# Copyright (c) 2023 Rishiyur S. Nikhil and Bluespec, Inc.  All Rights Reserved
# Author: Rishiyur S. Nikhil

# This file is included in the main Makefile

# Please refer to parent 'Makefile' for definitions of Makefile
# variables representing directories from which these files are
# copied.

# ****************************************************************
# ****************************************************************
# ****************************************************************
# SECTION: Prepare build directory ready for AWS-F1-HDK flow

AWS_CL_DIR = AWS_CL_Catamaran
DESIGN      = $(AWS_CL_DIR)/design

.PHONY: for_aws
for_aws:
	@echo "INFO: Creating and populating aws-fpga HDK custom-logic dir: $(AWS_CL_DIR)"
	tar -xvzf AWS_CL_Catamaran_wo_Core.tar.gz
	mkdir -p $(DESIGN)/common_cells
	@echo "INFO: Copying RTL files from $(CVA6_REPO_DIR)/"
	cat  $(CORE_CVA6_WRAPPER_RTL)/cv64a6_imafdc_sv39_catamaran_config_pkg.sv \
		$(CVA6_REPO_DIR)/vendor/pulp-platform/axi/src/axi_pkg.sv \
		$(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpnew_pkg.sv \
		$(CVA6_REPO_DIR)/core/include/ariane_dm_pkg.sv \
		$(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpu_div_sqrt_mvp/hdl/defs_div_sqrt_mvp.sv \
		$(CVA6_REPO_DIR)/core/include/riscv_pkg.sv \
		$(CVA6_REPO_DIR)/core/include/ariane_pkg.sv \
		$(CVA6_REPO_DIR)/core/include/ariane_axi_pkg.sv \
		$(CVA6_REPO_DIR)/corev_apu/tb/ariane_soc_pkg.sv \
		$(CVA6_REPO_DIR)/corev_apu/tb/ariane_axi_soc_pkg.sv \
		$(CVA6_REPO_DIR)/core/include/cvxif_pkg.sv \
		$(CVA6_REPO_DIR)/core/include/wt_cache_pkg.sv \
		$(CVA6_REPO_DIR)/vendor/pulp-platform/common_cells/src/cf_math_pkg.sv \
		> $(DESIGN)/all_pkgs.sv
	cp -p  $(CVA6_REPO_DIR)/common/local/util/sram.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/alu.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/amo_buffer.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/ariane_regfile_ff.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/ariane_regfile_fpga.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/axi_shim.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/branch_unit.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/cache_subsystem/cva6_icache.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/cache_subsystem/wt_axi_adapter.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/cache_subsystem/wt_cache_subsystem.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/cache_subsystem/wt_dcache.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/cache_subsystem/wt_dcache_ctrl.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/cache_subsystem/wt_dcache_mem.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/cache_subsystem/wt_dcache_missunit.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/cache_subsystem/wt_dcache_wbuffer.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/commit_stage.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/compressed_decoder.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/controller.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/csr_buffer.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/csr_regfile.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/cva6.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/cvxif_fu.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/decoder.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/dromajo_ram.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/ex_stage.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/fpu_wrap.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/frontend/bht.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/frontend/btb.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/frontend/frontend.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/frontend/instr_queue.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/frontend/instr_scan.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/frontend/ras.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/id_stage.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/instr_realign.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/issue_read_operands.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/issue_stage.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/load_store_unit.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/load_unit.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/lsu_bypass.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/mmu_sv39/mmu.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/mmu_sv39/ptw.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/mmu_sv39/tlb.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/mult.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/multiplier.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/perf_counters.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/pmp/src/pmp.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/pmp/src/pmp_entry.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/re_name.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/scoreboard.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/serdiv.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/store_buffer.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/core/store_unit.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/common_cells/include/common_cells/registers.svh  $(DESIGN)/common_cells/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/common_cells/src/exp_backoff.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/common_cells/src/fifo_v3.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/common_cells/src/lfsr.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/common_cells/src/lzc.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/common_cells/src/popcount.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/common_cells/src/rr_arb_tree.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/common_cells/src/shift_reg.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/common_cells/src/unread.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpnew_cast_multi.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpnew_classifier.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpnew_divsqrt_multi.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpnew_fma.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpnew_fma_multi.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpnew_noncomp.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpnew_opgroup_block.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpnew_opgroup_fmt_slice.sv \
		$(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpnew_opgroup_multifmt_slice.sv \
		$(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpnew_rounding.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpnew_top.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpu_div_sqrt_mvp/hdl/control_mvp.sv \
		$(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpu_div_sqrt_mvp/hdl/div_sqrt_top_mvp.sv \
		$(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpu_div_sqrt_mvp/hdl/iteration_div_sqrt_mvp.sv \
		$(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpu_div_sqrt_mvp/hdl/norm_div_sqrt_mvp.sv \
		$(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpu_div_sqrt_mvp/hdl/nrbd_nrsc_mvp.sv \
		$(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpu_div_sqrt_mvp/hdl/preprocess_mvp.sv \
		$(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpga-support/rtl/SyncDpRam.sv  $(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpga-support/rtl/AsyncDpRam.sv \
		$(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpga-support/rtl/AsyncThreePortRam.sv \
		$(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/tech_cells_generic/src/rtl/tc_sram.sv \
		$(DESIGN)/
	cp -p  $(CVA6_REPO_DIR)/common/local/util/tc_sram_fpga_wrapper.sv \
		$(DESIGN)
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpga-support/rtl/SyncSpRamBeNx64.sv \
		$(DESIGN)
	tar -cvzf $(AWS_CL_DIR)_for_AWS_HDK.tar.gz  $(AWS_CL_DIR)
	@echo "INFO: AWS-HDK-flow-ready dir is ready: $(AWS_CL_DIR)/"

# ****************************************************************

.PHONY: full_clean_AWS
full_clean_AWS:
	rm -r -f  $(AWS_CL_DIR)  $(AWS_CL_DIR)_for_AWS_HDK.tar.gz
