getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true

editPin -pinWidth 0.2 -pinDepth 0.6 -fixOverlap 1 -unit MICRON -spreadDirection        clockwise -side Left   -layer 3 -spreadType center -spacing 0.8 -pin {clk1 core_gate1 rst1 inst_core1* mem_in_core1*}
editPin -pinWidth 0.2 -pinDepth 0.6 -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Right  -layer 3 -spreadType center -spacing 0.8 -pin {clk2 core_gate2 rst2 inst_core2* mem_in_core2*}
editPin -pinWidth 0.2 -pinDepth 0.6 -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Bottom -layer 3 -spreadType center -spacing 0.8 -pin {out_core1* s_valid1 norm_valid psum_norm_1* psum_norm_2* s_valid2 out_core2* }

setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true


setPinAssignMode -pinEditInBatch false


legalizePin
checkPinAssignment