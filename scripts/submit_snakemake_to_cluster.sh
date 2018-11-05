
#!/bin/bash
#$ -S /bin/sh
#$ -j y

configFile=$1
if [ $# -eq 0 ]; then
    echo "Config File is required. Please specify config file with full path"
    exit 1
fi

source /etc/profile.d/modules.sh
module load python3/3.5.1 sge

maxJobs=10
queue=seq-calling.q

scriptDir=/home/sumans/Project_Git_Repos/variantCallingPipelineGermlineHC4/scripts
logDir=/home/sumans/Project_Git_Repos/variantCallingPipelineGermlineHC4/logs/

mkdir -p $logDir 2>/dev/null


ds=`date "+%Y-%m-%d_%H%M%S"`


#conf=$configFile snakemake -s ${scriptDir}/Snakefile_germline_variant_calling_HC --cluster "qsub -V -q $queue -j y -o $logDir" --jobs $maxJobs --latency-wait 300 &> $logDir"log.out."$ds



conf=$configFile snakemake -s ${scriptDir}/Snakefile_germline_variant_calling_HC --rerun-incomplete --cluster "qsub -q $queue -pe by_node 5 -o $logDir -e $logDir" --jobs $maxJobs --latency-wait 300 &> $logDir"log.out."$ds

#conf=$configFile snakemake -s ${scriptDir}/Snakefile_germline_variant_calling_HC --unlock 