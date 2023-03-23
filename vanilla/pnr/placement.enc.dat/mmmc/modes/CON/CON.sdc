###############################################################
#  Generated by:      Cadence Innovus 19.17-s077_1
#  OS:                Linux x86_64(Host ID ieng6-ece-20.ucsd.edu)
#  Generated on:      Wed Mar 22 22:22:39 2023
#  Design:            fullchip
#  Command:           saveDesign placement.enc
###############################################################
current_design fullchip
create_clock [get_ports {clk}]  -name clk -period 0.500000 -waveform {0.000000 0.250000}
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {inst[14]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {mem_in[22]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {mem_in[15]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {inst[1]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {mem_in[11]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {mem_in[6]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {inst[10]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {mem_in[27]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {mem_in[2]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {inst[6]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {inst[15]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {mem_in[30]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {mem_in[23]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {mem_in[16]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {inst[2]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {mem_in[7]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {inst[11]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {mem_in[12]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {mem_in[28]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {mem_in[3]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {inst[7]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {inst[16]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {mem_in[31]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {mem_in[24]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {mem_in[17]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {inst[3]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {inst[12]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {mem_in[20]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {mem_in[13]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {mem_in[8]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {mem_in[29]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {mem_in[4]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {inst[8]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {mem_in[25]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {mem_in[18]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {mem_in[0]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {inst[4]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {mem_in[9]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {inst[13]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {mem_in[21]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {mem_in[14]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {inst[0]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {reset}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {mem_in[10]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {mem_in[5]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {inst[9]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {mem_in[26]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {mem_in[19]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {mem_in[1]}]
set_input_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {inst[5]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[32]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[25]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[18]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[62]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[55]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[48]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[1]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[85]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[78]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[10]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[40]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[33]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[26]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[19]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[70]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[63]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[56]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[49]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[2]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[86]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[79]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[11]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[41]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[34]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[27]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[71]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[64]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[57]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[3]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[87]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[12]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[42]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[35]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[28]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[72]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[65]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[58]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[4]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[20]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[13]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[50]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[43]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[36]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[29]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[80]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[73]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[66]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[59]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[5]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[21]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[14]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[51]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[44]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[37]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[81]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[74]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[67]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[6]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[22]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[15]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[52]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[45]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[38]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[82]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[75]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[68]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[7]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[30]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[23]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[16]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[60]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[53]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[46]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[39]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[83]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[76]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[69]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[8]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[31]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[24]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[17]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[61]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[54]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[47]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[0]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[84]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[77]}]
set_output_delay -add_delay 0.2 -max -clock [get_clocks {clk}] [get_ports {out[9]}]
