set terminal postscript enhanced color
set output "BandPasses.ps"
set datafile separator ","
set grid 
file4="Ch4Tray1_Tray2_terminatedInput4GHzLO.txt"
file3="Ch3Tray1_Tray2_terminatedInput4GHzLO.txt"
file2="Ch2Tray1_Tray2_terminatedInput4GHzLO.txt"
file1="Ch1Tray1_Tray2_terminatedInput4GHzLO.txt"
file5 ="Ch1Tray1_Tray2_terminatedInput4GHzLO_with1000_1500MhzBPF.txt"
file6 ="Ch1Tray1_Tray2_terminatedInput4GHzLO_with1000_1500MhzBPF2.txt"
file7 ="Ch1Tray1_Tray2_terminatedInput4GHzLO_with500_1000MhzBPF.txt"
file8="Ch1Tray1_Tray2_terminatedInput4GHzLO_with500_1000MhzBPF_500MHzLPFRemoved_andOtherOutputTerminated.txt"
file9="Ch1Tray1_Tray2_terminatedInput4GHzLO_with1000_1500MhzBPF_500MHzLPFRemoved_andOtherOutputTerminated.txt"

plot file1 using ($1):($2) ps 0.5 t "Ch1",file2 using ($1):($2) ps 0.5 t "Ch2",file3 using ($1):($2) ps 0.5 t "Ch3",file4 using ($1):($2) ps 0.5 t "Ch4",file5 using ($1):($2) ps 0.5 t "Ch1 With BPF",file6 using ($1):($2) ps 0.5 t "Ch1 With BPF2",file7 using ($1):($2) ps 0.5 t "Ch1 With BPF",file8 using ($1):($2) ps 0.5 t "Ch1 With BPF No LPF",file9 using ($1):($2) ps 0.5 t "Ch1 With BPF No LPF"
set xlabel "Frequency [Ghz]"
set ylabel "Power [dBm]"

set output "IFBandPass4GHzLO.ps"
set xrange [-0.2:1.7]
set yrange [*:10]
set title 'IF Band'
set ylabel "Power [dB]"
plot  file1 using ($1):($2+40) ps 0.5 w l t 'Channel1', file2 using ($1):($2+40) ps 0.5 w l t 'Channel2',file3 using ($1):($2+40) ps 0.5 w l t 'Channel3',file4 using ($1):($2+40) ps 0.5 w l t 'Channel'   

