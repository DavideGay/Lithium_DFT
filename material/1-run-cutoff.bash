#!/bin/bash

rm -f results-cutoff.dat

for ((ecutwfc=10;((ecutwfc<=80));ecutwfc=ecutwfc+2)); do

if [ ! -e cutoff/_li.scf-$ecutwfc.out ]; then

cat <<EOF > cutoff/_li.scf-$ecutwfc.in
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
    celldm(1) = 6.5,
    nat=  1, ntyp= 1,
    ecutwfc =$ecutwfc,
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
 4 4 4   1 1 1
EOF

pw.x < cutoff/_li.scf-$ecutwfc.in > cutoff/_li.scf-$ecutwfc.out

fi

(
    echo -n "$ecutwfc "
    grep ! cutoff/_li.scf-$ecutwfc.out
) >> results-cutoff.dat

done

cat <<EOF | gnuplot -persist
set xlabel "WFC cutoff (Ry)"
set ylabel "Energy (Ry)"
set origin 0,0
set size 0.5,1.0
set multiplot
plot 'results-cutoff.dat' u 1:6 not
set origin 0.5,0.0
set xlabel "1/ WFC cutoff (1/Ry)"
plot [0:1./20] 'results-cutoff.dat' u (1./\$1):6 not
unset multiplot
EOF
