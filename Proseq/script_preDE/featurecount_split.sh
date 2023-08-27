#!/bin/bash

# Путь до исходного файла
input_file="/home/artem9/featureCounts_out/featureCounts_hisat2.txt"

# Имя первого файла
output_file="featureCounts_hisat2.txt"

# Вырезаем нужные колонки для первого файла
cut -f 1,7-14 "$input_file" > "$output_file"

