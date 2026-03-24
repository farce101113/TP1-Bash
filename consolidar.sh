#!/bin/bash

BASE="$HOME/EPNro1"

while true; do
    for file in "$BASE/entrada/"*.txt; do
        [ -e "$file" ] || continue

        cat "$file" >> "$BASE/salida/$FILENAME.txt"
        mv "$file" "$BASE/procesado/"
    done

    sleep 5
done
