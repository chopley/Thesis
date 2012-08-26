set terminal postscript enhanced color
set output "BandPasses.ps"
set datafile separator ","
set grid 
file1="Ch1NoPads.txt"
file2="Ch2WithPads.txt"
file3="Ch2NoPads.txt"
file4="Ch3NoPads.txt"
file5="Ch4NoPads.txt"
plot file1 using ($1):($2) ps 0.5 t "Ch1",file2 using ($1):($2) ps 0.5 t "Ch2",file3 using ($1):($2) ps 0.5 t "Ch2",file4 using ($1):($2) ps 0.5 t "Ch3",file5 using ($1):($2) ps 0.5 t "Ch4"
set xlabel "Frequency [Ghz]"
set ylabel "Power [dBm]"

