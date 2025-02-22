#!/bin/bash

set -eu

reads="/home/jovyan/shared-team/kebaso/phage_training/data"
trimmed="/home/jovyan/phage_training/results/trimgalore"
fastqc_recheck="/home/jovyan/phage_training/results/fastqc-re-check"
multiqc="/home/jovyan/phage_training/results/multiqc"

threads=8

mkdir -p ${fastqc_recheck} ${trimmed}

echo "Cleaning data using trim_galore"

# Run trim_galore for data cleaning
echo "Running trim_galore..."
trim_galore \
--paired "${reads}"/*_1.fastq.gz "${reads}"/*_2.fastq.gz \
--fastqc_args "--outdir ${fastqc_recheck}" \
--quality 28 \
--length 30 \
--cores "${threads}" \
--output_dir "${trimmed}"

echo "Data cleaning with trim_galore completed successfully."

echo Cleaning data done...

# Combine quality reports using MultiQC

source /opt/conda/bin/activate /shared/team/conda/fredrickkebaso.climb-kenya/multiqc

echo "Combining quality reports using MultiQC..."

multiqc -o "${multiqc}" "${fastqc_recheck}"

echo "Quality reports combined successfully."

echo "Data cleaning completed successfully!"