set terminal postscript enhanced color
set output "BandPasses.ps"
set datafile separator ","
set grid 
file1 ="Ch1Tray1_Tray2_terminatedInput4500MHzLO_500MHzLPFNoHPF.txt"
file2="Ch1Tray1_Tray2_terminatedInput4500MHzLO_500MHzHPFNoLPF.txt"
file3="Ch1Tray1_Tray2_terminatedInput4500MHzLO_NoFilters.txt"
file4="Ch1Tray1_Tray2_terminatedInput4500MHzLO_500MHzHPFWithLPF.txt"
file5="Ch1Tray1_Tray2_terminatedInput4500MHzLO_500MHzLPFWithHPF.txt"
plot file1 using ($1):($2) ps 0.5 t "Ch1 500MhzLPF",file2 using ($1):($2) ps 0.5 t "Ch1 500MhzHPF",file3 using ($1):($2) ps 0.5 t "Ch1 NoFilters",file4 using ($1):($2) ps 0.5 t "Ch1 500HPF with LPF",file5 using ($1):($2) ps 0.5 t "Ch1 500LPF with HPF"
set xlabel "Frequency [Ghz]"
set ylabel "Power [dBm]"

set output "IFBandPass4_5GHzLO.ps"
set xrange [-0.2:1.7]
set yrange [*:10]
set title 'IF Band 4.5GHz LO'
set ylabel "Power [dB]"
plot  file3 using ($1):($2+40) ps 0.5 w l t 'Full IF Band',file4 using ($1):($2+40) ps 0.5 w l t 'DC-500MHz',file5 using ($1):($2+40) ps 0.5 w l t '500MHz-1000MHz'      