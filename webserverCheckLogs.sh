#!/bin/bash

LOG_FILE="/var/log/apache2/access.log"

if [ ! -f "$LOG_FILE" ]; then
  echo "Ошибка: Лог-файл $LOG_FILE не найден"
  exit 1
fi

ERRORS=$(grep -E '" (4[0-9][0-9]|5[0-9][0-9]) ' "$LOG_FILE")

if [ -n "$ERRORS" ]; then
  echo "Найдены ошибки 4xx и 5xx:"
  echo "$ERRORS"
else
  echo "Ошибок нет"
fi
