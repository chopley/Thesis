
# -*- coding: utf-8 -*-
import serial
#import time
from pylab import *
# for file opening made easier
#from __future__ import with_statement
import numpy as np
#import scipy as scipy
#from pylab import load           # warning, the load() function of numpy will be shadowed
import os
#from pylab import save

#set these parameters appropriately
usbport='/dev/ttyUSB0'
gpibAddress=2
###########################
filename=sys.argv[1]
try:
	os.mkdir(ttle,0755)
except:
	print 'Already have directory'


def getSERIALdata(device,str):
#	print str
#	print "GetSERIALdata\n"
	i=0
	a="%s\r" % (str)
	#device.write("++auto 0\r\n");	
	device.write(a)
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

def SERIALcommandNoQuery(device,str):
	a="%s\r" % (str)
	device.write(a)
	
	
def SERIALcommand(device,str):
	print str
	a="%s\r" % (str)
	device.write(a)
	a=''	
	a=device.readline()
	a=a.strip()
	a=a.rstrip('\r\n')
	return a



data = ""
i=1
while i==1:
  try:
	 
	  while i==1:
		
		  
		  try:
		    gpib=serial.Serial(usbport,115200)
		    gpib.timeout=0.5
		    gpib.rtscts = True
		    gpib.xonxoff = False
		    print 'setup gpib'
		  except:
		    print "Failed to connect to the VNA"
#		    time.sleep(0.5)
		    #return
		  
		  a=SERIALcommandNoQuery(gpib,"++mode 1")
		  a=SERIALcommandNoQuery(gpib,"++auto 1")
		  a=SERIALcommand(gpib,"++ver")
		  print a
		  addressline="++addr " +str(gpibAddress)
		  print addressline
		  a=SERIALcommandNoQuery(gpib,addressline)
		  print 'herhe'
		  a=SERIALcommandNoQuery(gpib,"++eos 3")
		  print 'herhe'
		  a=SERIALcommandNoQuery(gpib,"++ifc")
		  print 'herhe'
		  a=SERIALcommandNoQuery(gpib,"++eoi 1")
		  Sp = SERIALcommand(gpib,"*IDN?")
		  print Sp
		  startFreq = SERIALcommand(gpib,"FA?")
		  stopFreq = SERIALcommand(gpib,"FB?")
 		  print 'StartFreq'
  		  print int(startFreq)
		  data = SERIALcommand(gpib,"XMA?0,501")
	          datasplit=data.split(',')
		  d=np.array(datasplit)
	          freq=np.linspace(int(startFreq)/1e9,int(stopFreq)/1e9,501)
		  #print freq
		  fileString=filename
		  file=open(fileString,"w")
		  for i in range(501):
			a= '%s,%s\n' %(freq[i],float(d[i])/100)
			file.write(a)
			print a
			#rint freq[i],int(d[i])/100
				
   		 
		  file.close()	
		  gpib.close()
		  #time.sleep(1) 
	 
		  

  except:
	  print "Failed to send!"
#	  time.sleep(0.5)
	  gpib.close
	  pass
	#return

#lakeshore.close()
