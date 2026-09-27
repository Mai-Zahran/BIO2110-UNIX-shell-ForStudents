#!/usr/bin/env bash
# helper_examples.sh : read-only examples from Book Chapter 4. Run from biomed_text_demo/raw/.
# Field map of a CSV header
head -n 1 labs_dirty.csv | tr ',' '\n' | cat -n
# Anchored label fix, previewed
sed 's/,Glu,/,Glucose,/' labs_dirty.csv | head
# Keep the header and the rows above a threshold
awk -F ',' 'NR==1 || $4+0 > 100' labs_dirty.csv | head
