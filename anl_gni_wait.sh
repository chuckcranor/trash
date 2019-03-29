#!/bin/bash -eu
#COBALT --jobname mercury-runner-scw
#COBALT -t 59
#COBALT -n 2
#COBALT --mode script
#COBALT --output %HOME%/joblogs/mercury-runner-$COBALT_JOBID.out
#COBALT --error %HOME%/joblogs/mercury-runner-$COBALT_JOBID.out
#COBALT --debuglog %HOME%/joblogs/mercury-runner-$COBALT_JOBID.clog
#COBALT -A radix-io
#COBALT -q debug-flat-quad

subnet=""

# uncomment to change the default values below

###export MR_TWOWAY=1
###export MR_LOCAL=1
###export MR_POLLSPIN=1

###export MR_NPROTOS="bmi+tcp"
###export MR_NSIZES="64 1024 4096 32768 65536"
###export MR_NLIMITS="1 2 4 8 16"
###export MR_NREPEATS=2
###export MR_NRPCS=100000
export MR_NTIMEOUT=300

# !!! SC19 settings !!!
export MR_NPROTOS="ofi+gni"
export MR_NSIZES="8 16 256 1024 2048 4096 8192 16384 32768 65536"
export MR_NLIMITS="1"
export MR_NREPEATS=3

###export MR_BPROTOS="bmi+tcp"
export MR_BPROTOS="none"
###export MR_BSIZES="2m"
###export MR_BLIMITS="1 2"
###export MR_BREPEATS=2
###export MR_BRPCS=10000
###export MR_BTIMEOUT=120

export DEFAULT_MPIOPTS="-cc none"

/home/ccranor/dev-th/scripts/run_combo_mercury_runner.sh $subnet

exit 0
