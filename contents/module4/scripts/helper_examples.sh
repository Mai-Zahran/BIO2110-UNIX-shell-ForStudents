#!/usr/bin/env bash
# BIO 2110 Module 4 - helper examples (reference only, not a setup script)
# The commands from Book Chapter 4, in order, so an instructor can rerun the
# chapter's examples from contents/module4 in one go and compare the output
# with the numbers printed on the page. Students do not need this file.
# Usage: bash contents/module4/scripts/helper_examples.sh
set -e
cd "$(dirname "${BASH_SOURCE[0]}")/../biomed_text_demo/raw"
echo "== line counts (expect 31, 21, 22)"; wc -l labs_dirty.csv vitals.tsv notes.txt
echo "== field map"; head -n 1 labs_dirty.csv | tr ',' '\n' | cat -n
echo "== NF (expect 6 6 6 / 5 5 5)"; head -n 3 labs_dirty.csv | awk -F ',' '{print NF}'; head -n 3 vitals.tsv | awk -F '\t' '{print NF}'
echo "== naive substitution damage (expect 7)"; sed 's/Glu/Glucose/' labs_dirty.csv | grep -c 'Glucosecose'
echo "== anchored fix (expect 15 and 0)"; sed 's/,Glu,/,Glucose,/' labs_dirty.csv | grep -c ',Glucose,'; sed 's/,Glu,/,Glucose,/' labs_dirty.csv | grep -c 'Glucosecose'
echo "== NA without g / with g (expect 1 / 0)"; sed 's/NA/NotMeasured/' notes.txt | grep -c 'NA'; sed 's/NA/NotMeasured/g' notes.txt | grep -c 'NA'
echo "== sed p without -n (expect 38)"; sed '/Glucose/p' labs_dirty.csv | wc -l
echo "== blank/comment removal (expect 16, 19, 13)"; sed '/^$/d' notes.txt | wc -l; sed '/^#/d' notes.txt | wc -l; sed '/^$/d; /^#/d' notes.txt | wc -l
echo "== test_name table (expect Creatinine 5, Glu 8, Glucose 7, HbA1c 5, Sodium 5)"; tail -n +2 labs_dirty.csv | cut -d ',' -f 3 | sort | uniq -c
echo "== >100 all tests (expect 14), glucose >100 (expect 10), NA rows (expect 2)"; awk -F ',' 'NR>1 && $4+0 > 100' labs_dirty.csv | wc -l; awk -F ',' '($3=="Glucose" || $3=="Glu") && $4+0 > 100' labs_dirty.csv | wc -l; awk -F ',' '$4=="NA"' labs_dirty.csv | wc -l
echo "== glucose report lines (expect 16)"; awk -F ',' 'BEGIN{OFS="\t"; print "patient_id","test_name","result_value","unit","status"} NR>1 && ($3=="Glucose" || $3=="Glu") {print $1,$3,$4,$5,$6}' labs_dirty.csv | wc -l
echo "== SBP > 130 (expect 3)"; awk -F '\t' '$3=="SBP" && $4+0 > 130' vitals.tsv | wc -l
