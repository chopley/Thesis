#!/bin/bash

/usr/bin/gnuplot plotBandpass.gnu
ps2pdf IFBandPass4_5GHzLO.ps
cp IFBandPass4_5GHzLO.pdf ../../../images/digitalReceiver/BandPassPlots/
