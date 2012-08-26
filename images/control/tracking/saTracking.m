% function for plotting the control response of the SA dish

d=pipe_readSa('23-Aug-2010:13:53:20','23-Aug-2010:18:53:20')

close all
plot([1:length(d.antenna0.servo.fast_az_pos)]./5-3095,d.antenna0.servo.fast_az_pos+d.antenna0.servo.fast_az_err,'r')
hold
plot([1:length(d.antenna0.servo.fast_az_pos)]./5-3095,d.antenna0.servo.fast_az_pos,'*','MarkerSize',2)


title('Azimuth Response','FontSize',16);
xlabel('Time [s]','FontSize',14)
ylabel('Position [deg]','FontSize',12)
xlim([0 60])
ylim([-230 -130])
legend('Command Position','Antenna Position')
grid on
print -dpng azimuth



figure

plot([1:length(d.antenna0.servo.fast_el_pos)]./5-3095,d.antenna0.servo.fast_el_pos+d.antenna0.servo.fast_el_err,'r')
hold
plot([1:length(d.antenna0.servo.fast_el_pos)]./5-3095,d.antenna0.servo.fast_el_pos,'*','MarkerSize',2)

title('Elevation Response','FontSize',16);
xlabel('Time [s]','FontSize',14)
ylabel('Position [deg]','FontSize',12)
xlim([0 60])
legend('Command Position','Antenna Position')
grid on
print -dpng elevation