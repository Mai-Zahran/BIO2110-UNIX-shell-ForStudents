#!/usr/bin/env bash
set -euo pipefail

# Run this from: BIO2110_UNIX_shell_ForStudents/scripts/
# It will create: ../contents/module2/...

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
CONTENTS_DIR="${REPO_ROOT}/contents"
MODULE2_DIR="${CONTENTS_DIR}/module2"

RAW_DIR="${MODULE2_DIR}/clinic_demo/raw"
DOCS_DIR="${MODULE2_DIR}/clinic_demo/docs"
SCRIPTS_DIR="${MODULE2_DIR}/scripts"
PRACTICE_DIR="${MODULE2_DIR}/practice"

mkdir -p "${RAW_DIR}" "${DOCS_DIR}" "${SCRIPTS_DIR}" "${PRACTICE_DIR}"

###############################################################################
# Helper functions
###############################################################################

write_labs_csv() {
  local f="${RAW_DIR}/labs.csv"
  : > "$f"
  printf '%s\n' 'patient_id,visit_date,test_name,result_value,unit' >> "$f"

  # 120 data rows + 1 header = 121 lines total
  local i pid day test val unit
  for i in $(seq 1 120); do
    pid=$(printf 'P%03d' $(( (i - 1) % 30 + 1 )))
    day=$(printf '2025-01-%02d' $(( (i - 1) % 28 + 1 )))

    case $(( i % 6 )) in
      0) test="Glucose";      val=$((90 + (i % 35))); unit="mg/dL" ;;
      1) test="HbA1c";        val="$(printf '%d.%d' $((5 + (i % 3))) $((i % 10)))"; unit="percent" ;;
      2) test="Creatinine";   val="$(printf '%.1f' "$(echo "0")")"; unit="mg/dL" ;; # replaced below
      3) test="Sodium";       val=$((135 + (i % 8))); unit="mmol/L" ;;
      4) test="Potassium";    val="$(printf '%d.%d' $((3 + (i % 2))) $((i % 10)))"; unit="mmol/L" ;;
      5) test="Hemoglobin";   val="$(printf '%d.%d' $((11 + (i % 5))) $((i % 10)))"; unit="g/dL" ;;
    esac

    # Simple shell-only values (no awk/sed). Fix Creatinine branch with shell arithmetic pattern.
    if [ "$test" = "Creatinine" ]; then
      # values like 0.6 to 1.5
      val="0.$((6 + (i % 4)))"
      [ $(( i % 5 )) -eq 0 ] && val="1.$((0 + (i % 6)))"
    fi

    printf '%s,%s,%s,%s,%s\n' "$pid" "$day" "$test" "$val" "$unit" >> "$f"
  done
}

write_vitals_csv() {
  local f="${RAW_DIR}/vitals.csv"
  : > "$f"
  printf '%s\n' 'patient_id,visit_date,heart_rate,bp_systolic,bp_diastolic,temperature_c,resp_rate' >> "$f"

  # 120 data rows + 1 header = 121 lines total
  local i pid day hr sys dia temp rr
  for i in $(seq 1 120); do
    pid=$(printf 'P%03d' $(( (i - 1) % 30 + 1 )))
    day=$(printf '2025-01-%02d' $(( (i - 1) % 28 + 1 )))
    hr=$((60 + (i % 35)))
    sys=$((105 + (i % 30)))
    dia=$((65 + (i % 18)))
    temp="36.$((5 + (i % 6)))"
    rr=$((12 + (i % 8)))

    printf '%s,%s,%s,%s,%s,%s,%s\n' "$pid" "$day" "$hr" "$sys" "$dia" "$temp" "$rr" >> "$f"
  done
}

write_meds_tsv() {
  local f="${RAW_DIR}/meds.tsv"
  : > "$f"
  printf 'patient_id\tmed_name\tdose\tunit\tfrequency\n' >> "$f"

  # 120 data rows + 1 header = 121 lines total
  local i pid med dose unit freq
  for i in $(seq 1 120); do
    pid=$(printf 'P%03d' $(( (i - 1) % 30 + 1 )))

    case $(( i % 6 )) in
      0) med="Metformin";    dose="500"; unit="mg";   freq="BID" ;;
      1) med="Lisinopril";   dose="10";  unit="mg";   freq="QD"  ;;
      2) med="Atorvastatin"; dose="20";  unit="mg";   freq="QHS" ;;
      3) med="Aspirin";      dose="81";  unit="mg";   freq="QD"  ;;
      4) med="Levothyroxine";dose="50";  unit="mcg";  freq="QD"  ;;
      5) med="Albuterol";    dose="2";   unit="puffs";freq="PRN" ;;
    esac

    printf '%s\t%s\t%s\t%s\t%s\n' "$pid" "$med" "$dose" "$unit" "$freq" >> "$f"
  done
}

