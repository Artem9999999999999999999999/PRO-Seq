#!/bin/bash

# Установка путей и имен директорий
index_dir="/home/komissarov_ae/manasyan_rnaseq/data/genome_indices"
output_dir="/home/komissarov_ae/manasyan_rnaseq/data/mapping_results"
input_dir1="/home/komissarov_ae/manasyan_rnaseq/data/chd1"
input_dir2="/home/komissarov_ae/manasyan_rnaseq/data/s2"

# Проверка наличия утилит STAR
command -v STAR >/dev/null 2>&1 || { echo >&2 "Утилита STAR не установлена. Установите ее перед запуском скрипта."; exit 1; }

# Создание директории для сохранения результатов картирования, если она не существует
mkdir -p "$output_dir"

# Функция для картирования прочтений
function map_reads() {
    input_dir="$1"
    for read_file in "$input_dir"/*; do
        # Получаем имя файла без расширения
        filename=$(basename -- "$read_file")
        filename="${filename%.*}"
        # Запуск STAR для картирования прочтений
        echo "Запуск STAR для картирования файла $read_file..."
        STAR --runThreadN 12 \
             --genomeDir "$index_dir" \
             --readFilesIn "$read_file" \
             --outFileNamePrefix "$output_dir/mapped_${filename}_" \
             --outSAMtype BAM SortedByCoordinate \
             --twopassMode Basic
        echo "Картирование файла $read_file успешно завершено."
    done
}

# Вызов функции для обработки файлов из каждой директории
map_reads "$input_dir1"
map_reads "$input_dir2"

echo "Все прочтения успешно картированы. Результаты сохранены в директории: $output_dir"
