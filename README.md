# BAM MD5 Integrity Check Pipeline

## Overview

This repository contains a lightweight QC pipeline to validate the integrity of BAM files downloaded from the EGAD/ENA dataset using MD5 checksum comparison.

The workflow compares:
- MD5 values provided in the official checksum CSV file
- MD5 values computed locally from downloaded BAM files

## Dataset Description

Each sample is stored as a directory: as an example,
Folder1/
Folder2/
Folder3/

Each sample contains:
- `.bam` file (alignment file)
- `.bam.md5` file (locally provided checksum)

A metadata file is also provided to the use, and it expected MD5 checksums:
checksums_unique_lines.csv

## Pipeline Description

The script performs:
1. Iterates through all `Folder*` directories  
2. Extracts sample ID from folder name  
3. Retrieves expected MD5 from CSV file  
4. Reads computed MD5 from `.bam.md5` file  
5. Compares values  
6. Writes results to output log  

## Usage

Run the script from the root directory:
bash check_md5.sh

## Output
Results are stored in md5_check_results.txt file.
