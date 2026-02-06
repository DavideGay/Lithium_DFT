#!/bin/bash

for k in 10 12 14 16 20; do

cat <<EOF > pdos/_li-nscf-${k}.in
 &control
    calculation = 'nscf'
    restart_mode='from_scratch',
    prefix='li',
    tstress = .true.
    tprnfor = .true.
    pseudo_dir = './pseudopot/',
    outdir = './QE-outdir/',
 /
 &system
    ibrav=  3,
    celldm(1) = 6.4319,
    nat=  1, ntyp= 1, ecutwfc = 20.0,
    occupations='smearing', smearing='methfessel-paxton', degauss=0.01
 /
 &electrons
    mixing_mode = 'plain'
    mixing_beta = 0.7
    conv_thr =  1.0d-8
 /
ATOMIC_SPECIES
 Li  6.94 Li.pbe-mt_fhi.UPF
ATOMIC_POSITIONS
 Li 0.00 0.00 0.00
K_POINTS automatic
 $k $k $k  1 1 1
EOF


pw.x < pdos/_li-nscf-${k}.in > pdos/_li-nscf-${k}.out
projwfc.x < 3-Li-projwfc.in > 3-Li-projwfc.out
mv li.pdos_tot pdos/li.pdos_tot_$k

done

gnuplot -persist plotdos.gnuplot

