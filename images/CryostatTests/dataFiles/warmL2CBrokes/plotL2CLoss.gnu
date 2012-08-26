set terminal postscript enhanced color
set output "LinearCircular.ps"
set datafile separator ","
set yrange [-20.5:4.5]
set grid 
#file1="IfAmp0_79mA_NoLid_NoRegulator.txt"
#file2 ="IfAmp0_79mA_Lid_NoRegulator_ProperlySolderedNewCalibration.txt"
#file3 ="IfAmp2_82mA_lid_noregulator.txt"
#file4 ="berex"
#file5 ="IfAmp3_83mA_lid_noregulator.txt"
#file6= "IfAmp1_82mA_lid_noregulator.txt"

file1="l2c03_Lcp-Ex_2012_05_26_12:04:06_+297.82_243.310394.txt"
file2="l2c03_Lcp+Ex_2012_05_26_12:06:40_+297.82_243.317642.txt"
file3="l2c03_Lcp-Ey_2012_05_26_12:09:03_+297.83_243.324814.txt"
file4="l2c03_Lcp+Ey_2012_05_26_12:11:17_+297.84_243.328842.txt"
file5="l2c03_Rcp-Ex_2012_05_26_12:24:48_+297.88_243.370941.txt"
file6="l2c03_Rcp+Ex_2012_05_26_12:26:01_+297.88_243.373352.txt"
file7="l2c03_Rcp+Ey_2012_05_26_12:16:45_+297.85_243.344437.txt"
file8="l2c03_Rcp-Ey_2012_05_26_12:17:51_+297.86_243.348282.txt"



t1="RCP-Ex"
t2="RCP+Ex"
t3="RCP-Ey"
t4="RCP+Ey"
t5="LCP-Ex"
t6="LCP+Ex"
t7="LCP-Ey"
t8="LCP+Ey"

set title 'S21'
set xlabel 'Frequency [GHz]'
set ylabel 'dB'
set yrange [-20:1]
set xrange [3:7.5]
plot file1 using 1:3 ps 0.5 t t1,file2 using 1:3 ps 0.5 t t2,file3 using 1:3  ps 0.5 t t3,file4 using 1:3 ps 0.5 t t4,file5 using 1:3 ps 0.5 t t5,file6 using 1:3 ps 0.5 t t6,file7 using 1:3 ps 0.5 t t7,file8 using 1:3 ps 0.5 t t8
plot file1 using 1:3 ps 0.5 t t1,file2 using 1:3 ps 0.5 t t2,file3 using 1:3  ps 0.5 t t3,file4 using 1:3 ps 0.5 t t4
plot file5 using 1:3 ps 0.5 t t5,file6 using 1:3 ps 0.5 t t6,file7 using 1:3 ps 0.5 t t7,file8 using 1:3 ps 0.5 t t8
set title 'S11'
set yrange [-45:0]
plot file1 using 1:5 t t1,file2 using 1:5 t t2,file3 using 1:5 t t3,file4 using 1:5 t t4,file5 using 1:5 t t5,file6 using 1:5 t t6,file7 using 1:5 t t7,file8 using 1:5 t t8
set title 'S22'
plot file1 using 1:7 t t1,file2 using 1:7 t t2,file3 using 1:7 t t3,file4 using 1:7 t t4,file5 using 1:7 t t5,file6 using 1:7 t t6,file7 using 1:7 t t7,file8 using 1:7 t t8

set yrange [-6:4.5]
set title 'S21'
set xlabel 'Frequency [GHz]'
set ylabel 'dB'
set xrange [2:7]
plot file1 using 1:3 t t1,file2 using 1:3 t t2,file3 using 1:3 t t3,file4 using 1:3 t t4
set title 'S11'
set yrange [-45:0]
plot file1 using 1:5 t t1,file2 using 1:5 t t2,file3 using 1:5 t t3,file4 using 1:5 t t4
set title 'S22'
plot file1 using 1:7 t t1,file2 using 1:7 t t2,file3 using 1:7 t t3,file4 using 1:7 t t4
