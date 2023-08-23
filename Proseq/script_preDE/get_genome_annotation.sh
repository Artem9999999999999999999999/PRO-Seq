#!/bin/bash


# Установка путей и имен файлов
genome_dir="/home/komissarov_ae/manasyan_rnaseq/data/reference_data"    # Укажите путь к директории для сохранения генома
genome_file="dmel-all-chromosome-r6.52.fasta"                           # Имя файла для генома
annotation_file="dmel-all-r6.52.gtf"                                    # Имя файла для аннотации

# Проверка наличия утилит wget и gunzip
command -v wget >/dev/null 2>&1 || { echo >&2 "Утилита wget не установлена. Установите ее перед запуском скрипта."; exit 1; }
command -v gunzip >/dev/null 2>&1 || { echo >&2 "Утилита gunzip не установлена. Установите ее перед запуском скрипта."; exit 1; }

# Скачивание генома
echo "Скачивание генома Drosophila melanogaster..."
wget -P "$genome_dir" https://ftp.flybase.net/genomes/Drosophila_melanogaster/current/fasta/dmel-all-chromosome-r6.52.fasta.gz

# Распаковка генома
echo "Распаковка генома..."
gunzip -c "$genome_dir/dmel-all-chromosome-r6.52.fasta.gz" > "$genome_dir/$genome_file"

# Удаление временных файлов
echo "Удаление временных файлов..."
rm "$genome_dir/dmel-all-chromosome-r6.52.fasta.gz"

# Скачивание аннотации
echo "Скачивание аннотации Drosophila melanogaster..."
wget -P "$genome_dir" https://ftp.flybase.net/genomes/Drosophila_melanogaster/dmel_r6.52_FB2023_03/gtf/dmel-all-r6.52.gtf.gz

# Распаковка аннотации
echo "Распаковка аннотации..."
gunzip -c "$genome_dir/dmel-all-r6.52.gtf.gz" > "$genome_dir/$annotation_file"

# Удаление временных файлов
echo "Удаление временных файлов..."
rm "$genome_dir/dmel-all-r6.52.gtf.gz"

echo "Геном и аннотация успешно скачаны и распакованы в директорию: $genome_dir"
