#!/usr/bin/env bash
set -euo pipefail

# Practice Assignment 2 setup.
# Run from contents/module2/scripts/ after:
#   chmod u+x setup_module2_assignment.sh
#   ./setup_module2_assignment.sh
#
# Safe to re-run. Existing data files are never overwritten; only missing
# pieces are created so the workspace matches Book Chapter 2 (Figure 1)
# and Practice Assignment 2.

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
RAW_DIR="${BASE_DIR}/clinic_demo/raw"
DOCS_DIR="${BASE_DIR}/clinic_demo/docs"
SCRIPTS_DIR="${BASE_DIR}/scripts"
PRACTICE_DIR="${BASE_DIR}/practice"

mkdir -p "${RAW_DIR}" "${DOCS_DIR}" "${SCRIPTS_DIR}" "${PRACTICE_DIR}"

# ---------- clinic_demo/raw/labs.csv (field 3 = test_name; includes Glucose) ----------
# Header matches the example shown in Book Chapter 2, section 5.1.
if [ ! -f "${RAW_DIR}/labs.csv" ]; then
  {
    echo "patient_id,visit_date,test_name,result_value,unit"
    tests=("Glucose" "Hemoglobin" "Cholesterol" "Creatinine" "WBC" "Platelets")
    for i in $(seq 1 100); do
      d="2025-0$(( (RANDOM % 9)+1 ))-$(printf '%02d' $(( (RANDOM % 28)+1 )))"
      printf "P%03d,%s,%s,%d,mg/dL\n" "$(( (RANDOM % 50)+1 ))" "$d" "${tests[$((RANDOM % 6))]}" "$(( (RANDOM % 200)+1 ))"
    done
  } > "${RAW_DIR}/labs.csv"
fi

# ---------- clinic_demo/raw/vitals.csv ----------
if [ ! -f "${RAW_DIR}/vitals.csv" ]; then
  {
    echo "patient_id,visit_date,heart_rate,systolic_bp,diastolic_bp,temp_c"
    for i in $(seq 1 100); do
      d="2025-0$(( (RANDOM % 9)+1 ))-$(printf '%02d' $(( (RANDOM % 28)+1 )))"
      printf "P%03d,%s,%d,%d,%d,%d.%d\n" "$(( (RANDOM % 50)+1 ))" "$d" \
        "$(( (RANDOM % 60)+60 ))" "$(( (RANDOM % 50)+100 ))" "$(( (RANDOM % 30)+60 ))" \
        "$(( (RANDOM % 3)+36 ))" "$(( RANDOM % 10 ))"
    done
  } > "${RAW_DIR}/vitals.csv"
fi

# ---------- clinic_demo/raw/meds.tsv (field 2 = medication, field 3 = route) ----------
if [ ! -f "${RAW_DIR}/meds.tsv" ]; then
  {
    printf "patient_id\tmedication\troute\tdose_mg\tstart_date\n"
    meds=("Metformin" "Lisinopril" "Atorvastatin" "Amlodipine" "Insulin" "Aspirin")
    routes=("oral" "oral" "oral" "subcutaneous" "IV")
    for i in $(seq 1 100); do
      d="2025-0$(( (RANDOM % 9)+1 ))-$(printf '%02d' $(( (RANDOM % 28)+1 )))"
      printf "P%03d\t%s\t%s\t%d\t%s\n" "$(( (RANDOM % 50)+1 ))" "${meds[$((RANDOM % 6))]}" \
        "${routes[$((RANDOM % 5))]}" "$(( ((RANDOM % 10)+1) * 5 ))" "$d"
    done
  } > "${RAW_DIR}/meds.tsv"
fi

# ---------- clinic_demo/docs/data_dictionary.txt ----------
if [ ! -f "${DOCS_DIR}/data_dictionary.txt" ]; then
  cat > "${DOCS_DIR}/data_dictionary.txt" <<'TXT'
Module 2 clinic_demo data dictionary

labs.csv (comma-separated)
  patient_id    P001-P050
  visit_date    YYYY-MM-DD
  test_name     lab test (Glucose, Hemoglobin, Cholesterol, Creatinine, WBC, Platelets)
  result_value  numeric result
  unit          mg/dL

vitals.csv (comma-separated)
  patient_id, visit_date, heart_rate (bpm), systolic_bp, diastolic_bp (mmHg), temp_c

meds.tsv (tab-separated)
  patient_id, medication, route (oral / subcutaneous / IV), dose_mg, start_date
TXT
fi

# ---------- scripts/hello.sh (starts non-executable on purpose) ----------
if [ ! -f "${SCRIPTS_DIR}/hello.sh" ]; then
  cat > "${SCRIPTS_DIR}/hello.sh" <<'SH'
#!/usr/bin/env bash
echo "Hello from Module 2. Your shell can run scripts."
SH
fi
chmod -x "${SCRIPTS_DIR}/hello.sh"

echo "Practice Assignment 2 workspace ready."
echo "  Raw data:       ${RAW_DIR}"
echo "  Save outputs:   ${PRACTICE_DIR}"
echo "  Script to fix:  ${SCRIPTS_DIR}/hello.sh"
