#!/bin/bash

mkdir -p yw/png

for filepath in ./yw/gv/*; do
  if [ -f "$filepath" ]; then
    filename=$(basename $filepath)
    entity="${filename%.*}"
    dot -Tpng $filepath -o "yw/png/${entity}.png"
  fi
done