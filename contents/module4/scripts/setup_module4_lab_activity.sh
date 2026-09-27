#!/usr/bin/env bash
# setup_module4_lab_activity.sh
# Builds the lab_activity4 workspace for BIO 2110 Module 4 with synthetic data.
# Safe to run again: data files are rewritten; practice/ outputs are never touched.
set -e
HERE="$(cd "$(dirname "$0")" && pwd)"
ROOT="$HERE/../lab_activity4"
mkdir -p "$ROOT/practice" "$ROOT/biomed_text_demo/raw" "$ROOT/biomed_text_demo/docs"
cd "$ROOT"
# One-time, silent: tell this clone of the repository to ignore permission changes,
# so that the chmod +x students ran on this script never blocks a later git pull.
git -C "$HERE" config core.fileMode false 2>/dev/null || true
cat > biomed_text_demo/raw/labs_dirty.csv <<'__EOF__'
patient_id,visit_date,test_name,result_value,unit,status
P148,2025-06-08,Sodium,NA,mmol/L,Final
P132,2025-07-15,HbA1c,11.0,%,Prelim
P126,2025-01-01,HbA1c,5.9,%,Final
P144,2025-04-08,HbA1c,5.8,%,Prelim
P152,2025-05-08,HbA1c,5.1,%,Final
P125,2025-05-15,Glucose,218,mg/dL,Final
P124,2025-05-01,Glu,219,mg/dL,Prelim
P129,2025-01-15,Creatinine,NA,mg/dL,Final
P151,2025-01-01,Creatinine,2.2,mg/dL,Corrected
P104,2025-07-08,Sodium,129,mmol/L,Prelim
P128,2025-09-22,LDL,163,mg/dL,Final
P158,2025-04-08,Creatinine,0.6,mg/dL,Final
P116,2025-09-15,Sodium,134,mmol/L,Final
P154,2025-06-22,Creatinine,1.3,mg/dL,Final
P141,2025-09-22,Sodium,NA,mmol/L,Final
P127,2025-07-15,Creatinine,1.4,mg/dL,Corrected
P152,2025-01-22,LDL,95,mg/dL,Final
P106,2025-01-22,LDL,66,mg/dL,Final
P136,2025-05-22,LDL,121,mg/dL,Prelim
P142,2025-01-01,Creatinine,0.7,mg/dL,Final
P142,2025-07-08,Glu,185,mg/dL,Final
P159,2025-09-15,Glu,NA,mg/dL,Prelim
P113,2025-08-22,Creatinine,2.3,mg/dL,Final
P114,2025-01-15,Creatinine,2.5,mg/dL,Final
P104,2025-09-15,Glucose,98,mg/dL,Final
P123,2025-01-22,LDL,81,mg/dL,Prelim
P135,2025-06-08,HbA1c,9.6,%,Prelim
P144,2025-04-15,Sodium,131,mmol/L,Final
P157,2025-02-08,HbA1c,NA,%,Prelim
P113,2025-08-15,HbA1c,9.5,%,Final
P145,2025-04-22,Creatinine,3.0,mg/dL,Corrected
P107,2025-03-08,Creatinine,2.4,mg/dL,Final
P130,2025-08-15,HbA1c,10.7,%,Final
P122,2025-07-08,HbA1c,9.6,%,Corrected
P145,2025-03-01,Sodium,150,mmol/L,Prelim
P157,2025-01-08,Sodium,147,mmol/L,Final
P150,2025-02-08,Glu,196,mg/dL,Corrected
P147,2025-02-22,Glu,82,mg/dL,Corrected
P135,2025-06-22,Glu,197,mg/dL,Final
P151,2025-09-08,HbA1c,10.7,%,Final
P134,2025-09-01,Creatinine,1.2,mg/dL,Final
P133,2025-04-08,Glu,217,mg/dL,Prelim
P105,2025-06-08,HbA1c,8.7,%,Final
P101,2025-06-22,HbA1c,10.8,%,Final
P116,2025-07-01,HbA1c,7.6,%,Corrected
P130,2025-05-22,Sodium,142,mmol/L,Prelim
P114,2025-04-22,Glucose,192,mg/dL,Final
P109,2025-09-15,Sodium,138,mmol/L,Final
P159,2025-07-15,Creatinine,1.4,mg/dL,Corrected
P150,2025-04-01,Glu,236,mg/dL,Final
P137,2025-08-01,LDL,104,mg/dL,Corrected
P141,2025-02-08,LDL,125,mg/dL,Final
P121,2025-01-01,HbA1c,10.7,%,Final
P152,2025-08-22,Sodium,130,mmol/L,Final
P104,2025-06-01,HbA1c,5.2,%,Final
P132,2025-02-15,Sodium,133,mmol/L,Final
P121,2025-09-15,Creatinine,1.1,mg/dL,Final
P119,2025-01-15,Creatinine,0.8,mg/dL,Corrected
P154,2025-08-01,Glu,143,mg/dL,Final
P103,2025-04-01,Glu,244,mg/dL,Final
P153,2025-09-22,LDL,194,mg/dL,Final
P154,2025-05-22,Sodium,144,mmol/L,Final
P142,2025-02-22,Glu,159,mg/dL,Corrected
P130,2025-04-15,LDL,216,mg/dL,Final
P159,2025-06-08,Glu,77,mg/dL,Final
P115,2025-01-01,Glucose,114,mg/dL,Final
P102,2025-03-01,LDL,159,mg/dL,Final
P110,2025-01-01,LDL,216,mg/dL,Corrected
P140,2025-03-01,Creatinine,2.3,mg/dL,Corrected
P155,2025-03-15,Glu,191,mg/dL,Corrected
P133,2025-03-01,HbA1c,5.9,%,Corrected
P158,2025-07-08,LDL,165,mg/dL,Corrected
P119,2025-05-08,Creatinine,0.8,mg/dL,Final
P146,2025-03-08,Creatinine,2.7,mg/dL,Final
P131,2025-02-22,Creatinine,1.0,mg/dL,Final
P102,2025-03-01,HbA1c,4.9,%,Final
P151,2025-06-15,HbA1c,5.2,%,Final
P128,2025-01-22,HbA1c,6.3,%,Corrected
P107,2025-08-01,Sodium,142,mmol/L,Final
P139,2025-05-15,Creatinine,1.0,mg/dL,Prelim
P146,2025-03-15,Glucose,183,mg/dL,Final
P125,2025-04-22,LDL,129,mg/dL,Final
P117,2025-02-15,Glu,98,mg/dL,Final
P109,2025-09-08,LDL,145,mg/dL,Prelim
P123,2025-05-01,Sodium,132,mmol/L,Prelim
P152,2025-08-15,Creatinine,0.7,mg/dL,Final
P109,2025-07-01,Creatinine,1.2,mg/dL,Prelim
P146,2025-07-08,LDL,203,mg/dL,Final
P120,2025-09-22,Glucose,177,mg/dL,Final
P127,2025-05-22,HbA1c,5.2,%,Final
P152,2025-03-22,Glu,246,mg/dL,Final
P139,2025-04-01,Glu,87,mg/dL,Final
P147,2025-07-01,Sodium,130,mmol/L,Prelim
P143,2025-02-22,LDL,144,mg/dL,Prelim
P151,2025-02-08,HbA1c,9.6,%,Final
P141,2025-04-01,Glu,89,mg/dL,Final
P128,2025-03-08,Glucose,219,mg/dL,Final
P156,2025-06-01,LDL,142,mg/dL,Prelim
P141,2025-09-01,Sodium,150,mmol/L,Corrected
P158,2025-06-15,Creatinine,2.0,mg/dL,Final
P144,2025-06-15,Creatinine,2.5,mg/dL,Prelim
P129,2025-06-08,Sodium,128,mmol/L,Corrected
P113,2025-02-08,Creatinine,1.8,mg/dL,Corrected
P114,2025-03-08,Sodium,129,mmol/L,Corrected
P133,2025-04-15,Sodium,134,mmol/L,Final
P134,2025-07-08,Glu,112,mg/dL,Final
P139,2025-07-22,LDL,69,mg/dL,Corrected
P108,2025-08-15,LDL,153,mg/dL,Prelim
P146,2025-06-15,HbA1c,6.0,%,Corrected
P117,2025-01-15,Creatinine,2.7,mg/dL,Final
P133,2025-03-15,LDL,155,mg/dL,Final
P106,2025-02-22,Glucose,141,mg/dL,Final
P103,2025-09-01,Glucose,182,mg/dL,Corrected
P117,2025-01-15,Glucose,215,mg/dL,Final
P156,2025-01-22,Glu,70,mg/dL,Final
P144,2025-06-01,Sodium,147,mmol/L,Corrected
P140,2025-06-22,HbA1c,10.6,%,Final
P131,2025-06-08,Creatinine,0.9,mg/dL,Final
P140,2025-09-08,Glucose,146,mg/dL,Final
P121,2025-08-15,Glucose,257,mg/dL,Corrected
P106,2025-03-08,Glucose,70,mg/dL,Prelim
P114,2025-07-08,HbA1c,5.8,%,Final
P118,2025-06-15,Glucose,152,mg/dL,Corrected
P102,2025-02-08,Glu,183,mg/dL,Final
P110,2025-09-01,Creatinine,3.0,mg/dL,Prelim
P140,2025-08-22,Sodium,128,mmol/L,Final
P107,2025-01-22,Glu,246,mg/dL,Corrected
P130,2025-01-15,Glucose,242,mg/dL,Final
P107,2025-02-08,Glu,119,mg/dL,Final
P135,2025-02-22,Sodium,132,mmol/L,Final
P135,2025-04-01,Glucose,252,mg/dL,Final
P127,2025-05-08,LDL,64,mg/dL,Prelim
P154,2025-06-22,Glu,152,mg/dL,Final
P124,2025-01-15,Glucose,99,mg/dL,Prelim
P156,2025-04-15,Creatinine,1.2,mg/dL,Final
P119,2025-05-22,Glu,170,mg/dL,Final
P107,2025-01-15,HbA1c,4.8,%,Final
P134,2025-01-01,Glucose,116,mg/dL,Corrected
P116,2025-07-15,HbA1c,10.2,%,Final
P116,2025-02-08,Glu,214,mg/dL,Final
P121,2025-08-22,Creatinine,2.0,mg/dL,Final
P115,2025-09-15,Glu,166,mg/dL,Prelim
P150,2025-07-01,HbA1c,7.8,%,Final
P153,2025-08-15,Creatinine,0.9,mg/dL,Final
P158,2025-07-01,Sodium,150,mmol/L,Final
P151,2025-01-15,Glucose,105,mg/dL,Final
P129,2025-01-15,Glucose,200,mg/dL,Final
P159,2025-01-01,LDL,150,mg/dL,Prelim
P157,2025-07-01,LDL,107,mg/dL,Final
P110,2025-04-22,Creatinine,2.4,mg/dL,Prelim
P160,2025-09-08,LDL,108,mg/dL,Prelim
P155,2025-03-22,Glucose,96,mg/dL,Final
P127,2025-06-01,Glu,257,mg/dL,Final
P108,2025-06-08,Creatinine,0.7,mg/dL,Prelim
P102,2025-06-22,LDL,81,mg/dL,Corrected
P128,2025-06-01,LDL,208,mg/dL,Final
P154,2025-07-15,HbA1c,6.8,%,Prelim
P123,2025-05-08,Sodium,129,mmol/L,Final
P101,2025-03-08,LDL,219,mg/dL,Prelim
P119,2025-07-22,LDL,166,mg/dL,Prelim
P138,2025-02-15,Creatinine,1.8,mg/dL,Prelim
P124,2025-06-01,HbA1c,5.6,%,Final
P139,2025-01-15,Sodium,130,mmol/L,Prelim
P141,2025-09-22,Glucose,156,mg/dL,Final
P105,2025-09-08,Sodium,132,mmol/L,Final
P140,2025-03-01,Glu,162,mg/dL,Corrected
P158,2025-01-01,Sodium,135,mmol/L,Final
P112,2025-09-01,Glucose,123,mg/dL,Prelim
P143,2025-07-01,Creatinine,0.9,mg/dL,Final
P160,2025-09-01,Glu,102,mg/dL,Final
P114,2025-09-15,Glu,260,mg/dL,Prelim
P111,2025-06-08,Glu,87,mg/dL,Corrected
P110,2025-09-01,HbA1c,9.0,%,Corrected
P131,2025-08-08,LDL,217,mg/dL,Prelim
P110,2025-07-08,Glu,185,mg/dL,Final
P129,2025-04-08,HbA1c,8.1,%,Final
P108,2025-02-01,Sodium,147,mmol/L,Final
P152,2025-01-08,Creatinine,1.0,mg/dL,Final
P144,2025-06-08,Glu,154,mg/dL,Final
P126,2025-06-22,Creatinine,1.0,mg/dL,Prelim
P157,2025-08-22,Glucose,70,mg/dL,Corrected
P107,2025-03-22,LDL,114,mg/dL,Prelim
P144,2025-03-08,Glucose,238,mg/dL,Final
P142,2025-07-08,Glucose,110,mg/dL,Final
P101,2025-05-15,Glu,137,mg/dL,Corrected
P115,2025-03-15,Glucose,238,mg/dL,Final
P148,2025-04-15,LDL,135,mg/dL,Final
P156,2025-08-22,Glucose,79,mg/dL,Prelim
P160,2025-05-01,HbA1c,7.8,%,Corrected
P143,2025-06-22,Creatinine,1.1,mg/dL,Final
P108,2025-02-08,Sodium,132,mmol/L,Final
P111,2025-08-15,Creatinine,1.7,mg/dL,Final
P142,2025-04-15,Glucose,147,mg/dL,Final
P152,2025-06-15,Glucose,97,mg/dL,Corrected
P106,2025-09-08,Glucose,157,mg/dL,Prelim
P125,2025-09-01,Sodium,150,mmol/L,Final
P131,2025-01-22,Glucose,189,mg/dL,Final
P134,2025-01-22,HbA1c,7.8,%,Corrected
P105,2025-05-08,LDL,199,mg/dL,Final
P119,2025-03-08,Creatinine,1.3,mg/dL,Prelim
P143,2025-08-01,Glucose,234,mg/dL,Prelim
P115,2025-08-08,Glu,149,mg/dL,Corrected
P155,2025-08-22,LDL,90,mg/dL,Final
P107,2025-08-08,Glucose,157,mg/dL,Final
P129,2025-01-08,HbA1c,9.9,%,Prelim
P138,2025-09-08,LDL,178,mg/dL,Final
P134,2025-02-08,Glu,155,mg/dL,Corrected
P149,2025-09-15,Sodium,135,mmol/L,Final
P105,2025-09-15,Sodium,142,mmol/L,Final
P124,2025-02-22,Creatinine,2.0,mg/dL,Final
P118,2025-04-15,Creatinine,1.1,mg/dL,Final
P137,2025-04-22,HbA1c,7.9,%,Final
P145,2025-02-15,LDL,174,mg/dL,Final
P139,2025-05-15,HbA1c,7.9,%,Prelim
P152,2025-01-01,LDL,186,mg/dL,Prelim
P132,2025-02-08,Glu,231,mg/dL,Prelim
P106,2025-05-08,Creatinine,2.6,mg/dL,Final
P132,2025-03-01,Creatinine,1.2,mg/dL,Final
P115,2025-08-22,LDL,162,mg/dL,Final
P139,2025-07-22,LDL,102,mg/dL,Final
P134,2025-09-22,Sodium,138,mmol/L,Final
P129,2025-05-08,HbA1c,7.1,%,Final
P120,2025-01-22,Glucose,258,mg/dL,Final
P123,2025-01-15,Creatinine,0.5,mg/dL,Final
P137,2025-06-01,Glucose,167,mg/dL,Final
P109,2025-04-08,Sodium,135,mmol/L,Corrected
P116,2025-07-01,Sodium,144,mmol/L,Corrected
P112,2025-08-15,Creatinine,2.9,mg/dL,Prelim
P146,2025-05-22,Sodium,130,mmol/L,Corrected
P117,2025-03-01,HbA1c,11.0,%,Final
P136,2025-03-15,Sodium,138,mmol/L,Final
P150,2025-01-08,Creatinine,1.7,mg/dL,Final
P139,2025-02-15,HbA1c,9.7,%,Final
P160,2025-04-22,Sodium,133,mmol/L,Final
P108,2025-07-01,Glucose,185,mg/dL,Final
P145,2025-06-01,Creatinine,0.6,mg/dL,Final
P129,2025-03-01,Glucose,255,mg/dL,Final
P109,2025-07-01,Creatinine,2.8,mg/dL,Corrected
P126,2025-02-15,HbA1c,7.1,%,Corrected
P146,2025-07-22,Glu,128,mg/dL,Corrected
P138,2025-07-22,HbA1c,7.9,%,Final
P145,2025-04-08,Glucose,229,mg/dL,Corrected
P117,2025-07-22,Glucose,112,mg/dL,Prelim
P128,2025-05-15,Glu,251,mg/dL,Final
P109,2025-03-08,Glu,97,mg/dL,Prelim
P156,2025-07-08,HbA1c,8.8,%,Corrected
P103,2025-07-22,Creatinine,1.3,mg/dL,Final
P106,2025-04-15,Glucose,157,mg/dL,Final
P150,2025-07-22,HbA1c,6.9,%,Corrected
P115,2025-05-08,Creatinine,2.0,mg/dL,Prelim
P157,2025-01-15,Glu,184,mg/dL,Final
P110,2025-01-08,Sodium,133,mmol/L,Corrected
P131,2025-03-22,Glu,156,mg/dL,Corrected
P104,2025-07-08,Glu,226,mg/dL,Corrected
P112,2025-05-08,LDL,84,mg/dL,Final
P106,2025-04-08,Sodium,138,mmol/L,Final
P159,2025-09-15,Sodium,130,mmol/L,Prelim
P151,2025-04-01,Glu,218,mg/dL,Final
P158,2025-04-22,HbA1c,10.2,%,Corrected
P145,2025-08-01,Glu,94,mg/dL,Final
P122,2025-07-15,Creatinine,0.8,mg/dL,Final
P120,2025-03-15,Glu,106,mg/dL,Final
P151,2025-01-15,Creatinine,1.1,mg/dL,Final
P133,2025-06-22,Creatinine,3.1,mg/dL,Corrected
P120,2025-09-22,Sodium,134,mmol/L,Prelim
P128,2025-08-15,Sodium,150,mmol/L,Final
P116,2025-02-08,Glu,99,mg/dL,Prelim
P141,2025-09-22,Creatinine,1.1,mg/dL,Corrected
P153,2025-06-08,Glu,170,mg/dL,Final
P158,2025-04-01,Glucose,84,mg/dL,Final
P153,2025-08-15,Sodium,148,mmol/L,Prelim
P103,2025-02-15,HbA1c,7.6,%,Prelim
P138,2025-06-01,Glu,147,mg/dL,Final
P118,2025-03-22,HbA1c,10.6,%,Corrected
P105,2025-06-15,Creatinine,2.6,mg/dL,Final
P129,2025-02-01,HbA1c,5.7,%,Prelim
P139,2025-06-15,Glucose,207,mg/dL,Final
P103,2025-08-15,Sodium,139,mmol/L,Corrected
P150,2025-08-01,Glucose,216,mg/dL,Final
P142,2025-09-08,HbA1c,5.7,%,Corrected
P104,2025-09-08,LDL,170,mg/dL,Corrected
P135,2025-02-01,Creatinine,1.4,mg/dL,Final
P108,2025-04-08,HbA1c,6.2,%,Final
P132,2025-08-08,Glucose,176,mg/dL,Final
P129,2025-09-08,Glu,185,mg/dL,Prelim
P155,2025-04-15,Creatinine,1.0,mg/dL,Final
P148,2025-05-22,HbA1c,6.0,%,Final
P152,2025-06-22,Creatinine,1.6,mg/dL,Corrected
P155,2025-06-15,Glucose,117,mg/dL,Prelim
P125,2025-05-01,HbA1c,9.1,%,Corrected
P127,2025-04-22,HbA1c,4.9,%,Corrected
P119,2025-05-15,Glucose,196,mg/dL,Final
P105,2025-07-08,Sodium,128,mmol/L,Final
P124,2025-07-01,Sodium,134,mmol/L,Final
P151,2025-06-22,Sodium,131,mmol/L,Corrected
P160,2025-03-08,Glucose,197,mg/dL,Corrected
P158,2025-06-01,Glu,193,mg/dL,Corrected
P160,2025-06-01,Sodium,130,mmol/L,Final
P127,2025-05-01,Glucose,131,mg/dL,Final
P119,2025-02-01,Sodium,129,mmol/L,Prelim
P104,2025-07-15,Creatinine,1.4,mg/dL,Final
P101,2025-05-15,Glu,75,mg/dL,Prelim
P108,2025-02-15,LDL,67,mg/dL,Prelim
P152,2025-05-15,Glucose,191,mg/dL,Final
P106,2025-02-22,Glu,246,mg/dL,Final
P149,2025-09-01,Glu,202,mg/dL,Corrected
P160,2025-05-08,Creatinine,0.9,mg/dL,Final
P132,2025-07-22,HbA1c,7.6,%,Final
P106,2025-04-15,LDL,163,mg/dL,Final
P153,2025-03-08,Creatinine,2.7,mg/dL,Final
P106,2025-08-15,LDL,208,mg/dL,Final
P147,2025-05-08,Glucose,240,mg/dL,Final
P104,2025-01-22,Glu,111,mg/dL,Prelim
P136,2025-09-22,Glu,220,mg/dL,Final
P148,2025-03-08,Glu,146,mg/dL,Final
P116,2025-02-15,LDL,135,mg/dL,Prelim
P111,2025-03-01,Glucose,204,mg/dL,Final
P151,2025-03-01,Creatinine,3.0,mg/dL,Prelim
P106,2025-01-08,HbA1c,5.6,%,Final
P155,2025-09-01,HbA1c,10.2,%,Corrected
P134,2025-06-15,LDL,194,mg/dL,Prelim
P116,2025-05-01,LDL,158,mg/dL,Final
P115,2025-06-22,Sodium,136,mmol/L,Final
P118,2025-02-22,Glucose,196,mg/dL,Final
P137,2025-02-08,HbA1c,6.6,%,Final
P114,2025-07-08,Creatinine,1.1,mg/dL,Corrected
P139,2025-07-01,Creatinine,2.3,mg/dL,Corrected
P138,2025-08-15,Sodium,140,mmol/L,Final
P148,2025-03-15,Glu,129,mg/dL,Corrected
P101,2025-08-01,Sodium,132,mmol/L,Final
P113,2025-01-01,LDL,107,mg/dL,Final
P110,2025-01-15,Glucose,195,mg/dL,Final
P132,2025-03-08,LDL,179,mg/dL,Final
P133,2025-06-22,HbA1c,9.8,%,Prelim
P126,2025-04-22,HbA1c,5.0,%,Prelim
P143,2025-05-08,Sodium,145,mmol/L,Final
P102,2025-06-15,Glucose,205,mg/dL,Prelim
P134,2025-08-08,HbA1c,7.6,%,Final
P153,2025-05-01,Glucose,99,mg/dL,Corrected
P158,2025-09-08,Glu,249,mg/dL,Final
P123,2025-03-22,Glu,154,mg/dL,Prelim
P140,2025-02-15,Creatinine,0.8,mg/dL,Corrected
P112,2025-09-08,Sodium,133,mmol/L,Prelim
P147,2025-05-08,HbA1c,11.2,%,Final
P102,2025-09-01,Creatinine,1.2,mg/dL,Corrected
P130,2025-02-08,Creatinine,3.1,mg/dL,Final
P109,2025-07-01,Glucose,239,mg/dL,Final
P126,2025-06-01,LDL,150,mg/dL,Final
P122,2025-04-15,Glu,149,mg/dL,Corrected
P142,2025-01-08,Sodium,138,mmol/L,Final
P104,2025-06-15,LDL,67,mg/dL,Final
P148,2025-05-15,Glu,135,mg/dL,Final
P146,2025-02-01,HbA1c,11.2,%,Final
P141,2025-06-08,Creatinine,0.9,mg/dL,Final
P128,2025-01-22,Glucose,242,mg/dL,Final
P126,2025-08-22,Glu,83,mg/dL,Corrected
P109,2025-09-08,HbA1c,10.6,%,Final
P106,2025-08-01,Glu,174,mg/dL,Corrected
P101,2025-01-08,Sodium,138,mmol/L,Final
P101,2025-01-15,HbA1c,6.7,%,Prelim
P113,2025-07-15,Glucose,135,mg/dL,Final
P142,2025-02-01,LDL,199,mg/dL,Prelim
P118,2025-06-08,Sodium,144,mmol/L,Corrected
P120,2025-09-15,LDL,174,mg/dL,Final
P148,2025-07-22,Creatinine,2.6,mg/dL,Final
P143,2025-07-22,HbA1c,7.5,%,Final
P137,2025-04-22,Creatinine,3.1,mg/dL,Prelim
P116,2025-04-22,Glucose,165,mg/dL,Final
P137,2025-07-15,Creatinine,2.6,mg/dL,Prelim
P135,2025-02-08,HbA1c,9.1,%,Corrected
P149,2025-06-22,HbA1c,7.4,%,Final
P154,2025-09-22,Creatinine,0.8,mg/dL,Final
P112,2025-02-15,Glu,80,mg/dL,Final
P122,2025-08-15,LDL,163,mg/dL,Prelim
P160,2025-03-15,Creatinine,2.7,mg/dL,Final
P122,2025-09-01,Sodium,150,mmol/L,Final
P133,2025-03-15,Glu,137,mg/dL,Final
P112,2025-04-08,HbA1c,11.5,%,Final
P150,2025-03-22,Sodium,144,mmol/L,Final
P121,2025-06-15,Sodium,148,mmol/L,Final
P145,2025-03-01,Glu,169,mg/dL,Final
P127,2025-08-01,Sodium,138,mmol/L,Final
P126,2025-05-15,Glu,199,mg/dL,Final
P106,2025-03-08,Glu,75,mg/dL,Corrected
P111,2025-07-08,LDL,217,mg/dL,Final
P123,2025-03-08,Glucose,188,mg/dL,Final
P112,2025-04-01,LDL,60,mg/dL,Corrected
P119,2025-03-22,HbA1c,8.7,%,Final
P154,2025-02-22,LDL,169,mg/dL,Final
P151,2025-09-08,Sodium,132,mmol/L,Final
P159,2025-07-15,Creatinine,2.1,mg/dL,Prelim
P150,2025-08-22,LDL,74,mg/dL,Final
P153,2025-08-22,HbA1c,10.4,%,Corrected
P113,2025-02-08,Sodium,143,mmol/L,Prelim
P124,2025-06-22,LDL,132,mg/dL,Final
P125,2025-07-15,Creatinine,2.8,mg/dL,Corrected
P155,2025-08-08,Sodium,148,mmol/L,Corrected
P114,2025-02-08,LDL,188,mg/dL,Prelim
P101,2025-01-08,Glucose,235,mg/dL,Corrected
P123,2025-08-08,HbA1c,5.9,%,Final
P117,2025-03-01,LDL,72,mg/dL,Final
P120,2025-01-15,HbA1c,10.6,%,Final
P141,2025-04-08,HbA1c,9.7,%,Final
P110,2025-05-22,Glu,238,mg/dL,Corrected
P122,2025-05-22,Glucose,219,mg/dL,Final
P146,2025-06-15,Glu,200,mg/dL,Prelim
P137,2025-09-22,Glu,200,mg/dL,Prelim
P145,2025-04-15,Sodium,130,mmol/L,Final
P130,2025-03-01,Glucose,208,mg/dL,Final
P114,2025-06-08,Glu,200,mg/dL,Final
P148,2025-02-01,Glucose,143,mg/dL,Final
P151,2025-07-08,LDL,181,mg/dL,Final
P110,2025-09-01,Creatinine,1.9,mg/dL,Final
P147,2025-05-15,Sodium,141,mmol/L,Final
P106,2025-01-08,Creatinine,2.9,mg/dL,Corrected
P108,2025-01-15,Glu,246,mg/dL,Final
P115,2025-02-01,HbA1c,10.8,%,Final
P130,2025-06-01,Glucose,247,mg/dL,Prelim
P158,2025-06-15,LDL,214,mg/dL,Prelim
P121,2025-05-08,Glu,70,mg/dL,Final
P144,2025-06-15,LDL,215,mg/dL,Corrected
P126,2025-08-08,Sodium,142,mmol/L,Corrected
P128,2025-02-15,Creatinine,3.1,mg/dL,Final
P126,2025-08-15,Glucose,170,mg/dL,Prelim
P123,2025-09-01,Glu,227,mg/dL,Final
P137,2025-05-15,Sodium,141,mmol/L,Final
P156,2025-04-22,HbA1c,10.4,%,Final
P129,2025-05-15,LDL,127,mg/dL,Corrected
P117,2025-06-22,Sodium,134,mmol/L,Prelim
P115,2025-06-01,LDL,176,mg/dL,Final
P121,2025-08-08,LDL,70,mg/dL,Final
P113,2025-03-08,Glu,208,mg/dL,Corrected
P133,2025-06-01,Glucose,174,mg/dL,Prelim
P153,2025-01-22,HbA1c,7.1,%,Final
P155,2025-06-15,Sodium,150,mmol/L,Final
P138,2025-06-01,Glucose,231,mg/dL,Final
P110,2025-07-08,Creatinine,1.8,mg/dL,Final
P147,2025-05-01,Creatinine,3.1,mg/dL,Corrected
P111,2025-02-08,Glu,104,mg/dL,Final
P102,2025-04-15,HbA1c,6.1,%,Final
P101,2025-06-22,Creatinine,2.3,mg/dL,Final
P128,2025-07-01,HbA1c,11.3,%,Final
P118,2025-04-15,Creatinine,2.1,mg/dL,Prelim
P139,2025-01-22,Glucose,246,mg/dL,Corrected
P156,2025-04-08,Sodium,140,mmol/L,Prelim
P130,2025-09-22,Glu,126,mg/dL,Prelim
P101,2025-08-01,HbA1c,6.2,%,Final
P114,2025-07-15,Glucose,123,mg/dL,Final
P143,2025-06-08,Glu,211,mg/dL,Corrected
P156,2025-09-22,Glucose,189,mg/dL,Final
P122,2025-03-08,Glucose,217,mg/dL,Final
P136,2025-04-15,HbA1c,11.4,%,Prelim
P159,2025-09-01,HbA1c,6.9,%,Final
P111,2025-09-08,HbA1c,9.4,%,Final
P131,2025-02-08,HbA1c,8.8,%,Final
P145,2025-06-15,HbA1c,10.3,%,Final
P105,2025-07-08,Glu,103,mg/dL,Corrected
P149,2025-08-22,LDL,113,mg/dL,Final
P135,2025-07-08,Glucose,170,mg/dL,Final
P112,2025-01-08,LDL,146,mg/dL,Prelim
P113,2025-01-22,HbA1c,6.3,%,Final
P149,2025-05-22,Creatinine,1.5,mg/dL,Final
P102,2025-06-22,Sodium,145,mmol/L,Final
P110,2025-01-08,Glucose,233,mg/dL,Final
P136,2025-06-15,LDL,91,mg/dL,Prelim
P143,2025-04-22,Glu,195,mg/dL,Final
P149,2025-08-08,Glucose,115,mg/dL,Prelim
P131,2025-09-01,Sodium,131,mmol/L,Corrected
P148,2025-09-22,LDL,182,mg/dL,Final
P133,2025-07-15,HbA1c,7.4,%,Final
P132,2025-07-15,Creatinine,1.9,mg/dL,Final
P116,2025-01-15,Creatinine,2.1,mg/dL,Final
P148,2025-02-01,Sodium,128,mmol/L,Final
P111,2025-03-01,Sodium,149,mmol/L,Final
P120,2025-04-15,Creatinine,1.4,mg/dL,Final
P139,2025-06-01,LDL,146,mg/dL,Final
P159,2025-04-01,Glucose,226,mg/dL,Final
P128,2025-06-01,Glu,227,mg/dL,Final
P143,2025-06-01,Sodium,134,mmol/L,Final
P118,2025-09-22,Glu,241,mg/dL,Prelim
P107,2025-01-08,Sodium,144,mmol/L,Prelim
P126,2025-09-01,LDL,162,mg/dL,Final
P157,2025-03-22,Creatinine,0.8,mg/dL,Final
P130,2025-07-15,Creatinine,2.0,mg/dL,Final
P135,2025-04-01,LDL,132,mg/dL,Final
P111,2025-07-15,LDL,97,mg/dL,Prelim
P110,2025-05-01,Sodium,131,mmol/L,Corrected
P118,2025-04-15,LDL,154,mg/dL,Final
P140,2025-02-22,LDL,87,mg/dL,Final
P105,2025-08-08,Glucose,204,mg/dL,Prelim
P125,2025-05-01,Creatinine,2.5,mg/dL,Final
P117,2025-02-15,HbA1c,8.5,%,Final
P136,2025-01-01,Creatinine,2.1,mg/dL,Corrected
P103,2025-04-22,LDL,92,mg/dL,Corrected
P154,2025-04-15,Glucose,255,mg/dL,Corrected
P136,2025-06-08,Glucose,81,mg/dL,Corrected
P123,2025-07-15,HbA1c,5.7,%,Final
P147,2025-04-22,LDL,180,mg/dL,Corrected
P104,2025-07-08,Sodium,131,mmol/L,Final
P125,2025-04-01,Glu,219,mg/dL,Prelim
__EOF__
cat > biomed_text_demo/raw/vitals.tsv <<'__EOF__'
patient_id	visit_date	metric_name	result_value	unit
P108	2025-06-22	DBP	60	mmHg
P104	2025-01-08	HR	122	beats/min
P101	2025-03-15	DBP	93	mmHg
P143	2025-01-15	HR	88	beats/min
P145	2025-09-15	DBP	87	mmHg
P132	2025-05-15	SBP	140	mmHg
P152	2025-03-22	DBP	55	mmHg
P132	2025-06-22	DBP	82	mmHg
P147	2025-04-15	HR	61	beats/min
P140	2025-01-08	HR	90	beats/min
P111	2025-04-15	HR	71	beats/min
P129	2025-05-08	SBP	126	mmHg
P125	2025-03-15	DBP	87	mmHg
P117	2025-05-08	SBP	142	mmHg
P114	2025-04-22	HR	109	beats/min
P152	2025-01-08	HR	87	beats/min
P136	2025-09-22	DBP	106	mmHg
P106	2025-09-08	DBP	108	mmHg
P106	2025-07-22	HR	58	beats/min
P106	2025-08-01	SBP	106	mmHg
P144	2025-06-22	DBP	78	mmHg
P120	2025-06-22	DBP	108	mmHg
P158	2025-03-08	DBP	87	mmHg
P110	2025-03-08	DBP	104	mmHg
P126	2025-04-22	HR	90	beats/min
P114	2025-05-01	SBP	122	mmHg
P138	2025-05-01	SBP	163	mmHg
P160	2025-07-08	HR	68	beats/min
P137	2025-01-01	HR	68	beats/min
P115	2025-08-22	SBP	108	mmHg
P130	2025-09-08	DBP	67	mmHg
P128	2025-03-22	DBP	97	mmHg
P144	2025-05-15	SBP	146	mmHg
P131	2025-03-01	DBP	97	mmHg
P131	2025-03-01	DBP	65	mmHg
P151	2025-07-15	HR	131	beats/min
P139	2025-09-01	DBP	66	mmHg
P113	2025-01-01	HR	109	beats/min
P135	2025-04-15	HR	67	beats/min
P102	2025-06-08	DBP	78	mmHg
P138	2025-04-22	HR	79	beats/min
P105	2025-04-01	HR	130	beats/min
P143	2025-02-22	SBP	169	mmHg
P134	2025-01-22	HR	142	beats/min
P113	2025-02-08	SBP	162	mmHg
P116	2025-01-08	HR	94	beats/min
P155	2025-03-01	DBP	62	mmHg
P120	2025-04-08	HR	125	beats/min
P102	2025-05-01	SBP	114	mmHg
P119	2025-03-01	DBP	60	mmHg
P101	2025-02-08	SBP	159	mmHg
P124	2025-09-22	DBP	60	mmHg
P108	2025-04-08	HR	85	beats/min
P133	2025-07-01	HR	136	beats/min
P138	2025-06-08	DBP	83	mmHg
P112	2025-09-22	DBP	65	mmHg
P118	2025-09-08	DBP	62	mmHg
P159	2025-06-01	DBP	87	mmHg
P126	2025-05-01	SBP	130	mmHg
P108	2025-04-08	HR	58	beats/min
P158	2025-02-01	SBP	128	mmHg
P148	2025-08-15	SBP	115	mmHg
P114	2025-06-08	DBP	89	mmHg
P142	2025-08-01	SBP	166	mmHg
P103	2025-07-15	HR	152	beats/min
P116	2025-02-15	SBP	107	mmHg
P139	2025-08-22	SBP	158	mmHg
P120	2025-05-15	SBP	97	mmHg
P122	2025-01-22	HR	83	beats/min
P124	2025-09-22	DBP	57	mmHg
P102	2025-06-08	DBP	70	mmHg
P150	2025-04-22	HR	63	beats/min
P139	2025-07-15	HR	138	beats/min
P125	2025-02-08	SBP	107	mmHg
P117	2025-05-08	SBP	172	mmHg
P142	2025-07-22	HR	150	beats/min
P127	2025-08-22	SBP	122	mmHg
P108	2025-05-15	SBP	167	mmHg
P128	2025-01-08	HR	100	beats/min
P126	2025-04-22	HR	85	beats/min
P132	2025-04-08	HR	110	beats/min
P119	2025-02-22	SBP	143	mmHg
P106	2025-07-22	HR	69	beats/min
P141	2025-06-15	DBP	70	mmHg
P140	2025-03-22	DBP	64	mmHg
P130	2025-08-01	SBP	176	mmHg
P125	2025-03-15	DBP	79	mmHg
P108	2025-05-15	SBP	166	mmHg
P156	2025-05-15	SBP	150	mmHg
P105	2025-06-15	DBP	57	mmHg
P136	2025-08-15	SBP	135	mmHg
P135	2025-04-15	HR	62	beats/min
P123	2025-06-01	DBP	97	mmHg
P129	2025-06-15	DBP	59	mmHg
P135	2025-05-22	SBP	124	mmHg
P122	2025-03-08	DBP	100	mmHg
P128	2025-02-15	SBP	121	mmHg
P136	2025-07-08	HR	148	beats/min
P140	2025-02-15	SBP	153	mmHg
P133	2025-09-15	DBP	69	mmHg
P103	2025-09-01	DBP	102	mmHg
P127	2025-07-15	HR	117	beats/min
P115	2025-07-15	HR	98	beats/min
P118	2025-07-22	HR	60	beats/min
P109	2025-07-01	HR	146	beats/min
P135	2025-05-22	SBP	102	mmHg
P102	2025-04-22	HR	149	beats/min
P139	2025-09-01	DBP	80	mmHg
P104	2025-02-15	SBP	95	mmHg
P118	2025-07-22	HR	121	beats/min
P143	2025-03-01	DBP	82	mmHg
P146	2025-02-01	SBP	106	mmHg
P115	2025-09-01	DBP	60	mmHg
P120	2025-05-15	SBP	132	mmHg
P139	2025-07-15	HR	72	beats/min
P113	2025-03-15	DBP	93	mmHg
P153	2025-05-08	SBP	109	mmHg
P134	2025-02-01	SBP	178	mmHg
P130	2025-08-01	SBP	147	mmHg
P102	2025-05-01	SBP	130	mmHg
P131	2025-02-22	SBP	107	mmHg
P117	2025-04-01	HR	99	beats/min
P159	2025-04-15	HR	152	beats/min
P111	2025-05-22	SBP	111	mmHg
P134	2025-02-01	SBP	136	mmHg
P122	2025-03-08	DBP	59	mmHg
P115	2025-09-01	DBP	100	mmHg
P147	2025-06-01	DBP	64	mmHg
P145	2025-07-01	HR	83	beats/min
P107	2025-03-01	DBP	58	mmHg
P121	2025-07-01	HR	125	beats/min
P103	2025-07-15	HR	83	beats/min
P136	2025-07-08	HR	59	beats/min
P116	2025-01-08	HR	103	beats/min
P117	2025-04-01	HR	138	beats/min
P121	2025-07-01	HR	135	beats/min
P103	2025-08-22	SBP	115	mmHg
P135	2025-06-01	DBP	107	mmHg
P131	2025-01-15	HR	123	beats/min
P105	2025-05-08	SBP	157	mmHg
P124	2025-08-15	SBP	103	mmHg
P119	2025-02-22	SBP	123	mmHg
P131	2025-02-22	SBP	126	mmHg
P133	2025-08-08	SBP	154	mmHg
P132	2025-04-08	HR	114	beats/min
P127	2025-07-15	HR	101	beats/min
P123	2025-05-22	SBP	175	mmHg
P111	2025-06-01	DBP	72	mmHg
P137	2025-03-15	DBP	68	mmHg
P113	2025-02-08	SBP	138	mmHg
P154	2025-09-08	DBP	104	mmHg
P121	2025-09-15	DBP	92	mmHg
P137	2025-02-08	SBP	126	mmHg
P104	2025-01-08	HR	68	beats/min
P109	2025-07-01	HR	65	beats/min
P140	2025-03-22	DBP	70	mmHg
P107	2025-02-22	SBP	159	mmHg
P110	2025-02-01	SBP	148	mmHg
P107	2025-01-15	HR	94	beats/min
P148	2025-09-22	DBP	105	mmHg
P136	2025-08-15	SBP	138	mmHg
P103	2025-09-01	DBP	89	mmHg
P138	2025-06-08	DBP	68	mmHg
P128	2025-01-08	HR	71	beats/min
P160	2025-08-15	SBP	175	mmHg
P155	2025-02-22	SBP	138	mmHg
P111	2025-06-01	DBP	97	mmHg
P137	2025-03-15	DBP	67	mmHg
P101	2025-01-01	HR	136	beats/min
P104	2025-03-22	DBP	60	mmHg
P124	2025-08-15	SBP	132	mmHg
P137	2025-01-01	HR	89	beats/min
P160	2025-09-22	DBP	74	mmHg
P108	2025-06-22	DBP	67	mmHg
P105	2025-05-08	SBP	149	mmHg
P122	2025-02-01	SBP	119	mmHg
P142	2025-09-08	DBP	89	mmHg
P112	2025-08-15	SBP	165	mmHg
P104	2025-03-22	DBP	93	mmHg
P155	2025-01-15	HR	137	beats/min
P159	2025-05-22	SBP	117	mmHg
P120	2025-04-08	HR	98	beats/min
P130	2025-07-22	HR	132	beats/min
P118	2025-09-08	DBP	89	mmHg
P152	2025-02-15	SBP	165	mmHg
P110	2025-01-22	HR	63	beats/min
P124	2025-07-08	HR	84	beats/min
P114	2025-04-22	HR	74	beats/min
P106	2025-08-01	SBP	141	mmHg
P110	2025-01-22	HR	124	beats/min
P128	2025-02-15	SBP	168	mmHg
P112	2025-07-08	HR	115	beats/min
P129	2025-04-01	HR	115	beats/min
P109	2025-09-15	DBP	99	mmHg
P157	2025-08-08	SBP	95	mmHg
P125	2025-01-01	HR	97	beats/min
P148	2025-07-08	HR	135	beats/min
P157	2025-09-15	DBP	101	mmHg
P115	2025-07-15	HR	151	beats/min
P134	2025-01-22	HR	61	beats/min
P156	2025-06-22	DBP	65	mmHg
P153	2025-04-01	HR	142	beats/min
P126	2025-06-08	DBP	95	mmHg
P101	2025-01-01	HR	136	beats/min
P147	2025-05-22	SBP	109	mmHg
P138	2025-05-01	SBP	135	mmHg
P114	2025-05-01	SBP	122	mmHg
P125	2025-01-01	HR	84	beats/min
P132	2025-05-15	SBP	143	mmHg
P121	2025-09-15	DBP	78	mmHg
P106	2025-09-08	DBP	68	mmHg
P130	2025-09-08	DBP	65	mmHg
P117	2025-06-15	DBP	83	mmHg
P133	2025-09-15	DBP	101	mmHg
P144	2025-04-08	HR	129	beats/min
P119	2025-01-15	HR	70	beats/min
P146	2025-03-08	DBP	103	mmHg
P115	2025-08-22	SBP	120	mmHg
P129	2025-06-15	DBP	105	mmHg
P125	2025-02-08	SBP	104	mmHg
P154	2025-07-22	HR	123	beats/min
P140	2025-02-15	SBP	154	mmHg
P101	2025-03-15	DBP	56	mmHg
P107	2025-01-15	HR	84	beats/min
P105	2025-04-01	HR	96	beats/min
P119	2025-01-15	HR	86	beats/min
P140	2025-01-08	HR	137	beats/min
P126	2025-05-01	SBP	153	mmHg
P156	2025-04-08	HR	92	beats/min
P119	2025-03-01	DBP	59	mmHg
P112	2025-07-08	HR	55	beats/min
P134	2025-03-08	DBP	108	mmHg
P123	2025-05-22	SBP	100	mmHg
P121	2025-08-08	SBP	174	mmHg
P120	2025-06-22	DBP	92	mmHg
P102	2025-04-22	HR	80	beats/min
P158	2025-01-22	HR	147	beats/min
P118	2025-08-01	SBP	153	mmHg
P123	2025-04-15	HR	63	beats/min
P128	2025-03-22	DBP	91	mmHg
P145	2025-08-08	SBP	112	mmHg
P149	2025-01-01	HR	142	beats/min
P150	2025-06-08	DBP	79	mmHg
P157	2025-07-01	HR	113	beats/min
P136	2025-09-22	DBP	80	mmHg
P107	2025-03-01	DBP	93	mmHg
P153	2025-06-15	DBP	98	mmHg
P104	2025-02-15	SBP	164	mmHg
P151	2025-09-01	DBP	88	mmHg
P150	2025-05-01	SBP	144	mmHg
P122	2025-01-22	HR	128	beats/min
P149	2025-02-08	SBP	149	mmHg
P116	2025-03-22	DBP	97	mmHg
P121	2025-08-08	SBP	124	mmHg
P135	2025-06-01	DBP	80	mmHg
P109	2025-09-15	DBP	107	mmHg
P141	2025-04-01	HR	88	beats/min
P112	2025-08-15	SBP	115	mmHg
P112	2025-09-22	DBP	99	mmHg
P132	2025-06-22	DBP	72	mmHg
P114	2025-06-08	DBP	103	mmHg
P127	2025-09-01	DBP	89	mmHg
P130	2025-07-22	HR	115	beats/min
P127	2025-09-01	DBP	78	mmHg
P126	2025-06-08	DBP	97	mmHg
P122	2025-02-01	SBP	95	mmHg
P139	2025-08-22	SBP	149	mmHg
P131	2025-01-15	HR	67	beats/min
P154	2025-08-01	SBP	129	mmHg
P111	2025-05-22	SBP	170	mmHg
P110	2025-03-08	DBP	69	mmHg
P138	2025-04-22	HR	127	beats/min
P151	2025-08-22	SBP	154	mmHg
P133	2025-08-08	SBP	166	mmHg
P127	2025-08-22	SBP	115	mmHg
P124	2025-07-08	HR	84	beats/min
P113	2025-01-01	HR	88	beats/min
P149	2025-03-15	DBP	93	mmHg
P118	2025-08-01	SBP	152	mmHg
P146	2025-01-22	HR	118	beats/min
P107	2025-02-22	SBP	125	mmHg
P101	2025-02-08	SBP	109	mmHg
P105	2025-06-15	DBP	56	mmHg
P129	2025-04-01	HR	89	beats/min
P111	2025-04-15	HR	112	beats/min
P109	2025-08-08	SBP	157	mmHg
P137	2025-02-08	SBP	103	mmHg
P123	2025-04-15	HR	145	beats/min
P123	2025-06-01	DBP	58	mmHg
P110	2025-02-01	SBP	163	mmHg
P129	2025-05-08	SBP	177	mmHg
P141	2025-05-08	SBP	112	mmHg
P116	2025-03-22	DBP	77	mmHg
P103	2025-08-22	SBP	112	mmHg
P133	2025-07-01	HR	107	beats/min
P109	2025-08-08	SBP	178	mmHg
P117	2025-06-15	DBP	71	mmHg
P134	2025-03-08	DBP	96	mmHg
P116	2025-02-15	SBP	146	mmHg
P113	2025-03-15	DBP	72	mmHg
__EOF__
cat > biomed_text_demo/raw/notes.txt <<'__EOF__'
# Clinic notes export, free text, one note per line
# Lines starting with # are comments and are not notes

