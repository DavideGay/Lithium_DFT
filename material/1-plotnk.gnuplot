reset
#f(x)=a*x+b
#a=0.001; b=0.6929
#fit [:0.02] f(x) 'results-cutoff.dat' u (1/$1):6 via a,b
set ytics font ",11"
set xtics font ",11"

set xlabel "size of k point mesh" font ",12"
set ylabel "Total Energy (Ry)" font ",12"
#set origin 0,0
#set size 0.5,1.0
#set multiplot
plot 'results-cut20-nk.dat' u 1:6 w lp lc 8 pt 7 not

#set origin 0.5,0.0
#set xlabel "1/ size of k point mesh" font ",12"
#plot 'results-cut20-nk.dat' u (1/$1):6 w lp lc 8 pt 7 not
#unset multiplot

