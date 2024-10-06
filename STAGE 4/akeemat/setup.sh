    1  ### Install conda ###
    2
    3  # Download miniconda
    4  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    5
    6  # Run the installer
    7  bash Miniconda3-latest-Linux-x86_64.sh
    8
    9  # Activate conda
   10  source ~/.bashrc
   11
   12  # Initialize conda environment
   13  ~/miniconda3/bin/conda init
   14
   15  # Verify the installation
   16  conda --version
   17
   18  # Install fastqc
   19  sudo apt install fastqc
   20
   21  # Install fastp
   22  conda install -c bioconda fastp
   23
   24  # Install bbtools
   25  sudo apt install bbtools
   26
   27  # Install bwa
   28  conda install bwa
   29
   30  # Install samtools
   31  sudo apt install samtools
   32
   33  # Install bcftools
   34  conda install bcftools
   35
   36  # Install freebayes
   37  conda install freebayes
