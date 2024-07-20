#!/bin/bash

python -m venv .venv
source .venv/bin/activate

mkdir -p yw/yw yw/gv yw/png

for filepath in ./yw/history/*; do
  if [ -f "$filepath" ]; then
    filename=$(basename $filepath)
    entity="${filename%.*}"
    or2yw -i $filepath -o "yw/yw/${entity}.yw"
    # or2yw -i $filepath -o "yw/png/${entity}.png" -ot png
    # or2yw -i $filepath -o "yw/gv/${entity}.gv" -ot gv
  fi
done