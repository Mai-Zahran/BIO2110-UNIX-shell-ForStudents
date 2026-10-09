#!/usr/bin/env bash
# setup_module5_lab_assignment.sh
# Builds the workspace for graded Lab Assignment 5 (Google Cloud Shell).
# Run from the repository root:
#   bash contents/module5/scripts/setup_module5_lab_assignment.sh
# Safe to run again. It rebuilds raw/ and scripts/ and does not touch output/ or work/.

set -eu
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODULE="$(cd "$HERE/.." && pwd)"
git -C "$MODULE" config core.fileMode false >/dev/null 2>&1 || true
WORK="$MODULE/lab_assignment5"

mkdir -p "$WORK/raw" "$WORK/scripts" "$WORK/output" "$WORK/work"
rm -f "$WORK"/raw/*.log "$WORK"/raw/*.txt "$WORK"/scripts/*.sh

cat > "$WORK/raw/ward_a.log" <<'EOF_LOG'
2026-03-16 07:00 P201 heart_rate 78 OK
2026-03-16 07:10 P214 glucose 107 OK
2026-03-16 07:20 P227 oxygen 98 OK
2026-03-16 07:30 P233 heart_rate 126 ALERT
2026-03-16 07:40 P201 oxygen 97 OK
2026-03-16 07:50 P214 heart_rate 67 OK
2026-03-16 08:00 P227 glucose 121 OK
2026-03-16 08:10 P233 oxygen 96 OK
2026-03-16 08:20 P201 glucose 110 OK
2026-03-16 08:30 P214 oxygen 86 ALERT
2026-03-16 08:40 P227 heart_rate 93 OK
2026-03-16 08:50 P233 glucose 126 OK
2026-03-16 09:00 P201 heart_rate 83 OK
2026-03-16 09:10 P214 glucose 104 OK
2026-03-16 09:20 P227 oxygen 87 ALERT
2026-03-16 09:30 P233 heart_rate 70 OK
2026-03-16 09:40 P201 oxygen 99 OK
2026-03-16 09:50 P214 heart_rate 92 OK
2026-03-16 10:00 P227 glucose 99 OK
2026-03-16 10:10 P233 oxygen 99 OK
2026-03-16 10:20 P201 glucose 99 OK
2026-03-16 10:30 P214 oxygen 99 OK
2026-03-16 10:40 P227 heart_rate 132 ALERT
2026-03-16 10:50 P233 glucose 93 OK
2026-03-16 11:00 P201 heart_rate 70 OK
2026-03-16 11:10 P214 glucose 105 OK
2026-03-16 11:20 P227 oxygen 94 OK
2026-03-16 11:30 P233 heart_rate 126 ALERT
2026-03-16 11:40 P201 oxygen 95 OK
2026-03-16 11:50 P214 heart_rate 65 OK
EOF_LOG

cat > "$WORK/raw/ward_b.log" <<'EOF_LOG'
2026-03-16 07:00 P305 heart_rate 88 OK
2026-03-16 07:10 P318 glucose 111 OK
2026-03-16 07:20 P322 oxygen 97 OK
2026-03-16 07:30 P340 heart_rate 87 OK
2026-03-16 07:40 P305 oxygen 94 OK
2026-03-16 07:50 P318 heart_rate 98 OK
2026-03-16 08:00 P322 glucose 115 OK
2026-03-16 08:10 P340 oxygen 97 OK
2026-03-16 08:20 P305 glucose 111 OK
2026-03-16 08:30 P318 oxygen 94 OK
2026-03-16 08:40 P322 heart_rate 90 OK
2026-03-16 08:50 P340 glucose 269 ALERT
2026-03-16 09:00 P305 heart_rate 73 OK
2026-03-16 09:10 P318 glucose 123 OK
2026-03-16 09:20 P322 oxygen 97 OK
2026-03-16 09:30 P340 heart_rate 98 OK
2026-03-16 09:40 P305 oxygen 97 OK
2026-03-16 09:50 P318 heart_rate 97 OK
2026-03-16 10:00 P322 glucose 98 OK
2026-03-16 10:10 P340 oxygen 98 OK
2026-03-16 10:20 P305 glucose 118 OK
2026-03-16 10:30 P318 oxygen 94 OK
2026-03-16 10:40 P322 heart_rate 77 OK
2026-03-16 10:50 P340 glucose 117 OK
2026-03-16 11:00 P305 heart_rate 83 OK
2026-03-16 11:10 P318 glucose 274 ALERT
2026-03-16 11:20 P322 oxygen 97 OK
2026-03-16 11:30 P340 heart_rate 94 OK
2026-03-16 11:40 P305 oxygen 96 OK
2026-03-16 11:50 P318 heart_rate 62 OK
EOF_LOG

cat > "$WORK/raw/ward_c.log" <<'EOF_LOG'
2026-03-16 07:00 P402 heart_rate 93 OK
2026-03-16 07:10 P411 glucose 286 ALERT
2026-03-16 07:20 P426 oxygen 98 OK
2026-03-16 07:30 P439 heart_rate 82 OK
2026-03-16 07:40 P402 oxygen 99 OK
2026-03-16 07:50 P411 heart_rate 63 OK
2026-03-16 08:00 P426 glucose 288 ALERT
2026-03-16 08:10 P439 oxygen 99 OK
2026-03-16 08:20 P402 glucose 108 OK
2026-03-16 08:30 P411 oxygen 98 OK
2026-03-16 08:40 P426 heart_rate 91 OK
2026-03-16 08:50 P439 glucose 113 OK
2026-03-16 09:00 P402 heart_rate 84 OK
2026-03-16 09:10 P411 glucose 268 ALERT
2026-03-16 09:20 P426 oxygen 94 OK
2026-03-16 09:30 P439 heart_rate 90 OK
2026-03-16 09:40 P402 oxygen 97 OK
2026-03-16 09:50 P411 heart_rate 129 ALERT
2026-03-16 10:00 P426 glucose 111 OK
2026-03-16 10:10 P439 oxygen 96 OK
2026-03-16 10:20 P402 glucose 281 ALERT
2026-03-16 10:30 P411 oxygen 99 OK
2026-03-16 10:40 P426 heart_rate 88 OK
2026-03-16 10:50 P439 glucose 108 OK
2026-03-16 11:00 P402 heart_rate 72 OK
2026-03-16 11:10 P411 glucose 102 OK
2026-03-16 11:20 P426 oxygen 97 OK
2026-03-16 11:30 P439 heart_rate 93 OK
2026-03-16 11:40 P402 oxygen 85 ALERT
2026-03-16 11:50 P411 heart_rate 75 OK
EOF_LOG

cat > "$WORK/raw/seq_batch1.txt" <<'EOF_SEQ'
A01 GAGATCCAAGGTAACCCGAATGATACATGA
A02 GTTGCATGGAATTCGTAACCAATAACGAAG
A03 CTGGTAGGGTCACTCAAATATGTTTCTGCT
A04 CTACGAGCTACAAGTCAATCGGTCCGGATA
A05 ATTAGAATGACGCACTTAATCAAGGAGTTT
A06 CATAGTGTCATATGATTTTGGATGGACAGA
A07 GGGTTATTTCACGAGAATTCTCTAGTTTGG
A08 TCGAGCTTGACCGACGCAAATAGGTGTAGA
A09 CCACGGCGGTATAGATGCACCTTTTAGCCT
A10 AATGCAATGGAGCGAGTCTAATAGTCCAAT
EOF_SEQ

cat > "$WORK/raw/seq_batch2.txt" <<'EOF_SEQ'
B01 CGTGAGAATTCTGCAAAGATCAAAATGTTG
B02 GTGAGCCAGCTGAATGGACGAGTGCGCACC
B03 AGCGGTGCCCGAGTCAGCCCTACTTTGCGT
B04 ATGTACGTTGAAGATGCTAGTAGACGGGGA
B05 TGATCAAGAGCCCGAATTCAGTGCATACAA
B06 AGGGGTAATCTTCCCGTACGGTGTCTACTC
B07 ATGTTGTTTGCGACTAATTTCCAACGCATA
B08 GCTGAGGCCTTCTTATGTCCATGCCTGTTG
B09 TTCCGTCTTCCAGGAATTCCCTACTTCTGT
B10 GTGTTATACACATTTCGTCTAATACCATCC
EOF_SEQ

cat > "$WORK/raw/seq_batch3.txt" <<'EOF_SEQ'
C01 AATGGGCCGAGCCGGCTCGCGCCCACCTTG
C02 CACGACCCATAAGTCCACCCCCATCCACAC
C03 ACTTATATATTCCGCGATGAATTCTGTTCA
C04 CTGTCGCGAATTCACCCGAACATGCGCGTT
C05 TCATTTCATGGCCGTAATACCGTTTGAGGG
C06 AGCTTATCAGCGATGTCATCCGTATTCTGA
C07 TGGATCGCCGGATAGCGTTCTAAAAAATTC
C08 GTCACTAGTTACTTACGAATTCGGCTGACC
C09 AGATAACCAGCATAACTCTAAGTACTGCTA
C10 GTAAGAATTCGACCTGGCGAGCTACCTGCA
EOF_SEQ

cat > "$WORK/scripts/ward_report.sh" <<'EOF_SCRIPT'
# ward_report.sh
# Purpose: save the ALERT lines from the Ward A log in a report.
# Run it from the folder that contains raw/ and output/.

echo "Starting Ward A report"

# 1. Extract the alert lines
grep "ALERT" raw/ward_a.log > output/ward_a_alerts.txt

# 2. Verify the report
wc -l output/ward_a_alerts.txt

echo "Finished"
EOF_SCRIPT

cat > "$WORK/scripts/ward_variables.sh" <<'EOF_SCRIPT'
# ward_variables.sh
# Purpose: save the ALERT lines from one ward log, with the file names stored in variables.

INPUT="raw/ward_a.log"
OUTPUT="output/ward_a_alerts.txt"

# 1. Extract the alert lines
grep "ALERT" "$INPUT" > "$OUTPUT"

# 2. Verify the report
wc -l "$OUTPUT"
EOF_SCRIPT

cat > "$WORK/scripts/loop_starter.sh" <<'EOF_SCRIPT'
# loop_starter.sh
# Purpose: show the first 2 lines of each ward log.

for file in raw/ward_a.log raw/ward_b.log raw/ward_c.log
do
  echo "Checking $file"
  head -n 2 "$file"
done
EOF_SCRIPT

cat > "$WORK/scripts/motif_report.sh" <<'EOF_SCRIPT'
# motif_report.sh
# Purpose: collect every sequence that contains the EcoRI site GAATTC
# from three sequence batches in one report.

for file in raw/seq_batch1.txt raw/seq_batch2.txt raw/seq_batch3.txt
do
  grep "GAATTC" "$file" >> output/ecori_sites.txt
done

# Verify the report
wc -l output/ecori_sites.txt
EOF_SCRIPT

if [ ! -f "$WORK/output/README.txt" ]; then
  echo "Files created by your scripts are saved in this folder." > "$WORK/output/README.txt"
fi
if [ ! -f "$WORK/work/README.txt" ]; then
  echo "Save your own copies of scripts in this folder." > "$WORK/work/README.txt"
fi

echo "Module 5 lab_assignment5 is ready in:"
echo "  $WORK"
echo "Spot check: the three ward logs and three sequence batches have this many lines in total:"
cat "$WORK"/raw/*.log "$WORK"/raw/*.txt | wc -l
