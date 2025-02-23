#!/bin/bash

set -eu  # Exit immediately on error and treat unset variables as an error
echo "Activating conda environment for FastQC..."

# Activate the conda environment containing FastQC

source /opt/conda/bin/activate /shared/team/conda/fredrickkebaso.climb-kenya/spades

echo "Starting SPAdes assembly pipeline..."

echo "Initializing variables..."

# Define the output directory for SPAdes results
results="$HOME/phage_training/results/spades" 

# Define paths to trimmed sequencing reads (forward and reverse)
forward_read="$HOME/phage_training/results/trimgalore/ERR2093245_1_val_1.fq.gz" 
reverse_read="$HOME/phage_training/results/trimgalore/ERR2093245_2_val_2.fq.gz" 

# Create the output directory if it does not exist
echo "Creating output directory if not present..."
mkdir -p "${results}"

# Run SPAdes with specified parameters
echo "Running SPAdes assembly..."

spades.py -o "${results}" -1 "${forward_read}" -2 "${reverse_read}" --threads 48 --memory 200 -k 51 --cov-cutoff auto

# Display completion message
echo "Assembly completed successfully!!"