write_data_dictionary() {
  local f="${DOCS_DIR}/data_dictionary.txt"
  : > "$f"

  # Make this file >101 lines too
  printf '%s\n' 'Module 2 clinic_demo data dictionary' >> "$f"
  printf '%s\n' 'This file documents the small practice datasets used in Module 2.' >> "$f"
  printf '%s\n' '' >> "$f"
  printf '%s\n' '[labs.csv]' >> "$f"
  printf '%s\n' 'patient_id      : Patient identifier (e.g., P001)' >> "$f"
  printf '%s\n' 'visit_date      : Visit date (YYYY-MM-DD)' >> "$f"
  printf '%s\n' 'test_name       : Lab test name (Glucose, HbA1c, etc.)' >> "$f"
  printf '%s\n' 'result_value    : Measured result value' >> "$f"
  printf '%s\n' 'unit            : Measurement unit (mg/dL, mmol/L, etc.)' >> "$f"
  printf '%s\n' '' >> "$f"
  printf '%s\n' '[vitals.csv]' >> "$f"
  printf '%s\n' 'patient_id      : Patient identifier (e.g., P001)' >> "$f"
  printf '%s\n' 'visit_date      : Visit date (YYYY-MM-DD)' >> "$f"
  printf '%s\n' 'heart_rate      : Heart rate (beats per minute)' >> "$f"
  printf '%s\n' 'bp_systolic     : Systolic blood pressure (mmHg)' >> "$f"
  printf '%s\n' 'bp_diastolic    : Diastolic blood pressure (mmHg)' >> "$f"
  printf '%s\n' 'temperature_c   : Body temperature (Celsius)' >> "$f"
  printf '%s\n' 'resp_rate       : Respiratory rate (breaths per minute)' >> "$f"
  printf '%s\n' '' >> "$f"
  printf '%s\n' '[meds.tsv]' >> "$f"
  printf '%s\n' 'patient_id      : Patient identifier (e.g., P001)' >> "$f"
  printf '%s\n' 'med_name        : Medication name' >> "$f"
  printf '%s\n' 'dose            : Dose value' >> "$f"
  printf '%s\n' 'unit            : Dose unit (mg, mcg, puffs)' >> "$f"
  printf '%s\n' 'frequency       : Dosing frequency (QD, BID, QHS, PRN)' >> "$f"
  printf '%s\n' '' >> "$f"
  printf '%s\n' 'Notes:' >> "$f"
  printf '%s\n' '- These datasets are synthetic and for teaching only.' >> "$f"
  printf '%s\n' '- Files are plain text so they can be previewed with head/tail/less.' >> "$f"
  printf '%s\n' '- CSV files use commas; TSV files use tabs.' >> "$f"
  printf '%s\n' '- In Module 2, students should save outputs in practice/.' >> "$f"

  # Pad to at least 101 lines
  local current_lines
  current_lines=$(wc -l < "$f")
  local n
  for n in $(seq $((current_lines + 1)) 110); do
    printf 'Reference note line %03d: preview first, then filter, then save output in practice/.\n' "$n" >> "$f"
  done
}

write_hello_script() {
  local f="${SCRIPTS_DIR}/hello.sh"
  cat > "$f" <<'EOF'
#!/usr/bin/env bash
echo "Hello from module2/scripts/hello.sh"
EOF

  # Intentionally NOT executable so students can practice chmod +x
  chmod 644 "$f"
}

write_lab_setup_script() {
  local f="${SCRIPTS_DIR}/setup_module2_lab_activity.sh"
  cat > "$f" <<'EOF'
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
EOF

  # Intentionally NOT executable (students must chmod +x)
  chmod 644 "$f"
}

write_assignment_setup_script() {
  local f="${SCRIPTS_DIR}/setup_module2_assignment.sh"
  cat > "$f" <<'EOF'
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
EOF

  # Intentionally NOT executable (students must chmod +x)
  chmod 644 "$f"
}

###############################################################################
# Build content
###############################################################################

write_labs_csv
write_vitals_csv
write_meds_tsv
write_data_dictionary
write_hello_script
write_lab_setup_script
write_assignment_setup_script

# practice/ intentionally mostly empty (students create outputs there)
# We leave only directories unless you want placeholders.

echo "Module 2 content setup completed successfully at: ${MODULE2_DIR}"

