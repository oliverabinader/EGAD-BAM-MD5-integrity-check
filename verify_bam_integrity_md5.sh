#!/bin/bash

set -e

echo "Starting MD5 validation..."

BASE_DIR="$(pwd)"
CSV_FILE="$BASE_DIR/data/dataset-checksums.csv"
OUTPUT_FILE="$BASE_DIR/results/md5_check_results.txt"

mkdir -p results
> "$OUTPUT_FILE"

for folder in "$BASE_DIR"/data/EGAF*; do
    if [ -d "$folder" ]; then

        stable_id=$(basename "$folder")

        csv_md5=$(awk -F',' -v id="$stable_id" '
            NR>1 && $1 == id {print $2}
        ' "$CSV_FILE")

        folder_md5=$(cat "$folder"/*.md5 | tr -d '\r')

        if [ "$csv_md5" == "$folder_md5" ]; then
            echo "$stable_id: MD5 MATCH" >> "$OUTPUT_FILE"
        else
            echo "$stable_id: MD5 MISMATCH (CSV: $csv_md5, Folder: $folder_md5)" >> "$OUTPUT_FILE"
        fi

    fi
done

echo "Done. Results written to $OUTPUT_FILE"
