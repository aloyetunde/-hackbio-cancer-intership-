# Create a conda environment
conda create -n ngs_pipeline -y

# Activate the environment
source activate ngs_pipeline

# Install required tools
conda install -c bioconda fastqc fastp bwa samtools bcftools freebayes -y

echo "All tools installed successfully in the ngs_pipeline environment."
