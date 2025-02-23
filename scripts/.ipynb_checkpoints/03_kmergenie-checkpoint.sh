#!/bin/bash  

# ---------------------- Modules ------------------------------  

# Display a message indicating that the required environment is being activated  
echo "Loading required modules/Activating required environment..."  

# Activate the conda environment containing KmerGenie  
source /opt/conda/bin/activate /shared/team/conda/fredrickkebaso.climb-kenya/kmergenie  

# ---------------------- Variables ------------------------------  

# Define the directory containing raw sequencing read files  
reads="$HOME/shared-team/kebaso/phage_training/data"  

# Define the directory where KmerGenie results will be stored  
results="$HOME/phage_training/results/kmer-genie"  

# Ensure the output directory exists  
mkdir -p "${results}"  

# ---------------------- KmerGenie Analysis ------------------------------  

# Display a message before running KmerGenie  
echo "Determining Best K-mer length using KmerGenie v1.7051..."  

# Loop through all FASTQ files and run KmerGenie on each  
for file in "${reads}"/*.fq.gz; do  
    kmergenie "$file" -k 141 -t 24 -o "${results}"  
done  

# Display a completion message  
echo "KmerGenie analysis completed. Results stored in ${results}."  
