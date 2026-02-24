#!/usr/bin/env bash
set -euo pipefail

# Run from contents/module2/scripts/ after making executable:
# chmod +x setup_module2_lab_activity.sh
# ./setup_module2_lab_activity.sh

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LAB_DIR="${BASE_DIR}/practice/lab_activity2"

mkdir -p "${LAB_DIR}"

# Starter prompt file (students will use Module 1 + Module 2 commands only)
cat > "${LAB_DIR}/README_lab_activity2.txt" <<'TXT'
Lab Activity 2 (Practice, not graded)
Theme: Biomedical shell data workflow practice

Use only commands seen so far (examples):
pwd, ls, cd, head, tail, less, wc, cut, sort, uniq, grep, redirection (> >> 2>), pipes (|), ls -l, chmod

Suggested practice tasks:
1) Confirm location and list files.
2) Preview labs.csv and vitals.csv safely.
3) Count lines in labs.csv and vitals.csv and save results into this folder.
4) Extract one column from labs.csv with cut, then sort and uniq -c.
5) Save a frequency summary into this folder.
6) Trigger one safe error (bad filename) and redirect stderr to an errors file.
7) Check permissions of hello.sh and make it executable.
TXT

# Empty target files students will generate or append to (practice)
: > "${LAB_DIR}/notes_log.txt"
: > "${LAB_DIR}/errors_lab2.txt"

echo "Module 2 Lab Activity 2 setup created at: ${LAB_DIR}"
