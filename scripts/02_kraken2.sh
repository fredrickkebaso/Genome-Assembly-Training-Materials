
# Contaminated reads removal will not be done for today because the databses are huge and may take sometime to prepeare (Explian the command below and what they do), however i incorporate fcs screen to compesate for this step.


echo "Running Kraken2..."

kraken2 \
--db "${database}" \
--threads "${threads}" --use-names \
--report "${results}/kraken_report_2.txt" \
--classified-out "${results}/${species}_classified_reads#.fq" \
--unclassified-out "${results}/${species}_unclassified_reads#.fq" \
--minimum-hit-groups 5 \
--confidence 0.7 \
--paired "${forward_read}" "${reverse_read}" 

echo "Kraken2 execution completed."

echo compress the outputs....

pigz ${results}/${species}*.fq

echo Read compression completed successfully !!!