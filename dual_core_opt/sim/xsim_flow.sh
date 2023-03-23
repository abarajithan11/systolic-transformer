#!/bin/bash
rm -r *webtalk* *.log *.pb *.jou *.vcd *.wdb *.dir .xil 
xvlog --nolog -f ./sim_filelist
xvlog --nolog -sv -f ./sim_filelist_sv
xelab --timescale 1ns/1ps --nolog -debug all -top dualcore_tb -snapshot dualcore_tb_snapshot
xsim --nolog dualcore_tb_snapshot --tclbatch xsim_cfg.tcl
xsim --nolog --gui dualcore_tb_snapshot.wdb

exit 0
