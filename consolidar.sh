#!/bin/bash

BASE="$HOME/EPNro1"
shopt -s nullglob

while true; do
    txt_files=("$BASE/entrada/"*.txt)

    if [ ${#txt_files[@]} -gt 0 ]; then
        for file in "${txt_files[@]}"; do
            cat "$file" >> "$BASE/salida/${FILENAME}.txt"
            echo >> "$BASE/salida/${FILENAME}.txt"
        done

        mv "${txt_files[@]}" "$BASE/procesado/"
    fi

    sleep 5
done