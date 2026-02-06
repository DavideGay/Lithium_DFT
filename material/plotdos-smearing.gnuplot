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
plot "pdos/li.pdos_tot_smear_0.01" u 1:2 w l lw 1.5 t "degauss=0.01",\
"pdos/li.pdos_tot_smear_0.02" u 1:2 w l lw 1.5 t "degauss=0.02",\
"pdos/li.pdos_tot_smear_0.03" u 1:2 w l lw 1.5 t "degauss=0.03",\
"pdos/li.pdos_tot_smear_0.04" u 1:2 w l lw 1.5 t "degauss=0.04",\
"pdos/li.pdos_tot_smear_0.05" u 1:2 w l lw 1.5 t "degauss=0.05"

#unset multiplot
