https://raw.githubusercontent.com/pdlfs/deltafs-umbrella/master/scripts/vpicexpt_gen.pl.in

Here's the ==DOIT for leveldb

std="--constraints haswell --experiment sc17bj --iterations 1 \
--overcommit enable --tag rc24-p-1h-ldb --tests deltafs \
--env XX_IGNORE_DIRS=fields:hydro:rundata:names \
--env XX_SH_THREE_HOP=0 \
--env XX_HG_PROTO=bmi+tcp \
--env XX_ALWAYS_SHUFFLE=0 \
--env XX_BYPASS_CH=1 \
--env XX_BG_PAUSE=1 \
--env XX_BG_SNGCOMP=1 \
--env XX_USE_LEVELDB=1 \
--env VPIC_EMU=preload-runner \
--env 'VPIC_EMU_OPTS=-t 1800' \
--env VPIC_PRE="

eval ../vpicexpt_gen.pl ${std} --run 1 --dw int .
eval ../vpicexpt_gen.pl ${std} --run 2 --dw int .

This time, run 1 only gets 32k particles per core!
