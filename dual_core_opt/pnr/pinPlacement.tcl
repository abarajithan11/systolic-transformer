getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true

editPin -pinWidth 0.2 -pinDepth 0.6 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 3 -spreadType center -spacing 0.8 -pin {clk* rst* inst_core* mem_in_*}

setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true

editPin -pinWidth 0.2 -pinDepth 0.6 -fixOverlap 1 -unit MICRON -spreadDirection counterclockwise -side Bottom -layer 3 -spreadType center -spacing 0.8 -pin {norm_gate s_valid* norm_valid psum_norm* out_core* }

setPinAssignMode -pinEditInBatch false


legalizePin
checkPinAssignment