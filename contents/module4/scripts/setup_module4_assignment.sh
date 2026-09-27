#!/usr/bin/env bash
# setup_module4_assignment.sh
# Builds the practice workspace for BIO 2110 Module 4 with synthetic data.
# Safe to run again: data files are rewritten; practice/ outputs are never touched.
set -e
HERE="$(cd "$(dirname "$0")" && pwd)"
ROOT="$HERE/../practice"
mkdir -p "$ROOT/practice" "$ROOT/biomed_text_demo/raw" "$ROOT/biomed_text_demo/docs"
cd "$ROOT"
# One-time, silent: tell this clone of the repository to ignore permission changes,
# so that the chmod +x students ran on this script never blocks a later git pull.
git -C "$HERE" config core.fileMode false 2>/dev/null || true
cat > biomed_text_demo/raw/labs_dirty.csv <<'__EOF__'
patient_id,visit_date,test_name,result_value,unit,status
P147,2025-05-22,Glucose,NA,mg/dL,Final
P114,2025-01-08,LDL,121,mg/dL,Final
P138,2025-04-22,Glu,177,mg/dL,Prelim
P133,2025-03-01,Glu,127,mg/dL,Final
P154,2025-08-15,LDL,131,mg/dL,Final
P156,2025-07-01,Glu,244,mg/dL,Prelim
P138,2025-02-01,Glucose,126,mg/dL,Corrected
P134,2025-08-22,Glu,NA,mg/dL,Final
P130,2025-09-22,Creatinine,1.2,mg/dL,Final
P103,2025-03-08,LDL,208,mg/dL,Corrected
P120,2025-05-15,HbA1c,10.8,%,Final
P137,2025-01-15,Sodium,138,mmol/L,Final
P138,2025-03-08,HbA1c,8.1,%,Prelim
P108,2025-07-22,Sodium,131,mmol/L,Final
P134,2025-04-15,LDL,NA,mg/dL,Final
P157,2025-09-01,LDL,186,mg/dL,Prelim
P118,2025-05-01,LDL,63,mg/dL,Corrected
P118,2025-07-22,Glu,92,mg/dL,Final
P141,2025-02-01,Sodium,134,mmol/L,Final
P116,2025-03-01,Glu,206,mg/dL,Corrected
P145,2025-09-15,LDL,107,mg/dL,Final
P147,2025-06-01,HbA1c,NA,%,Final
P103,2025-05-22,Glu,122,mg/dL,Final
P152,2025-07-08,Sodium,147,mmol/L,Final
P132,2025-04-22,Creatinine,2.7,mg/dL,Final
P113,2025-09-08,Glu,104,mg/dL,Final
P155,2025-02-01,LDL,204,mg/dL,Prelim
P159,2025-02-15,Sodium,148,mmol/L,Corrected
P130,2025-05-22,HbA1c,8.0,%,Corrected
P140,2025-02-08,Glucose,230,mg/dL,Final
P155,2025-06-08,Glu,147,mg/dL,Final
P101,2025-07-08,Glucose,171,mg/dL,Final
P130,2025-04-08,LDL,110,mg/dL,Final
P158,2025-03-08,Sodium,143,mmol/L,Prelim
P104,2025-08-01,HbA1c,8.9,%,Corrected
P150,2025-02-01,HbA1c,10.7,%,Prelim
P145,2025-09-22,HbA1c,6.0,%,Final
P156,2025-08-22,LDL,101,mg/dL,Final
P146,2025-01-01,LDL,185,mg/dL,Corrected
P129,2025-04-01,LDL,122,mg/dL,Final
P126,2025-05-15,Creatinine,2.3,mg/dL,Final
P128,2025-01-08,HbA1c,10.2,%,Final
P153,2025-01-22,Glucose,168,mg/dL,Final
P115,2025-01-01,Glucose,159,mg/dL,Final
P158,2025-08-22,LDL,210,mg/dL,Final
P149,2025-08-15,Glucose,199,mg/dL,Final
P124,2025-03-22,HbA1c,10.9,%,Final
P143,2025-02-22,Sodium,141,mmol/L,Final
P114,2025-09-08,Creatinine,1.3,mg/dL,Final
P108,2025-07-01,Glu,206,mg/dL,Final
P126,2025-06-22,LDL,166,mg/dL,Final
P159,2025-06-01,Glu,104,mg/dL,Final
P160,2025-02-22,Glucose,131,mg/dL,Final
P109,2025-03-08,Sodium,144,mmol/L,Corrected
P155,2025-01-15,Glucose,190,mg/dL,Final
P116,2025-07-08,Sodium,136,mmol/L,Prelim
P102,2025-06-15,Sodium,145,mmol/L,Final
P151,2025-07-15,HbA1c,7.9,%,Final
P116,2025-08-15,Glucose,77,mg/dL,Final
P157,2025-06-08,Glu,152,mg/dL,Final
P139,2025-03-01,Glucose,204,mg/dL,Prelim
P107,2025-08-15,Creatinine,1.7,mg/dL,Corrected
P128,2025-05-22,LDL,64,mg/dL,Corrected
P136,2025-09-08,Glucose,218,mg/dL,Final
P124,2025-05-15,Glucose,218,mg/dL,Final
P155,2025-04-15,Creatinine,1.7,mg/dL,Corrected
P138,2025-09-01,Creatinine,0.6,mg/dL,Final
P156,2025-06-15,Creatinine,1.6,mg/dL,Final
P108,2025-05-22,Sodium,137,mmol/L,Corrected
P123,2025-09-15,Creatinine,2.4,mg/dL,Final
P133,2025-07-08,Sodium,136,mmol/L,Prelim
P147,2025-01-22,Sodium,137,mmol/L,Final
P122,2025-08-22,HbA1c,10.2,%,Corrected
P122,2025-08-15,Creatinine,1.7,mg/dL,Final
P132,2025-01-22,Glucose,225,mg/dL,Final
P149,2025-03-15,Sodium,147,mmol/L,Corrected
P116,2025-05-22,LDL,198,mg/dL,Corrected
P117,2025-02-15,LDL,63,mg/dL,Final
P137,2025-02-15,Glucose,101,mg/dL,Final
P153,2025-06-08,Creatinine,0.8,mg/dL,Corrected
P139,2025-09-22,LDL,81,mg/dL,Final
P111,2025-01-01,Glucose,138,mg/dL,Prelim
P129,2025-01-08,Glucose,110,mg/dL,Prelim
P146,2025-07-15,Glucose,162,mg/dL,Final
P122,2025-01-08,Sodium,149,mmol/L,Final
P102,2025-06-22,LDL,143,mg/dL,Prelim
P156,2025-07-15,Sodium,142,mmol/L,Final
P151,2025-04-15,Glu,169,mg/dL,Final
P109,2025-07-08,LDL,190,mg/dL,Final
P117,2025-08-01,HbA1c,6.8,%,Final
P146,2025-01-22,LDL,208,mg/dL,Prelim
P144,2025-03-08,Sodium,145,mmol/L,Final
P101,2025-05-15,HbA1c,10.6,%,Final
P101,2025-01-08,Sodium,144,mmol/L,Final
P114,2025-02-15,Glucose,209,mg/dL,Final
P160,2025-07-08,HbA1c,10.7,%,Final
P150,2025-05-22,Glucose,100,mg/dL,Prelim
P143,2025-06-08,Creatinine,2.6,mg/dL,Final
P109,2025-06-22,HbA1c,4.9,%,Final
P153,2025-01-22,Glucose,211,mg/dL,Corrected
P125,2025-01-22,Creatinine,0.8,mg/dL,Final
P111,2025-03-15,Glu,213,mg/dL,Corrected
P144,2025-05-15,LDL,152,mg/dL,Prelim
P116,2025-07-22,HbA1c,11.4,%,Final
P119,2025-05-22,Creatinine,0.8,mg/dL,Corrected
P139,2025-05-22,HbA1c,5.3,%,Final
P109,2025-05-01,LDL,185,mg/dL,Final
P131,2025-05-08,LDL,131,mg/dL,Final
P104,2025-01-15,Sodium,128,mmol/L,Final
P112,2025-08-01,LDL,97,mg/dL,Prelim
P118,2025-06-01,Creatinine,1.7,mg/dL,Final
P104,2025-08-08,Glu,126,mg/dL,Corrected
P151,2025-01-22,Glu,257,mg/dL,Final
P121,2025-02-22,LDL,95,mg/dL,Final
P151,2025-07-01,Creatinine,1.8,mg/dL,Final
P142,2025-02-22,HbA1c,11.2,%,Final
P127,2025-08-22,Creatinine,1.5,mg/dL,Final
P135,2025-05-01,Glu,82,mg/dL,Prelim
P138,2025-08-08,HbA1c,5.9,%,Final
P121,2025-08-22,Glucose,128,mg/dL,Final
P118,2025-08-08,Sodium,142,mmol/L,Final
P114,2025-08-08,Sodium,141,mmol/L,Corrected
P135,2025-03-01,Glucose,129,mg/dL,Prelim
P149,2025-07-01,Sodium,134,mmol/L,Final
P134,2025-01-08,Glu,177,mg/dL,Final
P120,2025-01-08,LDL,93,mg/dL,Prelim
P105,2025-07-22,Glucose,130,mg/dL,Corrected
P104,2025-08-22,LDL,65,mg/dL,Corrected
P130,2025-05-22,Glucose,107,mg/dL,Final
P105,2025-02-08,Glu,184,mg/dL,Final
P135,2025-04-22,Glu,142,mg/dL,Final
P143,2025-04-15,HbA1c,7.1,%,Final
P138,2025-09-15,Sodium,137,mmol/L,Prelim
P104,2025-01-08,Creatinine,1.2,mg/dL,Corrected
P153,2025-03-01,HbA1c,6.2,%,Final
P155,2025-07-22,Glucose,165,mg/dL,Prelim
P128,2025-07-15,Creatinine,1.7,mg/dL,Final
P109,2025-08-15,LDL,138,mg/dL,Final
P149,2025-02-22,HbA1c,11.0,%,Final
P107,2025-01-08,Glu,108,mg/dL,Final
P149,2025-06-01,Creatinine,0.9,mg/dL,Final
P148,2025-02-01,Glucose,251,mg/dL,Final
P139,2025-01-22,Glu,161,mg/dL,Final
P131,2025-09-08,Glucose,178,mg/dL,Final
P115,2025-01-01,Sodium,149,mmol/L,Prelim
P122,2025-08-01,HbA1c,7.5,%,Final
P154,2025-08-01,Glu,161,mg/dL,Final
P154,2025-03-22,Glucose,237,mg/dL,Final
P105,2025-04-08,Sodium,146,mmol/L,Final
P129,2025-01-08,Sodium,140,mmol/L,Final
P110,2025-05-01,LDL,124,mg/dL,Final
P143,2025-08-01,Glucose,207,mg/dL,Final
P124,2025-06-22,Sodium,130,mmol/L,Final
P125,2025-09-01,HbA1c,8.3,%,Final
P153,2025-03-15,LDL,120,mg/dL,Final
P123,2025-08-08,Creatinine,1.8,mg/dL,Final
P121,2025-04-15,HbA1c,7.6,%,Prelim
P105,2025-05-08,LDL,100,mg/dL,Final
P122,2025-05-22,Glucose,258,mg/dL,Corrected
P144,2025-07-01,Glu,245,mg/dL,Prelim
P116,2025-06-08,Sodium,134,mmol/L,Final
P155,2025-09-01,LDL,97,mg/dL,Final
P134,2025-02-22,LDL,169,mg/dL,Final
P148,2025-04-22,Glucose,253,mg/dL,Final
P151,2025-09-22,LDL,95,mg/dL,Prelim
P149,2025-04-08,LDL,137,mg/dL,Prelim
P134,2025-08-22,HbA1c,7.7,%,Final
P109,2025-08-15,Creatinine,1.5,mg/dL,Final
P144,2025-02-15,LDL,167,mg/dL,Prelim
P108,2025-02-01,Sodium,148,mmol/L,Corrected
P143,2025-03-01,LDL,190,mg/dL,Final
P122,2025-09-01,Sodium,132,mmol/L,Final
P115,2025-09-22,Creatinine,0.6,mg/dL,Final
P153,2025-03-01,Glu,218,mg/dL,Final
P140,2025-08-08,HbA1c,8.6,%,Corrected
P107,2025-09-15,Sodium,131,mmol/L,Prelim
P120,2025-03-15,Sodium,139,mmol/L,Final
P142,2025-02-15,LDL,119,mg/dL,Final
P158,2025-07-15,Glu,190,mg/dL,Prelim
P150,2025-03-01,Creatinine,1.5,mg/dL,Final
P146,2025-02-01,LDL,175,mg/dL,Final
P106,2025-02-08,Glu,190,mg/dL,Prelim
P129,2025-05-15,Glucose,78,mg/dL,Final
P140,2025-04-01,Sodium,130,mmol/L,Final
P113,2025-04-22,Glucose,248,mg/dL,Final
P119,2025-07-08,Glucose,108,mg/dL,Final
P113,2025-01-15,Creatinine,1.6,mg/dL,Final
P121,2025-08-01,Creatinine,2.9,mg/dL,Prelim
P118,2025-06-22,HbA1c,6.3,%,Prelim
P117,2025-05-15,LDL,138,mg/dL,Final
P142,2025-09-15,Glu,144,mg/dL,Corrected
P141,2025-06-08,HbA1c,11.3,%,Final
P159,2025-09-22,Creatinine,2.4,mg/dL,Final
P155,2025-09-08,Sodium,128,mmol/L,Prelim
P103,2025-03-08,HbA1c,6.0,%,Corrected
P157,2025-09-15,Sodium,148,mmol/L,Corrected
P114,2025-04-22,Sodium,128,mmol/L,Final
P146,2025-01-08,Glu,237,mg/dL,Final
P111,2025-03-22,Sodium,146,mmol/L,Prelim
P102,2025-09-08,HbA1c,11.5,%,Corrected
P127,2025-01-15,HbA1c,10.8,%,Final
P131,2025-03-08,Glucose,175,mg/dL,Corrected
P159,2025-02-01,Creatinine,2.1,mg/dL,Final
P109,2025-08-01,Glu,118,mg/dL,Corrected
P130,2025-08-01,Glu,120,mg/dL,Final
P129,2025-03-15,Creatinine,0.5,mg/dL,Final
P123,2025-07-22,Glu,224,mg/dL,Corrected
P127,2025-03-15,Sodium,148,mmol/L,Final
P115,2025-07-01,Sodium,141,mmol/L,Final
P136,2025-02-01,Glucose,149,mg/dL,Final
P104,2025-09-08,HbA1c,6.3,%,Final
P121,2025-01-08,Glu,202,mg/dL,Final
P130,2025-04-01,Sodium,134,mmol/L,Final
P122,2025-07-15,LDL,172,mg/dL,Final
P141,2025-01-22,Glucose,146,mg/dL,Prelim
P133,2025-04-01,LDL,112,mg/dL,Final
P117,2025-07-15,Sodium,137,mmol/L,Prelim
P113,2025-01-08,Sodium,130,mmol/L,Final
P110,2025-07-08,Glucose,200,mg/dL,Final
P121,2025-03-08,LDL,132,mg/dL,Prelim
P129,2025-05-22,Glu,73,mg/dL,Final
P145,2025-07-15,Glu,156,mg/dL,Final
P117,2025-02-15,Glu,258,mg/dL,Final
P118,2025-07-08,Sodium,134,mmol/L,Final
P107,2025-07-01,Glucose,196,mg/dL,Corrected
P155,2025-04-01,HbA1c,5.5,%,Final
P150,2025-01-22,Creatinine,0.7,mg/dL,Prelim
P119,2025-05-22,HbA1c,5.1,%,Final
P113,2025-03-08,HbA1c,5.2,%,Final
P140,2025-07-01,Glu,105,mg/dL,Final
P105,2025-02-08,Creatinine,1.6,mg/dL,Final
P156,2025-02-15,Creatinine,0.7,mg/dL,Final
P141,2025-03-08,LDL,147,mg/dL,Corrected
P111,2025-03-15,LDL,79,mg/dL,Corrected
P160,2025-07-01,Glu,135,mg/dL,Final
P127,2025-09-22,Sodium,150,mmol/L,Prelim
P133,2025-09-22,HbA1c,7.1,%,Final
P125,2025-05-08,Glucose,80,mg/dL,Prelim
P113,2025-07-08,Sodium,134,mmol/L,Final
P152,2025-06-22,HbA1c,9.6,%,Final
P142,2025-08-01,HbA1c,10.4,%,Final
P135,2025-04-01,LDL,92,mg/dL,Final
P155,2025-08-22,Glucose,110,mg/dL,Prelim
P118,2025-07-15,Creatinine,2.1,mg/dL,Corrected
P106,2025-06-01,Creatinine,2.8,mg/dL,Corrected
P139,2025-05-15,Sodium,148,mmol/L,Final
P144,2025-04-15,Creatinine,1.5,mg/dL,Prelim
P145,2025-03-15,Glucose,104,mg/dL,Corrected
P127,2025-09-01,Glucose,79,mg/dL,Final
P131,2025-02-22,HbA1c,10.0,%,Corrected
P136,2025-05-22,Sodium,141,mmol/L,Final
P134,2025-06-08,Sodium,129,mmol/L,Final
P112,2025-09-15,Glucose,212,mg/dL,Final
P147,2025-05-15,Creatinine,2.2,mg/dL,Final
P127,2025-09-15,Creatinine,3.0,mg/dL,Final
P115,2025-06-22,HbA1c,9.2,%,Prelim
P154,2025-05-22,Creatinine,3.0,mg/dL,Final
P102,2025-06-22,LDL,69,mg/dL,Corrected
P149,2025-03-01,Glu,167,mg/dL,Corrected
P127,2025-06-01,Glu,83,mg/dL,Prelim
P127,2025-04-01,LDL,203,mg/dL,Final
P126,2025-06-01,Glu,141,mg/dL,Prelim
P146,2025-09-08,HbA1c,6.6,%,Corrected
P122,2025-05-01,Glu,183,mg/dL,Final
P139,2025-05-15,HbA1c,11.5,%,Prelim
P111,2025-04-01,Creatinine,2.6,mg/dL,Corrected
P118,2025-02-08,Glu,122,mg/dL,Final
P136,2025-05-01,Creatinine,0.7,mg/dL,Final
P156,2025-01-15,HbA1c,5.1,%,Prelim
P121,2025-08-01,HbA1c,6.1,%,Final
P116,2025-02-01,Creatinine,0.7,mg/dL,Prelim
P132,2025-04-22,Glu,142,mg/dL,Final
P157,2025-07-01,HbA1c,5.9,%,Final
P107,2025-02-08,LDL,125,mg/dL,Final
P110,2025-04-01,HbA1c,6.7,%,Prelim
P136,2025-05-08,LDL,140,mg/dL,Final
P123,2025-05-08,HbA1c,9.4,%,Final
P147,2025-07-01,Glu,107,mg/dL,Final
P101,2025-09-01,LDL,62,mg/dL,Final
P107,2025-05-08,Sodium,139,mmol/L,Final
P153,2025-05-08,HbA1c,11.3,%,Corrected
P123,2025-05-15,Glucose,259,mg/dL,Final
P133,2025-02-15,Creatinine,1.4,mg/dL,Final
P139,2025-01-01,Creatinine,2.5,mg/dL,Final
P110,2025-05-22,Sodium,131,mmol/L,Final
P141,2025-01-08,Creatinine,2.9,mg/dL,Prelim
P105,2025-08-22,Creatinine,0.7,mg/dL,Prelim
P106,2025-08-15,LDL,111,mg/dL,Corrected
P140,2025-05-01,Creatinine,1.0,mg/dL,Final
P122,2025-05-22,Glucose,257,mg/dL,Final
P124,2025-06-15,Glucose,144,mg/dL,Corrected
P101,2025-09-22,LDL,140,mg/dL,Prelim
P151,2025-01-15,Glucose,253,mg/dL,Prelim
P159,2025-05-22,Glucose,249,mg/dL,Final
P150,2025-09-15,LDL,103,mg/dL,Corrected
P121,2025-04-08,Glucose,139,mg/dL,Prelim
P108,2025-06-01,LDL,135,mg/dL,Final
P148,2025-01-15,Creatinine,0.6,mg/dL,Final
P118,2025-09-15,Creatinine,0.5,mg/dL,Final
P147,2025-09-01,LDL,104,mg/dL,Corrected
P129,2025-03-15,HbA1c,7.0,%,Final
P156,2025-01-15,LDL,80,mg/dL,Final
P107,2025-02-15,Glucose,125,mg/dL,Corrected
P150,2025-08-01,Sodium,144,mmol/L,Prelim
P141,2025-06-22,Glu,132,mg/dL,Corrected
P152,2025-01-15,Creatinine,0.6,mg/dL,Prelim
P148,2025-06-01,Sodium,130,mmol/L,Final
P111,2025-05-08,Creatinine,2.0,mg/dL,Final
P139,2025-01-08,HbA1c,6.9,%,Prelim
P160,2025-06-08,Glu,236,mg/dL,Final
P110,2025-03-08,LDL,169,mg/dL,Corrected
P111,2025-03-01,HbA1c,4.9,%,Corrected
P125,2025-05-15,Glucose,85,mg/dL,Final
P129,2025-05-01,Creatinine,2.2,mg/dL,Final
P106,2025-07-22,Sodium,128,mmol/L,Final
P102,2025-03-08,Sodium,132,mmol/L,Final
P160,2025-07-01,Creatinine,3.2,mg/dL,Prelim
P131,2025-09-22,HbA1c,9.5,%,Final
P154,2025-03-22,HbA1c,9.6,%,Final
P136,2025-02-22,Glu,106,mg/dL,Final
P104,2025-05-22,Glucose,77,mg/dL,Final
P144,2025-05-22,HbA1c,7.3,%,Final
P130,2025-03-15,LDL,97,mg/dL,Final
P125,2025-03-08,Sodium,146,mmol/L,Final
P141,2025-09-01,LDL,173,mg/dL,Corrected
P134,2025-09-22,Glucose,70,mg/dL,Final
P119,2025-06-15,Glucose,122,mg/dL,Prelim
P154,2025-08-15,Sodium,149,mmol/L,Corrected
P160,2025-03-01,Sodium,143,mmol/L,Corrected
P128,2025-02-08,Sodium,143,mmol/L,Final
P137,2025-01-15,Glu,154,mg/dL,Final
P133,2025-03-08,Glucose,206,mg/dL,Corrected
P145,2025-01-01,Sodium,133,mmol/L,Corrected
P142,2025-04-08,Creatinine,1.2,mg/dL,Final
P102,2025-02-22,Glu,246,mg/dL,Final
P148,2025-07-15,Glucose,123,mg/dL,Prelim
P117,2025-06-01,Glucose,189,mg/dL,Final
P131,2025-09-01,Creatinine,1.3,mg/dL,Corrected
P160,2025-07-08,Sodium,147,mmol/L,Final
P115,2025-04-22,Glu,143,mg/dL,Final
P101,2025-09-15,HbA1c,5.5,%,Final
P152,2025-06-15,LDL,134,mg/dL,Prelim
P120,2025-01-22,Creatinine,1.1,mg/dL,Final
P131,2025-07-15,Glu,133,mg/dL,Final
P154,2025-09-22,Glu,177,mg/dL,Final
P147,2025-01-08,LDL,152,mg/dL,Final
P153,2025-05-15,Sodium,133,mmol/L,Prelim
P124,2025-03-08,Creatinine,2.1,mg/dL,Final
P103,2025-03-01,Sodium,139,mmol/L,Final
P156,2025-02-15,Glucose,84,mg/dL,Final
P132,2025-04-22,LDL,210,mg/dL,Final
P128,2025-02-01,Glu,142,mg/dL,Prelim
P135,2025-07-01,Sodium,142,mmol/L,Final
P114,2025-01-22,HbA1c,8.4,%,Prelim
P120,2025-05-15,Glu,70,mg/dL,Final
P158,2025-08-22,Creatinine,1.4,mg/dL,Final
P143,2025-02-15,Glu,214,mg/dL,Final
P142,2025-01-15,Glu,189,mg/dL,Prelim
P130,2025-04-15,Glu,236,mg/dL,Final
P115,2025-02-08,Glu,93,mg/dL,Corrected
P141,2025-02-22,Sodium,147,mmol/L,Final
P156,2025-05-08,Glu,166,mg/dL,Prelim
P131,2025-04-22,Sodium,134,mmol/L,Final
P115,2025-05-08,Creatinine,2.6,mg/dL,Final
P137,2025-02-15,LDL,199,mg/dL,Final
P125,2025-07-15,LDL,220,mg/dL,Corrected
P145,2025-07-01,Creatinine,1.7,mg/dL,Corrected
P105,2025-05-08,HbA1c,10.5,%,Final
P118,2025-08-08,Glucose,142,mg/dL,Final
P125,2025-03-22,Glu,141,mg/dL,Corrected
P148,2025-07-01,Glu,259,mg/dL,Final
P144,2025-07-15,Glucose,174,mg/dL,Final
P152,2025-01-15,Glu,101,mg/dL,Corrected
P122,2025-05-15,HbA1c,10.0,%,Final
P126,2025-03-22,HbA1c,8.1,%,Final
P101,2025-04-01,Sodium,128,mmol/L,Final
P115,2025-08-01,Sodium,139,mmol/L,Final
P123,2025-09-08,Sodium,141,mmol/L,Final
P120,2025-01-01,Glucose,175,mg/dL,Final
P107,2025-07-22,Sodium,148,mmol/L,Final
P143,2025-06-22,Creatinine,1.1,mg/dL,Corrected
P136,2025-05-01,HbA1c,11.2,%,Prelim
P135,2025-06-08,Creatinine,2.9,mg/dL,Final
P146,2025-04-01,Creatinine,2.8,mg/dL,Final
P138,2025-04-15,LDL,161,mg/dL,Final
P107,2025-09-15,HbA1c,5.2,%,Final
P134,2025-04-15,Creatinine,1.2,mg/dL,Final
P142,2025-04-22,Glucose,110,mg/dL,Corrected
P134,2025-01-22,Creatinine,1.0,mg/dL,Prelim
P148,2025-07-22,Glu,256,mg/dL,Final
P136,2025-03-08,Glucose,114,mg/dL,Final
P101,2025-02-15,Creatinine,3.0,mg/dL,Corrected
P155,2025-03-08,Creatinine,1.0,mg/dL,Final
P151,2025-05-15,Glu,229,mg/dL,Corrected
P112,2025-06-22,Glucose,88,mg/dL,Final
P160,2025-05-15,LDL,200,mg/dL,Prelim
P137,2025-09-08,HbA1c,8.1,%,Final
P108,2025-02-22,Creatinine,0.6,mg/dL,Final
P159,2025-09-22,HbA1c,9.8,%,Prelim
P126,2025-02-15,Glucose,218,mg/dL,Final
P141,2025-04-08,Glu,192,mg/dL,Final
P108,2025-02-15,HbA1c,7.6,%,Final
P113,2025-02-22,LDL,190,mg/dL,Corrected
P146,2025-01-22,Sodium,130,mmol/L,Final
P115,2025-03-22,LDL,157,mg/dL,Prelim
P124,2025-04-01,Glucose,181,mg/dL,Final
P123,2025-01-15,Glu,145,mg/dL,Prelim
P117,2025-02-15,Creatinine,2.1,mg/dL,Final
P118,2025-09-22,Glucose,115,mg/dL,Final
P154,2025-04-08,Creatinine,3.1,mg/dL,Prelim
P131,2025-04-15,Creatinine,0.7,mg/dL,Final
P120,2025-07-01,Glu,132,mg/dL,Final
P151,2025-04-22,Sodium,150,mmol/L,Final
P135,2025-01-22,HbA1c,9.4,%,Prelim
P120,2025-01-01,LDL,113,mg/dL,Corrected
P152,2025-03-08,Glucose,87,mg/dL,Prelim
P124,2025-06-08,Glu,214,mg/dL,Final
P148,2025-01-15,LDL,125,mg/dL,Final
P102,2025-07-01,Creatinine,2.5,mg/dL,Prelim
P108,2025-01-08,Glucose,135,mg/dL,Prelim
P119,2025-06-01,Creatinine,0.6,mg/dL,Prelim
P159,2025-01-22,LDL,163,mg/dL,Final
P146,2025-09-22,Sodium,147,mmol/L,Corrected
P132,2025-05-22,HbA1c,9.6,%,Final
P115,2025-05-08,Creatinine,2.3,mg/dL,Final
P125,2025-07-15,HbA1c,9.7,%,Corrected
P126,2025-09-08,LDL,199,mg/dL,Final
P112,2025-07-08,Glu,202,mg/dL,Final
P114,2025-03-01,Glu,218,mg/dL,Final
P131,2025-03-08,Sodium,133,mmol/L,Prelim
P127,2025-06-01,HbA1c,11.3,%,Final
P106,2025-09-01,Glucose,253,mg/dL,Final
P118,2025-02-15,Glucose,113,mg/dL,Corrected
P112,2025-09-08,Creatinine,2.9,mg/dL,Prelim
P128,2025-06-01,Glucose,155,mg/dL,Final
P101,2025-09-08,Glu,260,mg/dL,Corrected
P119,2025-03-15,LDL,134,mg/dL,Final
P159,2025-08-22,Creatinine,2.6,mg/dL,Final
P104,2025-04-22,Glucose,228,mg/dL,Prelim
P119,2025-09-01,Glucose,220,mg/dL,Final
P158,2025-06-08,HbA1c,10.4,%,Final
P142,2025-08-22,Sodium,145,mmol/L,Prelim
P152,2025-07-22,HbA1c,9.2,%,Final
P103,2025-02-01,Glucose,95,mg/dL,Final
P159,2025-04-22,HbA1c,6.8,%,Final
P159,2025-05-08,Creatinine,1.5,mg/dL,Corrected
P110,2025-03-01,Glu,120,mg/dL,Final
P132,2025-05-15,Sodium,136,mmol/L,Corrected
P154,2025-06-01,Sodium,135,mmol/L,Corrected
P116,2025-08-15,Creatinine,1.2,mg/dL,Final
P158,2025-09-01,Glucose,93,mg/dL,Final
P140,2025-06-01,LDL,136,mg/dL,Prelim
P137,2025-01-01,Creatinine,1.2,mg/dL,Prelim
P123,2025-07-08,LDL,68,mg/dL,Prelim
P108,2025-01-08,Sodium,149,mmol/L,Final
P101,2025-06-15,Glu,111,mg/dL,Final
P112,2025-01-22,HbA1c,8.8,%,Final
P103,2025-04-08,Creatinine,2.5,mg/dL,Final
P119,2025-03-01,Glu,74,mg/dL,Final
P113,2025-02-22,Glucose,224,mg/dL,Corrected
P126,2025-09-22,Sodium,128,mmol/L,Final
P102,2025-07-15,Glucose,213,mg/dL,Final
P124,2025-02-22,LDL,205,mg/dL,Final
P110,2025-06-15,Creatinine,3.1,mg/dL,Final
P137,2025-02-01,Creatinine,2.3,mg/dL,Final
P121,2025-05-15,Creatinine,1.0,mg/dL,Final
P109,2025-05-01,Glucose,114,mg/dL,Final
P112,2025-07-15,Sodium,142,mmol/L,Corrected
P141,2025-03-22,Glu,217,mg/dL,Corrected
P121,2025-02-15,Sodium,140,mmol/L,Final
P140,2025-08-01,HbA1c,10.5,%,Corrected
P125,2025-08-01,LDL,84,mg/dL,Final
P150,2025-06-08,Glu,246,mg/dL,Corrected
P106,2025-03-15,HbA1c,10.3,%,Final
P115,2025-03-15,Glucose,231,mg/dL,Final
P157,2025-03-22,Creatinine,2.7,mg/dL,Final
P159,2025-08-15,Glu,108,mg/dL,Final
P119,2025-06-01,Sodium,137,mmol/L,Final
P157,2025-06-01,Glucose,190,mg/dL,Prelim
P148,2025-03-22,HbA1c,6.9,%,Corrected
__EOF__
cat > biomed_text_demo/raw/vitals.tsv <<'__EOF__'
patient_id	visit_date	metric_name	result_value	unit
P130	2025-09-08	DBP	64	mmHg
P145	2025-09-15	DBP	60	mmHg
P122	2025-01-22	HR	81	beats/min
P127	2025-08-22	SBP	134	mmHg
P106	2025-09-08	DBP	57	mmHg
P125	2025-03-15	DBP	60	mmHg
P116	2025-01-08	HR	151	beats/min
P142	2025-07-22	HR	119	beats/min
P150	2025-04-22	HR	88	beats/min
P121	2025-08-08	SBP	120	mmHg
P104	2025-03-22	DBP	85	mmHg
P102	2025-06-08	DBP	78	mmHg
P103	2025-07-15	HR	138	beats/min
P118	2025-07-22	HR	96	beats/min
P116	2025-02-15	SBP	162	mmHg
P146	2025-01-22	HR	143	beats/min
P120	2025-05-15	SBP	149	mmHg
P151	2025-07-15	HR	66	beats/min
P116	2025-03-22	DBP	100	mmHg
P117	2025-04-01	HR	142	beats/min
P148	2025-08-15	SBP	119	mmHg
P135	2025-04-15	HR	140	beats/min
P140	2025-02-15	SBP	114	mmHg
P119	2025-01-15	HR	113	beats/min
P105	2025-06-15	DBP	83	mmHg
P105	2025-05-08	SBP	139	mmHg
P101	2025-02-08	SBP	95	mmHg
P148	2025-09-22	DBP	108	mmHg
P109	2025-09-15	DBP	85	mmHg
P113	2025-03-15	DBP	91	mmHg
P143	2025-02-22	SBP	153	mmHg
P113	2025-01-01	HR	103	beats/min
P139	2025-09-01	DBP	63	mmHg
P120	2025-04-08	HR	127	beats/min
P103	2025-09-01	DBP	87	mmHg
P118	2025-09-08	DBP	60	mmHg
P132	2025-05-15	SBP	152	mmHg
P112	2025-07-08	HR	70	beats/min
P153	2025-04-01	HR	101	beats/min
P160	2025-07-08	HR	110	beats/min
P144	2025-06-22	DBP	64	mmHg
P117	2025-05-08	SBP	132	mmHg
P128	2025-03-22	DBP	82	mmHg
P130	2025-08-01	SBP	122	mmHg
P153	2025-06-15	DBP	73	mmHg
P141	2025-06-15	DBP	79	mmHg
P108	2025-06-22	DBP	59	mmHg
P116	2025-02-15	SBP	162	mmHg
P113	2025-02-08	SBP	112	mmHg
P152	2025-02-15	SBP	136	mmHg
P112	2025-09-22	DBP	99	mmHg
P144	2025-05-15	SBP	165	mmHg
P106	2025-08-01	SBP	95	mmHg
P143	2025-01-15	HR	93	beats/min
P110	2025-03-08	DBP	72	mmHg
P109	2025-08-08	SBP	116	mmHg
P120	2025-06-22	DBP	92	mmHg
P155	2025-02-22	SBP	128	mmHg
P152	2025-03-22	DBP	75	mmHg
P121	2025-07-01	HR	58	beats/min
P104	2025-02-15	SBP	147	mmHg
P110	2025-03-08	DBP	62	mmHg
P152	2025-01-08	HR	125	beats/min
P151	2025-08-22	SBP	119	mmHg
P117	2025-05-08	SBP	130	mmHg
P106	2025-09-08	DBP	93	mmHg
P125	2025-01-01	HR	70	beats/min
P149	2025-01-01	HR	72	beats/min
P106	2025-08-01	SBP	128	mmHg
P103	2025-09-01	DBP	63	mmHg
P102	2025-05-01	SBP	156	mmHg
P139	2025-08-22	SBP	100	mmHg
P128	2025-01-08	HR	126	beats/min
P131	2025-03-01	DBP	107	mmHg
P107	2025-01-15	HR	124	beats/min
P150	2025-06-08	DBP	103	mmHg
P104	2025-01-08	HR	62	beats/min
P104	2025-03-22	DBP	108	mmHg
P133	2025-08-08	SBP	125	mmHg
P159	2025-04-15	HR	93	beats/min
P133	2025-07-01	HR	74	beats/min
P140	2025-01-08	HR	121	beats/min
P132	2025-04-08	HR	127	beats/min
P158	2025-02-01	SBP	118	mmHg
P142	2025-09-08	DBP	64	mmHg
P151	2025-09-01	DBP	69	mmHg
P113	2025-02-08	SBP	106	mmHg
P119	2025-03-01	DBP	90	mmHg
P123	2025-04-15	HR	122	beats/min
P102	2025-06-08	DBP	72	mmHg
P105	2025-04-01	HR	112	beats/min
P124	2025-09-22	DBP	101	mmHg
P158	2025-03-08	DBP	100	mmHg
P112	2025-07-08	HR	68	beats/min
P103	2025-08-22	SBP	99	mmHg
P101	2025-02-08	SBP	101	mmHg
P138	2025-04-22	HR	102	beats/min
P131	2025-02-22	SBP	124	mmHg
P155	2025-03-01	DBP	60	mmHg
P123	2025-06-01	DBP	84	mmHg
P127	2025-09-01	DBP	67	mmHg
P118	2025-07-22	HR	89	beats/min
P145	2025-07-01	HR	74	beats/min
P125	2025-02-08	SBP	118	mmHg
P153	2025-05-08	SBP	141	mmHg
P158	2025-01-22	HR	150	beats/min
P119	2025-02-22	SBP	149	mmHg
P114	2025-06-08	DBP	89	mmHg
P126	2025-04-22	HR	71	beats/min
P137	2025-03-15	DBP	55	mmHg
P128	2025-02-15	SBP	167	mmHg
P147	2025-05-22	SBP	121	mmHg
P115	2025-08-22	SBP	113	mmHg
P106	2025-07-22	HR	135	beats/min
P114	2025-06-08	DBP	63	mmHg
P122	2025-03-08	DBP	101	mmHg
P112	2025-08-15	SBP	99	mmHg
P145	2025-08-08	SBP	114	mmHg
P129	2025-05-08	SBP	165	mmHg
P131	2025-01-15	HR	119	beats/min
P113	2025-01-01	HR	100	beats/min
P141	2025-05-08	SBP	173	mmHg
P108	2025-04-08	HR	56	beats/min
P130	2025-07-22	HR	150	beats/min
P132	2025-06-22	DBP	93	mmHg
P157	2025-09-15	DBP	75	mmHg
P147	2025-06-01	DBP	78	mmHg
P160	2025-09-22	DBP	85	mmHg
P135	2025-06-01	DBP	59	mmHg
P112	2025-09-22	DBP	94	mmHg
P105	2025-04-01	HR	78	beats/min
P110	2025-01-22	HR	84	beats/min
P120	2025-05-15	SBP	139	mmHg
P120	2025-04-08	HR	58	beats/min
P118	2025-08-01	SBP	118	mmHg
P157	2025-07-01	HR	144	beats/min
P104	2025-01-08	HR	75	beats/min
P115	2025-07-15	HR	119	beats/min
P107	2025-03-01	DBP	104	mmHg
P134	2025-02-01	SBP	144	mmHg
P122	2025-02-01	SBP	178	mmHg
P117	2025-06-15	DBP	88	mmHg
P154	2025-09-08	DBP	98	mmHg
P108	2025-05-15	SBP	125	mmHg
P111	2025-06-01	DBP	84	mmHg
P101	2025-03-15	DBP	101	mmHg
P154	2025-07-22	HR	56	beats/min
P118	2025-08-01	SBP	149	mmHg
P107	2025-01-15	HR	62	beats/min
P110	2025-02-01	SBP	121	mmHg
P159	2025-05-22	SBP	128	mmHg
P138	2025-06-08	DBP	59	mmHg
P111	2025-06-01	DBP	81	mmHg
P126	2025-05-01	SBP	175	mmHg
P134	2025-03-08	DBP	88	mmHg
P120	2025-06-22	DBP	93	mmHg
P149	2025-03-15	DBP	103	mmHg
P103	2025-07-15	HR	107	beats/min
P107	2025-02-22	SBP	131	mmHg
P136	2025-09-22	DBP	57	mmHg
P103	2025-08-22	SBP	109	mmHg
P116	2025-03-22	DBP	100	mmHg
P109	2025-07-01	HR	75	beats/min
P156	2025-06-22	DBP	107	mmHg
P124	2025-07-08	HR	72	beats/min
P104	2025-02-15	SBP	109	mmHg
P148	2025-07-08	HR	87	beats/min
P109	2025-08-08	SBP	135	mmHg
P154	2025-08-01	SBP	116	mmHg
P108	2025-05-15	SBP	161	mmHg
P117	2025-06-15	DBP	60	mmHg
P119	2025-02-22	SBP	111	mmHg
P115	2025-09-01	DBP	80	mmHg
P111	2025-04-15	HR	138	beats/min
P109	2025-07-01	HR	57	beats/min
P116	2025-01-08	HR	121	beats/min
P139	2025-07-15	HR	106	beats/min
P101	2025-01-01	HR	89	beats/min
P102	2025-04-22	HR	131	beats/min
P143	2025-03-01	DBP	57	mmHg
P146	2025-03-08	DBP	75	mmHg
P155	2025-01-15	HR	106	beats/min
P114	2025-05-01	SBP	162	mmHg
P124	2025-08-15	SBP	116	mmHg
P114	2025-04-22	HR	64	beats/min
P111	2025-05-22	SBP	138	mmHg
P133	2025-09-15	DBP	88	mmHg
P113	2025-03-15	DBP	58	mmHg
P147	2025-04-15	HR	137	beats/min
P111	2025-04-15	HR	117	beats/min
P112	2025-08-15	SBP	124	mmHg
P144	2025-04-08	HR	78	beats/min
P160	2025-08-15	SBP	166	mmHg
P127	2025-07-15	HR	82	beats/min
P149	2025-02-08	SBP	105	mmHg
P126	2025-06-08	DBP	93	mmHg
P110	2025-01-22	HR	86	beats/min
P136	2025-08-15	SBP	113	mmHg
P110	2025-02-01	SBP	175	mmHg
P137	2025-02-08	SBP	174	mmHg
P156	2025-05-15	SBP	123	mmHg
P119	2025-03-01	DBP	106	mmHg
P134	2025-01-22	HR	142	beats/min
P109	2025-09-15	DBP	87	mmHg
P142	2025-08-01	SBP	95	mmHg
P115	2025-09-01	DBP	71	mmHg
P159	2025-06-01	DBP	78	mmHg
P107	2025-03-01	DBP	83	mmHg
P101	2025-03-15	DBP	92	mmHg
P106	2025-07-22	HR	145	beats/min
P138	2025-05-01	SBP	128	mmHg
P156	2025-04-08	HR	116	beats/min
P140	2025-03-22	DBP	61	mmHg
P135	2025-05-22	SBP	120	mmHg
P146	2025-02-01	SBP	126	mmHg
P136	2025-07-08	HR	140	beats/min
P107	2025-02-22	SBP	144	mmHg
P119	2025-01-15	HR	144	beats/min
P129	2025-04-01	HR	64	beats/min
P115	2025-08-22	SBP	119	mmHg
P114	2025-05-01	SBP	141	mmHg
P114	2025-04-22	HR	105	beats/min
P101	2025-01-01	HR	138	beats/min
P137	2025-01-01	HR	147	beats/min
P141	2025-04-01	HR	149	beats/min
P102	2025-05-01	SBP	156	mmHg
P157	2025-08-08	SBP	101	mmHg
P111	2025-05-22	SBP	158	mmHg
P115	2025-07-15	HR	71	beats/min
P102	2025-04-22	HR	120	beats/min
P118	2025-09-08	DBP	105	mmHg
P108	2025-06-22	DBP	65	mmHg
P105	2025-05-08	SBP	121	mmHg
P108	2025-04-08	HR	88	beats/min
P121	2025-09-15	DBP	55	mmHg
P129	2025-06-15	DBP	65	mmHg
P123	2025-05-22	SBP	156	mmHg
P117	2025-04-01	HR	77	beats/min
P150	2025-05-01	SBP	102	mmHg
P105	2025-06-15	DBP	59	mmHg
__EOF__
cat > biomed_text_demo/raw/notes.txt <<'__EOF__'
# Clinic notes export, free text, one note per line
# Lines starting with # are comments and are not notes
P130 blood pressure rechecked after 5 minutes
P160 follow-up scheduled in 3 months
P147 medication list reviewed, no changes
P155 reports feeling well, no new complaints
P123 fasting confirmed before draw
ERROR: note for P157 could not be parsed on import
P104 fasting confirmed before draw
P113 follow-up scheduled in 3 months
P123 fasting confirmed before draw
P133 medication list reviewed, no changes
P122 reports feeling well, no new complaints
P151 weight NA, height NA
P125 glucose meter reading NA at home
P143 blood pressure rechecked after 5 minutes
P129 reports feeling well, no new complaints
P115 follow-up scheduled in 3 months
# reviewed by nursing staff
P106 fasting confirmed before draw

P150 reports feeling well, no new complaints
P136 glucose meter reading NA at home
P104 blood pressure rechecked after 5 minutes
P153 fasting confirmed before draw
P135 blood pressure rechecked after 5 minutes
P143 medication list reviewed, no changes

P160 follow-up scheduled in 3 months
P113 follow-up scheduled in 3 months
P148 weight NA, height NA
P125 weight NA, height NA
ERROR: note for P109 could not be parsed on import
P115 glucose meter reading NA at home
# reviewed by nursing staff
P113 blood pressure rechecked after 5 minutes
# reviewed by nursing staff
P112 blood pressure rechecked after 5 minutes
P122 sample hemolyzed, result flagged


P148 medication list reviewed, no changes
P156 weight NA, height NA

P147 weight NA, height NA
P124 glucose meter reading NA at home
ERROR: note for P137 could not be parsed on import
P139 medication list reviewed, no changes
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
