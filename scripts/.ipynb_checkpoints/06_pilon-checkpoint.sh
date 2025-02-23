#!/bin/bash
set -e  

echo "Activating conda environment for Pilon..."
source /opt/conda/bin/activate /shared/team/conda/fredrickkebaso.climb-kenya/pilon

basedir="$HOME/phage_training/results"
genome="${basedir}/spades/contigs.fasta"
bam_file="${basedir}/mapping/contigs_mapped.sorted.bam"
out_prefix=$(basename "${genome}" .fasta)
results="${basedir}/pilon"
jar_file="/shared/team/conda/fredrickkebaso.climb-kenya/pilon/share/pilon-1.24-0/pilon.jar"

echo "Creating Pilon output directory..."
mkdir -p "${results}"

echo "Running Pilon..."
java -Xmx200g -jar "${jar_file}" \
    --genome "${genome}" \
    --frags "${bam_file}" \
    --fix "bases" \
    --changes \
    --tracks \
    --output "${out_prefix}" \
    --outdir "${results}"

echo "Pilon has finished running."
