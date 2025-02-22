set -eu

for env in trimgalore chopper nanoqc cutadapt multiqc spades flye minimap2 bwa pilon fcs_screen compleasm busco; do
    conda create -y -n $env
done

echo Done

