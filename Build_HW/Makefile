###  -*-Makefile-*-
# Copyright (c) 2023 Rishiyur S. Nikhil and Bluespec, Inc.  All Rights Reserved
# Author: Rishiyur S. Nikhil

$(info INFO: 'make help' shows available targets and current settings.)

# ================================================================
.PHONY: help
help:
	@echo "Makefile to build hardware for Catamaran_CVA6"
	@echo ""
	@echo "Usage:"
	@echo "  $(SIM_EXE_FILE)    From RTL, create simulation executable (using Verilator)"
	@echo "  for_aws             From RTL, create build directory for AWS-F1-HDK flow"
	@echo ""
	@echo "  help                Show this help info"
	@echo "  make clean          Remove intermediate files/directories"
	@echo "  make full_clean     Restore to pristine state"
	@echo ""
	@echo "  Current settings:"
	@echo "    CVA6_REPO_DIR = $(CVA6_REPO_DIR)"

# ================================================================
# External repos (please change as necessary for your environment)

# Your clone of the CVA6 repo: https://github.com/openhwgroup/cva6.git
# for CVA6 RTL
CVA6_REPO_DIR ?= $(HOME)/Git/cva6

# ================================================================
# Local RTL sources

# Fixed RTL and C for Catamaran
CATAMARAN_RTL = Catamaran_RTL
CATAMARAN_C   = Catamaran_C

# RTL for Catamaran_Core wrapper for CVA6 core
CORE_CVA6_WRAPPER_RTL = Core_CVA6_Wrapper_RTL

# RTL from Bluespec bsc libs
BSC_LIB_RTL = bsc_lib_RTL

# ================================================================
# SECTION: Generate simulation executable using Verilator

include Make_Include_Verilator.mk

# ================================================================
# SECTION: Prepare build directory ready for AWS-F1-HDK flow

include Make_Include_AWS.mk

# ****************************************************************

.PHONY: clean
clean: clean_Verilator
	rm -r -f  *~  tmp_*

.PHONY: full_clean
full_clean: clean  full_clean_Verilator  full_clean_AWS

# ================================================================
