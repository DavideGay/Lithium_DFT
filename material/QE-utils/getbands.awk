# Extract bands from pw.x scf/nscf/bands calculation.
# Execution:
#   awk -f getbands.awk pwfile.out
#
BEGIN{maxline=999; firstk=1; klen=0; print "#klen kx ky kz bands(eV)";ik=0}
/number of k points/ {nk=$5;}
/Starting magnetic structure/ {nspin=2;}
(($0~/band energies/)||($0~/bands \(ev\)/)) {
  ik++;
  kx=$3; ky=$4; kz=$5; getline; # skip one empty line
#  if ((nspin==2)&&(ik-1==nk/2)) {firstk=1;printf "\n"}
  if ((nspin==2)&&(ik-1==nk)) {firstk=1;printf "\n"}
  if (firstk) {
    dk=0;
    klen=0;
    firstk=0;
  } else {
    dk=sqrt((kx-ox)^2+(ky-oy)^2+(kz-oz)^2);
    klen+=dk;
  }
  bandk="";
  for (i=0;i<maxline;i++) {
    getline;
    if (NF>0) {
      bandk=bandk" "$0;
    } else {
      print klen, kx, ky, kz, bandk;
      ox=kx; oy=ky; oz=kz;
      break;
    }
  }
}
