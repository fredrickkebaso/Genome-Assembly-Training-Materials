#!/bin/bash

# Exit immediately if a command exits with a non-zero status and treat unset variables as an error
set -eu

# Display message indicating conda environment activation
echo "Activating conda environment for FastQC..."

# Activate the conda environment containing FastQC
source /opt/conda/bin/activate /shared/team/conda/fredrickkebaso.climb-kenya/fastqc

# Display a message confirming environment activation
echo "Conda environment activated!"

# Set the base directory where data and results are stored
basedir="$HOME/phage_training"

# Define the directory containing raw sequencing reads
reads="$HOME/shared-team/kebaso/phage_training/data"

# Define the output directory for FastQC results
results="${basedir}/results/fastqc"

# Ensure the output directory exists before running FastQC
mkdir -p "${results}"

# Define the number of threads for FastQC processing (set manually if undefined)
threads=4  # Adjust this value based on available system resources

# Display message indicating FastQC execution
echo "Running FastQC on raw reads using ${threads} threads..."

# Run FastQC on the input reads and save results in the specified directory
fastqc "${reads}"/*.gz -t "${threads}" -o "${results}"

# Display completion message
echo "FastQC analysis completed. Results saved in ${results}"
