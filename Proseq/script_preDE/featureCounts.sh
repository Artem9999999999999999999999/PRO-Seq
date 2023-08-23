#!/bin/bash

# Устанавливаем пути к файлам GTF и BAM
gtf_file="/home/komissarov_ae/manasyan_rnaseq/data/reference_data/dmel-all-r6.52.gtf"
bam_folder="/home/komissarov_ae/manasyan_rnaseq/data/bams"

# Проверяем, существует ли указанный GTF файл
if [ ! -f "$gtf_file" ]; then
  echo "Файл GTF не найден: $gtf_file"
  exit 1
fi

# Проверяем, существует ли указанная папка с BAM файлами
if [ ! -d "$bam_folder" ]; then
  echo "Папка с BAM файлами не найдена: $bam_folder"
  exit 1
fi

# Переходим в папку с BAM файлами
cd "$bam_folder" || exit

# Запускаем featureCounts с использованием указанных параметров
featureCounts -T 8 -a "$gtf_file" -o counts.txt *.bam

# Успешное завершение
echo "Выполнение featureCounts завершено. Результаты сохранены в counts.txt"
