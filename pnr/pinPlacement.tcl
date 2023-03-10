getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.09 -pinDepth 0.47 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 1 -spreadType center -spacing 1.5 -pin {clk {x[0]} {x[1]} {x[2]} {x[3]} {y[0]} {y[1]} {y[2]} {y[3]} {z[0]} {z[1]} {z[2]} {z[3]}}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Right -layer 1 -spreadType center -spacing 1.6 -pin {{out[0]} {out[1]} {out[2]} {out[3]} {out[4]} {out[5]}}
setPinAssignMode -pinEditInBatch false
