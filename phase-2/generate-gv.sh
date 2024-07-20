#!/bin/bash

alias yw='java -jar ./yesworkflow-0.2.0-jar-with-dependencies.jar'

mkdir -p yw/gv-manual

for filepath in ./yw/yw/*; do
  if [ -f "$filepath" ]; then
    filename=$(basename $filepath)
    entity="${filename%.*}"
    java -jar ./yesworkflow-0.2.0-jar-with-dependencies.jar graph $filepath > "yw/gv-manual/${entity}.gv"
  fi
done