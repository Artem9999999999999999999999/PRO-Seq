#!/bin/bash

input_file1="featureCounts_hisat2.txt"
output_file1="featureCounts_hisat2.csv"

input_file2="featureCounts_r6_53.txt"
output_file2="featureCounts_r6_53.csv"

# Удаление строк, начинающихся с символа '#'
sed -i '/^#/d' "$input_file1"

# Извлечение заголовков столбцов
header1=$(head -n 1 "$input_file1")

# Замена символов табуляции на запятые в заголовке
header_csv1=$(echo "$header1" | tr '\t' ',')

# Сохранение заголовка в выходной файл CSV
echo "$header_csv1" > "$output_file1"

# Извлечение данных и замена символов табуляции на запятые
tail -n +2 "$input_file1" | sed 's/\t/,/g' >> "$output_file1"

echo "Преобразование завершено. Результат сохранен в $output_file1."

# Удаление строк, начинающихся с символа '#'
sed -i '/^#/d' "$input_file2"

# Извлечение заголовков столбцов
header2=$(head -n 1 "$input_file2")

# Замена символов табуляции на запятые в заголовке
header_csv2=$(echo "$header2" | tr '\t' ',')

# Сохранение заголовка в выходной файл CSV
echo "$header_csv2" > "$output_file2"

# Извлечение данных и замена символов табуляции на запятые
tail -n +2 "$input_file2" | sed 's/\t/,/g' >> "$output_file2"

echo "Преобразование завершено. Результат сохранен в $output_file2."
