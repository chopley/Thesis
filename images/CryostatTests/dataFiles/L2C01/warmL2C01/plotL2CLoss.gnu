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

file1="L2C01_LCP_-Ey_2012_05_25_10:32:28_+297.54_243.068054.txt"
file2="L2C01_LCP_+Ey_2012_05_25_10:36:18_+297.56_243.085953.txt"


file3="L2C01_LCP_-Ex_2012_05_25_10:38:35_+297.57_243.096451.txt"
file4="L2C01_LCP_+Ex_2012_05_25_10:41:46_+297.58_243.106476.txt"

file5="L2C01_RCP_+Ex_2012_05_25_10:45:10_+297.60_243.126190.txt"
file6="L2C01_RCP_-Ex_2012_05_25_10:46:34_+297.61_243.132950.txt"
file7="L2C01_RCP_-Ey_2012_05_25_10:48:07_+297.61_243.139984.txt"
file8="L2C01_RCP_+Ey_2012_05_25_10:49:44_+297.62_243.146011.txt"

#file3=file1
#file4=file1
#file5=file1
#file6=file1
#file7=file1
#file8=file1

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
