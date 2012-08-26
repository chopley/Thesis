#!/bin/bash
while [ 1 ]
do
   python grabVnaTemperaturesAnritsyPower20May.py	
   python thermalPowerTestsNoControl.py	
   echo "Sleeping"
   sleep 5m
   echo "End Sleeping"
done
