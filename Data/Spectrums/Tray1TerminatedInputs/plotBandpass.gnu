set terminal postscript enhanced color
set output "IFBand.ps"
set datafile separator ","
set grid 
file1 ="Ch1NoPads.txt"
file2 ="Ch2NoPads.txt"
file3 ="Ch3NoPads.txt"
file4 ="Ch4NoPads.txt"
set xlabel "Frequency [Ghz]"
set ylabel "Power [dBm]"
set title "Full 1GHz IF band"
plot file1 using ($1):($2) ps 0.5 t "Ch1",file2 using ($1):($2) ps 0.5 t "Ch2",file3 using ($1):($2) ps 0.5 t "Ch3",file4 using ($1):($2) ps 0.5 t "Ch4"
