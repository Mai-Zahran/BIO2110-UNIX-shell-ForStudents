#!/usr/bin/env bash
# setup_module2_practice_assignment.sh
# Builds the workspace for Practice Assignment 2 (Google Cloud Shell).
# Run from the repository root:
#   bash contents/module2/scripts/setup_module2_practice_assignment.sh
# Safe to run again. It rebuilds raw/ and scripts/, resets the script permission,
# and does not touch outputs/.

set -eu
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODULE="$(cd "$HERE/.." && pwd)"
git -C "$MODULE" config core.fileMode false >/dev/null 2>&1 || true
WORK="$MODULE/practice_assignment2"

mkdir -p "$WORK/raw" "$WORK/scripts" "$WORK/outputs"

cat > "$WORK/raw/labs.csv" <<'EOF_LABS'
patient_id,visit_date,test_name,result_value,unit
P001,2026-01-01,HbA1c,5.3,percent
P002,2026-01-02,Creatinine,1.6,mg/dL
P003,2026-01-03,Glucose,159,mg/dL
P004,2026-01-04,Creatinine,0.8,mg/dL
P005,2026-01-05,Creatinine,1.6,mg/dL
P006,2026-01-06,Potassium,5.3,mmol/L
P007,2026-01-07,Glucose,110,mg/dL
P008,2026-01-08,Sodium,142,mmol/L
P009,2026-01-09,Glucose,174,mg/dL
P010,2026-01-10,Potassium,5.0,mmol/L
P011,2026-01-11,Potassium,3.6,mmol/L
P012,2026-01-12,Glucose,105,mg/dL
P013,2026-01-13,Sodium,133,mmol/L
P014,2026-01-14,Glucose,123,mg/dL
P015,2026-01-15,Sodium,146,mmol/L
P016,2026-01-16,Glucose,175,mg/dL
P017,2026-01-17,Glucose,77,mg/dL
P018,2026-01-18,Creatinine,1.8,mg/dL
P019,2026-01-19,Glucose,89,mg/dL
P020,2026-01-20,Sodium,136,mmol/L
P021,2026-01-21,Hemoglobin,14.7,g/dL
P022,2026-01-22,Glucose,166,mg/dL
P023,2026-01-23,Hemoglobin,12.7,g/dL
P024,2026-01-24,Glucose,154,mg/dL
P025,2026-01-25,HbA1c,6.1,percent
P026,2026-01-26,Hemoglobin,13.6,g/dL
P027,2026-01-27,Hemoglobin,14.8,g/dL
P028,2026-01-28,Creatinine,1.2,mg/dL
P029,2026-02-01,Hemoglobin,14.4,g/dL
P030,2026-02-02,Sodium,133,mmol/L
P031,2026-02-03,Creatinine,0.6,mg/dL
P032,2026-02-04,HbA1c,5.7,percent
P033,2026-02-05,Hemoglobin,13.4,g/dL
P034,2026-02-06,Creatinine,1.6,mg/dL
P035,2026-02-07,Sodium,136,mmol/L
P036,2026-02-08,Creatinine,1.1,mg/dL
P037,2026-02-09,Hemoglobin,12.1,g/dL
P038,2026-02-10,Hemoglobin,11.0,g/dL
P039,2026-02-11,Sodium,143,mmol/L
P040,2026-02-12,Potassium,4.4,mmol/L
P041,2026-02-13,Potassium,4.6,mmol/L
P042,2026-02-14,Glucose,139,mg/dL
P043,2026-02-15,Glucose,177,mg/dL
P044,2026-02-16,Potassium,3.8,mmol/L
P045,2026-02-17,HbA1c,7.8,percent
P046,2026-02-18,Creatinine,1.7,mg/dL
P047,2026-02-19,Creatinine,1.2,mg/dL
P048,2026-02-20,Sodium,132,mmol/L
P049,2026-02-21,Hemoglobin,12.3,g/dL
P050,2026-02-22,Glucose,143,mg/dL
P051,2026-02-23,Sodium,141,mmol/L
P052,2026-02-24,HbA1c,9.1,percent
P053,2026-02-25,Glucose,127,mg/dL
P054,2026-02-26,Sodium,146,mmol/L
P055,2026-02-27,Potassium,5.4,mmol/L
P056,2026-02-28,Glucose,156,mg/dL
P057,2026-03-01,Glucose,177,mg/dL
P058,2026-03-02,Potassium,3.5,mmol/L
P059,2026-03-03,Sodium,144,mmol/L
P060,2026-03-04,Glucose,145,mg/dL
P061,2026-03-05,Hemoglobin,10.6,g/dL
P062,2026-03-06,HbA1c,8.3,percent
P063,2026-03-07,Creatinine,1.4,mg/dL
P064,2026-03-08,Sodium,141,mmol/L
P065,2026-03-09,Hemoglobin,15.6,g/dL
P066,2026-03-10,Potassium,3.7,mmol/L
P067,2026-03-11,Creatinine,1.4,mg/dL
P068,2026-03-12,Creatinine,0.8,mg/dL
P069,2026-03-13,Creatinine,0.7,mg/dL
P070,2026-03-14,Hemoglobin,12.4,g/dL
P071,2026-03-15,HbA1c,9.3,percent
P072,2026-03-16,Creatinine,1.4,mg/dL
P073,2026-03-17,HbA1c,7.6,percent
P074,2026-03-18,Potassium,5.0,mmol/L
P075,2026-03-19,Creatinine,1.0,mg/dL
P076,2026-03-20,Creatinine,1.5,mg/dL
P077,2026-03-21,Sodium,134,mmol/L
P078,2026-03-22,Glucose,72,mg/dL
P079,2026-03-23,Glucose,158,mg/dL
P080,2026-03-24,Glucose,118,mg/dL
P081,2026-03-25,Creatinine,1.7,mg/dL
P082,2026-03-26,Glucose,169,mg/dL
P083,2026-03-27,Creatinine,1.5,mg/dL
P084,2026-03-28,Hemoglobin,11.8,g/dL
P085,2026-04-01,Glucose,170,mg/dL
P086,2026-04-02,Creatinine,0.8,mg/dL
P087,2026-04-03,HbA1c,7.3,percent
P088,2026-04-04,Glucose,81,mg/dL
P089,2026-04-05,Glucose,95,mg/dL
P090,2026-04-06,HbA1c,8.3,percent
P091,2026-04-07,Sodium,143,mmol/L
P092,2026-04-08,Hemoglobin,14.9,g/dL
P093,2026-04-09,Sodium,138,mmol/L
P094,2026-04-10,HbA1c,5.4,percent
P095,2026-04-11,HbA1c,6.4,percent
P096,2026-04-12,Glucose,99,mg/dL
P097,2026-04-13,HbA1c,8.7,percent
P098,2026-04-14,Potassium,5.2,mmol/L
P099,2026-04-15,Potassium,3.5,mmol/L
P100,2026-04-16,HbA1c,7.1,percent
P101,2026-04-17,Sodium,134,mmol/L
P102,2026-04-18,Sodium,143,mmol/L
P103,2026-04-19,Creatinine,0.8,mg/dL
P104,2026-04-20,Potassium,4.0,mmol/L
P105,2026-04-21,Creatinine,1.0,mg/dL
P106,2026-04-22,Sodium,134,mmol/L
P107,2026-04-23,Glucose,141,mg/dL
P108,2026-04-24,Glucose,107,mg/dL
P109,2026-04-25,Creatinine,1.3,mg/dL
P110,2026-04-26,Potassium,3.6,mmol/L
P111,2026-04-27,Sodium,137,mmol/L
P112,2026-04-28,Glucose,158,mg/dL
P113,2026-05-01,Glucose,161,mg/dL
P114,2026-05-02,HbA1c,5.2,percent
P115,2026-05-03,Hemoglobin,14.5,g/dL
P116,2026-05-04,Creatinine,0.9,mg/dL
P117,2026-05-05,Creatinine,0.8,mg/dL
P118,2026-05-06,Sodium,132,mmol/L
P119,2026-05-07,Potassium,5.4,mmol/L
P120,2026-05-08,Glucose,127,mg/dL
EOF_LABS

