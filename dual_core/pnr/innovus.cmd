#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Wed Mar 22 01:28:10 2023                
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
setMultiCpuUsage -localcpus 8
setMultiCpuUsage -localCpu 8
set init_pwr_net VDD
set init_gnd_net VSS
set init_verilog ../dualcore.out.v
set init_design_netlisttype Verilog
set init_design_settop 1
set init_top_cell dualcore
set init_lef_file /home/linux/ieng6/ee260bwi23/public/PDKdata/lef/tcbn65gplus_8lmT2.lef
create_library_set -name WC_LIB -timing $worst_timing_lib
create_library_set -name BC_LIB -timing $best_timing_lib
create_rc_corner -name Cmax -cap_table $worst_captbl -T 125
create_rc_corner -name Cmin -cap_table $best_captbl -T -40
create_delay_corner -name WC -library_set WC_LIB -rc_corner Cmax
create_delay_corner -name BC -library_set BC_LIB -rc_corner Cmin
create_constraint_mode -name CON -sdc_file [list $sdc]
create_analysis_view -name WC_VIEW -delay_corner WC -constraint_mode CON
create_analysis_view -name BC_VIEW -delay_corner BC -constraint_mode CON
init_design -setup WC_VIEW -hold BC_VIEW
set_interactive_constraint_modes {CON}
setDesignMode -process 65
floorPlan -site core -r 1 0.50 10.0 10.0 10.0 10.0
timeDesign -preplace -prefix preplace
globalNetConnect VDD -type pgpin -pin VDD -inst * -verbose
globalNetConnect VSS -type pgpin -pin VSS -inst * -verbose
addRing -spacing {top 2 bottom 2 left 2 right 2} -width {top 3 bottom 3 left 3 right 3} -layer {top M1 bottom M1 left M2 right M2} -center 1 -type core_rings -nets {VSS  VDD}
setAddStripeMode -break_at block_ring
addStripe -number_of_sets 2 -spacing 6 -layer M4 -width 2 -nets { VSS VDD }
sroute
zoomBox 164.66700 33.18100 1059.77200 409.41600
zoomOut
zoomIn
fit
zoomBox -372.24550 13.84800 917.50250 555.96100
zoomBox -36.03950 182.91700 450.38900 387.37500
zoomBox -294.41000 -11.69050 995.34050 530.42350
zoomBox -454.96700 -131.43800 1330.15600 618.89350
zoomBox -255.66350 147.30250 840.62700 608.10050
zoomBox -208.19950 213.65300 723.64750 605.33150
zoomBox -133.56300 317.98950 539.69750 600.97750
zoomBox -40.67650 447.83750 310.77000 595.55900
zoomBox -20.97250 481.08900 232.94800 587.81800
zoomBox -67.88750 447.22200 345.58100 621.01300
zoomBox -220.31800 337.18500 711.53750 728.86700
zoomBox -1103.67550 138.75500 1367.11200 1177.28800
zoomBox -424.03850 200.52900 865.72900 742.65000
zoomBox -90.56550 322.59300 481.71250 563.13550
zoomBox -32.80350 367.07650 318.64850 514.80050
zoomBox -11.02950 393.90600 204.80600 484.62700
zoomBox -106.38400 317.10200 380.05550 521.56450
zoomBox -214.08600 230.35250 577.99900 563.28550
zoomBox -389.46150 89.09500 900.31800 631.22100
zoomBox -321.28900 167.04000 775.02400 627.84750
zoomBox -216.54950 287.16100 575.53700 620.09450
zoomBox -175.89750 333.17150 497.37600 616.16500
zoomBox -114.60800 401.49650 371.83250 605.95950
zoomBox -90.95900 427.73450 322.51550 601.52800
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
selectWire 18.0000 1.0000 20.0000 578.8000 4 VDD
deselectAll
selectWire 10.0000 6.0000 12.0000 573.8000 4 VSS
deselectAll
selectWire 10.0000 564.2350 571.8000 564.5650 1 VDD
deselectAll
selectWire 18.0000 1.0000 20.0000 578.8000 4 VDD
setAddStripeMode -ignore_block_check false -break_at none -route_over_rows_only false -rows_without_stripes_only false -extend_to_closest_target none -stop_at_last_wire_for_area false -partial_set_thru_domain false -ignore_nondefault_domains false -trim_antenna_back_to_shape none -spacing_type edge_to_edge -spacing_from_block 0 -stripe_min_length stripe_width -stacked_via_top_layer M8 -stacked_via_bottom_layer M1 -via_using_exact_crossover_size false -split_vias false -orthogonal_only true -allow_jog { padcore_ring  block_ring } -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape   }
addStripe -nets {VDD VSS} -layer M4 -direction vertical -width 1.8 -spacing 1.8 -number_of_sets 20 -start_from left -switch_layer_over_obs false -max_same_layer_jog_length 2 -padcore_ring_top_layer_limit M8 -padcore_ring_bottom_layer_limit M1 -block_ring_top_layer_limit M8 -block_ring_bottom_layer_limit M1 -use_wire_group 0 -snap_wire_center_to_grid None
zoomBox -133.34350 406.67400 353.09700 611.13700
zoomBox -599.98650 174.80150 689.79500 716.92850
zoomBox -482.71950 229.82850 613.59500 690.63650
zoomBox -388.67900 280.06250 543.18850 671.74950
zoomBox -269.25700 368.54050 404.01750 651.53450
zoomBox -181.96400 432.80300 304.47800 637.26650
zoomBox -98.73350 489.18900 200.00250 614.75500
deselectAll
selectWire 13.6000 6.0000 15.4000 573.8000 4 VSS
zoomBox -193.33400 425.41350 378.95200 665.95950
zoomBox -734.12750 226.84000 1051.04850 977.19350
zoomBox -257.96950 334.96500 838.35250 795.77600
zoomBox 138.12900 444.62450 710.41650 685.17100
zoomBox 317.77800 501.25150 669.23600 648.97800
zoomBox 429.85300 540.50850 645.69350 631.23150
set init_pwr_net VDD
set init_gnd_net VSS
set init_verilog ../dualcore.out.v
set init_design_netlisttype Verilog
set init_design_settop 1
set init_top_cell dualcore
set init_lef_file /home/linux/ieng6/ee260bwi23/public/PDKdata/lef/tcbn65gplus_8lmT2.lef
create_library_set -name WC_LIB -timing $worst_timing_lib
create_library_set -name BC_LIB -timing $best_timing_lib
create_rc_corner -name Cmax -cap_table $worst_captbl -T 125
create_rc_corner -name Cmin -cap_table $best_captbl -T -40
create_delay_corner -name WC -library_set WC_LIB -rc_corner Cmax
create_delay_corner -name BC -library_set BC_LIB -rc_corner Cmin
create_constraint_mode -name CON -sdc_file [list $sdc]
create_analysis_view -name WC_VIEW -delay_corner WC -constraint_mode CON
create_analysis_view -name BC_VIEW -delay_corner BC -constraint_mode CON
init_design -setup WC_VIEW -hold BC_VIEW
set_interactive_constraint_modes {CON}
setDesignMode -process 65
deselectAll
zoomBox 301.59450 492.59000 715.07700 666.38700
zoomBox 55.93450 400.83750 848.03800 733.77800
zoomBox -587.81900 160.17600 1197.38650 910.54200
zoomBox -2038.67850 -382.21350 1984.72650 1308.92300
zoomBox -560.40650 -118.50600 957.01900 519.30550
zoomBox -132.54200 -42.17950 659.56400 290.76200
zoomBox -425.24000 -157.10350 864.57250 385.03650
zoomBox -1420.30350 -661.23200 1486.61100 560.61600
zoomBox -3076.93950 -1639.20750 2491.79700 701.47000
zoomBox -7422.19350 -4204.37650 5128.33650 1070.92150
zoomBox -3659.69550 -1899.26050 2891.76100 854.47850
zoomBox -1100.44000 -331.31800 1370.43950 707.25350
zoomBox -867.98700 -188.90450 1232.26050 693.88150
zoomBox -172.23700 182.66900 759.65450 574.36600
floorPlan -site core -r 1 0.50 10.0 10.0 10.0 10.0
timeDesign -preplace -prefix preplace
globalNetConnect VDD -type pgpin -pin VDD -inst * -verbose
globalNetConnect VSS -type pgpin -pin VSS -inst * -verbose
addRing -spacing {top 2 bottom 2 left 2 right 2} -width {top 3 bottom 3 left 3 right 3} -layer {top M1 bottom M1 left M2 right M2} -center 1 -type core_rings -nets {VSS  VDD}
setAddStripeMode -break_at block_ring
addStripe -number_of_sets 2 -spacing 6 -layer M4 -width 2 -nets { VSS VDD }
sroute
selectWire 13.6000 6.0000 15.4000 573.8000 4 VSS
deselectAll
zoomBox -12.38250 270.84450 474.07250 475.31350
zoomBox -43.92300 253.34500 528.37750 493.89700
zoomBox -307.11650 107.51000 982.70750 649.65500
