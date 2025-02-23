#!/bin/bash

set -eu  # Exit immediately on error and treat unset variables as an error

#----------------------------- Mapping Statistics ---------------------------------

# Activate required environment for CheckV
echo "Activating CheckV environment..."

source /opt/conda/bin/activate /shared/team/conda/fredrickkebaso.climb-kenya/checkv

echo "Environment activated successfully!!"

#----------------------------- Define Input and Output Paths ---------------------

echo "Creating output variables..."

# Define the path to assembled genome contigs
genome_files="$HOME/phage_training/results/spades/contigs.fasta"

# Define the directory for CheckV output results
results="$HOME/phage_training/results/checkv"

#Add DB to PATH

export CHECKVDB="/home/jovyan/shared-team/kebaso/phage_training/data/databases/checkv-db-v1.5"
#----------------------------- Create Output Directory ---------------------------

# Ensure the CheckV results directory exists before running the analysis
echo "Creating CheckV results directory if it doesn't exist..."
mkdir -p "${results}"

#----------------------------- Run CheckV ----------------------------------------

echo "Running CheckV quality assessment on assembled contigs..."

checkv end_to_end "${genome_files}" "${results}" -t 24

# Display completion message
echo "CheckV analysis completed successfully! Results saved in: ${results}"
