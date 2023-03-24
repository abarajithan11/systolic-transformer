getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true

editPin -pinWidth 0.2 -pinDepth 0.6 -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Left -layer 3 -spreadType start -spacing 0.8 -start 0.0 460.6 -pin {clk* core_gate* rst* inst_core* mem_in_*}

setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true

editPin -pinWidth 0.2 -pinDepth 0.6 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Bottom -layer 3 -spreadType start -spacing 0.8 -start 460.6 0.0 -pin {s_valid* norm_valid psum_norm* out_core* }

setPinAssignMode -pinEditInBatch false


legalizePin
checkPinAssignment