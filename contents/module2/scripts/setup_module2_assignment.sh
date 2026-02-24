#!/usr/bin/env bash
set -euo pipefail

# Run from contents/module2/scripts/ after making executable:
# chmod +x setup_module2_assignment.sh
# ./setup_module2_assignment.sh

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ASSIGN_DIR="${BASE_DIR}/practice/assignment2_practice"

mkdir -p "${ASSIGN_DIR}"

cat > "${ASSIGN_DIR}/README_assignment2_practice.txt" <<'TXT'
Assignment 2 Practice (not graded, no submission)
Theme: Clinic-style text streams and permissions

Use only commands seen in Module 1 + Module 2:
pwd, ls, cd, head, tail, less, wc, cut, sort, uniq, grep,
>, >>, 2>, |, ls -l, ls -ld, chmod

Suggested practice workflow:
A) Preview raw files (labs.csv, vitals.csv, meds.tsv).
B) Build one pipeline that summarizes a column from labs.csv:
   tail -n +2 ... | cut ... | sort | uniq -c | sort -nr
C) Save final output into this folder and preview it.
D) Create an evidence log using > then >>.
E) Redirect one intentional error to a separate error log.
F) Practice permissions with ../scripts/hello.sh (check then chmod +x).
TXT

: > "${ASSIGN_DIR}/work_log.txt"
: > "${ASSIGN_DIR}/errors_assignment2.txt"

echo "Module 2 Assignment 2 practice setup created at: ${ASSIGN_DIR}"
