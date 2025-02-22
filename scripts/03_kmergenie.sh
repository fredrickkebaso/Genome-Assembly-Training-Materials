#!/bin/bash 

set -eu 

# ---------------------- Modules ------------------------------

echo "Loading required modules/Activating required environment..."

source /opt/conda/bin/activate /shared/team/conda/fredrickkebaso.climb-kenya/kmergenie

trimmed="$HOME/phage_training/results/trimgalore"
results="$HOME/phage_training/results/kmergenie"

#Determines kmer length
echo Determining Best Kmer length using KmerGenie v 1.7051

for file in `ls ${trimmed}/*.fq.gz`
do

kmergenie  $file --diploid -k 141 -t 24 -o ${results}

done;