#!/usr/bin/env bash
# BIO 2110 Module 4 - Lab Activity 4 workspace setup
# Builds contents/module4/lab_activity4/biomed_text_demo/{raw,docs} and lab_activity4/practice/.
# Same folder shape and file names as the chapter demo, larger data, so the chapter's numbers do not carry over.
# Run from anywhere inside the repo:
#   bash contents/module4/scripts/setup_module4_lab_activity.sh
# Safe to rerun: raw/ and docs/ are regenerated, practice/ is never touched.

set -e
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MOD="$(cd "$HERE/.." && pwd)"
LAB="$MOD/lab_activity4/biomed_text_demo"
PRAC="$MOD/lab_activity4/practice"

mkdir -p "$LAB/raw" "$LAB/docs" "$PRAC"

# ---------- labs_dirty.csv : 120 rows, 6 fields ----------
awk 'BEGIN {
  OFS=",";
  np=30; nt=7; nd=11; ns=5;
  split("Glu Glucose Creatinine HbA1c Sodium Potassium Glu", tests, " ");
  split("2025-03-03 2025-03-04 2025-03-05 2025-03-06 2025-03-07 2025-03-10 2025-03-11 2025-03-12 2025-03-13 2025-03-14 2025-03-17", dates, " ");
  split("Final Final Prelim Final Corrected", stat, " ");
  print "patient_id","visit_date","test_name","result_value","unit","status";
  for (i=1; i<=120; i++) {
    p = sprintf("P%03d", 100 + ((i-1) % np) + 1);
    t = tests[((i-1) % nt) + 1];
    d = dates[((i-1) % nd) + 1];
    s = stat[((i-1) % ns) + 1];
    if (t == "Glu" || t == "Glucose") { v = 70 + ((i*37) % 140); u = "mg/dL"; }
    else if (t == "Creatinine")       { v = sprintf("%.1f", 0.6 + ((i*13) % 16) / 10); u = "mg/dL"; }
    else if (t == "HbA1c")            { v = sprintf("%.1f", 4.9 + ((i*7) % 45) / 10); u = "%"; }
    else if (t == "Sodium")           { v = 130 + ((i*11) % 18); u = "mmol/L"; }
    else                              { v = sprintf("%.1f", 3.2 + ((i*5) % 25) / 10); u = "mmol/L"; }
    if (i % 29 == 0) v = "NA";
    print p, d, t, v, u, s;
  }
}' > "$LAB/raw/labs_dirty.csv"

# ---------- vitals.tsv : 60 rows, 5 fields, TAB separated ----------
awk 'BEGIN {
  OFS="\t";
  np=15; nm=4;
  split("HR SBP Temp SpO2", met, " ");
  split("bpm mmHg C %", unit, " ");
  print "patient_id","visit_date","metric","value","unit";
  for (i=1; i<=60; i++) {
    pi = ((i-1) % np) + 1;
    mi = ((i-1) % nm) + 1;
    p = sprintf("P%03d", 100 + pi);
    d = sprintf("2025-03-%02d", 3 + (pi % 12));
    m = met[mi];
    if (m == "HR")        v = 58 + ((i*17) % 50);
    else if (m == "SBP")  v = 108 + ((i*23) % 52);
    else if (m == "Temp") v = sprintf("%.1f", 36.2 + ((i*3) % 21) / 10);
    else                  v = 92 + ((i*7) % 8);
    print p, d, m, v, unit[mi];
  }
}' > "$LAB/raw/vitals.tsv"

# ---------- notes.txt : free text with blanks, comments, NA, ERROR ----------
cat > "$LAB/raw/notes.txt" <<'EOF'
# Clinic intake notes, March 2025, morning block
# NA means the value was not recorded at intake.

P101 arrived 08:05, fasting confirmed, glucose drawn
P101 weight 70 kg, height 168 cm

P102 arrived 08:20, not fasting, sample drawn anyway
P102 weight NA, height 175 cm
ERROR: P102 barcode unreadable, tube relabeled by hand

P103 arrived 08:40, fasting confirmed
P103 weight 82 kg, height NA

P104 arrived 09:00, reports dizziness on standing
P104 weight 91 kg, height 181 cm
WARNING: P104 systolic above 150, flagged for provider

P105 arrived 09:15, fasting confirmed
P105 weight 58 kg, height 159 cm

# Late morning
P106 arrived 10:10, fasting NA (patient unsure)
P106 weight 77 kg, height 170 cm

P107 arrived 10:30, fasting confirmed, glucose drawn
P107 weight NA, height NA
ERROR: P107 glucose tube hemolyzed, redraw scheduled

P108 arrived 10:45, fasting confirmed
P108 weight 66 kg, height 163 cm
WARNING: P108 temperature 38.2 C, flagged for provider

P109 arrived 11:05, not fasting
P109 weight 88 kg, height 178 cm

# Afternoon block
P110 arrived 13:10, fasting confirmed, glucose drawn
P110 weight 73 kg, height 171 cm

ERROR: P110 sample left at room temperature, result rejected
EOF

# ---------- docs/data_dictionary.txt ----------
cat > "$LAB/docs/data_dictionary.txt" <<'EOF'
Lab Activity 4 data dictionary (lab_activity4/biomed_text_demo/raw)

labs_dirty.csv  (comma separated, 6 fields, header row + 120 data rows)
  1 patient_id    P101 to P130
  2 visit_date    YYYY-MM-DD, March 2025
  3 test_name     Glu or Glucose (same test, two spellings), Creatinine,
                  HbA1c, Sodium, Potassium
  4 result_value  a number, or NA when no result was available
  5 unit          mg/dL, %, mmol/L
  6 status        Final, Prelim or Corrected

vitals.tsv  (TAB separated, 5 fields, header row + 60 data rows)
  1 patient_id    P101 to P115
  2 visit_date
  3 metric        HR, SBP, Temp, SpO2
  4 value
  5 unit          bpm, mmHg, C, %

notes.txt  (free text, one note per line, 40 lines)
  Lines starting with # are comments. Blank lines separate patients.
  NA marks a value that was not recorded.
  Lines starting with ERROR: or WARNING: are system messages.

Rules: never edit anything in raw/. Every result is a new file in ../../practice/.
Rerunning the setup script rebuilds raw/ and docs/ and leaves practice/ alone.
EOF

[ -f "$PRAC/README.txt" ] || cat > "$PRAC/README.txt" <<'EOF'
Save every file you create during Lab Activity 4 in this folder.
The setup script never deletes anything here.
EOF

echo "Lab Activity 4 workspace ready at: $MOD/lab_activity4"
echo "Spot check (expect 121, 61, 40):"
wc -l "$LAB/raw/labs_dirty.csv" "$LAB/raw/vitals.tsv" "$LAB/raw/notes.txt" | sed '$d'
