# VariantCallingPipeline-Germline-HC4
## CGR's Germline Variant Calling Pipeline with SnakeMake and GATK4


## Introduction
This Pipeline will serve as a CGR WGS/WES Germline Variant calling pipeline for external projects (non-production builds). Current plan is to have this pipeline take calibrated BAMs as input and have it generate a compressed and indexed VCF file as Final output.

## Outline of the workflow:
![Workflow - Scatter & Gather for WGS/WES](Figures/workflow_scatter_gather_v2.png)

![Workflow - Normal for Small genomic region](Figures/Workflow.png)

## Status

* Current Work:
  + Testing GATK 4
  + Testing Snakemake as an alternative for workflow management insted of Bash/AWK workflow thats being used currently for current Germline V3 Pipeline
  + Testing NEW HaplotypeCaller Workflow in GATK 4
  + Testing GenomicsDBIImport Module
  + Testing GenotypeGVCF module (differnt from GATK 3's GenotypeGVCF)
  
* Future Work:
  + Adding Scatter and Gather Workflow for GenomicsDBIImport (to optimize for WGS/WES analysis)
  + Adding Concatenation Workflow after GenotypeGVCF 
  + Adding Different Cores and SGE environment for different rules
  
## Features
* Pipeline-Automation-ErrorTrackingSpecific Features
  + "Protected" output VCF files
  + Directory Feature added to the Snakemake to check for timestamp
  + Flags to be added to monitor Pipeline Completion
  + Has the capacity to remember  when a job is terminated without comletion or without a warning (for e.g. - random cluster failures)
  + Stict Bash Mode (Error Handling). Non-Zero Status means failure
  + Can detect incomplete results' files
  
## Pipeline/HPC Failure Scenarios Tested
  1. Job failure by itself. (java error, memory issue, core dump, etc.)
    1.1 without output.
    1.2 with partial output.
  2. Job failed due to cluster issue. (job killed by the cluster)
    2.1 without output.
    2.2 with partial output.
  3. Job entered in to eqw/dr status (not easy to simulate, let’s be creative here).
  4. Job stuck in the “r” status (Snakemake will simply wait under this situation, which is expected and not very harmful, other than wasting computational time until the user realizes it)   
  5. Any other error scenario…?
  
  