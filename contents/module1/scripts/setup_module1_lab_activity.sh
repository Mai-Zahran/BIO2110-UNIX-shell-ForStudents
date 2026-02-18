#!/usr/bin/env bash
# setup_module1_lab_activity.sh
#
# Module 1 Lab (Google Cloud Shell) setup
# - Creates/refreshes: contents/module1/lab_activity/
# - Seeds a small "ehr_demo" dataset for safe practice (raw + docs)
# - Creates a separate practice area for cp/mv/rm drills
#
# Safe to re-run. Designed so students run ONE command, then practice.
#
# Recommended location in repo:
#   contents/module1/scripts/setup_module1_lab_activity.sh
#
# Run from the repo root:
#   bash contents/module1/scripts/setup_module1_lab_activity.sh

set -euo pipefail

REPO_URL="https://github.com/Mai-Zahran/BIO2110-UNIX-shell-ForStudents.git"
REPO_DIR_DEFAULT="$HOME/BIO2110-UNIX-shell-ForStudents"

echo "== BIO2110 • Module 1 Lab Setup (Google Cloud Shell) =="
echo

# --------- 1) Find the repo ---------
REPO_DIR=""

if [ -d "./contents/module1" ]; then
  REPO_DIR="$(pwd)"
elif [ -d "../../module1" ] && [ -d "../../../.git" ]; then
  REPO_DIR="$(cd ../../.. && pwd)"
elif [ -d "$REPO_DIR_DEFAULT/contents/module1" ]; then
  REPO_DIR="$REPO_DIR_DEFAULT"
else
  echo "[1/4] Course repo not found in current folder."
  echo "      Cloning into: $REPO_DIR_DEFAULT"
  git clone "$REPO_URL" "$REPO_DIR_DEFAULT"
  REPO_DIR="$REPO_DIR_DEFAULT"
fi

MODULE1_DIR="$REPO_DIR/contents/module1"

if [ ! -d "$MODULE1_DIR" ]; then
  echo "ERROR: Expected Module 1 folder not found at:"
  echo "  $MODULE1_DIR"
  echo "Tell your instructor (repo structure may have changed)."
  exit 1
fi

echo "[1/4] Using repo at:"
echo "      $REPO_DIR"
echo

echo "[2/4] Attempting: git pull (ok if it fails in a restricted environment)"
( cd "$REPO_DIR" && git pull ) >/dev/null 2>&1 || true
echo "      Done."
echo

# --------- 2) Create lab workspace ---------
LAB_DIR="$MODULE1_DIR/lab_activity"
EHR_DIR="$LAB_DIR/ehr_demo"
RAW_DIR="$EHR_DIR/raw"
DOCS_DIR="$EHR_DIR/docs"
PRACTICE_DIR="$LAB_DIR/practice"
TMP_DIR="$LAB_DIR/tmp"
TAB_DIR="$LAB_DIR/tab_practice"

echo "[3/4] Creating/refreshing lab workspace at:"
echo "      $LAB_DIR"
mkdir -p "$RAW_DIR" "$DOCS_DIR" "$PRACTICE_DIR/work" "$PRACTICE_DIR/results" "$PRACTICE_DIR/docs" "$TMP_DIR" "$TAB_DIR"

# Clean only the *practice* area
rm -rf "$PRACTICE_DIR/work" "$PRACTICE_DIR/results" "$PRACTICE_DIR/docs"
mkdir -p "$PRACTICE_DIR/work" "$PRACTICE_DIR/results" "$PRACTICE_DIR/docs"

# --------- 3) Seed demo data ---------
# ----------------------------
# Generate patients.csv (N rows)
# ----------------------------
PAT_N=250   # number of patient rows (not counting header)

