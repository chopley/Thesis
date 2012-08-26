set terminal postscript enhanced color
set output "Tray2OutputPower.ps"
set datafile separator ","
set grid 
file1 ="Ch1Tray2_FullIFBandWithLNA2_Ch1Tray1InputPower.txt"
file2 ="Ch2Tray2_FullIFBandWithLNA2_Ch1Tray1InputPower.txt"
file3 ="Ch3Tray2_FullIFBandWithLNA2_Ch1Tray1InputPower.txt"
file4 ="Ch4Tray2_FullIFBandWithLNA2_Ch1Tray1InputPower.txt"
file5 ="Ch4Tray2_FullIFBandWithLNA2_Ch1Tray1InputPower_Measurement2.txt"
file6="Ch4Tray2_FullIFBandWithLNA2_Ch1Tray1InputPower_Measurement3_with10dBPadonThirdAmpOutput.txt"
file7="Ch4Tray2_FullIFBandWithLNA2_Ch1Tray1InputPower_Measurement4_with10dBPadonThirdAmpOutput_Removed10dBetweenTray1_Tray2_andAdded10dBbetweenBPF2andMixer.txt"
file8="Ch4Tray2_FullIFBandWithLNA2_Ch1Tray1InputPower_Measurement5_with10dBPadonThirdAmpOutput_Removed10dBetweenTray1_Tray2_andAdded3dBbetweenBPF2andMixer.txt"
file9="Ch3Tray2_FullIFBandWithLNA2_Ch1Tray1InputPower_Measurement2_Removed10dBetweenTray1_Tray2_andAdded3dBbetweenBPF2andMixer.txt"
file10="Ch2Tray2_FullIFBandWithLNA2_Ch1Tray1InputPower_Measurement2_Removed10dBetweenTray1_Tray2_andAdded3dBbetweenBPF2andMixer.txt"
file11="Ch1Tray2_FullIFBandWithLNA2_Ch1Tray1InputPower_Measurement2_Removed10dBetweenTray1_Tray2_andAdded3dBbetweenBPF2andMixer.txt"
file12="Ch4Tray2_FullIFBandWithLNA2_Ch1Tray1InputPower_Measurement2_Removed10dBetweenTray1_Tray2_andAdded3dBbetweenBPF2andMixer.txt"



set xlabel "Frequency [Ghz]"
set ylabel "Power [dBm]"
set title "Tray 2 Output bandwidth"
plot file1 using ($1):($2) ps 0.5 t "Ch1",file2 using ($1):($2) ps 0.5 t "Ch2",file3 using ($1):($2) ps 0.5 t "Ch3",file4 using ($1):($2) ps 0.5 t "Ch4"
set yrange[-50:-35]
plot file1 using ($1):($2) ps 0.5 t "Ch1",file2 using ($1):($2) ps 0.5 t "Ch2",file3 using ($1):($2) ps 0.5 t "Ch3",file4 using ($1):($2) ps 0.5 t "Ch4",file5 using ($1):($2) ps 0.5 t "Ch4New",file6 using ($1):($2) ps 0.5 t "Ch4NewExtra10dBPad Between Amp3 and BPF",file7 using ($1):($2) ps 0.5 t "Ch4 10dBPad between BPF and Mixer",file8 using ($1):($2) ps 0.5 t "Ch4 3dB Pad between BPF and Mixer",file9 using ($1):($2) ps 0.5 t "Ch3 Pad between BPF and Mixer",file10 using ($1):($2) ps 0.5 t "Ch3 Pad between BPF and Mixer",file11 using ($1):($2) ps 0.5 t "Ch1 Pad between BPF and Mixer",file12 using ($1):($2) ps 0.5 t "Ch3 Pad between BPF and Mixer"
set yrange[-40:-30]
plot file1 using ($1):($2) ps 0.5 t "Ch1",file2 using ($1):($2) ps 0.5 t "Ch2",file3 using ($1):($2) ps 0.5 t "Ch3",file4 using ($1):($2) ps 0.5 t "Ch4",file5 using ($1):($2) ps 0.5 t "Ch4New",file6 using ($1):($2) ps 0.5 t "Ch4NewExtra10dBPad Between Amp3 and BPF",file7 using ($1):($2) ps 0.5 t "Ch4 10dBPad between BPF and Mixer",file8 using ($1):($2) ps 0.5 t "Ch4 3dB Pad between BPF and Mixer",file9 using ($1):($2) ps 0.5 t "Ch3 Pad between BPF and Mixer",file10 using ($1):($2) ps 0.5 t "Ch2 Pad between BPF and Mixer",file11 using ($1):($2) ps 0.5 t "Ch1 Pad between BPF and Mixer",file12 using ($1):($2) ps 0.5 t "Ch4 Pad between BPF and Mixer"