cat > "$WORK/raw/meds.tsv" <<'EOF_MEDS'
patient_id	med_name	dose	unit	frequency
P001	Levothyroxine	50	mcg	QD
P002	Metformin	500	mg	BID
P003	Levothyroxine	50	mcg	QD
P004	Atorvastatin	20	mg	QHS
P005	Levothyroxine	50	mcg	QD
P006	Atorvastatin	20	mg	QHS
P007	Levothyroxine	50	mcg	QD
P008	Levothyroxine	50	mcg	QD
P009	Lisinopril	10	mg	QD
P010	Atorvastatin	20	mg	QHS
P011	Atorvastatin	20	mg	QHS
P012	Atorvastatin	20	mg	QHS
P013	Lisinopril	10	mg	QD
P014	Levothyroxine	50	mcg	QD
P015	Levothyroxine	50	mcg	QD
P016	Atorvastatin	20	mg	QHS
P017	Atorvastatin	20	mg	QHS
P018	Atorvastatin	20	mg	QHS
P019	Levothyroxine	50	mcg	QD
P020	Metformin	500	mg	BID
P021	Atorvastatin	20	mg	QHS
P022	Levothyroxine	50	mcg	QD
P023	Atorvastatin	20	mg	QHS
P024	Metformin	500	mg	BID
P025	Levothyroxine	50	mcg	QD
P026	Metformin	500	mg	BID
P027	Metformin	500	mg	BID
P028	Metformin	500	mg	BID
P029	Lisinopril	10	mg	QD
P030	Atorvastatin	20	mg	QHS
P031	Levothyroxine	50	mcg	QD
P032	Atorvastatin	20	mg	QHS
P033	Levothyroxine	50	mcg	QD
P034	Lisinopril	10	mg	QD
P035	Lisinopril	10	mg	QD
P036	Lisinopril	10	mg	QD
P037	Lisinopril	10	mg	QD
P038	Lisinopril	10	mg	QD
P039	Metformin	500	mg	BID
P040	Metformin	500	mg	BID
P041	Levothyroxine	50	mcg	QD
P042	Atorvastatin	20	mg	QHS
P043	Atorvastatin	20	mg	QHS
P044	Atorvastatin	20	mg	QHS
P045	Metformin	500	mg	BID
P046	Levothyroxine	50	mcg	QD
P047	Lisinopril	10	mg	QD
P048	Metformin	500	mg	BID
P049	Metformin	500	mg	BID
P050	Levothyroxine	50	mcg	QD
P051	Atorvastatin	20	mg	QHS
P052	Metformin	500	mg	BID
P053	Levothyroxine	50	mcg	QD
P054	Lisinopril	10	mg	QD
P055	Lisinopril	10	mg	QD
P056	Levothyroxine	50	mcg	QD
P057	Atorvastatin	20	mg	QHS
P058	Levothyroxine	50	mcg	QD
P059	Metformin	500	mg	BID
P060	Lisinopril	10	mg	QD
P061	Atorvastatin	20	mg	QHS
P062	Metformin	500	mg	BID
P063	Lisinopril	10	mg	QD
P064	Atorvastatin	20	mg	QHS
P065	Levothyroxine	50	mcg	QD
P066	Lisinopril	10	mg	QD
P067	Levothyroxine	50	mcg	QD
P068	Atorvastatin	20	mg	QHS
P069	Atorvastatin	20	mg	QHS
P070	Metformin	500	mg	BID
P071	Lisinopril	10	mg	QD
P072	Atorvastatin	20	mg	QHS
P073	Levothyroxine	50	mcg	QD
P074	Metformin	500	mg	BID
P075	Levothyroxine	50	mcg	QD
P076	Metformin	500	mg	BID
P077	Lisinopril	10	mg	QD
P078	Levothyroxine	50	mcg	QD
P079	Lisinopril	10	mg	QD
P080	Atorvastatin	20	mg	QHS
P081	Metformin	500	mg	BID
P082	Atorvastatin	20	mg	QHS
P083	Metformin	500	mg	BID
P084	Lisinopril	10	mg	QD
P085	Lisinopril	10	mg	QD
P086	Atorvastatin	20	mg	QHS
P087	Atorvastatin	20	mg	QHS
P088	Atorvastatin	20	mg	QHS
P089	Metformin	500	mg	BID
P090	Atorvastatin	20	mg	QHS
P091	Levothyroxine	50	mcg	QD
P092	Atorvastatin	20	mg	QHS
P093	Metformin	500	mg	BID
P094	Atorvastatin	20	mg	QHS
P095	Metformin	500	mg	BID
P096	Metformin	500	mg	BID
P097	Levothyroxine	50	mcg	QD
P098	Atorvastatin	20	mg	QHS
P099	Metformin	500	mg	BID
P100	Metformin	500	mg	BID
P101	Atorvastatin	20	mg	QHS
P102	Lisinopril	10	mg	QD
P103	Metformin	500	mg	BID
P104	Metformin	500	mg	BID
P105	Levothyroxine	50	mcg	QD
P106	Metformin	500	mg	BID
P107	Atorvastatin	20	mg	QHS
P108	Lisinopril	10	mg	QD
P109	Atorvastatin	20	mg	QHS
P110	Lisinopril	10	mg	QD
P111	Levothyroxine	50	mcg	QD
P112	Lisinopril	10	mg	QD
P113	Levothyroxine	50	mcg	QD
P114	Atorvastatin	20	mg	QHS
P115	Levothyroxine	50	mcg	QD
P116	Levothyroxine	50	mcg	QD
P117	Lisinopril	10	mg	QD
P118	Metformin	500	mg	BID
P119	Lisinopril	10	mg	QD
P120	Metformin	500	mg	BID
EOF_MEDS

