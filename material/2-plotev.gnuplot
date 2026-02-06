reset
set key top left
set xlabel "a (Bohr)" font ",12"
set ylabel "Total energy (Ry)" font ",12"
p [6.1:6.7][-0.696:]"fit-pbe.dat" u 1:2 w p pt 4 lc 6 t "PBE", "" u 1:3 w l lc 6 t "PBE Murnaghan fit",\
"fit-pz.dat" u 1:2 w p pt 6 lc 7 t "PZ", "" u 1:3 w l lc 7 t "PZ Murnaghan fit"
