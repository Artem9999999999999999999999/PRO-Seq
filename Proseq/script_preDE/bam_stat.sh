#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <path_to_directory>"
    exit 1
fi

directory="$1"
output_file="/home/komissarov_ae/manasyan_rnaseq/data/alignment_and_coverage_results.txt"

echo "Directory: $directory" > "$output_file"
echo "-------------------------------" >> "$output_file"

for bam_file in "$directory"/*.bam; do
    echo "Processing $bam_file"
    echo "Results for $bam_file:" >> "$output_file"
    echo "------------------------" >> "$output_file"

    samtools stats "$bam_file" >> "$output_file"
    echo -e "\n" >> "$output_file"
done

echo "All results written to $output_file"