PAT_FILE="$RAW_DIR/patients.csv"
{
  echo "patient_id,age,sex,condition"
  for i in $(seq -w 1 "$PAT_N"); do
    # simple, plausible values (not real)
    age=$(( (10#$i % 70) + 18 ))
    sex=$((10#$i % 2))
    if [[ "$sex" -eq 0 ]]; then s="F"; else s="M"; fi
    case $((10#$i % 5)) in
      0) c="hypertension" ;;
      1) c="type2_diabetes" ;;
      2) c="asthma" ;;
      3) c="hyperlipidemia" ;;
      4) c="migraine" ;;
    esac
    echo "P${i},${age},${s},${c}"
  done
} > "$PAT_FILE"

# ----------------------------
# Generate visits.csv (similar size to patients)
# ----------------------------
VIS_N=250   # number of visit rows (not counting header)

VIS_FILE="$RAW_DIR/visits.csv"
{
  echo "visit_id,patient_id,visit_date,site,reason"
  for i in $(seq -w 1 "$VIS_N"); do
    pid="P$(printf "%03d" $(( (10#$i % PAT_N) + 1 )))"
    # deterministic-ish date pattern
    month=$(( (10#$i % 12) + 1 ))
    day=$(( (10#$i % 27) + 1 ))
    date=$(printf "2025-%02d-%02d" "$month" "$day")
    case $((10#$i % 4)) in
      0) site="ED" ;;
      1) site="clinic" ;;
      2) site="telehealth" ;;
      3) site="lab" ;;
    esac
    case $((10#$i % 6)) in
      0) reason="follow_up" ;;
      1) reason="new_symptoms" ;;
      2) reason="med_refill" ;;
      3) reason="lab_review" ;;
      4) reason="vaccination" ;;
      5) reason="annual_physical" ;;
    esac
    echo "V${i},${pid},${date},${site},${reason}"
  done
} > "$VIS_FILE"

cat > "$DOCS_DIR/data_dictionary.txt" <<'EOF'
DATA DICTIONARY (demo)

patients.csv
- patient_id: patient identifier (string)
- sex: F/M (string)
- age: age in years (integer)
- zip: postal code (string)

visits.csv
- visit_id: visit identifier (string)
- patient_id: links to patients.csv (string)
- date: visit date YYYY-MM-DD (string)
- site: clinic / ed (string)
- chief_complaint: brief reason for visit (string)
EOF

BIG="$RAW_DIR/big_log.txt"
: > "$BIG"
i=1
while [ $i -le 1200 ]; do
  printf "2026-02-17T10:%02d:%02dZ device=ECG value=%d\n" $((i%60)) $((i%60)) $((i%1000)) >> "$BIG"
  i=$((i+1))
done

# --------- 4) Controlled learning traps ---------
mkdir -p "$LAB_DIR/EHR_Demo"
printf "This folder exists to demonstrate case sensitivity.\n" > "$LAB_DIR/EHR_Demo/CASE_NOTE.txt"

mkdir -p "$TMP_DIR/is_a_directory"
touch "$TMP_DIR/delete_me.txt"

\
# Tab completion practice: multiple similar names (folders + files)
# Goal: students can practice Tab with BOTH directory names and file names, including "ambiguous" cases.
mkdir -p "$TAB_DIR"

# 1) Similar directory names (Tab should show multiple options when you press Tab twice)
mkdir -p "$TAB_DIR/very_long_directory_name_for_tab_practice"
mkdir -p "$TAB_DIR/very_long_directory_name_for_tab_prep"
mkdir -p "$TAB_DIR/very_long_directory_name_for_tab_project"

# 2) Similar file names in the SAME folder (Tab should complete, or list options)
cat > "$TAB_DIR/patient_001_notes.txt" <<'EOF'
Patient 001 — notes (sample)
EOF
cat > "$TAB_DIR/patient_001_raw.txt" <<'EOF'
patient_id,age,sex
P001,44,F
EOF
cat > "$TAB_DIR/patient_002_notes.txt" <<'EOF'
Patient 002 — notes (sample)
EOF
cat > "$TAB_DIR/patient_002_raw.txt" <<'EOF'
patient_id,age,sex
P002,51,M
EOF

cat > "$TAB_DIR/patients.csv" <<'EOF'
patient_id,age,sex
P001,44,F
P002,51,M
P003,39,F
EOF
cp "$TAB_DIR/patients.csv" "$TAB_DIR/patients_notes.csv"
cp "$TAB_DIR/patients.csv" "$TAB_DIR/patients_preview.csv"

# 3) Similar file names inside a long directory (practice Tab on nested paths)
cat > "$TAB_DIR/very_long_directory_name_for_tab_practice/patients_for_notes.csv" <<'EOF'
patient_id,note
P001,Follow-up scheduled.
P002,New medication started.
EOF
cat > "$TAB_DIR/very_long_directory_name_for_tab_practice/patients_for_preview.csv" <<'EOF'
patient_id,preview
P001,OK
P002,OK
EOF
cat > "$TAB_DIR/very_long_directory_name_for_tab_practice/patients_for_practice.csv" <<'EOF'
patient_id,practice
P001,yes
P002,yes
EOF

# 4) A deeper folder with long names (Tab on directories *and* paths)
mkdir -p "$TAB_DIR/very_long_directory_name_for_tab_practice/subfolder_with_another_long_name_for_more_tab_practice"
touch "$TAB_DIR/very_long_directory_name_for_tab_practice/subfolder_with_another_long_name_for_more_tab_practice/README_tab.txt"

cat > "$LAB_DIR/CHECKLIST.txt" <<'EOF'
Module 1 Lab Checklist (open with: less CHECKLIST.txt)

Evidence routine (always):
1) pwd      (Where am I?)
2) ls -F    (What exists here?)
3) Compare command text to reality (names, slashes, capitalization)

You will practice:
- pwd, ls, ls -F, ls -l, ls -ltr
- cd, cd .., cd ~, cd -
- absolute vs relative paths
- head, tail, less, cat (only for small files)
- mkdir -p, touch, cp, cp -r, mv, rm (ONLY inside lab_activity/practice or lab_activity/tmp)
- Tab completion drills (tab_practice/)
EOF

echo "[4/4] Done."
echo
echo "Next steps:"
echo "  cd \"$LAB_DIR\""
echo "  pwd"
echo "  ls -F"
echo
