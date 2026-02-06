reset
f(x)=a*x+b
a=0.001; b=0.6929
fit [:0.02] f(x) 'results-cutoff.dat' u (1/$1):6 via a,b
set ytics font ",11"
set xtics font ",11"

set xlabel "WFC cutoff (Ry)" font ",12"
set ylabel "Energy (Ry)" font ",12"
set origin 0,0
set size 0.5,1.0
set multiplot
set arrow 1 from graph 0, first -0.692905 to graph 1, first -0.692905 \
    nohead lw 1 lc rgb "black" dt 2
plot 'results-cutoff.dat' u 1:6 w lp pt 8 lc 8 not
unset arrow

set origin 0.5,0.0
set xlabel "1/ WFC cutoff (1/Ry)" font ",12"
plot [0.0:1./20] 'results-cutoff.dat' u (1./$1):6 w lp pt 8 lc 8 not,\
f(x) w l lw 1 lc rgb "black" dt 2 not
unset multiplot
