#!/bin/bash

set -eu 

#-----------------------------mapping_statistics---------------------------------

# Activate required environment
echo "Activating env......"

source /opt/conda/bin/activate /shared/team/conda/fredrickkebaso.climb-kenya/mapping

echo Environment activated successfully!!
echo "Creating output variables..."

# Define input files 
genome_files=("$HOME/phage_training/results/spades/contigs.fasta")
num_threads=24

# Define paths to trimmed sequencing reads (forward and reverse)
forward_read="$HOME/phage_training/results/trimgalore/ERR2093245_1_val_1.fq.gz" 
reverse_read="$HOME/phage_training/results/trimgalore/ERR2093245_2_val_2.fq.gz"
results="$HOME/phage_training/results/mapping"

# Create mapping_stats directory if it doesn't exist
echo "Creating mapping_stats directory..."

mkdir -p "${results}"

# Index the genomes
echo "Indexing the genomes..."
for file in "${genome_files[@]}"; do
    echo "Indexing '${file}'..."
    bwa index "${file}"
done

# Map reads to indexed assembly
echo "Mapping reads to indexed assembly..."
for file in "${genome_files[@]}"; do
    echo "Mapping '${file}'..."
    file_name=$(basename "${file%.*}")
    echo "Mapping reads to ${file_name} assembly..."
    bwa mem -t "${num_threads}" "${file}" "${forward_read}" "${reverse_read}" > "${results}/${file_name}_mapped.sam"

    echo Converting to bam, sorting and extracting mapping statistis....

    samtools view -@ "${num_threads}" -bS "${results}/${file_name}_mapped.sam" | samtools sort -o "${results}/${file_name}_mapped.sorted.bam" -
    samtools flagstat "${results}/${file_name}_mapped.sorted.bam" > "${results}/${file_name}_mapping_stats.txt"
    samtools coverage "${results}/${file_name}_mapped.sorted.bam" > "${results}/${file_name}_coverage_stats.txt"
    samtools depth "${results}/${file_name}_mapped.sorted.bam" > "${results}/${file_name}_depth_stats.txt"

done

# Index the sorted BAM files
echo "Indexing sorted BAM files..."
for sorted_bam_file in "${results}"/*.sorted.bam; do
    echo "Indexing '${sorted_bam_file}'..."
    samtools index "${sorted_bam_file}"
done

# Echo completion message

echo "Mapping, indexing and sorting completed successfully!"