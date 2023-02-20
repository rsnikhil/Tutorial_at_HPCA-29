// Copyright (c) 2023 Rishiyur S. Nikhil and Bluespec, Inc.  All Rights Reserved

// WARNING: the order of the 'includes below is important (dependencies)

// Before Verilator reads CVA6's top-level module file 'cva6.sv',
// these files from the CVA6 repo must be read by Verilator
// because of dependencies.

// All the directory/file names below are relative to the top-level of
// the clone of the CVA6 Git repo.

// ----------------
// For
//     package cva6_config_pkg
// in file
//     Lab/Catamaran_Core_CVA6/src/cv64a6_imafdc_sv39_catamaran_config_pkg.sv
`include "cv64a6_imafdc_sv39_catamaran_config_pkg.sv"

// For
//     package riscv
// is in two files:
// 1.  core/include/riscv_pkg.sv
// 2.  core/pmp/include/riscv.sv
// I think we should use (1) (also cva6/core/Flist.cva6 does not mention (2)).
`include "riscv_pkg.sv"

// For  package ariane_dm_pkg    in file  core/include/ariane_dm_pkg.sv
`include "ariane_dm_pkg.sv"

// For  package ariane_pkg       in file  core/include/ariane_pkg.sv
`include "ariane_pkg.sv"

// For  package ariane_soc       in file  corev_apu/tb/ariane_soc_pkg.sv
`include "ariane_soc_pkg.sv"

// For  package axi_pkg          in file  vendor/pulp-platform/axi/src/axi_pkg.sv
`include "axi_pkg.sv"

// For  package ariane_axi_soc   in file  corev_apu/tb/ariane_axi_soc_pkg.sv
`include "ariane_axi_soc_pkg.sv"

// for  package ariane_axi       in file  core/include/ariane_axi_pkg.sv
`include "ariane_axi_pkg.sv"

// package  cvxif_pkg            in file  core/include/cvxif_pkg.sv
`include "cvxif_pkg"

// package  fpnew_pkg            in file  vendor/pulp-platform/fpnew/src/fpnew_pkg.sv
`include "fpnew_pkg.sv"

// for  module ariane_regfile    in file  core/ariane_regfile_ff.sv
`include "ariane_regfile_ff.sv"

// package cf_math_pkg
`include "cf_math_pkg.sv"

// ----------------
// For file
//     common_cells/registers.svh
// `included from
//     vendor/pulp-platform/fpnew/src/fpnew_opgroup_multifmt_slice.sv
// There are three files called 'common_cells/registers.svh':
// 1.  common/submodules/common_cells/include/common_cells/registers.svh
// 2.  vendor/pulp-platform/common_cells/include/common_cells/registers.svh
// 3.  vendor/pulp-platform/fpnew/src/common_cells/include/common_cells/registers.svh
// It must be (3), as it is in the same sub-directory as the reference?
// In Makefile, we place:
//     -I$(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/common_cells/include

// ----------------
// For
//     module lzc
// referred from
//     vendor/pulp-platform/fpnew/src/fpnew_cast_multi.sv:271:3
// There are three files called 'lzc.sv':
// 1.  common/submodules/common_cells/src/lzc.sv
// 2.  vendor/pulp-platform/common_cells/src/lzc.sv
// 3.  vendor/pulp-platform/fpnew/src/common_cells/src/lzc.sv
// (1) and (2) are identical.
// It must be (3), as it is in the same sub-directory as the reference?
// In Makefile, we place:
//     -I$(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/common_cells/src

// ----------------
// For
//     module div_sqrt_top_mvp
// referred from
//     vendor/pulp-platform/fpnew/src/fpnew_divsqrt_multi.sv:259:3
// is in file:
//     /vendor/pulp-platform/fpnew/src/fpu_div_sqrt_mvp/hdl/div_sqrt_top_mvp.sv
// In Makefile, we place:
//     -I$(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpu_div_sqrt_mvp/hdl

// ----------------
// For
//     package defs_div_sqrt_mvp
// referred from
//     vendor/pulp-platform/fpnew/src/fpu_div_sqrt_mvp/hdl/div_sqrt_top_mvp.sv:35:8
// In Makefile, we place:
//     -I$(CVA6_REPO_DIR)/vendor/pulp-platform/fpnew/src/fpu_div_sqrt_mvp/hdl
`include "defs_div_sqrt_mvp.sv"

// ----------------
// For
//     module mmu
// referred from
//     core/load_store_unit.sv:140:9
// is in
//     core/mmu_sv39/mmu.sv
// In Makefile, we place:
//     -I$(CVA6_REPO_DIR)/core/mmu_sv39

// ----------------
// For
//     module pmp
// referred from
//     core/mmu_sv39/ptw.sv:138:5
// is in
//     core/pmp/src/pmp.sv
// In Makefile, we place:
//     -I$(CVA6_REPO_DIR)/core/pmp/src

// ----------------
// For
//     module frontend
// referred from
//     core/cva6.sv:271:3
// is in
//     core/frontend/frontend.sv
// In Makefile, we place:
//     -I$(CVA6_REPO_DIR)/core/frontend

// ----------------
// For
//     module std_cache_subsystem
// referred from
//     core/cva6.sv:728:3
// is in
//     core/cache_subsystem/std_cache_subsystem.sv
// In Makefile, we place:
//     -I$(CVA6_REPO_DIR)/core/cache_subsystem

// ----------------
// For
//     package std_cache_pkg
// referred from
//     core/cache_subsystem/std_cache_subsystem.sv:18:57
// Is in
//     core/include/std_cache_pkg.sv
// In Makefile, we place:
//     -I$(CVA6_REPO_DIR)/core/include
`include "std_cache_pkg.sv"

// ----------------
// For
//     package wt_cache_pkg
// referred from
//     core/cache_subsystem/cva6_icache_axi_wrapper.sv:16:61
// Is in
//     core/include/wt_cache_pkg.sv
// In Makefile, we place:
//     -I$(CVA6_REPO_DIR)/core/include
`include "wt_cache_pkg.sv"

// ----------------
// For
//     module tc_sram
// referred from
//     common/local/util/tc_sram_wrapper.sv:39:3
// Is in
// A   vendor/pulp-platform/tech_cells_generic/src/rtl/tc_sram.sv:53
// B   vendor/pulp-platform/tech_cells_generic/src/fpga/tc_sram_xilinx.sv:19
// Both have same module params and args, but B is meant for Vivado macros etc.
// In Makefile, we place:
//     -I$(CVA6_REPO_DIR)/vendor/pulp-platform/tech_cells_generic/src/rtl

// ----------------
// For
//     module cva6
// is in
//     core/cva6.sv
`include "cva6.sv"

// ================================================================
