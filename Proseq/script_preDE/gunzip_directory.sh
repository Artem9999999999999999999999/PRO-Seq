#!/bin/bash

# Проверяем, передан ли аргумент с путем до директории
if [ -z "$1" ]; then
  echo "Пожалуйста, укажите путь до директории."
  exit 1
fi

# Переходим в указанную директорию
cd "$1"

# Разархивируем все файлы с расширением .gz в текущей директории
for file in *.gz; do
  # Проверяем, что файл существует и является файлом с расширением .gz
  if [ -e "$file" ] && [[ "$file" == *.gz ]]; then
    echo "Разархивация файла: $file"
    # Используем утилиту gunzip для разархивации
    gunzip "$file"
  fi
done

echo "Все файлы .gz в директории были разархивированы."
