reset

set key font ",12"
set xlabel "r (Bohr)" font ",12"
set ylabel "Charge Density (electrons/Bohr)" font ",12"

p [:6]\
"4-Li.charge" u 1:2 w l lw 3.5 lc 8 t "total charge",\
"4-Li.wfc" u 1:($3**2)*2 w l lw 2 lc 7 dt 2 t "1s",\
"4-Li.wfc" u 1:($2**2)*1 w l lw 2 lc 6 dt 2 t "2s"

