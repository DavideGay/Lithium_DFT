#!/bin/bash

# PDOS
pw.x < 3-Li-nscf.in > 3-Li-nscf.out
projwfc.x < 3-Li-projwfc.in > 3-Li-projwfc.out
#gnuplot -persist 3-plotdos.gnuplot

# BANDS
pw.x < 3-Li-bands.in > 3-Li-bands.out
awk -f ./QE-utils/getbands.awk 3-Li-bands.out > 3-Li-bands.dat
#gnuplot -persist 3-plotbands.bash

#gnuplot -persist 3-plotall.bash
