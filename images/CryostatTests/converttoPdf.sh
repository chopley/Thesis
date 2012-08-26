#!/bin/bash
for i in $(ls *.eps);
do
	echo item: $i
       epstopdf $i	
done
