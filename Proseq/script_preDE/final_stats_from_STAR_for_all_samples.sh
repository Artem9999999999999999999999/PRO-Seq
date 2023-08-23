#!/bin/bash

input_folder="/home/komissarov_ae/manasyan_rnaseq/data/mapping_results_ch/"
output_file="/home/komissarov_ae/manasyan_rnaseq/data/mapping_results_ch/final_stats_for_all_samples.txt"

> "$output_file"

# Проходимся по всем файлам формата Log.final.out в заданной папке
for file in "$input_folder"/*Log.final.out; do
    sample_name=$(basename "$file" | cut -d'_' -f4-7) # Получаем имя образца из имени файла

    # Записываем название образца в выходной файл
    echo "Название семпла: $sample_name" >> "$output_file"
    echo "                          $(grep -m 1 "Number of input reads" "$file")" >> "$output_file"
    echo "                      $(grep -m 1 "Average input read length" "$file")" >> "$output_file"
    echo "UNIQUE READS:" >> "$output_file"
    grep -A 4 "UNIQUE READS" "$file" | tail -n 4 >> "$output_file"
    echo "MULTI-MAPPING READS:" >> "$output_file"
    grep -A 2 "MULTI-MAPPING READS" "$file" | tail -n 2 >> "$output_file"
    echo "UNMAPPED READS:" >> "$output_file"
    grep -A 4 "UNMAPPED READS" "$file" | tail -n 4 >> "$output_file"
    echo "CHIMERIC READS:" >> "$output_file"
    grep -A 2 "CHIMERIC READS" "$file" | tail -n 2 >> "$output_file"

    echo "" >> "$output_file"
done

echo "Статистика сохранена в $output_file"
