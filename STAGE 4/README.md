# NGS Analysis Pipeline
## Description
This repository contains a simple Next Generation Sequencing (NGS) analysis pipeline implemented using various bioinformatics tools. The pipeline performs quality control, trimming, genome mapping, and variant calling on raw sequencing data.

## Table of Contents
1. [Installation](#installation)
2. [Usage](#usage)
3. [Datasets](#datasets)
4. [Tools](#tools)
5. [Additional Resources](#AdditionalResources)
   

## Installation
To set up the required tools for the NGS analysis pipeline, run the following command:

```bash
bash setup.sh
```

## Usage
To execute the pipeline, run the following script:
```bash
bash script.sh
```
Ensure all required tools and dependencies are installed by running the
[script.sh](https://github.com/aloyetunde/-hackbio-cancer-intership-/blob/main/script.sh) script. This script will install tools like FastQC, FastP, BWA, samtools and bcftools if they aren't already installed:

 ### Run the Pipeline
You can run the pipeline with the script.sh script.

Required Inputs:

Reference Genome: A .fasta file (e.g., reference.fasta)

Forward Strand: A .fastq.gz file containing the forward strand reads (e.g., ACBarrie_R1.fastq.gz)

Reverse Strand: A .fastq.gz file containing the reverse strand reads (e.g., ACBarrie_R2.fastq.gz)

 ### Pipeline Workflow
The pipeline performs the following steps:

1. Quality Control (FastQC): Analyzes the quality of the raw sequencing reads.
2. Trimming (FastP): Trims the raw reads to remove adapters and low-quality bases.
3. Genome Mapping (BWA): Maps the trimmed reads to the reference genome.
4. Compression, viewing and sorting of sam files (samtools) : Compresses sam files to smaller files in the bam format. The sam and bam files can also be viewed and sorted.
5. Variant Calling (bcftools/freebayes): Identifies variants (SNPs and indels) based on the mapped reads.

 ### Output Files
FastQC Reports: Quality control reports for both forward and reverse reads.

Trimmed Reads: Files with trimmed reads for both forward and reverse strands.

BAM/SAM Files: Aligned reads in BAM or SAM format.

VCF Files: Variant call format file containing the identified variants.

## Datasets
Links to all input files referred to in the script are provided in [dataset](https://github.com/aloyetunde/-hackbio-cancer-intership-/blob/main/STAGE%204/DATA/DATASET.md).

## Tools
FastQC

FastP

BWA

samtools

bcftools/freebayes

Refer to [requirements.txt](https://github.com/aloyetunde/-hackbio-cancer-intership-/blob/main/requirements.txt) for a complete list of dependencies.

## Additional Resources
1. [Introduction to Whole Genome Sequencing and Variant Calling](https://www.youtube.com/watch?v=NxRECdxKP40)

2. [Raw Sequence to Variant Calling Pipeline with FreeBayes](https://www.youtube.com/watch?v=gmJ6LteXAq0)

3. [Galaxy Tutorial for Variant Calling](https://training.galaxyproject.org/training-material/topics/data-science/tutorials/bash-variant-calling/tutorial.html.)

4. [Using For loops in BASh](https://www.youtube.com/watch?v=T7hVOiTsSUU)

5. [HackBio Video for loops for multiple datasets using FastP](https://youtu.be/HNE0VPZK8yM.)