P130 fasting confirmed before draw
P130 weight NA, height NA
# reviewed by nursing staff
# reviewed by nursing staff
P157 sample hemolyzed, result flagged
P126 glucose meter reading NA at home

P125 weight NA, height NA


P150 fasting confirmed before draw
P118 sample hemolyzed, result flagged
P105 glucose meter reading NA at home


P119 fasting confirmed before draw
P134 weight NA, height NA
# reviewed by nursing staff
P107 reports feeling well, no new complaints
P151 follow-up scheduled in 3 months
P122 medication list reviewed, no changes
P111 follow-up scheduled in 3 months


# reviewed by nursing staff
P144 fasting confirmed before draw
P143 sample hemolyzed, result flagged

P146 medication list reviewed, no changes
P127 follow-up scheduled in 3 months
P123 weight NA, height NA


P137 fasting confirmed before draw
P145 weight NA, height NA
P138 follow-up scheduled in 3 months


P109 weight NA, height NA
P108 medication list reviewed, no changes
P117 follow-up scheduled in 3 months
P154 follow-up scheduled in 3 months
P106 glucose meter reading NA at home
P146 weight NA, height NA

P113 glucose meter reading NA at home
# reviewed by nursing staff
# reviewed by nursing staff
P126 medication list reviewed, no changes
P135 fasting confirmed before draw

