#!/usr/bin/env bash
# BIO 2110 Module 4 - Practice Assignment 4 workspace setup
# Builds contents/module4/practice/biomed_text_demo/raw/ and practice/outputs/.
# Run from anywhere inside the repo:
#   bash contents/module4/scripts/setup_module4_assignment.sh
# Safe to rerun: raw/ is regenerated, outputs/ is never touched.
# The files have the same names and columns as the Book Chapter 4 demo files,
# but more rows and a few new surprises, so the chapter's answers will not match.

set -e
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MOD="$(cd "$HERE/.." && pwd)"
PR="$MOD/practice"

mkdir -p "$PR/biomed_text_demo/raw" "$PR/outputs"

# ---------- labs_dirty.csv : 90 rows, 6 fields ----------
awk 'BEGIN {
  OFS=",";
  np=25; nt=8; nd=13; ns=5;
  split("Glu Creatinine Glucose HbA1c glucose Sodium Glu Potassium", tests, " ");
  split("2025-04-01 2025-04-02 2025-04-03 2025-04-04 2025-04-07 2025-04-08 2025-04-09 2025-04-10 2025-04-11 2025-04-14 2025-04-15 2025-04-16 2025-04-17", dates, " ");
  split("Final Prelim Final Final Corrected", stat, " ");
  print "patient_id","visit_date","test_name","result_value","unit","status";
  for (i=1; i<=90; i++) {
    p = sprintf("P%03d", 200 + ((i-1) % np) + 1);
    t = tests[((i-1) % nt) + 1];
    d = dates[((i-1) % nd) + 1];
    s = stat[((i-1) % ns) + 1];
    if (t == "Glu" || t == "Glucose" || t == "glucose") { v = 68 + ((i*41) % 150); u = "mg/dL"; }
    else if (t == "Creatinine") { v = sprintf("%.1f", 0.6 + ((i*11) % 17) / 10); u = "mg/dL"; }
    else if (t == "HbA1c")      { v = sprintf("%.1f", 5.0 + ((i*9) % 42) / 10); u = "%"; }
    else if (t == "Sodium")     { v = 129 + ((i*13) % 20); u = "mmol/L"; }
    else                        { v = sprintf("%.1f", 3.1 + ((i*7) % 27) / 10); u = "mmol/L"; }
    if (i % 23 == 0) v = "NA";
    print p, d, t, v, u, s;
  }
}' > "$PR/biomed_text_demo/raw/labs_dirty.csv"

# ---------- vitals.tsv : 44 rows, 5 fields, TAB separated ----------
awk 'BEGIN {
  OFS="\t";
  np=11; nm=4;
  split("HR SBP Temp SpO2", met, " ");
  split("bpm mmHg C %", unit, " ");
  print "patient_id","visit_date","metric","value","unit";
  for (i=1; i<=44; i++) {
    pi = ((i-1) % np) + 1;
    mi = ((i-1) % nm) + 1;
    p = sprintf("P%03d", 200 + pi);
    d = sprintf("2025-04-%02d", 1 + (pi % 10));
    m = met[mi];
    if (m == "HR")        v = 55 + ((i*19) % 56);
    else if (m == "SBP")  v = 104 + ((i*29) % 60);
    else if (m == "Temp") v = sprintf("%.1f", 36.0 + ((i*3) % 24) / 10);
    else                  v = 91 + ((i*5) % 9);
    print p, d, m, v, unit[mi];
  }
}' > "$PR/biomed_text_demo/raw/vitals.tsv"

# ---------- notes.txt ----------
cat > "$PR/biomed_text_demo/raw/notes.txt" <<'EOF'
# Clinic intake notes, April 2025
# NA means the value was not recorded.

P201 arrived 08:00, fasting confirmed, glucose drawn
P201 weight 69 kg, height 166 cm

P202 arrived 08:25, not fasting
P202 weight NA, height 174 cm
ERROR: P202 tube label mismatch, sample relabeled

P203 arrived 08:50, fasting confirmed
P203 weight 84 kg, height NA

P204 arrived 09:10, reports headache
P204 weight 90 kg, height 179 cm
WARNING: P204 systolic above 150, flagged for provider

# Mid-morning
P205 arrived 09:40, fasting NA (patient unsure)
P205 weight 61 kg, height 158 cm

P206 arrived 10:05, fasting confirmed, glucose drawn
P206 weight NA, height NA
ERROR: P206 glucose sample hemolyzed, redraw scheduled

P207 arrived 10:30, fasting confirmed
P207 weight 75 kg, height 169 cm
WARNING: P207 temperature 38.4 C, flagged for provider

P208 arrived 11:00, not fasting
P208 weight 87 kg, height 177 cm

ERROR: P208 result rejected, sample stored too long
EOF

[ -f "$PR/outputs/README.txt" ] || cat > "$PR/outputs/README.txt" <<'EOF'
Save every file you create during Practice Assignment 4 in this folder.
The setup script never deletes anything here.
EOF

echo "Practice Assignment 4 workspace ready at: $PR/biomed_text_demo"
echo "Spot check (expect 91, 45, 33):"
wc -l "$PR/biomed_text_demo/raw/labs_dirty.csv" "$PR/biomed_text_demo/raw/vitals.tsv" "$PR/biomed_text_demo/raw/notes.txt" | sed '$d'
