set clock_cycle 1
set io_delay 0.2 

set clock_port clk

create_clock -name clk -period $clock_cycle [get_ports $clock_port]

set_input_delay -clock [get_clocks clk] -add_delay -max $io_delay [get_ports {mem_in[*]}]
set_input_delay -clock [get_clocks clk] -add_delay -max $io_delay [get_ports {inst[*]}]
set_input_delay -clock [get_clocks clk] -add_delay -max $io_delay [get_ports {reset}]
set_output_delay -clock [get_clocks clk] -add_delay -max $io_delay [get_ports {out[*]}]
clk1, 
   rst1,
   mem_in_core1[*], 
   inst_core1[*], 
   out_core1[*],
   clk2, 
   rst2,
   mem_in_core2[*], 
   inst_core2, 
   out_core2[*],
   norm_gate,
   s_valid1, s_valid2, 
   psum_norm_1[*],
   psum_norm_2[*],
   norm_valid