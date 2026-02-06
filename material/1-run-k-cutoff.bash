#!/bin/bash

ecutwfc=20
rm -f results-cut${ecutwfc}-nk.dat

for nk in 4 6 8 10 12 14 16 18 20; do
#for ((ecutwfc=10;((ecutwfc<=60));ecutwfc=ecutwfc+2)); do

name="_li.scf-cut${ecutwfc}-${nk}"
if [ ! -e cutoff/${name}.out ]; then

cat <<EOF > cutoff/${name}.in
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
 $nk $nk $nk   1 1 1
EOF

pw.x < cutoff/${name}.in > cutoff/${name}.out

fi

(
    echo -n "$nk "
    grep ! cutoff/${name}.out
) >> results-cut${ecutwfc}-nk.dat

#done
done

cat <<EOF | gnuplot -persist
set xlabel "# of k points"
set ylabel "Energy (Ry)"
set origin 0,0
set size 0.5,1.0
set multiplot
plot 'results-cut${ecutwfc}-nk.dat' u 1:6 w p not
#'results-cutoff-6.dat' u 2:7 w p t 'k=6',\
set origin 0.5,0.0
set xlabel "1/ # of k points"
plot [:] 'results-cut${ecutwfc}-nk.dat' u (1./\$1):6 w p not
unset multiplot
EOF
