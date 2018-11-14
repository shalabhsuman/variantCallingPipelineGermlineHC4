# VariantCallingPipeline-Germline-HC4
## CGR's Latest Version of Germline Variant Calling Pipeline with SnakeMake and GATK4 (IN PROGRESS..)

### The Workflow will serve as an CGR WGS/WES Variant calling pipeline for external projects (non-production builds) and will take calibrated BAMs as input and will generate a compressed and indexed VCF file as output.

## Outline of the workflow:

![Workflow - Phase 1](Figures/Workflow.png)

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
  