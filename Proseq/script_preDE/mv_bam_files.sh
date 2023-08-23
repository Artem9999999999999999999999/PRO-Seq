#!/bin/bash

# Устанавливаем переменные с путями к исходной и целевой папкам
source_folder="/home/komissarov_ae/manasyan_rnaseq/data/mapping_results"
target_folder="/home/komissarov_ae/manasyan_rnaseq/data/bams"

# Создание директории для сохранения файлов, если она не существует
mkdir -p " $target_folder"

# Переходим в исходную папку
cd "$source_folder" || exit

# Ищем все файлы, оканчивающиеся на sortedByCoord.out.bam
files_to_move=$(find . -type f -name "*sortedByCoord.out.bam")

# Проверяем, что найдены файлы
if [ -z "$files_to_move" ]; then
  echo "Файлы не найдены."
else
  # Перемещаем найденные файлы в целевую папку
  mv $files_to_move "$target_folder"
  echo "Файлы успешно перемещены."
fi
