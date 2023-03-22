###############################################################
#  Generated by:      Cadence Innovus 19.17-s077_1
#  OS:                Linux x86_64(Host ID ieng6-ece-07.ucsd.edu)
#  Generated on:      Wed Mar 22 04:06:30 2023
#  Design:            dualcore
#  Command:           saveDesign placement.enc
###############################################################
current_design dualcore
create_clock [get_ports {clk1}]  -name clk1 -period 1.000000 -waveform {0.000000 0.500000}
create_clock [get_ports {clk2}]  -name clk2 -period 1.000000 -waveform {0.000000 0.500000}
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {mem_in_core2[10]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {inst_core2[11]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {mem_in_core1[11]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {inst_core1[7]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {mem_in_core2[26]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {mem_in_core2[19]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {inst_core1[12]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {mem_in_core1[27]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {mem_in_core1[4]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {inst_core2[7]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {rst1}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {mem_in_core2[4]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {mem_in_core2[11]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {rst2}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {inst_core2[12]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {mem_in_core1[12]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {inst_core1[8]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {mem_in_core2[27]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {inst_core1[13]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {mem_in_core1[5]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {mem_in_core1[28]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {inst_core2[8]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {mem_in_core2[5]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {inst_core1[0]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {mem_in_core2[12]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {inst_core2[13]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {mem_in_core1[20]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {mem_in_core1[13]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {inst_core1[9]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {mem_in_core2[28]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {inst_core1[14]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {inst_core2[0]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {mem_in_core1[29]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {mem_in_core1[6]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {inst_core2[9]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {mem_in_core2[6]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {inst_core1[1]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {mem_in_core2[20]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {mem_in_core2[13]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {inst_core2[14]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {mem_in_core1[21]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {mem_in_core1[14]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {mem_in_core2[29]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {inst_core1[15]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {inst_core2[1]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {mem_in_core1[7]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {mem_in_core2[7]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {inst_core1[2]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {mem_in_core2[21]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {mem_in_core2[14]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {inst_core2[15]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {mem_in_core1[22]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {mem_in_core1[15]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {inst_core1[16]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {inst_core2[2]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {mem_in_core1[8]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {mem_in_core2[8]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {inst_core1[3]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {mem_in_core2[22]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {mem_in_core2[15]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {inst_core2[16]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {mem_in_core1[30]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {mem_in_core1[23]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {mem_in_core1[16]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {mem_in_core1[0]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {inst_core2[3]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {mem_in_core1[9]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {mem_in_core2[0]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {mem_in_core2[9]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {mem_in_core2[30]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {mem_in_core2[23]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {mem_in_core2[16]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {inst_core1[4]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {s_valid1}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {mem_in_core1[31]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {mem_in_core1[24]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {mem_in_core1[17]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {mem_in_core1[1]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {inst_core2[4]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {mem_in_core2[1]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {s_valid2}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {inst_core1[5]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {mem_in_core2[31]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {mem_in_core2[24]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {mem_in_core2[17]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {inst_core1[10]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {mem_in_core1[25]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {mem_in_core1[18]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {mem_in_core1[2]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {inst_core2[5]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {mem_in_core2[2]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {inst_core2[10]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {mem_in_core1[10]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {inst_core1[6]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {mem_in_core2[25]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {mem_in_core2[18]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {inst_core1[11]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {mem_in_core1[26]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {mem_in_core1[19]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {mem_in_core1[3]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {inst_core2[6]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {mem_in_core2[3]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[83]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[76]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[69]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[60]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[53]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[46]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[39]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[8]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[31]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[24]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[17]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {psum_norm_2[4]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[84]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[77]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[61]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[54]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[47]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[9]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[32]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[25]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[18]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[0]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {psum_norm_2[5]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[85]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[78]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[62]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[55]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[48]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[40]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[33]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[26]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[19]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[1]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {psum_norm_2[6]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[86]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[79]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[10]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[70]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[63]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[56]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[49]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[41]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[34]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[27]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[2]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {psum_norm_2[7]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[87]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[11]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[71]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[64]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[57]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[42]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[35]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[28]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[3]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {psum_norm_2[8]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[12]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {psum_norm_1[0]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[72]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[65]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[58]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[50]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[43]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[36]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[29]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[4]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {psum_norm_2[10]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {psum_norm_2[9]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[20]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[13]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {psum_norm_1[1]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[80]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[73]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[66]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[59]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[51]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[44]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[37]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[5]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[21]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[14]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {psum_norm_1[2]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[81]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[74]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[67]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[52]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[45]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[38]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[6]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[22]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[15]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {psum_norm_1[3]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[82]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[75]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[68]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[60]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[53]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[46]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[39]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[7]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[30]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[23]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[16]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {psum_norm_1[4]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[83]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[76]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[69]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[61]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[54]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[47]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[8]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[31]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[24]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[17]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[0]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {psum_norm_1[5]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {norm_valid}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[84]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[77]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[62]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[55]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[48]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[9]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[32]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[25]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[18]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[1]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[10]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {psum_norm_1[6]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[85]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[78]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[70]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[63]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[56]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[49]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[40]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[33]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[26]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[19]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[2]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[11]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {psum_norm_1[7]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[86]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[79]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[71]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[64]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[57]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[41]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[34]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[27]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[3]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[12]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {psum_norm_1[8]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[87]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[72]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[65]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[58]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {psum_norm_1[10]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[42]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[35]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[28]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[4]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[20]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[13]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {psum_norm_1[9]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {psum_norm_2[0]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[80]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[73]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[66]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[59]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[50]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[43]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[36]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[29]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[21]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[14]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[5]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {psum_norm_2[1]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[81]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[74]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[67]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[51]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[44]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[37]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[22]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[15]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[6]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {psum_norm_2[2]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[82]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[75]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[68]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[52]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[45]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {out_core2[38]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[30]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[23]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[16]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk1}] [get_ports {out_core1[7]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk2}] [get_ports {psum_norm_2[3]}]
