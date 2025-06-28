#!/bin/bash

LOG_FILE="/var/log/apache2/access.log"

if [ ! -f "$LOG_FILE" ]; then
  echo "Error: Log file $LOG_FILE not found"
  exit 1
fi

ERRORS=$(grep -E '" (4[0-9][0-9]|5[0-9][0-9]) ' "$LOG_FILE")

if [ -n "$ERRORS" ]; then
  echo -e ""
  echo "4xx AND 5xx ERRPRS FOUND:"
  echo -e ""
  echo "$ERRORS"
  echo -e ""
else
  echo -e "" 
  echo "There are no errors in log file"
  echo -e ""
fi
