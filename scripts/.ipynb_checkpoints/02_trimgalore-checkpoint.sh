#!/bin/bash

set -eu

# Contamination check

# ---------------- Modules -----------------------
echo "Loading required modules/Activating required environment..."

source /opt/conda/bin/activate /shared/team/conda/fredrickkebaso.climb-kenya/trimgalore
echo "Environment activated !!!"

# ---------------- Requirements ------------------
echo "Creating output variables..."

# Initializing variables
reads="$HOME/shared-team/kebaso/phage_training/data"
results="$HOME/phage_training/results/trimgalore"
fastqc="$HOME/phage_training/results/fastqc-re-check"
multiqc="$HOME/phage_training/results/multiqc-re-check"
threads=8

# Create output and quality report directories
mkdir -p "${results}" "${fastqc}" "${multiqc}"

echo "Cleaning data using trim_galore"

# Run trim_galore for data cleaning
echo "Running trim_galore..."
trim_galore \
--paired "${reads}"/*_1.fastq.gz "${reads}"/*_2.fastq.gz \
--fastqc_args "--outdir ${fastqc}" \
--quality 28 \
--clip_R1 8 \
--clip_R2 3 \
--length 30 \
--cores "${threads}" \
--output_dir "${results}"

echo "Data cleaning with trim_galore completed successfully."

echo "Cleaning data done..."

# Deactivate previous conda environment
conda deactivate

# Activate MultiQC environment
source /opt/conda/bin/activate /shared/team/conda/fredrickkebaso.climb-kenya/multiqc

# Combine quality reports using MultiQC
echo "Combining quality reports using MultiQC..."
multiqc -o "${multiqc}" "${fastqc}"
echo "Quality reports combined successfully."

echo "Data cleaning completed successfully!"
