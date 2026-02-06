# #!/usr/bin/gnuplot -persist

#unset key

#set origin 0,0
#set multiplot

#set origin 0,0
#set size 0.7,1.0
#set rmargin 0
#set style data lp
#set xlabel "k"
#set ylabel "Energy (eV)"
#plot "3-Li-bands.dat" u 1:5, "" u 1:6, "" u 1:7, "" u 1:8, "" u 1:9, "" u 1:10, "" u 1:11, "" u 1:12

#set rmargin
#set lmargin 0
#set origin 0.7,0.0
#set size 0.3,1.0
#set style data l
#unset ylabel
#set ytics format ""
#set xlabel "DOS (states/eV)"
set ylabel "DOS (states/eV)"
set xlabel "Energy (eV)"
plot "pdos/li.pdos_tot_10" u 1:2 w l lw 1.5 t "k=10",\
"pdos/li.pdos_tot_12" u 1:2 w l lw 1.5 t "k=12",\
"pdos/li.pdos_tot_14" u 1:2 w l lw 1.5 t "k=14",\
"pdos/li.pdos_tot_16" u 1:2 w l lw 1.5 t "k=16",\
"pdos/li.pdos_tot_20" u 1:2 w l lw 1.5 t "k=20"

#unset multiplot
