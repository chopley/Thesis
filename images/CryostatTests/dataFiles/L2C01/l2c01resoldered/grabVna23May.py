
# -*- coding: utf-8 -*-
import serial
import time
from pylab import *
# for file opening made easier
#from __future__ import with_statement
import numpy as np
import scipy as scipy
from pylab import load           # warning, the load() function of numpy will be shadowed
import os
import sys
from pylab import save

ReadoutPeriod=1
#f = open('Lakeshorelog.txt', 'a')
tempSensorPosition=4
sensorSensorPosition=0
#set these parameters appropriately
usbport='/dev/ttyGpib'

#ttle=sys.argv[1]
#Sparameters=(['S11','S21','S22','S12'])
Sparameters=(['S11'])
S11mag=1
S21mag=4
S22mag=7
S12mag=10

LowFreq=0
HighFreq=20
ylimLow=0
ylimHigh=70
#these are calculated from the values above- no need to change in normal circumstances#############################
S11pha=S11mag+1
S11GRP=S11mag+2
S21pha=S21mag+1
S21GRP=S21mag+2
S22pha=S22mag+1
S22GRP=S22mag+2
S12pha=S12mag+1
S12GRP=S12mag+2

#print sys.argv[1]

def getSERIALdata(device,str):
#	print str
#	print "GetSERIALdata\n"
	i=0
	a="%s\r" % (str)
	#device.write("++auto 0\r\n");	
	device.write(a)
#	device.write("++read eoi\r")
	a=''	
	b=device.read(5)
	while(b!=''):
		i=i+1
		a=a+b	
		#print "Getting more Data: ",i*1000," Bytes \n"
		b=device.read(5)
	print "Got Data: ~",i*5," Bytes \n"
	a=a.strip()
	a=a.rstrip('\r\n')
	#print 'printing readlinein GetSerialData\n'
	#print b
	#print a
	return a

def SERIALcommandNoQueryNoResponse(device,str):
	#some gpib interfaces do not reply at all to a command ie. the anritsu vna- to overcome this we first turn off the auto reply option on the prologix see pg 9 of the manual, then turn it on again after the command is given
	#print str
	device.write("++auto 0\r");	
	a="%s\r" % (str)
	device.write(a)
	device.write("++auto 1\r");	
	#time.sleep(3)	
	#a=device.readline()
	#a=a.strip()
	#a=a.rstrip('\r\n')
#	print "Sending Command ",a
	#return a

def SERIALcommandNoQuery(device,str):
	print str
	bstart = "++auto 0\r"
	bend = "++auto 1\r"
	device.write(bstart)
	time.sleep(0.2)
	a="%s\r" % (str)
	device.write(a)
	time.sleep(0.2)
	device.write(bend)
	time.sleep(0.2)
	#time.sleep(3)	
	#a=device.readline()
	#a=a.strip()
	#a=a.rstrip('\r\n')
#	print "Sending Command ",a
	#return a
def SERIALcommand(device,str):
	print str
	i=0
	a="%s\r" % (str)
	device.write(a)
		#device.write("++read eoi\r")
	a=''	
	b=device.read(5)
	while(b!=''):
		i=i+1
		a=a+b	
		#print "Getting more Data: ",i*1000," Bytes \n"
		b=device.read(5)
	a=a.strip()
	a=a.rstrip('\r\n')
	return a

def SERIALcommandNoQueryEOI(device,str):
	print str
	a="%s\r" % (str)
	device.write(a)
	#time.sleep(3)	
	#a=device.readline()
	#a=a.strip()
	#a=a.rstrip('\r\n')
#	print "Sending Command ",a
	#return a
def SERIALcommandEOI(device,str):
	print str
	i=0
	a="%s\r" % (str)
	device.write(a)
	device.write("++read eoi\r")
	a=''	
	b=device.read(5)
	while(b!=''):
		i=i+1
		a=a+b	
		#print "Getting more Data: ",i*1000," Bytes \n"
		b=device.read(5)
	a=a.strip()
	a=a.rstrip('\r\n')
	return a

def getSERIALdataEOI(device,str):
#	print str
#	print "GetSERIALdata\n"
	i=0
	a="%s\r" % (str)
	#device.write("++auto 0\r\n");	
	device.write(a)
	device.write("++read eoi\r")
	device.write("++read eoi\r")
	a=''	
	b=device.read(100)
	while(b!=''):
		print i
		i=i+1
		a=a+b	
		#print "Getting more Data: ",i*1000," Bytes \n"
		b=device.read(100)
	print "Got Data: ~",i*1," Bytes \n"
	a=a.strip()
	a=a.rstrip('\r\n')
	#print 'printing readlinein GetSerialData\n'
	#print b
	#print a
	return a


print size(sys.argv)
inputArgSize=size(sys.argv)
if inputArgSize==2:
	filenameArg=sys.argv[1]

