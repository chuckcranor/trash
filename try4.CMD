#!/bin/sh
 
std="--constraints haswell --experiment sc17a --iterations 1 \
        --overcommit enable --tag try4 --tests deltafs"
 
../vpicexpt_gen.pl ${std} --run 1 --dw 250GiB .
../vpicexpt_gen.pl ${std} --run 2 --dw 500GiB . 
../vpicexpt_gen.pl ${std} --run 3 --dw 1000GiB . 
../vpicexpt_gen.pl ${std} --run 4 --dw 2000GiB .
../vpicexpt_gen.pl ${std} --run 5 --dw 3200GiB . 
../vpicexpt_gen.pl ${std} --run 6 --dw 6400GiB .
 
##../vpicexpt_gen.pl ${std} --run 7 --dw 12800GiB .
##../vpicexpt_gen.pl ${std} --run 8 --dw 25600GiB .
 
exit 0 

