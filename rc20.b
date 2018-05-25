#!/bin/sh
std="--constraints haswell --experiment sc17br --iterations 1 \
--overcommit enable --tag rc20-p-1h-bmi-noworker --tests deltafs 
--skipreads
\
--env XX_IGNORE_DIRS=fields:hydro:rundata:names \
--env XX_SH_THREE_HOP=0 \
--env XX_HG_PROTO=bmi+tcp \
--env XX_ALWAYS_SHUFFLE=0 \
--env XX_RPC_USE_WORKER=0 \
--env XX_BYPASS_CH=1 \
--env XX_BYPASS_WRITE=1 \
--env XX_SKIP_SAMP=1 \
--env VPIC_EMU=preload-runner \
--env 'VPIC_EMU_OPTS=-t 1800' \
--env VPIC_PRE="

eval ../vpicexpt_gen.pl ${std} --run 2 --dw off .

#This is for the bmi+tcp run.

#!/bin/sh
std="--constraints haswell --experiment sc17br --iterations 1 \
--overcommit enable --tag rc20-p-1h-gni-noworker --tests deltafs 
--skipreads
\
--env XX_IGNORE_DIRS=fields:hydro:rundata:names \
--env XX_SH_THREE_HOP=0 \
--env XX_HG_PROTO=ofi+gni \
--env XX_ALWAYS_SHUFFLE=0 \
--env XX_RPC_USE_WORKER=0 \
--env XX_BYPASS_CH=1 \
--env XX_BYPASS_WRITE=1 \
--env XX_SKIP_SAMP=1 \
--env VPIC_EMU=preload-runner \
--env 'VPIC_EMU_OPTS=-t 1800' \
--env VPIC_PRE="

eval ../vpicexpt_gen.pl ${std} --run 2 --dw off .

#This is for the ofi+gni run.

