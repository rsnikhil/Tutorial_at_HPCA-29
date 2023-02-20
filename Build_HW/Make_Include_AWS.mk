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

AWS_HDK_DIR = cl_AWSteria_RISCV

.PHONY: for_aws
for_aws:
	@echo "INFO: Creating and populating aws-fpga HDK custom-logic dir: $(AWS_HDK_DIR)"
	@echo ".. Copying RTL for Platform_AWSF1 support"
	rm -r -f $(AWS_HDK_DIR)
	@echo ".. copying RTL for Catamaran and CVA6 Core"
	@echo "..     (from $(VERILATOR_SRCS) previously created for Verilator)"
	cp -p -R  $(VERILATOR_SRCS)/*       $(AWS_HDK_DIR)/design/
	@echo ".. copying fpga-specific RTL from CVA6 repo"
	cp -p  $(CVA6_REPO_DIR)/common/local/util/tc_sram_fpga_wrapper.sv \
		$(AWS_HDK_DIR)/design/
	cp -p  $(CVA6_REPO_DIR)/vendor/pulp-platform/fpga-support/rtl/SyncSpRamBeNx64.sv \
		$(AWS_HDK_DIR)/design/
	@echo ".. removing simulation-only files"
	rm -f $(AWS_HDK_DIR)/design/vpi_wrapper_c_*
	rm -f $(AWS_HDK_DIR)/design/mkBytevec.v
	rm -f $(AWS_HDK_DIR)/design/mkDDR_*_Model.v
	rm -f $(AWS_HDK_DIR)/design/mkTop_HW_Side.v
	rm -f $(AWS_HDK_DIR)/design/C_Imported_Functions.c
	rm -f $(AWS_HDK_DIR)/design/C_Imported_Functions.h
	rm -f $(AWS_HDK_DIR)/design/sim_main.cpp
	rm -f $(AWS_HDK_DIR)/design/tc_sram_wrapper.sv
	@echo "INFO: AWS-HDK-flow-ready dir is ready: $(AWS_HDK_DIR)/"

# ****************************************************************

.PHONY: full_clean_AWS
full_clean_AWS:
	rm -r -f  $(AWS_HDK_DIR)
