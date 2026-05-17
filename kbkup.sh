#!/bin/bash

ERROR='\033[1;31m'
SUCCESS='\033[0;32m'
NC='\033[0m'

if [ -z "$1" ]; then
    echo -e "${ERROR}Oops!${NC} Please add a path. Example: kbkup ~/Downloads"
    exit 1
fi

# --- config ---
START="$1"
END="$HOME/backups"
DATE=$(date +%Y-%m-%d)
FOLDER_NAME=$(basename "$START")
FILE_NAME="${DATE}-${FOLDER_NAME}.tar.gz"

mkdir -p "$END"
echo "Starting ..."
tar -czf "$END/$FILE_NAME" "$START" 2>/dev/null &

PID=$!
SPIN='◜◝◞◟'

while kill -0 $PID 2>/dev/null; do
  for i in {0..3}; do
    echo -ne "\r[${SPIN:$i:1}] Hold on..."
    sleep 0.1
  done
done

echo -ne "\r\033[K"

if [ $? -eq 0 ]; then
    echo -e "${SUCCESS}Success!${NC} $FILE_NAME has been saved to $END"
else
    echo -e "${ERROR}Oops!${NC} Something broke and I have no idea what it is."
    exit 1
fi
