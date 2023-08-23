#!/bin/bash

# Установка путей и имен файлов
ref_dir="/home/komissarov_ae/manasyan_rnaseq/data/reference_data"
genome_file="dmel-all-chromosome-r6.52.fasta"
annotation_file="dmel-all-r6.52.gtf"
index_dir="/home/komissarov_ae/manasyan_rnaseq/data/genome_indices"

# Проверка наличия утилит STAR
command -v STAR >/dev/null 2>&1 || { echo >&2 "Утилита STAR не установлена. Установите ее перед запуском скрипта."; exit 1; }

# Создание директории для сохранения индексов, если она не существует
mkdir -p "$index_dir"

# Запуск индексации генома с помощью STAR
echo "Запуск индексации генома с использованием STAR..."
STAR --runThreadN 6 \
--runMode genomeGenerate \
--genomeDir "$index_dir" \
--genomeFastaFiles "$ref_dir/$genome_file" \
--sjdbGTFfile "$ref_dir/$annotation_file" \
--genomeSAindexNbases 11 \
--sjdbOverhang 99

echo "Индексация генома успешно завершена. Индексы сохранены в директории: $index_dir"
