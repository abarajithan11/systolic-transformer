#!/bin/bash
rm -r *webtalk* *.log *.pb *.jou *.vcd *.wdb *.dir .xil 
xvlog --nolog -f ./sim_filelist
xelab --nolog -debug all -top tb_afifo -snapshot afifo_tb_snapshot
xsim --nolog afifo_tb_snapshot --tclbatch xsim_cfg.tcl
xsim --nolog --gui afifo_tb_snapshot.wdb

exit 0