cat > "$WORK/raw/vitals.csv" <<'EOF_VITALS'
patient_id,visit_date,heart_rate,bp_systolic,bp_diastolic,temperature_c,resp_rate
P001,2026-01-01,67,148,76,36.9,18
P002,2026-01-02,78,154,60,36.5,17
P003,2026-01-03,89,154,78,36.2,19
P004,2026-01-04,87,148,66,38.3,16
P005,2026-01-05,66,103,89,36.3,19
P006,2026-01-06,65,149,94,37.5,22
P007,2026-01-07,60,143,82,36.6,15
P008,2026-01-08,75,124,73,37.6,21
P009,2026-01-09,77,144,61,36.4,20
P010,2026-01-10,65,115,84,38.3,15
P011,2026-01-11,100,117,72,36.4,12
P012,2026-01-12,110,137,69,37.1,17
P013,2026-01-13,107,135,78,37.8,13
P014,2026-01-14,90,112,95,37.2,12
P015,2026-01-15,100,115,82,36.5,16
P016,2026-01-16,76,135,88,36.4,22
P017,2026-01-17,110,137,76,37.8,16
P018,2026-01-18,87,140,65,37.4,17
P019,2026-01-19,83,142,80,36.8,16
P020,2026-01-20,62,102,87,37.0,22
P021,2026-01-21,92,151,68,36.8,15
P022,2026-01-22,86,102,90,38.3,21
P023,2026-01-23,62,155,68,38.1,13
P024,2026-01-24,64,151,62,37.9,17
P025,2026-01-25,78,149,63,36.1,11
P026,2026-01-26,68,139,62,36.3,15
P027,2026-01-27,58,153,86,37.9,20
P028,2026-01-28,90,159,88,38.0,14
P029,2026-02-01,79,126,71,36.2,19
P030,2026-02-02,65,156,78,37.5,22
P031,2026-02-03,100,134,77,36.9,16
P032,2026-02-04,81,120,95,37.9,22
P033,2026-02-05,97,155,70,38.3,12
P034,2026-02-06,104,110,87,38.2,19
P035,2026-02-07,80,130,69,36.4,11
P036,2026-02-08,106,128,91,36.3,18
P037,2026-02-09,85,153,75,36.7,13
P038,2026-02-10,101,160,98,38.3,14
P039,2026-02-11,102,109,74,36.9,22
P040,2026-02-12,59,104,69,36.5,15
P041,2026-02-13,56,121,79,37.5,22
P042,2026-02-14,110,117,90,36.4,22
P043,2026-02-15,105,131,65,38.3,20
P044,2026-02-16,64,147,80,37.6,12
P045,2026-02-17,59,119,73,36.9,19
P046,2026-02-18,83,115,90,37.1,20
P047,2026-02-19,94,102,67,36.9,12
P048,2026-02-20,61,107,75,37.7,21
P049,2026-02-21,89,139,76,36.5,15
P050,2026-02-22,85,98,63,36.6,21
P051,2026-02-23,110,137,90,37.6,15
P052,2026-02-24,96,154,79,37.7,18
P053,2026-02-25,106,104,88,38.2,12
P054,2026-02-26,109,111,78,38.3,12
P055,2026-02-27,102,134,71,38.3,19
P056,2026-02-28,95,134,97,38.2,11
P057,2026-03-01,103,125,85,37.4,21
P058,2026-03-02,102,98,93,37.1,21
P059,2026-03-03,91,114,61,37.3,22
P060,2026-03-04,87,114,77,36.6,13
P061,2026-03-05,110,141,60,37.8,14
P062,2026-03-06,75,134,85,38.0,14
P063,2026-03-07,90,135,66,37.6,21
P064,2026-03-08,99,143,70,38.0,17
P065,2026-03-09,77,145,69,38.2,15
P066,2026-03-10,61,98,68,37.6,16
P067,2026-03-11,80,106,97,37.6,19
P068,2026-03-12,66,132,76,38.2,12
P069,2026-03-13,55,152,69,36.5,15
P070,2026-03-14,69,112,73,38.3,15
P071,2026-03-15,66,120,97,36.3,20
P072,2026-03-16,77,137,69,38.1,15
P073,2026-03-17,60,107,96,36.8,22
P074,2026-03-18,106,148,80,37.5,11
P075,2026-03-19,77,147,65,36.7,19
P076,2026-03-20,108,112,73,38.3,16
P077,2026-03-21,100,146,68,37.4,21
P078,2026-03-22,77,145,81,38.3,17
P079,2026-03-23,92,107,91,37.9,13
P080,2026-03-24,73,108,94,36.7,16
P081,2026-03-25,61,108,86,36.3,15
P082,2026-03-26,63,99,74,37.1,13
P083,2026-03-27,96,112,64,36.6,13
P084,2026-03-28,93,101,89,37.0,15
P085,2026-04-01,100,103,74,38.0,19
P086,2026-04-02,70,109,84,36.7,18
P087,2026-04-03,106,115,74,36.8,21
P088,2026-04-04,68,146,80,38.0,19
P089,2026-04-05,89,120,62,37.6,20
P090,2026-04-06,62,137,71,37.7,14
P091,2026-04-07,59,152,89,36.6,12
P092,2026-04-08,103,98,67,36.4,19
P093,2026-04-09,59,157,73,38.1,21
P094,2026-04-10,79,156,63,38.3,13
P095,2026-04-11,80,113,74,38.2,11
P096,2026-04-12,91,110,75,38.3,21
P097,2026-04-13,99,147,82,38.1,17
P098,2026-04-14,91,104,67,36.3,13
P099,2026-04-15,98,103,91,36.4,19
P100,2026-04-16,92,140,82,37.6,21
P101,2026-04-17,65,105,73,36.3,14
P102,2026-04-18,97,147,60,37.0,15
P103,2026-04-19,94,104,76,38.1,18
P104,2026-04-20,107,124,97,37.4,16
P105,2026-04-21,95,147,80,36.2,19
P106,2026-04-22,91,158,78,37.7,18
P107,2026-04-23,78,110,70,38.4,12
P108,2026-04-24,92,119,94,36.4,12
P109,2026-04-25,66,133,84,36.9,11
P110,2026-04-26,63,120,91,36.2,14
P111,2026-04-27,70,142,74,37.1,11
P112,2026-04-28,110,102,80,38.1,17
P113,2026-05-01,92,131,66,37.5,18
P114,2026-05-02,73,99,94,36.6,13
P115,2026-05-03,70,100,67,36.5,15
P116,2026-05-04,59,158,77,38.0,13
P117,2026-05-05,85,131,77,37.1,20
P118,2026-05-06,70,119,96,37.9,22
P119,2026-05-07,73,121,88,36.6,12
P120,2026-05-08,62,122,96,38.3,20
EOF_VITALS

cat > "$WORK/scripts/hello.sh" <<'EOF_SH'
#!/usr/bin/env bash
# A tiny script for the permissions task. It prints one line.
echo "Hello from practice_assignment2/scripts/hello.sh"
EOF_SH

chmod -x "$WORK/scripts/hello.sh"
if [ ! -f "$WORK/outputs/README.txt" ]; then
  echo "Save the files you create in this assignment in this folder." > "$WORK/outputs/README.txt"
fi

echo "Module 2 practice_assignment2 is ready in:"
echo "  $WORK"
echo "Spot check: the three raw files have this many lines in total:"
cat "$WORK"/raw/labs.csv "$WORK"/raw/meds.tsv "$WORK"/raw/vitals.csv | wc -l
