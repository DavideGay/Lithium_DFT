reset
unset key
#set style data lp
#set xlabel "k" font ",12"
unset xlabel
set ylabel "Energy (eV)" font ",12"
#plot [0:4.28024]"2-al.band.dat" u 1:5, "" u 1:6, "" u 1:7, "" u 1:8, "" u 1:9, "" u 1:10, "" u 1:11, "" u 1:12

unset grid
set grid xtics lc rgb "gray" lw 1 lt 1
set xtics ("Γ" 0.0, "H" 1.0, "N" 1.70711, "Γ" 2.41421, "P" 3.28024, "H" 4.14626) font ",13"

set arrow 1 from graph 0, first 0.5974 to graph 1, first 0.6 \
    nohead lw 1 lc rgb "black" dt 2
set label "E_F" at graph 0.028,0.19
set style line 1 lc rgb "black" lw 1
plot [0.:4.14626][-5.:30.] "3-Li-bands.dat" u 1:5 w lp lw 1.5 not,\
"" u 1:6 w lp lw 1.5 not,\
"" u 1:7 w lp lw 1.5 not,\
"" u 1:8 w lp lw 1.5 not,\
"" u 1:9 w lp lw 1.5 not,\
"" u 1:10 w lp lw 1.5 not,\
"" u 1:11 w lp lw 1.5 not,\
"" u 1:12 w lp lw 1.5 not
