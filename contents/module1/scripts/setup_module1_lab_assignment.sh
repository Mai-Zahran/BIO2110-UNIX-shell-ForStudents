#!/usr/bin/env bash
# setup_module1_lab_assignment.sh
# Builds the workspace for the graded Lab Assignment 1 (Google Cloud Shell).
# Run from the repository root:
#   bash contents/module1/scripts/setup_module1_lab_assignment.sh
# Safe to run again. It rebuilds clinic/, archive/ and scratch/, and does not touch work/.

set -eu
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODULE="$(cd "$HERE/.." && pwd)"
WORK="$MODULE/lab_assignment1"

mkdir -p "$WORK/clinic/raw" "$WORK/clinic/docs" "$WORK/clinic/results" "$WORK/archive" "$WORK/scratch"

cat > "$WORK/clinic/raw/patients.csv" <<'EOF_P'
patient_id,sex,age_group,zip3
P101,F,40-49,112
P102,M,30-39,112
P103,F,60-69,113
P104,M,50-59,112
P105,F,20-29,114
P106,M,70-79,113
P107,F,30-39,112
P108,M,40-49,114
P109,F,50-59,113
P110,M,60-69,112
EOF_P

cat > "$WORK/clinic/raw/visits.csv" <<'EOF_V'
visit_id,patient_id,visit_date,site,reason
V001,P108,2026-01-01,Queens,followup
V002,P105,2026-01-04,Bronx,lab_draw
V003,P102,2026-01-07,Brooklyn,imaging
V004,P109,2026-01-10,Queens,checkup
V005,P106,2026-01-13,Bronx,followup
V006,P103,2026-01-16,Brooklyn,lab_draw
V007,P110,2026-01-19,Queens,imaging
V008,P107,2026-01-22,Bronx,checkup
V009,P104,2026-01-25,Brooklyn,followup
V010,P101,2026-02-01,Queens,lab_draw
V011,P108,2026-02-04,Bronx,imaging
V012,P105,2026-02-07,Brooklyn,checkup
V013,P102,2026-02-10,Queens,followup
V014,P109,2026-02-13,Bronx,lab_draw
V015,P106,2026-02-16,Brooklyn,imaging
V016,P103,2026-02-19,Queens,checkup
V017,P110,2026-02-22,Bronx,followup
V018,P107,2026-02-25,Brooklyn,lab_draw
V019,P104,2026-03-01,Queens,imaging
V020,P101,2026-03-04,Bronx,checkup
EOF_V

cat > "$WORK/clinic/docs/readme.txt" <<'EOF_R'
Clinic demo data for Lab Assignment 1

raw/      the two data files, which must not be changed
docs/     this file
results/  an empty folder for your own results

Each file in raw/ starts with a header line.
EOF_R

cat > "$WORK/archive/old_notes.txt" <<'EOF_O'
Old notes from the previous intern.
The visits file was last checked in March.
The results folder was emptied before handover.
EOF_O

echo "This file exists so that you can practice deleting a file safely." > "$WORK/scratch/delete_me.txt"

echo "Module 1 lab_assignment1 is ready in:"
echo "  $WORK"
echo "Spot check: the two raw files have this many lines in total:"
cat "$WORK"/clinic/raw/patients.csv "$WORK"/clinic/raw/visits.csv | wc -l
