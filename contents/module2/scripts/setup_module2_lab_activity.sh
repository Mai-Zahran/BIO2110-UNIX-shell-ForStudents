#!/usr/bin/env bash
set -euo pipefail

# Run from contents/module2/scripts/ after making executable:
# chmod +x setup_module2_lab_activity.sh
# ./setup_module2_lab_activity.sh

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LAB_DIR="${BASE_DIR}/lab_activity2"

# Note: practice/work and practice/results are intentionally NOT created here.
# Students build those themselves in Activity 6 (mkdir -p), matching the
# Module 1 pedagogy of hand-building their own workspace.
mkdir -p "${LAB_DIR}"/clinical "${LAB_DIR}"/bio "${LAB_DIR}"/devices \
         "${LAB_DIR}"/streams "${LAB_DIR}"/permissions "${LAB_DIR}"/outputs \
         "${LAB_DIR}"/tmp

# ---------- clinical/patients.csv ----------
{
  echo "patient_id,name,age,sex,insurance"
  ins=("Medicare" "Medicaid" "Private" "Uninsured")
  for i in $(seq 1 100); do
    age=$(( (RANDOM % 70) + 18 ))
    sex=$([ $((RANDOM % 2)) -eq 0 ] && echo "F" || echo "M")
    echo "P${i},Patient${i},${age},${sex},${ins[$((RANDOM % 4))]}"
  done
} > "${LAB_DIR}/clinical/patients.csv"

# ---------- clinical/visits.csv (field3=department, field4=room, field6=status) ----------
{
  echo "visit_id,patient_id,department,room,visit_date,status"
  depts=("Cardiology" "Radiology" "Oncology" "Pediatrics" "Emergency" "Neurology")
  rooms=("101" "102" "103" "104" "105")
  statuses=("Completed" "Cancelled" "NoShow" "Scheduled")
  for i in $(seq 1 100); do
    d="2026-0$(( (RANDOM % 9)+1 ))-$(printf '%02d' $(( (RANDOM % 28)+1 )))"
    echo "V${i},P$(( (RANDOM % 100)+1 )),${depts[$((RANDOM % 6))]},${rooms[$((RANDOM % 5))]},${d},${statuses[$((RANDOM % 4))]}"
  done
} > "${LAB_DIR}/clinical/visits.csv"

# ---------- clinical/labs.csv (field3=test_name) ----------
{
  echo "lab_id,patient_id,test_name,value,unit,test_date"
  tests=("Glucose" "Hemoglobin" "Cholesterol" "Creatinine" "WBC" "Platelets")
  for i in $(seq 1 100); do
    d="2026-0$(( (RANDOM % 9)+1 ))-$(printf '%02d' $(( (RANDOM % 28)+1 )))"
    val=$(( (RANDOM % 200)+1 ))
    echo "L${i},P$(( (RANDOM % 100)+1 )),${tests[$((RANDOM % 6))]},${val},mg/dL,${d}"
  done
} > "${LAB_DIR}/clinical/labs.csv"

# ---------- bio/gene_counts.tsv (field1=gene_id, field4=pathway) ----------
{
  printf "gene_id\tsample_id\tcount\tpathway\n"
  pathways=("Apoptosis" "CellCycle" "Metabolism" "Signaling" "Immune")
  for i in $(seq 1 100); do
    printf "GENE%03d\tS%02d\t%d\t%s\n" "$i" "$(( (RANDOM % 10)+1 ))" "$(( RANDOM % 5000 ))" "${pathways[$((RANDOM % 5))]}"
  done
} > "${LAB_DIR}/bio/gene_counts.tsv"

# ---------- bio/sample_manifest.csv ----------
{
  echo "sample_id,tissue,collection_date"
  tissues=("Liver" "Brain" "Blood" "Lung" "Kidney")
  for i in $(seq 1 10); do
    d="2026-0$(( (RANDOM % 9)+1 ))-$(printf '%02d' $(( (RANDOM % 28)+1 )))"
    printf "S%02d,%s,%s\n" "$i" "${tissues[$((RANDOM % 5))]}" "$d"
  done
} > "${LAB_DIR}/bio/sample_manifest.csv"

# ---------- devices/ecg_events.txt (pipe-delimited, field4=event, includes ALERT) ----------
{
  echo "event_id|device_id|timestamp|event"
  events=("NORMAL" "ALERT" "LOW" "HIGH")
  for i in $(seq 1 100); do
    ts="2026-06-01T$(printf '%02d' $((RANDOM % 24))):$(printf '%02d' $((RANDOM % 60))):00"
    echo "E${i}|D$(( (RANDOM % 5)+1 ))|${ts}|${events[$((RANDOM % 4))]}"
  done
} > "${LAB_DIR}/devices/ecg_events.txt"

# ---------- streams/vitals_stream.txt ----------
{
  for i in $(seq 1 50); do
    hr=$(( (RANDOM % 60)+60 ))
    echo "t=${i} hr=${hr}bpm"
  done
} > "${LAB_DIR}/streams/vitals_stream.txt"

# ---------- streams/department_values.txt ----------
{
  depts=("Cardiology" "Radiology" "Oncology" "Pediatrics" "Emergency" "Neurology")
  for i in $(seq 1 100); do
    echo "${depts[$((RANDOM % 6))]}"
  done
} > "${LAB_DIR}/streams/department_values.txt"

# ---------- permissions/ scripts (start non-executable on purpose) ----------
cat > "${LAB_DIR}/permissions/run_after_chmod.sh" <<'SH'
#!/usr/bin/env bash
echo "Script ran successfully after chmod u+x."
SH

cat > "${LAB_DIR}/permissions/run_student_report.sh" <<'SH'
#!/usr/bin/env bash
echo "Student report script ran successfully."
SH
chmod -x "${LAB_DIR}/permissions/run_after_chmod.sh" "${LAB_DIR}/permissions/run_student_report.sh"

# ---------- tmp/delete_me.txt (safe-delete practice target) ----------
echo "Safe to delete during Activity 6." > "${LAB_DIR}/tmp/delete_me.txt"

echo "Module 2 Lab Activity 2 setup created at: ${LAB_DIR}"
