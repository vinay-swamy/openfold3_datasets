#!/bin/bash
mkdir jaspar_pfm
cd jaspar_pfm
wget https://jaspar2022.genereg.net/download/data/2022/CORE/JASPAR2022_CORE_non-redundant_pfms_jaspar.zip
unzip JASPAR2022_CORE_non-redundant_pfms_jaspar.zip
wget https://jaspar2022.genereg.net/download/database/JASPAR2022.sql.gz
gunzip -c JASPAR2022.sql.gz | sqlite3 JASPAR2022.sqlite3
sqlite3 -separator "," JASPAR2022.sqlite3 "SELECT * from MATRIX" > sql_internal_metadata.csv
sqlite3 -separator "," JASPAR2022.sqlite3 "SELECT * from MATRIX_PROTEIN" > sql_internal_uniprot_mapping.csv
