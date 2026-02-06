# #!/usr/bin/gnuplot -persist
reset

set key top left

#set rmargin
#set lmargin 0
#set origin 0.7,0.0
#set size 0.3,1.0

set style data l
set xlabel "Energy (eV)" font ",12"
set ylabel "DOS (states/eV)" font ",12"
#set ytics format ""

# Fermi energy = 0.5974
#set arrow 1 from graph 0, first 0.6 to graph 1, first 0.6 \
#    nohead lw 1 lc rgb "black" dt 2
set arrow 1 from first 0., graph 0 to first 0., graph 0.46 \
    nohead lw 1.5 lc rgb "black" dt 2

# "k=20, degauss=0.03"
ef=0.5974
plot [-5.:31.][:]"li.pdos_tot" u ($1-ef):2 w l lw 1.5 lc rgb "black" t "total DOS",\
"li.pdos_atm\#1\(Li\)_wfc\#1\(s\)" u ($1-ef):2 w l lw 1.3 t "s",\
"li.pdos_atm\#1\(Li\)_wfc\#2\(p\)" u ($1-ef):2 w l lw 1.3 t "p",\
"li.pdos_atm\#1\(Li\)_wfc\#3\(d\)" u ($1-ef):2 w l lw 1.3 t "d",\
"li.pdos_atm\#1\(Li\)_wfc\#4\(f\)" u ($1-ef):2 w l lw 1.3 lc 7 t "f"
#"" u 1:3 w l lw 1 t "total PDOS"

unset multiplot
