#!/bin/bash

/usr/bin/gnuplot plotBandpass.gnu
ps2pdf IFBandPass4GHzLO.ps
cp IFBandPass4GHzLO.pdf ../../../images/digitalReceiver/BandPassPlots/
