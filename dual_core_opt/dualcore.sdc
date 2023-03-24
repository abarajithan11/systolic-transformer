set clock_cycle1 1
set io_delay 0.2 
set clock_cycle2 1

set clock_port1 clk1
set clock_port2 clk2

create_clock -name clk1 -period $clock_cycle1 [get_ports $clock_port1]
create_clock -name clk2 -period $clock_cycle2 [get_ports $clock_port2]

set_clock_groups -async -group {clk1} -group {clk2}

set_false_path -from [get_ports "rst1"]
set_false_path -from [get_ports "rst2"]

set_input_delay -clock [get_clocks clk1] -add_delay -max $io_delay [get_ports {rst1}]
set_input_delay -clock [get_clocks clk1] -add_delay -max $io_delay [get_ports {core_gate1}]
set_input_delay -clock [get_clocks clk1] -add_delay -max $io_delay [get_ports {mem_in_core1[*]}]
set_input_delay -clock [get_clocks clk1] -add_delay -max $io_delay [get_ports {inst_core1[*]}]
set_input_delay -clock [get_clocks clk1] -add_delay -max $io_delay [get_ports {s_valid1}]
set_output_delay -clock [get_clocks clk1] -add_delay -max $io_delay [get_ports {out_core1[*]}]
set_output_delay -clock [get_clocks clk1] -add_delay -max $io_delay [get_ports {psum_norm_1[*]}]
set_output_delay -clock [get_clocks clk1] -add_delay -max $io_delay [get_ports {psum_norm_2[*]}]
set_output_delay -clock [get_clocks clk1] -add_delay -max $io_delay [get_ports {norm_valid}]

set_input_delay -clock [get_clocks clk2] -add_delay -max $io_delay [get_ports {core_gate2}]
set_input_delay -clock [get_clocks clk2] -add_delay -max $io_delay [get_ports {rst2}]
set_input_delay -clock [get_clocks clk2] -add_delay -max $io_delay [get_ports {mem_in_core2[*]}]
set_input_delay -clock [get_clocks clk2] -add_delay -max $io_delay [get_ports {inst_core2[*]}]
set_input_delay -clock [get_clocks clk2] -add_delay -max $io_delay [get_ports {s_valid2}]
set_output_delay -clock [get_clocks clk2] -add_delay -max $io_delay [get_ports {out_core2[*]}]



set_multicycle_path -setup 2 -from normalizer_inst/sum_reg* -to normalizer_inst/div_out*_reg*
set_multicycle_path -hold  1 -from normalizer_inst/sum_reg* -to normalizer_inst/div_out*_reg*
 
set_multicycle_path -setup 2 -from normalizer_inst/div_in*_reg* -to normalizer_inst/div_out*_reg*
set_multicycle_path -hold  1 -from normalizer_inst/div_in*_reg* -to normalizer_inst/div_out*_reg*
 
