set terminal postscript enhanced color
set output "Tray2OutputPower.ps"
set datafile separator ","
set grid 
file1 ="Ch1Tray2_FullIFBandWithCh1Tray1InputPower.txt"
file2 ="Ch2Tray2_FullIFBandWithCh1Tray1InputPower.txt"
file3 ="Ch3Tray2_FullIFBandWithCh1Tray1InputPower.txt"
file4 ="Ch4Tray2_FullIFBandWithCh1Tray1InputPower.txt"
set xlabel "Frequency [Ghz]"
set ylabel "Power [dBm]"
set title "Tray 2 Output bandwidth"
plot file1 using ($1):($2) ps 0.5 t "Ch1 IF Band",file2 using ($1):($2) ps 0.5 t "Ch2",file3 using ($1):($2) ps 0.5 t "Ch3",file4 using ($1):($2) ps 0.5 t "Ch4"