P143 reports feeling well, no new complaints
ERROR: note for P115 could not be parsed on import
P125 blood pressure rechecked after 5 minutes
P115 glucose meter reading NA at home

P102 weight NA, height NA
__EOF__
cat > biomed_text_demo/docs/data_dictionary.txt <<'__EOF__'
Data dictionary for biomed_text_demo (synthetic data, no real patients)

labs_dirty.csv  (comma-separated, header row)
  1 patient_id     P101 to P160
  2 visit_date     YYYY-MM-DD
  3 test_name      Glucose is entered two ways, as Glu and as Glucose. Other tests: Creatinine, HbA1c, Sodium, LDL
  4 result_value   a number, or NA when the result was not recorded
  5 unit           mg/dL, %, or mmol/L
  6 status         Final, Prelim or Corrected (three values, not two)

vitals.tsv  (tab-separated, header row)
  1 patient_id  2 visit_date  3 metric_name (HR, SBP, DBP)  4 result_value  5 unit

notes.txt  free text, one note per line; blank lines and lines starting with # are not notes; NA marks a missing value
__EOF__
[ -f practice/README.txt ] || echo "Save your outputs here (created by the setup script)." > practice/README.txt
echo "Workspace ready: $ROOT"
echo "Spot check:"; wc -l biomed_text_demo/raw/labs_dirty.csv biomed_text_demo/raw/vitals.tsv biomed_text_demo/raw/notes.txt
