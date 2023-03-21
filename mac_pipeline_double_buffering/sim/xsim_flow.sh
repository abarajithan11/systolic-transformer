#!/bin/bash
rm -r *webtalk* *.log *.pb *.jou *.vcd *.wdb *.dir .xil 
xvlog --nolog -f ./sim_filelist
xelab --nolog -debug all -top pipelined_single_core_tb -snapshot pipelined_single_core_tb_snapshot
xsim --nolog pipelined_single_core_tb_snapshot --tclbatch xsim_cfg.tcl
xsim --nolog --gui pipelined_single_core_tb_snapshot.wdb

exit 0