try:
	vna=serial.Serial(usbport,115200)
	vna.timeout=1
	vna.rtscts = True
	vna.xonxoff = False
except:
	print "Failed to connect to the VNA"
	time.sleep(0.5)
#return

a=SERIALcommand(vna,"++ver")

a=SERIALcommandNoQueryEOI(vna,"++auto 0")
a=SERIALcommandNoQueryEOI(vna,"++mode 1")
a=SERIALcommandNoQueryEOI(vna,"++addr 6")


a=SERIALcommand(vna,"++ver")
time.sleep(2)
print 'here'
a=SERIALcommandNoQueryEOI(vna,"++eos 3")
a=SERIALcommandNoQueryEOI(vna,"++eoi 1")
a=SERIALcommand(vna,"++ver")

a=SERIALcommandNoQueryEOI(vna,"D14")
a=SERIALcommandNoQueryEOI(vna,"Ch1")
a=SERIALcommandNoQueryEOI(vna,"S11")
a=SERIALcommandNoQueryEOI(vna,"MPH")

a=SERIALcommandNoQueryEOI(vna,"Ch2")
a=SERIALcommandNoQueryEOI(vna,"S21")
a=SERIALcommandNoQueryEOI(vna,"MPH")

a=SERIALcommandNoQueryEOI(vna,"Ch3")
a=SERIALcommandNoQueryEOI(vna,"S12")
a=SERIALcommandNoQueryEOI(vna,"MPH")

a=SERIALcommandNoQueryEOI(vna,"Ch4")
a=SERIALcommandNoQueryEOI(vna,"S22")
a=SERIALcommandNoQueryEOI(vna,"MPH")

time.sleep(15)
freq=getSERIALdataEOI(vna,"OFV")
#a=SERIALcommandNoQueryEOI(vna,"MPH")
#a=SERIALcommandNoQueryEOI(vna,"RDA")
frequencies=freq.split(',')
freqNP=np.array(frequencies)

a=SERIALcommandNoQueryEOI(vna,"Ch1")
dat=getSERIALdataEOI(vna,"OFD")
data=dat.split(',')
dataNPS11=np.array(data)

a=SERIALcommandNoQueryEOI(vna,"Ch2")
dat=getSERIALdataEOI(vna,"OFD")
data=dat.split(',')
dataNPS21=np.array(data)

a=SERIALcommandNoQueryEOI(vna,"Ch4")
dat=getSERIALdataEOI(vna,"OFD")
data=dat.split(',')
dataNPS22=np.array(data)

a=SERIALcommandNoQueryEOI(vna,"++addr 11")
Lakeshore=SERIALcommandEOI(vna,"KRDG?") #get the Lakeshore Temps in Kelvin
vna.close()

try:
	vna=serial.Serial(usbport,115200)
	vna.timeout=1
	vna.rtscts = True
	vna.xonxoff = False
except:
	print "Failed to connect to the VNA"
	time.sleep(0.5)


a=SERIALcommandEOI(vna,"++addr 12")
cryocon=SERIALcommandEOI(vna,"INPUT? A?") #get the Lakeshore Temps in Kelvin

a=SERIALcommandNoQuery(vna,"++addr 13")
Power=SERIALcommandEOI(vna,"CWO 1") #get the Lakeshore Temps in Kelvin


timeHere = time.time()
timeLog= time.strftime("%Y_%m_%d_%H:%M:%S", time.localtime())
c="%s,%s,%s,%s,%s\n" %(timeHere,timeLog,Lakeshore,cryocon,Power)
print c
file=open("Temperatures.txt","a")
file.write(c)
file.close()	
LsThermal=Lakeshore.split(',')
if inputArgSize==1:
	filename="%s_%s_%s.txt" %(timeLog,LsThermal[1],cryocon)
elif inputArgSize==2:
	filename="%s_%s_%s_%s.txt" %(sys.argv[1],timeLog,LsThermal[1],cryocon)

file=open(filename,"w")
a="Anritsu VNA Frequency[GHz],S21[deg],S21[dB],S11[deg],S11[dB],S22[deg],S22[dB]\n"
file.write(a) #write the file header
file.write(c) #write the temperatures to the file header
for i in range(1,np.size(freqNP)):
	MAGS21=dataNPS21[2*i-1]
	PHAS21=dataNPS21[2*i]
	MAGS11=dataNPS11[2*i-1]
	PHAS11=dataNPS11[2*i]
	MAGS22=dataNPS22[2*i-1]
	PHAS22=dataNPS22[2*i]
	a="%f,%f,%f,%f,%f,%f,%f\n" %(float(freqNP[i])/1e9,float(MAGS21),float(PHAS21),float(MAGS11),float(PHAS11),float(MAGS22),float(PHAS22))
	file.write(a)
	print a

file.close()	


try:
	vna.close()
except:
	print 'Failed to close the vnaz\n'

#lakeshore.close()
