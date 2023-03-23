
# XM-Sim Command File
# TOOL:	xmsim(64)	20.09-s017
#

set tcl_prompt1 {puts -nonewline "xcelium> "}
set tcl_prompt2 {puts -nonewline "> "}
set vlog_format %h
set vhdl_format %v
set real_precision 6
set display_unit auto
set time_unit module
set heap_garbage_size -200
set heap_garbage_time 0
set assert_report_level note
set assert_stop_level error
set autoscope yes
set assert_1164_warnings yes
set pack_assert_off {}
set severity_pack_assert_off {note warning}
set assert_output_stop_level failed
set tcl_debug_level 0
set relax_path_name 1
set vhdl_vcdmap XX01ZX01X
set intovf_severity_level ERROR
set probe_screen_format 0
set rangecnst_severity_level ERROR
set textio_severity_level ERROR
set vital_timing_checks_on 1
set vlog_code_show_force 0
set assert_count_attempts 1
set tcl_all64 false
set tcl_runerror_exit false
set assert_report_incompletes 0
set show_force 1
set force_reset_by_reinvoke 0
set tcl_relaxed_literal 0
set probe_exclude_patterns {}
set probe_packed_limit 4k
set probe_unpacked_limit 16k
set assert_internal_msg no
set svseed 1
set assert_reporting_mode 0
set vcd_compact_mode 0
alias . run
alias quit exit
database -open -vcd -into fullchip_tb.vcd _fullchip_tb.vcd1 -timescale fs
database -open -evcd -into fullchip_tb.vcd _fullchip_tb.vcd -timescale fs
database -open -shm -into waves.shm waves -default
probe -create -database waves fullchip_tb.K fullchip_tb.Q fullchip_tb.captured_data fullchip_tb.clk fullchip_tb.execute fullchip_tb.i fullchip_tb.inst fullchip_tb.j fullchip_tb.k fullchip_tb.kmem_rd fullchip_tb.kmem_wr fullchip_tb.load fullchip_tb.m fullchip_tb.mem_in fullchip_tb.ofifo_rd fullchip_tb.p fullchip_tb.pmem_add fullchip_tb.pmem_rd fullchip_tb.pmem_wr fullchip_tb.q fullchip_tb.qk_file fullchip_tb.qk_scan_file fullchip_tb.qkmem_add fullchip_tb.qmem_rd fullchip_tb.qmem_wr fullchip_tb.reset fullchip_tb.result fullchip_tb.s fullchip_tb.sum fullchip_tb.t fullchip_tb.temp5b fullchip_tb.temp16b fullchip_tb.temp_sum fullchip_tb.u fullchip_tb.weight fullchip_tb.fullchip_instance.clk fullchip_tb.fullchip_instance.inst fullchip_tb.fullchip_instance.mem_in fullchip_tb.fullchip_instance.out fullchip_tb.fullchip_instance.reset

simvision -input /home/linux/ieng6/ee260bwi23/vsureshkumar/systolic-transformer/vanilla/.simvision/31600_vsureshkumar__autosave.tcl.svcf
