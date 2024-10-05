#!/bin/bash

# Activate the conda environment
source activate ngs_pipeline

# Create directories
mkdir -p data results/{fastqc,fastp,bwa,variants}

# Change to data directory
cd data

# Download the reference genome
wget -O reference.fasta "https://raw.githubusercontent.com/josoga2/yt-dataset/main/dataset/raw_reads/reference.fasta"

# Index the reference genome
bwa index reference.fasta

# List of samples
samples=("ACBarrie" "Alsen" "Baxter" "Chara" "Drysdale")

# Download datasets and process each sample
for sample in "${samples[@]}"
do
    echo "Processing $sample..."

    # Download reads
    wget -O ${sample}_R1.fastq.gz "https://github.com/josoga2/yt-dataset/raw/main/dataset/raw_reads/${sample}_R1.fastq.gz"
    wget -O ${sample}_R2.fastq.gz "https://github.com/josoga2/yt-dataset/raw/main/dataset/raw_reads/${sample}_R2.fastq.gz"

    # Quality Control with FastQC
    fastqc ${sample}_R1.fastq.gz ${sample}_R2.fastq.gz -o ../results/fastqc

    # Trimming with FastP
    fastp -i ${sample}_R1.fastq.gz -I ${sample}_R2.fastq.gz \
          -o ${sample}_R1_trimmed.fastq.gz -O ${sample}_R2_trimmed.fastq.gz \
          -h ../results/fastp/${sample}_fastp.html -j ../results/fastp/${sample}_fastp.json

    # Mapping with BWA
    bwa mem reference.fasta ${sample}_R1_trimmed.fastq.gz ${sample}_R2_trimmed.fastq.gz > ../results/bwa/${sample}.sam

    # Convert SAM to BAM, sort and index
    samtools view -bS ../results/bwa/${sample}.sam | samtools sort -o ../results/bwa/${sample}_sorted.bam
    samtools index ../results/bwa/${sample}_sorted.bam

    # Variant Calling with FreeBayes
    freebayes -f reference.fasta ../results/bwa/${sample}_sorted.bam > ../results/variants/${sample}_variants.vcf

    echo "$sample processing completed."
done

echo "Pipeline execution completed."
