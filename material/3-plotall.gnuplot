# #!/usr/bin/gnuplot -persist
reset
unset key

set origin 0,0
bandsize=0.85
dossize=1.-bandsize
ef=0.5974
set multiplot

# BANDS
set origin 0,0
set size bandsize,1.0
set rmargin 0
set style data lp
set xlabel "k" font ",12"
set ylabel "Energy (eV)" font ",12"
unset grid
set grid xtics lc rgb "gray" lw 1 lt 1
set xtics ("Γ" 0.0, "H" 1.0, "N" 1.70711, "Γ" 2.41421, "P" 3.28024, "H" 4.14626) font ",13"
set arrow 1 from graph 0, first 0. to graph 1, first 0. \
    nohead lw 1 lc rgb "black" dt 2
#set label "E_F" at graph 0.028,0.19
plot [0.:4.14626][-5.:30.] "3-Li-bands.dat" u 1:($5-ef) w lp lw 1.5 not,\
"" u 1:($6-ef) w lp lw 1.5 not,\
"" u 1:($7-ef) w lp lw 1.5 not,\
"" u 1:($8-ef) w lp lw 1.5 not,\
"" u 1:($9-ef) w lp lw 1.5 not,\
"" u 1:($10-ef) w lp lw 1.5 not,\
"" u 1:($11-ef) w lp lw 1.5 not,\
"" u 1:($12-ef) w lp lw 1.5 not
unset label

# DOS
set rmargin
set lmargin 0
set origin bandsize,0.0
set size dossize,1.0
set style data l
unset ylabel
set ytics format ""
set xlabel "DOS (states/eV)" font ",12"
unset grid
set xtics ("0.5" 0.5, "1.0" 1.0) font ",11"
#plot "li.pdos_tot" u 2:1
plot [0.:1.0][-5:30.] "li.pdos_tot" u 2:($1-ef) w l lw 1.5 lc rgb "black" not

unset multiplot
