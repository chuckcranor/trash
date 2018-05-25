#!/bin/sh

std="--constraints haswell --experiment sc17z --iterations 2 --core-spec 
1 \
--overcommit enable --tag rc9-try2 --tests baseline,deltafs \
--env XX_IGNORE_DIRS=fields:hydro:rundata \
--env XX_HG_INTERVAL=1000 \
--env XX_RPC_SELF_FORWARD=1 \
--env XX_BYPASS_CH=1 \
--env XX_SKIP_SMP=0 \
--env XX_SMP_TH=32 \
--env XX_RR_BG=5"

../vpicexpt_gen.pl ${std} --run 1 --dw int .
../vpicexpt_gen.pl ${std} --run 2 --dw int .
../vpicexpt_gen.pl ${std} --run 3 --dw int .
../vpicexpt_gen.pl ${std} --run 4 --dw int .
../vpicexpt_gen.pl ${std} --run 5 --dw int .
../vpicexpt_gen.pl ${std} --run 6 --dw int .
../vpicexpt_gen.pl ${std} --run 7 --dw int .
../vpicexpt_gen.pl ${std} --run 8 --dw int .

