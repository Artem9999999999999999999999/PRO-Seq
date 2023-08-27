#!/bin/bash

# Установка путей и имен директорий
index_dir="/home/komissarov_ae/manasyan_rnaseq/data/dm6_genome_hisat2/genome"
output_dir="/home/komissarov_ae/manasyan_rnaseq/data/bams_hisat2"
input_dir1="/home/komissarov_ae/manasyan_rnaseq/data/data_proseq/chd1"
input_dir2="/home/komissarov_ae/manasyan_rnaseq/data/data_proseq/s2"

# Создание директории для сохранения результатов картирования, если она не существует
mkdir -p "$output_dir"

# Функция для картирования прочтений
function map_reads() {
    input_dir="$1"
    for read_file in "$input_dir"/*; do
        # Получаем имя файла без расширения
        filename=$(basename -- "$read_file")
        filename="${filename%.*}"
        # Запуск Hisat2 для картирования прочтений
        echo "Запуск Hisat2 для картирования файла $read_file..."
        hisat2 -q -x "$index_dir" -U "$read_file" | samtools sort -o "$output_dir/mapped_${filename}_sorted.bam"

        echo "Картирование файла $read_file успешно завершено."
    done
}

# Вызов функции для обработки файлов из каждой директории
map_reads "$input_dir1"
map_reads "$input_dir2"

echo "Все прочтения успешно картированы. Результаты сохранены в директории: $output_dir"
