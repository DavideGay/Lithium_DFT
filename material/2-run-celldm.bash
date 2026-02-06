#!/bin/bash

xc="pz"   # change this AND comment/uncomment (with !) input_dft line

rm -f ev-${xc}.dat

for dim in `seq 6.1 0.02 6.7`; do

if [ ! -e celldm/${xc}/_li.scf-$dim.out ]; then

cat <<EOF > celldm/${xc}/_li.scf-$dim.in
 &control
    calculation = 'scf'
    restart_mode='from_scratch',
    prefix='li',
    tstress = .true.
    tprnfor = .true.
    pseudo_dir = './pseudopot/',
    outdir = './QE-outdir/',
 /
 &system
    ibrav=  3,
    celldm(1) = $dim,
    nat=  1, ntyp= 1,
    ecutwfc = 20,
    occupations='smearing', smearing='methfessel-paxton', degauss=0.01
    input_dft='pz'
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
 10 10 10   1 1 1
EOF

pw.x < celldm/${xc}/_li.scf-$dim.in > celldm/${xc}/_li.scf-$dim.out

fi

(
    echo -n "$dim "
    #grep ! celldm/${xc}/_li.scf-$dim.out
    awk '/!    total energy/ { print $(NF-1); exit }' celldm/${xc}/_li.scf-$dim.out
) >> ev-${xc}.dat

done

#cat <<EOF | gnuplot -persist
#set xlabel "Alat (Bohr)"
#set ylabel "Total energy (Ry)"
##p "ev-${xc}.dat" u 1:6 w lp
#p "ev-${xc}.dat" u 1:2 w lp
#EOF
