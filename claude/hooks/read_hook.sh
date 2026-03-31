#!/bin/bash

read_path=$(python3 -c "
import sys, json
data = json.load(sys.stdin)
tool_input = data.get('tool_input') or {}
print(tool_input.get('file_path') or tool_input.get('path') or '')
")

if [[ "$read_path" == *".env"* ]]; then
  echo "Prohibido leer el archivo .env" >&2
  exit 2
fi
