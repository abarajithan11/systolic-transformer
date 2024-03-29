#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Sun Mar 12 23:43:11 2023                
#                                                     
#######################################################

#@(#)CDS: Innovus v19.17-s077_1 (64bit) 12/01/2020 11:09 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: NanoRoute 19.17-s077_1 NR201130-0207/19_17-UB (database version 18.20, 510.7.1) {superthreading v1.53}
#@(#)CDS: AAE 19.17-s018 (64bit) 12/01/2020 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: CTE 19.17-s022_1 () Nov 18 2020 03:10:35 ( )
#@(#)CDS: SYNTECH 19.17-s005_1 () Oct 28 2020 05:12:49 ( )
#@(#)CDS: CPE v19.17-s044
#@(#)CDS: IQuantus/TQuantus 19.1.3-s268 (64bit) Mon Aug 10 22:57:12 PDT 2020 (Linux 2.6.32-431.11.2.el6.x86_64)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
win
set init_pwr_net VDD
set init_gnd_net VSS
set init_verilog ./netlist/add.out.v
set init_design_netlisttype Verilog
set init_design_settop 1
set init_top_cell add
set init_lef_file /home/linux/ieng6/ee260bwi23/public/PDKdata/lef/tcbn65gplus_8lmT2.lef
create_library_set -name WC_LIB -timing $worst_timing_lib
create_library_set -name BC_LIB -timing $best_timing_lib
create_rc_corner -name Cmax -cap_table $worst_captbl -T 125
create_rc_corner -name Cmin -cap_table $best_captbl -T -40
create_delay_corner -name WC -library_set WC_LIB -rc_corner Cmax
create_delay_corner -name BC -library_set BC_LIB -rc_corner Cmin
create_constraint_mode -name CON -sdc_file [list $sdc]
