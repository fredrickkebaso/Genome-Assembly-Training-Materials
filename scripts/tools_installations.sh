#!/bin/bash

# Activate and install Chopper
echo "Activating Chopper environment..."
source /opt/conda/bin/activate /shared/team/conda/fredrickkebaso.climb-kenya/chopper
echo "Installing Chopper..."
conda install -y -c bioconda chopper

# Activate and install BUSCO
echo "Activating BUSCO environment..."
source /opt/conda/bin/activate /shared/team/conda/fredrickkebaso.climb-kenya/busco
echo "Installing BUSCO..."
conda install -y -c bioconda busco

# Activate and install BWA
echo "Activating BWA environment..."
source /opt/conda/bin/activate /shared/team/conda/fredrickkebaso.climb-kenya/bwa
echo "Installing BWA..."
conda install -y -c bioconda bwa

# Activate and install Compleasm
echo "Activating Compleasm environment..."
source /opt/conda/bin/activate /shared/team/conda/fredrickkebaso.climb-kenya/compleasm
echo "Installing Compleasm..."
conda install -y -c bioconda compleasm

# Activate and install Cutadapt
echo "Activating Cutadapt environment..."
source /opt/conda/bin/activate /shared/team/conda/fredrickkebaso.climb-kenya/cutadapt
echo "Installing Cutadapt..."
conda install -y -c bioconda cutadapt

# Activate and install FCS Screen
echo "Activating FCS Screen environment..."
source /opt/conda/bin/activate /shared/team/conda/fredrickkebaso.climb-kenya/fcs_screen
echo "Installing NCBI-FCS-GX..."
conda install -y -c bioconda ncbi-fcs-gx

# Activate and install Flye
echo "Activating Flye environment..."
source /opt/conda/bin/activate /shared/team/conda/fredrickkebaso.climb-kenya/flye
echo "Installing Flye..."
conda install -y -c bioconda flye

# Activate and install Minimap2
echo "Activating Minimap2 environment..."
source /opt/conda/bin/activate /shared/team/conda/fredrickkebaso.climb-kenya/minimap2
echo "Installing Minimap2..."
conda install -y -c bioconda minimap2

# Activate and install MultiQC
echo "Activating MultiQC environment..."
source /opt/conda/bin/activate /shared/team/conda/fredrickkebaso.climb-kenya/multiqc
echo "Installing MultiQC..."
conda install -y -c bioconda multiqc

# Activate and install NanoQC
echo "Activating NanoQC environment..."
source /opt/conda/bin/activate /shared/team/conda/fredrickkebaso.climb-kenya/nanoqc
echo "Installing NanoQC..."
conda install -y -c bioconda nanoqc

# Activate and install Pilon
echo "Activating Pilon environment..."
source /opt/conda/bin/activate /shared/team/conda/fredrickkebaso.climb-kenya/pilon
echo "Installing Pilon..."
conda install -y -c bioconda pilon

# Activate and install SPAdes
echo "Activating SPAdes environment..."
source /opt/conda/bin/activate /shared/team/conda/fredrickkebaso.climb-kenya/spades
echo "Installing SPAdes..."
conda install -y -c bioconda spades

# Activate and install Trim Galore
echo "Activating Trim Galore environment..."
source /opt/conda/bin/activate /shared/team/conda/fredrickkebaso.climb-kenya/trimgalore
echo "Installing Trim Galore..."
conda install -y -c bioconda trim-galore
echo "Installing Cutadapt for Trim Galore..."
conda install -y -c bioconda cutadapt

echo "All installations completed successfully! 🎉"

