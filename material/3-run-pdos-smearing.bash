#!/bin/bash

for degauss in 0.01 0.02 0.03 0.04 0.05; do

cat <<EOF > 3-Li-projwfc.in
&projwfc
    prefix='li'
    outdir = './QE-outdir/'
    ngauss=0
    degauss=${degauss}
    DeltaE=.020000
/
EOF

pw.x < 3-Li-nscf.in > 3-Li-nscf.out
projwfc.x < 3-Li-projwfc.in > 3-Li-projwfc.out
mv li.pdos_tot pdos/li.pdos_tot_smear_${degauss}

done

gnuplot -persist plotdos-smearing.gnuplot

