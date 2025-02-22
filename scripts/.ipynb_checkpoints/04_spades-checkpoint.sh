#!/bin/bash

set -eu

# ---------------- spades Assembly ----------------

# De novo genome assembly of short reads

# ---------------- Modules -----------------------

source /opt/conda/bin/activate /shared/team/conda/fredrickkebaso.climb-kenya/spades

# ---------------- Inputs/Outputs/Parameters ------------------

echo "Initializing variables..."

trimmed_1_read="$HOME/phage_training/results/trimgalore/ERR2093245_1_val_1.fq.gz"
trimmed_2_read="$HOME/phage_training/results/trimgalore/ERR2093245_2_val_2.fq.gz"
results="$HOME/phage_training/results/spades"       # Path to the output directory

# Create output directory

mkdir -p "${results}"

# Run spades

spades.py -o "${results}" -1 "${trimmed_1_read}" -2 "${trimmed_2_read}" --threads 42 --memory 200 -k 51 --cov-cutoff auto

echo Assembly completed successfully!!