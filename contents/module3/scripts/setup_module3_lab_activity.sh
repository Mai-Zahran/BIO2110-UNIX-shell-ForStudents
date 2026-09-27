#!/usr/bin/env bash
# setup_module3_lab_activity.sh
# Builds the lab_activity3 workspace for BIO 2110 Module 3 with synthetic data.
# Safe to run again: data files are rewritten, outputs/ and student files are never touched.
set -e
HERE="$(cd "$(dirname "$0")" && pwd)"
ROOT="$HERE/../lab_activity3"
mkdir -p "$ROOT"
cd "$ROOT"
mkdir -p clinical
mkdir -p bio
mkdir -p logs
mkdir -p outputs
mkdir -p practice
mkdir -p clinical
cat > clinical/labs.csv <<'__EOF__'
patient_id,collection_date,test_name,result_value,status
P041,2026-02-08,HDL,64,Normal
P023,2026-06-22,HbA1c,5.0,Normal
P023,2026-02-08,LDL,198,Critical
P050,2026-05-01,Sodium,148,Abnormal
P024,2026-03-01,glucose,121,Abnormal
P057,2026-02-22,Hemoglobin,11.1,Abnormal
P060,2026-06-08,HbA1c,5.6,Normal
P008,2026-05-15,Sodium,148,Abnormal
P012,2026-04-22,glucose,100,Abnormal
P055,2026-04-08,Creatinine,1.3,Abnormal
P002,2026-04-08,HbA1c,9.3,Critical
P016,2026-05-01,Creatinine,3.3,Critical
P010,2026-01-15,Lipid Panel,171,Normal
P048,2026-01-01,LDL,94,Normal
P047,2026-02-22,LDL,178,Abnormal
P035,2026-02-08,HbA1c,9.2,Critical
P033,2026-01-01,HbA1c,6.6,Abnormal
P051,2026-05-01,Sodium,131,Abnormal
P030,2026-03-15,Creatinine,2.0,Abnormal
P053,2026-04-08,HDL,51,Normal
P034,2026-02-22,glucose,81,Normal
P046,2026-05-01,glucose,156,Critical
P059,2026-03-01,Lipid Panel,219,Abnormal
P051,2026-02-08,LDL,163,Abnormal
P008,2026-02-22,Glucose,178,Critical
P040,2026-04-08,Sodium,128,Critical
P006,2026-02-22,HbA1c,6.8,Abnormal
P057,2026-01-15,Lipid Panel,202,Abnormal
P018,2026-01-15,HbA1c,4.8,Normal
P049,2026-05-15,Sodium,141,Normal
P050,2026-06-08,HDL,38,Abnormal
P030,2026-02-08,HDL,47,Normal
P011,2026-05-01,Sodium,149,Abnormal
P056,2026-06-22,Sodium,128,Critical
P055,2026-04-22,Creatinine,1.2,Normal
P018,2026-04-08,Lipid Panel,195,Normal
P020,2026-06-22,Hemoglobin,8.9,Critical
P007,2026-04-08,Hemoglobin,16.7,Normal
P006,2026-06-22,Sodium,146,Abnormal
P015,2026-04-22,Lipid Panel,255,Abnormal
P039,2026-01-01,Creatinine,2.4,Abnormal
P027,2026-02-08,Lipid Panel,279,Abnormal
P044,2026-02-08,Creatinine,1.6,Abnormal
P004,2026-01-01,HDL,36,Abnormal
P053,2026-04-22,Sodium,144,Normal
P016,2026-05-01,Sodium,135,Normal
P020,2026-02-22,Hemoglobin,13.7,Normal
P003,2026-02-08,LDL,192,Critical
P023,2026-03-15,HDL,76,Normal
P039,2026-05-15,Glucose,127,Critical
P016,2026-06-22,Hemoglobin,11.9,Abnormal
P053,2026-06-22,Glucose,110,Abnormal
P010,2026-06-08,Creatinine,2.6,Critical
P021,2026-04-22,Hemoglobin,9.8,Abnormal
P026,2026-03-15,Creatinine,1.9,Abnormal
P052,2026-01-01,Sodium,139,Normal
P022,2026-02-08,Sodium,140,Normal
P056,2026-06-22,HDL,60,Normal
P055,2026-03-15,LDL,152,Abnormal
P001,2026-01-15,LDL,63,Normal
P058,2026-02-22,Hemoglobin,9.2,Abnormal
P020,2026-03-01,Lipid Panel,269,Abnormal
P045,2026-06-22,HbA1c,8.8,Critical
P031,2026-04-22,LDL,214,Critical
P035,2026-05-01,LDL,218,Critical
P001,2026-02-22,HDL,48,Normal
P044,2026-04-08,Sodium,127,Critical
P039,2026-05-01,Sodium,143,Normal
P013,2026-06-22,HbA1c,4.9,Normal
P001,2026-05-01,Creatinine,0.6,Normal
P022,2026-06-22,Creatinine,2.5,Critical
P058,2026-05-15,Sodium,145,Normal
P055,2026-06-22,HDL,29,Critical
P023,2026-04-22,Lipid Panel,125,Normal
P052,2026-02-08,Lipid Panel,255,Abnormal
P044,2026-06-22,Lipid Panel,253,Abnormal
P020,2026-02-08,Creatinine,1.3,Abnormal
P020,2026-06-22,Lipid Panel,245,Abnormal
P013,2026-03-15,Creatinine,2.3,Abnormal
P011,2026-04-08,Glucose,138,Critical
P024,2026-05-01,LDL,106,Abnormal
P052,2026-01-01,LDL,158,Abnormal
P044,2026-02-08,LDL,156,Abnormal
P029,2026-03-15,Lipid Panel,255,Abnormal
P012,2026-05-15,Lipid Panel,135,Normal
P032,2026-05-01,LDL,75,Normal
P051,2026-05-01,Lipid Panel,191,Normal
P058,2026-05-15,Glucose,142,Critical
P009,2026-05-15,Glucose,199,Critical
P012,2026-02-08,Hemoglobin,16.9,Normal
P041,2026-04-08,Hemoglobin,17.4,Normal
P005,2026-06-08,HDL,76,Normal
P001,2026-06-08,Lipid Panel,260,Abnormal
P017,2026-01-15,Lipid Panel,192,Normal
P021,2026-03-15,HbA1c,9.7,Critical
P007,2026-01-01,HDL,84,Normal
P053,2026-05-15,Lipid Panel,202,Abnormal
P058,2026-05-15,HbA1c,6.0,Abnormal
P034,2026-04-08,Sodium,150,Abnormal
P034,2026-06-22,Creatinine,1.2,Normal
P018,2026-06-22,LDL,195,Critical
P042,2026-03-15,Sodium,148,Abnormal
P024,2026-04-22,Creatinine,3.2,Critical
P031,2026-03-01,Lipid Panel,318,Critical
P021,2026-02-08,HDL,60,Normal
P044,2026-04-08,HbA1c,5.4,Normal
P010,2026-05-15,Glucose,142,Critical
P049,2026-03-01,Hemoglobin,12.0,Normal
P056,2026-03-01,Lipid Panel,304,Critical
P026,2026-06-08,HDL,33,Abnormal
P060,2026-03-01,Hemoglobin,13.7,Normal
P025,2026-01-01,LDL,166,Abnormal
P051,2026-05-15,Glucose,158,Critical
P015,2026-06-22,Sodium,134,Abnormal
P005,2026-02-08,HbA1c,9.9,Critical
P028,2026-04-22,HDL,65,Normal
P037,2026-05-01,Hemoglobin,16.7,Normal
P024,2026-03-15,Lipid Panel,301,Critical
P018,2026-03-01,Sodium,147,Abnormal
P024,2026-05-15,Sodium,141,Normal
P043,2026-05-15,Lipid Panel,276,Abnormal
P037,2026-03-01,Sodium,144,Normal
P011,2026-04-08,Hemoglobin,12.3,Normal
P053,2026-05-15,HbA1c,9.8,Critical
P003,2026-06-22,Creatinine,0.7,Normal
P033,2026-06-22,LDL,134,Abnormal
P025,2026-02-22,Sodium,129,Critical
P050,2026-06-08,HbA1c,5.8,Abnormal
P048,2026-03-01,Lipid Panel,250,Abnormal
P035,2026-02-22,Glucose,93,Normal
P027,2026-01-01,HbA1c,8.7,Critical
P019,2026-06-22,Hemoglobin,8.9,Critical
P034,2026-05-15,Lipid Panel,298,Critical
P006,2026-02-08,Creatinine,0.7,Normal
P036,2026-01-01,Lipid Panel,231,Abnormal
P014,2026-01-01,Hemoglobin,17.4,Normal
P027,2026-05-01,Creatinine,2.5,Critical
P048,2026-04-08,HbA1c,5.4,Normal
P026,2026-01-15,Glucose,150,Critical
P005,2026-05-15,LDL,98,Normal
P009,2026-03-01,HDL,58,Normal
P007,2026-04-22,Glucose,142,Critical
P022,2026-05-01,HbA1c,10.7,Critical
P008,2026-06-22,LDL,217,Critical
P031,2026-03-15,Sodium,126,Critical
P040,2026-02-22,Glucose,175,Critical
P008,2026-03-15,Creatinine,1.2,Normal
P043,2026-03-01,HDL,66,Normal
P010,2026-06-08,Sodium,139,Normal
P034,2026-04-22,Lipid Panel,248,Abnormal
P016,2026-01-01,Glucose,144,Critical
P056,2026-01-01,Glucose,110,Abnormal
P009,2026-01-01,Hemoglobin,15.3,Normal
P017,2026-03-15,LDL,216,Critical
P054,2026-05-15,Sodium,141,Normal
P016,2026-02-08,LDL,83,Normal
P050,2026-03-15,Hemoglobin,12.5,Normal
P036,2026-03-01,LDL,96,Normal
P053,2026-02-08,Creatinine,2.8,Critical
P028,2026-05-15,Lipid Panel,150,Normal
P024,2026-01-15,HDL,38,Abnormal
P058,2026-06-22,HDL,53,Normal
P028,2026-05-15,Hemoglobin,15.6,Normal
P025,2026-04-22,Hemoglobin,11.7,Abnormal
P025,2026-02-08,Creatinine,1.9,Abnormal
P040,2026-04-22,HDL,59,Normal
P017,2026-01-01,HDL,58,Normal
P035,2026-03-15,Lipid Panel,319,Critical
P025,2026-03-15,HDL,62,Normal
P033,2026-04-08,Lipid Panel,218,Abnormal
P036,2026-02-22,Glucose,115,Abnormal
P031,2026-01-15,HDL,84,Normal
P029,2026-05-15,Hemoglobin,17.3,Normal
P030,2026-02-22,Hemoglobin,8.2,Critical
P059,2026-02-08,HbA1c,10.6,Critical
P057,2026-04-08,Glucose,91,Normal
P035,2026-05-01,LDL,69,Normal
P022,2026-06-08,LDL,205,Critical
P009,2026-06-22,Lipid Panel,318,Critical
P037,2026-03-15,Lipid Panel,204,Abnormal
P028,2026-01-15,Sodium,146,Abnormal
P036,2026-04-22,Sodium,134,Abnormal
P038,2026-01-15,Creatinine,1.8,Abnormal
P005,2026-03-15,Lipid Panel,207,Abnormal
P054,2026-06-08,HbA1c,7.2,Abnormal
P025,2026-05-15,HbA1c,4.6,Normal
P024,2026-05-15,HbA1c,9.6,Critical
P007,2026-03-15,HbA1c,8.4,Critical
P044,2026-04-08,Hemoglobin,11.9,Abnormal
P040,2026-06-08,HbA1c,8.2,Critical
P053,2026-05-01,LDL,208,Critical
P038,2026-05-01,Sodium,141,Normal
P010,2026-05-15,LDL,147,Abnormal
P025,2026-05-15,Lipid Panel,237,Abnormal
P023,2026-06-08,Hemoglobin,14.8,Normal
P049,2026-02-22,Glucose,70,Normal
P045,2026-01-01,Glucose,194,Critical
P016,2026-04-08,HDL,31,Abnormal
P022,2026-01-01,Glucose,193,Critical
P001,2026-04-22,Sodium,132,Abnormal
P020,2026-04-08,HDL,35,Abnormal
P006,2026-03-15,Glucose,130,Critical
P055,2026-03-15,HbA1c,10.4,Critical
P037,2026-06-22,Sodium,128,Critical
P002,2026-06-08,Lipid Panel,145,Normal
P009,2026-02-08,HDL,85,Normal
P048,2026-02-08,Glucose,171,Critical
P026,2026-04-22,Hemoglobin,16.5,Normal
P013,2026-03-01,Glucose,137,Critical
P010,2026-02-08,Hemoglobin,13.0,Normal
P042,2026-04-22,Lipid Panel,149,Normal
P035,2026-04-22,Sodium,142,Normal
P054,2026-01-01,Lipid Panel,272,Abnormal
P023,2026-03-15,Glucose,99,Normal
P050,2026-04-08,Lipid Panel,298,Critical
P011,2026-02-08,HbA1c,6.4,Abnormal
P057,2026-03-15,Sodium,138,Normal
P032,2026-05-01,Glucose,125,Abnormal
P021,2026-04-08,Sodium,140,Normal
P054,2026-01-15,LDL,213,Critical
P059,2026-05-15,Glucose,142,Critical
P037,2026-02-22,HDL,30,Critical
P017,2026-02-08,HbA1c,4.6,Normal
P031,2026-03-01,Glucose,194,Critical
P045,2026-01-01,Hemoglobin,13.4,Normal
P005,2026-01-15,Sodium,143,Normal
P048,2026-01-15,HDL,81,Normal
P036,2026-04-08,Creatinine,3.2,Critical
P009,2026-05-15,Creatinine,3.1,Critical
P031,2026-04-08,Creatinine,2.4,Abnormal
P045,2026-01-15,HDL,26,Critical
P041,2026-03-15,Glucose,179,Critical
P054,2026-04-08,Hemoglobin,8.8,Critical
P007,2026-05-01,LDL,209,Critical
P012,2026-04-22,Creatinine,1.0,Normal
P021,2026-04-22,Glucose,141,Critical
P002,2026-02-08,HDL,90,Normal
P001,2026-05-01,Glucose,154,Critical
P013,2026-05-15,Lipid Panel,266,Abnormal
P031,2026-05-15,Hemoglobin,9.1,Abnormal
P020,2026-06-22,Sodium,129,Critical
P041,2026-03-01,Creatinine,1.1,Normal
P029,2026-05-15,Glucose,122,Abnormal
P045,2026-03-01,Lipid Panel,300,Critical
P029,2026-04-08,Creatinine,0.6,Normal
P037,2026-03-01,Glucose,171,Critical
P060,2026-02-08,HDL,67,Normal
P016,2026-05-01,Lipid Panel,166,Normal
P022,2026-02-08,Lipid Panel,138,Normal
P038,2026-02-22,LDL,142,Abnormal
P005,2026-02-08,Hemoglobin,11.0,Abnormal
P019,2026-04-08,Creatinine,2.1,Abnormal
P039,2026-06-22,LDL,190,Critical
P035,2026-02-08,Hemoglobin,13.9,Normal
P042,2026-02-22,LDL,120,Abnormal
P030,2026-01-15,Glucose,103,Abnormal
P034,2026-03-01,HDL,41,Normal
P002,2026-04-08,Sodium,131,Abnormal
P017,2026-06-08,Creatinine,3.3,Critical
P004,2026-01-15,Glucose,183,Critical
P047,2026-01-01,Creatinine,2.0,Abnormal
P002,2026-05-15,Glucose,177,Critical
P060,2026-05-15,Glucose,128,Critical
P046,2026-01-15,HDL,85,Normal
P035,2026-01-15,HbA1c,10.2,Critical
P041,2026-04-08,HbA1c,7.1,Abnormal
P001,2026-01-01,Hemoglobin,9.3,Abnormal
P043,2026-04-08,LDL,104,Abnormal
P046,2026-06-22,LDL,142,Abnormal
P049,2026-04-22,HDL,57,Normal
P049,2026-01-15,Creatinine,2.6,Critical
P047,2026-03-15,Hemoglobin,17.5,Normal
P020,2026-06-08,HbA1c,8.3,Critical
P019,2026-03-15,HbA1c,10.8,Critical
P034,2026-05-15,HbA1c,7.7,Abnormal
P002,2026-02-08,Glucose,197,Critical
P048,2026-03-01,Creatinine,0.6,Normal
P040,2026-06-08,Creatinine,2.5,Critical
P039,2026-05-15,Lipid Panel,275,Abnormal
P027,2026-05-01,LDL,108,Abnormal
P010,2026-03-15,HDL,44,Normal
P013,2026-05-15,HDL,67,Normal
P058,2026-03-15,LDL,216,Critical
P021,2026-01-01,LDL,159,Abnormal
P030,2026-06-22,LDL,147,Abnormal
P021,2026-03-15,Creatinine,3.1,Critical
P059,2026-03-01,Sodium,132,Abnormal
P032,2026-04-08,Hemoglobin,14.4,Normal
P029,2026-01-01,LDL,82,Normal
P026,2026-03-15,Sodium,129,Critical
P011,2026-04-22,Lipid Panel,177,Normal
P050,2026-03-15,LDL,192,Critical
P002,2026-03-15,LDL,191,Critical
P003,2026-03-01,Lipid Panel,305,Critical
P043,2026-02-22,Glucose,196,Critical
P046,2026-04-22,Lipid Panel,198,Normal
P039,2026-06-22,Hemoglobin,14.5,Normal
P045,2026-01-01,Creatinine,3.4,Critical
P037,2026-02-22,LDL,65,Normal
P052,2026-01-15,HbA1c,6.5,Abnormal
P023,2026-03-01,Creatinine,3.2,Critical
P018,2026-03-01,Glucose,101,Abnormal
P026,2026-04-08,HbA1c,9.6,Critical
P036,2026-04-08,HDL,67,Normal
P049,2026-06-22,LDL,167,Abnormal
P004,2026-03-01,LDL,136,Abnormal
P015,2026-06-08,Glucose,187,Critical
P026,2026-04-08,Lipid Panel,189,Normal
P060,2026-04-22,Creatinine,1.2,Normal
P005,2026-06-08,Sodium,145,Normal
P054,2026-01-01,HDL,53,Normal
P050,2026-05-15,Creatinine,2.4,Abnormal
P028,2026-01-15,Glucose,109,Abnormal
P019,2026-03-15,Sodium,151,Abnormal
P052,2026-02-08,HDL,64,Normal
P042,2026-04-22,HbA1c,6.6,Abnormal
P014,2026-03-15,Glucose,102,Abnormal
P036,2026-06-22,HbA1c,9.0,Critical
P052,2026-02-08,Hemoglobin,16.5,Normal
P047,2026-03-15,Sodium,148,Abnormal
P046,2026-01-15,Hemoglobin,13.4,Normal
P018,2026-02-08,Creatinine,1.6,Abnormal
P028,2026-01-01,Creatinine,1.5,Abnormal
P014,2026-06-08,HbA1c,7.5,Abnormal
P051,2026-05-01,Hemoglobin,8.2,Critical
P046,2026-05-15,Sodium,144,Normal
P051,2026-02-22,HbA1c,10.4,Critical
P057,2026-04-22,HbA1c,10.7,Critical
P017,2026-04-22,Hemoglobin,14.2,Normal
P003,2026-05-15,HDL,41,Normal
P034,2026-05-01,LDL,120,Abnormal
P008,2026-01-01,HDL,51,Normal
P039,2026-06-08,Lipid Panel,229,Abnormal
P033,2026-02-08,HDL,77,Normal
P030,2026-03-15,Lipid Panel,295,Critical
P019,2026-01-01,LDL,170,Abnormal
P019,2026-02-08,Glucose,133,Critical
P046,2026-06-22,Creatinine,1.4,Abnormal
P008,2026-01-01,HbA1c,10.8,Critical
P038,2026-04-08,Lipid Panel,195,Normal
P048,2026-05-15,Hemoglobin,11.5,Abnormal
P022,2026-05-01,HDL,56,Normal
P031,2026-06-22,Sodium,151,Abnormal
P009,2026-04-08,LDL,138,Abnormal
P014,2026-04-22,Lipid Panel,313,Critical
P060,2026-01-01,Lipid Panel,181,Normal
P002,2026-06-08,Hemoglobin,16.6,Normal
P022,2026-04-22,Hemoglobin,11.9,Abnormal
P047,2026-04-22,Glucose,163,Critical
P020,2026-05-15,LDL,126,Abnormal
P006,2026-06-22,Hemoglobin,8.9,Critical
P051,2026-06-08,Creatinine,0.6,Normal
P059,2026-01-15,Creatinine,2.7,Critical
P027,2026-06-08,Lipid Panel,273,Abnormal
P033,2026-04-08,Creatinine,3.0,Critical
P008,2026-05-01,Lipid Panel,247,Abnormal
P038,2026-02-22,Glucose,112,Abnormal
P004,2026-01-15,Lipid Panel,190,Normal
P026,2026-01-15,LDL,163,Abnormal
P032,2026-02-08,HbA1c,6.4,Abnormal
P012,2026-05-01,LDL,62,Normal
P019,2026-03-15,Lipid Panel,198,Normal
P045,2026-06-22,Sodium,136,Normal
P017,2026-06-08,Sodium,135,Normal
P058,2026-06-22,Lipid Panel,181,Normal
P029,2026-06-08,HbA1c,5.8,Abnormal
P007,2026-05-15,Creatinine,2.1,Abnormal
P041,2026-05-15,Sodium,139,Normal
P043,2026-06-22,Creatinine,2.9,Critical
P027,2026-06-08,Glucose,186,Critical
P040,2026-03-15,LDL,155,Abnormal
P020,2026-02-08,Glucose,177,Critical
P047,2026-02-08,HbA1c,4.6,Normal
P003,2026-06-22,Sodium,138,Normal
P013,2026-01-01,Lipid Panel,182,Normal
P055,2026-02-22,Glucose,172,Critical
P033,2026-01-15,Hemoglobin,13.9,Normal
P042,2026-04-08,Hemoglobin,11.1,Abnormal
P003,2026-03-15,Glucose,140,Critical
P033,2026-06-08,Glucose,153,Critical
P059,2026-03-01,Hemoglobin,11.0,Abnormal
P056,2026-04-08,LDL,89,Normal
P015,2026-03-01,HDL,72,Normal
P024,2026-03-15,Hemoglobin,15.6,Normal
P057,2026-01-15,Creatinine,0.8,Normal
P007,2026-02-22,Sodium,128,Critical
P030,2026-03-01,HbA1c,8.6,Critical
P015,2026-03-01,Hemoglobin,15.2,Normal
P014,2026-01-01,LDL,205,Critical
P038,2026-01-15,Hemoglobin,10.2,Abnormal
P060,2026-03-01,Sodium,151,Abnormal
P002,2026-03-15,Creatinine,1.8,Abnormal
P041,2026-01-01,LDL,83,Normal
P013,2026-01-01,Sodium,145,Normal
P004,2026-01-15,Hemoglobin,16.0,Normal
P029,2026-04-22,Sodium,149,Abnormal
P015,2026-04-08,LDL,202,Critical
P036,2026-03-15,Hemoglobin,9.2,Abnormal
P043,2026-02-08,Sodium,134,Abnormal
P032,2026-06-22,Lipid Panel,258,Abnormal
P032,2026-02-22,HDL,90,Normal
P054,2026-04-22,Creatinine,1.0,Normal
P012,2026-05-15,HbA1c,7.2,Abnormal
P035,2026-02-22,HbA1c,6.1,Abnormal
P043,2026-02-08,Hemoglobin,13.7,Normal
P008,2026-05-15,Hemoglobin,8.7,Critical
P003,2026-06-22,Hemoglobin,14.9,Normal
P055,2026-05-15,Lipid Panel,148,Normal
P035,2026-03-15,HDL,49,Normal
P050,2026-01-01,Glucose,132,Critical
P032,2026-01-01,HbA1c,5.0,Normal
P011,2026-03-15,LDL,204,Critical
P030,2026-01-01,Sodium,134,Abnormal
P035,2026-01-01,Creatinine,2.1,Abnormal
P059,2026-04-08,LDL,87,Normal
P045,2026-02-22,LDL,173,Abnormal
P057,2026-04-08,LDL,198,Critical
P055,2026-04-22,Hemoglobin,17.2,Normal
P051,2026-02-08,HDL,33,Abnormal
P027,2026-01-01,HDL,87,Normal
P018,2026-03-15,Hemoglobin,9.7,Abnormal
P057,2026-04-08,HDL,36,Abnormal
P018,2026-03-01,Creatinine,0.7,Normal
P055,2026-01-01,Sodium,152,Abnormal
P019,2026-04-22,HDL,33,Abnormal
P001,2026-05-15,HbA1c,8.8,Critical
P040,2026-04-22,Hemoglobin,8.3,Critical
P047,2026-03-15,HDL,59,Normal
P059,2026-01-15,HDL,36,Abnormal
P056,2026-04-08,HbA1c,8.3,Critical
P011,2026-01-01,Creatinine,2.0,Abnormal
P056,2026-04-08,Creatinine,2.5,Critical
P006,2026-03-01,HDL,77,Normal
P023,2026-03-15,Sodium,143,Normal
P038,2026-06-08,HDL,63,Normal
P040,2026-02-22,Lipid Panel,245,Abnormal
P012,2026-04-22,Sodium,132,Abnormal
P005,2026-03-15,Glucose,104,Abnormal
P034,2026-05-15,Hemoglobin,15.4,Normal
P043,2026-01-01,HbA1c,7.1,Abnormal
P060,2026-02-22,LDL,73,Normal
P013,2026-02-08,Hemoglobin,13.9,Normal
P010,2026-06-08,HbA1c,4.8,Normal
P009,2026-02-22,HbA1c,5.4,Normal
P006,2026-05-15,LDL,158,Abnormal
P014,2026-04-22,HDL,39,Abnormal
P046,2026-03-01,HbA1c,7.5,Abnormal
P027,2026-01-01,Sodium,145,Normal
P042,2026-04-22,HDL,45,Normal
P033,2026-04-22,Sodium,146,Abnormal
P049,2026-05-15,HbA1c,9.7,Critical
P037,2026-02-08,Creatinine,1.4,Abnormal
P007,2026-01-15,Lipid Panel,176,Normal
P032,2026-06-08,Creatinine,2.1,Abnormal
P054,2026-06-22,Glucose,75,Normal
P052,2026-06-22,Glucose,99,Normal
P021,2026-06-22,Lipid Panel,297,Critical
P027,2026-04-22,Hemoglobin,10.5,Abnormal
P006,2026-02-08,Lipid Panel,121,Normal
P033,2026-06-22,Glucose,140,Critical
P014,2026-04-08,Sodium,141,Normal
P053,2026-02-22,Hemoglobin,13.0,Normal
P004,2026-01-15,Creatinine,1.1,Normal
P052,2026-06-08,Creatinine,3.3,Critical
P044,2026-01-01,Glucose,136,Critical
P031,2026-06-22,HbA1c,7.3,Abnormal
P037,2026-01-15,HbA1c,9.2,Critical
P039,2026-04-22,HDL,76,Normal
P034,2026-02-08,LDL,126,Abnormal
P012,2026-05-01,HDL,39,Abnormal
P014,2026-01-01,Creatinine,3.0,Critical
P025,2026-03-01,Glucose,174,Critical
P016,2026-03-15,HbA1c,7.6,Abnormal
P018,2026-06-08,HDL,76,Normal
P004,2026-05-15,Sodium,144,Normal
P044,2026-02-22,HDL,43,Normal
P017,2026-03-01,Glucose,143,Critical
P029,2026-03-01,HDL,33,Abnormal
P028,2026-03-01,LDL,205,Critical
P003,2026-06-08,HbA1c,4.6,Normal
P039,2026-06-22,HbA1c,10.3,Critical
P015,2026-04-08,HbA1c,10.0,Critical
P038,2026-04-08,HbA1c,7.3,Abnormal
P015,2026-05-01,Creatinine,1.5,Abnormal
P005,2026-01-01,Creatinine,1.9,Abnormal
P047,2026-06-08,Lipid Panel,185,Normal
P013,2026-06-08,LDL,112,Abnormal
P042,2026-03-15,Glucose,166,Critical
P048,2026-05-15,Sodium,133,Abnormal
P041,2026-04-22,Lipid Panel,176,Normal
P011,2026-05-15,HDL,68,Normal
P028,2026-04-08,HbA1c,4.8,Normal
P056,2026-06-08,Hemoglobin,13.0,Normal
P042,2026-03-15,Creatinine,0.6,Normal
P004,2026-05-01,HbA1c,10.9,Critical
P045,2026-04-22,Hemoglobin,16.5,Normal
P032,2026-03-15,Sodium,132,Abnormal
P049,2026-05-15,Lipid Panel,289,Critical
P058,2026-03-01,Creatinine,0.9,Normal
P009,2026-05-01,Sodium,126,Critical
__EOF__
mkdir -p clinical
cat > clinical/visits.csv <<'__EOF__'
patient_id,visit_date,department,provider,visit_type,status
P010,2026-04-08,Endocrinology,chen,NEW,Completed
P008,2026-02-22,Endocrinology,ramirez,FOLLOWUP,Completed
P038,2026-02-08,Neurology,ramirez,FOLLOWUP,Completed
P040,2026-04-22,Nephrology,chen,NEW,Cancelled
P006,2026-06-08,Neurology,okonkwo,TELEHEALTH,NoShow
P018,2026-06-08,Cardiology,ramirez,TELEHEALTH,Completed
P031,2026-01-15,Neurology,okonkwo,NEW,Completed
P010,2026-04-08,Cardiology,chen,NEW,Completed
P057,2026-03-01,Cardiology,delacruz,TELEHEALTH,NoShow
P053,2026-05-01,Neurology,ramirez,FOLLOWUP,Completed
P045,2026-03-01,Neurology,chen,TELEHEALTH,Completed
P054,2026-06-08,Cardiology,nakamura,TELEHEALTH,Completed
P018,2026-06-08,Cardiology,ramirez,TELEHEALTH,Completed
P059,2026-05-15,Nephrology,nakamura,FOLLOWUP,Completed
P019,2026-01-15,Endocrinology,nakamura,NEW,Completed
P047,2026-05-15,Nephrology,delacruz,FOLLOWUP,Completed
P026,2026-02-08,Neurology,okonkwo,FOLLOWUP,Completed
P033,2026-03-01,Cardiology,ramirez,TELEHEALTH,Completed
P027,2026-03-15,Endocrinology,delacruz,TELEHEALTH,Completed
P050,2026-02-08,Cardiology,chen,FOLLOWUP,Cancelled
P009,2026-03-01,Endocrinology,nakamura,TELEHEALTH,Completed
P025,2026-01-01,Neurology,chen,NEW,NoShow
P012,2026-06-22,Neurology,delacruz,TELEHEALTH,NoShow
P007,2026-01-15,Neurology,delacruz,NEW,Cancelled
P025,2026-01-01,Cardiology,chen,NEW,Completed
P002,2026-02-08,Cardiology,delacruz,FOLLOWUP,Completed
P035,2026-05-15,Cardiology,chen,FOLLOWUP,Cancelled
P058,2026-04-08,Neurology,ramirez,NEW,NoShow
P013,2026-01-01,Nephrology,ramirez,NEW,Completed
P006,2026-06-08,Neurology,okonkwo,TELEHEALTH,Completed
P044,2026-02-22,Cardiology,nakamura,FOLLOWUP,Cancelled
P039,2026-03-15,Nephrology,nakamura,TELEHEALTH,Completed
P031,2026-01-15,Neurology,okonkwo,NEW,Completed
P036,2026-06-22,Neurology,okonkwo,TELEHEALTH,Completed
P005,2026-05-01,Nephrology,chen,FOLLOWUP,Completed
P037,2026-01-01,Cardiology,delacruz,NEW,Completed
P012,2026-06-22,Endocrinology,delacruz,TELEHEALTH,Cancelled
P028,2026-04-22,Cardiology,ramirez,NEW,NoShow
P056,2026-02-22,Endocrinology,okonkwo,FOLLOWUP,Completed
P040,2026-04-22,Cardiology,chen,NEW,NoShow
P003,2026-03-15,Nephrology,ramirez,TELEHEALTH,Completed
P054,2026-06-08,Endocrinology,nakamura,TELEHEALTH,Completed
P046,2026-04-08,Neurology,okonkwo,NEW,Completed
P055,2026-01-15,Cardiology,chen,NEW,Cancelled
P043,2026-01-15,Nephrology,ramirez,NEW,Cancelled
P051,2026-03-15,Cardiology,okonkwo,TELEHEALTH,Completed
P056,2026-02-22,Endocrinology,okonkwo,FOLLOWUP,Completed
P028,2026-04-22,Cardiology,ramirez,NEW,Completed
P038,2026-02-08,Nephrology,ramirez,FOLLOWUP,Cancelled
P042,2026-06-08,Neurology,delacruz,TELEHEALTH,Completed
P011,2026-05-15,Cardiology,okonkwo,FOLLOWUP,Completed
P049,2026-01-01,Cardiology,nakamura,NEW,Cancelled
P029,2026-05-01,Neurology,nakamura,FOLLOWUP,Completed
P020,2026-02-22,Nephrology,chen,FOLLOWUP,Completed
P020,2026-02-22,Cardiology,chen,FOLLOWUP,Cancelled
P002,2026-02-08,Neurology,delacruz,FOLLOWUP,Completed
P038,2026-02-08,Endocrinology,ramirez,FOLLOWUP,Completed
P023,2026-05-15,Nephrology,ramirez,FOLLOWUP,Completed
P060,2026-06-22,Neurology,chen,TELEHEALTH,Completed
P003,2026-03-15,Neurology,ramirez,TELEHEALTH,Completed
P045,2026-03-01,Endocrinology,chen,TELEHEALTH,Cancelled
P056,2026-02-22,Neurology,okonkwo,FOLLOWUP,Completed
P016,2026-04-22,Cardiology,okonkwo,NEW,Cancelled
P055,2026-01-15,Neurology,chen,NEW,Cancelled
P007,2026-01-15,Neurology,delacruz,NEW,Completed
P029,2026-05-01,Neurology,nakamura,FOLLOWUP,Completed
P058,2026-04-08,Neurology,ramirez,NEW,Completed
P039,2026-03-15,Nephrology,nakamura,TELEHEALTH,Cancelled
P057,2026-03-01,Endocrinology,delacruz,TELEHEALTH,Completed
P059,2026-05-15,Cardiology,nakamura,FOLLOWUP,Completed
P050,2026-02-08,Neurology,chen,FOLLOWUP,Completed
P031,2026-01-15,Nephrology,okonkwo,NEW,Completed
P028,2026-04-22,Nephrology,ramirez,NEW,Completed
P015,2026-03-15,Neurology,chen,TELEHEALTH,Completed
P009,2026-03-01,Neurology,nakamura,TELEHEALTH,Completed
P018,2026-06-08,Neurology,ramirez,TELEHEALTH,Completed
P033,2026-03-01,Nephrology,ramirez,TELEHEALTH,Completed
P034,2026-04-08,Cardiology,nakamura,NEW,Completed
P016,2026-04-22,Neurology,okonkwo,NEW,Completed
P027,2026-03-15,Cardiology,delacruz,TELEHEALTH,Cancelled
P035,2026-05-15,Endocrinology,chen,FOLLOWUP,Completed
P040,2026-04-22,Cardiology,chen,NEW,NoShow
P032,2026-02-22,Cardiology,delacruz,FOLLOWUP,Cancelled
P055,2026-01-15,Cardiology,chen,NEW,Completed
P022,2026-04-08,Endocrinology,delacruz,NEW,Completed
P048,2026-06-22,Neurology,ramirez,TELEHEALTH,Completed
P052,2026-04-22,Endocrinology,delacruz,NEW,Completed
P036,2026-06-22,Neurology,okonkwo,TELEHEALTH,NoShow
P022,2026-04-08,Cardiology,delacruz,NEW,Completed
P011,2026-05-15,Neurology,okonkwo,FOLLOWUP,Completed
P050,2026-02-08,Neurology,chen,FOLLOWUP,Completed
P030,2026-06-08,Neurology,chen,TELEHEALTH,Cancelled
P022,2026-04-08,Cardiology,delacruz,NEW,Cancelled
P022,2026-04-08,Nephrology,delacruz,NEW,Completed
P005,2026-05-01,Nephrology,chen,FOLLOWUP,Completed
P015,2026-03-15,Endocrinology,chen,TELEHEALTH,Completed
P007,2026-01-15,Neurology,delacruz,NEW,NoShow
P029,2026-05-01,Endocrinology,nakamura,FOLLOWUP,Completed
P040,2026-04-22,Neurology,chen,NEW,Completed
P026,2026-02-08,Nephrology,okonkwo,FOLLOWUP,Completed
P014,2026-02-08,Cardiology,nakamura,FOLLOWUP,Cancelled
P006,2026-06-08,Neurology,okonkwo,TELEHEALTH,Completed
P039,2026-03-15,Nephrology,nakamura,TELEHEALTH,Completed
P004,2026-04-22,Cardiology,nakamura,NEW,Completed
P010,2026-04-08,Cardiology,chen,NEW,Completed
P049,2026-01-01,Endocrinology,nakamura,NEW,Completed
P021,2026-03-01,Cardiology,okonkwo,TELEHEALTH,Cancelled
P059,2026-05-15,Endocrinology,nakamura,FOLLOWUP,Completed
P053,2026-05-01,Endocrinology,ramirez,FOLLOWUP,Completed
P034,2026-04-08,Endocrinology,nakamura,NEW,Completed
P033,2026-03-01,Endocrinology,ramirez,TELEHEALTH,Completed
P044,2026-02-22,Cardiology,nakamura,FOLLOWUP,Completed
P036,2026-06-22,Cardiology,okonkwo,TELEHEALTH,Completed
P043,2026-01-15,Neurology,ramirez,NEW,Completed
P023,2026-05-15,Cardiology,ramirez,FOLLOWUP,Completed
P054,2026-06-08,Neurology,nakamura,TELEHEALTH,Cancelled
P025,2026-01-01,Neurology,chen,NEW,NoShow
P048,2026-06-22,Cardiology,ramirez,TELEHEALTH,Cancelled
P044,2026-02-22,Neurology,nakamura,FOLLOWUP,NoShow
P030,2026-06-08,Neurology,chen,TELEHEALTH,Completed
P023,2026-05-15,Cardiology,ramirez,FOLLOWUP,Completed
P041,2026-05-01,Neurology,okonkwo,FOLLOWUP,Completed
P024,2026-06-22,Neurology,nakamura,TELEHEALTH,Completed
P051,2026-03-15,Nephrology,okonkwo,TELEHEALTH,Completed
P032,2026-02-22,Neurology,delacruz,FOLLOWUP,Completed
P018,2026-06-08,Neurology,ramirez,TELEHEALTH,Completed
P053,2026-05-01,Neurology,ramirez,FOLLOWUP,Cancelled
P041,2026-05-01,Cardiology,okonkwo,FOLLOWUP,Completed
P024,2026-06-22,Endocrinology,nakamura,TELEHEALTH,Completed
P056,2026-02-22,Cardiology,okonkwo,FOLLOWUP,Cancelled
P023,2026-05-15,Neurology,ramirez,FOLLOWUP,Completed
P045,2026-03-01,Endocrinology,chen,TELEHEALTH,Completed
P046,2026-04-08,Nephrology,okonkwo,NEW,Completed
P013,2026-01-01,Endocrinology,ramirez,NEW,Cancelled
P041,2026-05-01,Neurology,okonkwo,FOLLOWUP,Completed
P013,2026-01-01,Cardiology,ramirez,NEW,Completed
P009,2026-03-01,Neurology,nakamura,TELEHEALTH,Completed
P007,2026-01-15,Endocrinology,delacruz,NEW,Completed
P001,2026-01-01,Cardiology,okonkwo,NEW,Cancelled
P008,2026-02-22,Neurology,ramirez,FOLLOWUP,Completed
P015,2026-03-15,Cardiology,chen,TELEHEALTH,Completed
P021,2026-03-01,Cardiology,okonkwo,TELEHEALTH,Completed
P054,2026-06-08,Endocrinology,nakamura,TELEHEALTH,Completed
P032,2026-02-22,Cardiology,delacruz,FOLLOWUP,Completed
P011,2026-05-15,Neurology,okonkwo,FOLLOWUP,Cancelled
P021,2026-03-01,Neurology,okonkwo,TELEHEALTH,Cancelled
P048,2026-06-22,Neurology,ramirez,TELEHEALTH,Completed
P021,2026-03-01,Cardiology,okonkwo,TELEHEALTH,Completed
P016,2026-04-22,Cardiology,okonkwo,NEW,Cancelled
P027,2026-03-15,Neurology,delacruz,TELEHEALTH,Cancelled
P017,2026-05-01,Endocrinology,delacruz,FOLLOWUP,Cancelled
P059,2026-05-15,Neurology,nakamura,FOLLOWUP,Completed
P015,2026-03-15,Cardiology,chen,TELEHEALTH,Completed
P011,2026-05-15,Cardiology,okonkwo,FOLLOWUP,Completed
P033,2026-03-01,Cardiology,ramirez,TELEHEALTH,Completed
P005,2026-05-01,Cardiology,chen,FOLLOWUP,Cancelled
P052,2026-04-22,Neurology,delacruz,NEW,Completed
P051,2026-03-15,Neurology,okonkwo,TELEHEALTH,Completed
P052,2026-04-22,Cardiology,delacruz,NEW,Cancelled
P037,2026-01-01,Neurology,delacruz,NEW,Completed
P028,2026-04-22,Endocrinology,ramirez,NEW,Completed
P048,2026-06-22,Nephrology,ramirez,TELEHEALTH,Completed
P009,2026-03-01,Nephrology,nakamura,TELEHEALTH,Cancelled
P020,2026-02-22,Cardiology,chen,FOLLOWUP,Completed
P002,2026-02-08,Endocrinology,delacruz,FOLLOWUP,Completed
P060,2026-06-22,Nephrology,chen,TELEHEALTH,NoShow
P034,2026-04-08,Cardiology,nakamura,NEW,Completed
P060,2026-06-22,Nephrology,chen,TELEHEALTH,Completed
P030,2026-06-08,Neurology,chen,TELEHEALTH,Cancelled
P060,2026-06-22,Cardiology,chen,TELEHEALTH,Completed
P057,2026-03-01,Nephrology,delacruz,TELEHEALTH,Cancelled
P035,2026-05-15,Neurology,chen,FOLLOWUP,Completed
P058,2026-04-08,Neurology,ramirez,NEW,Completed
P006,2026-06-08,Endocrinology,okonkwo,TELEHEALTH,Completed
P049,2026-01-01,Cardiology,nakamura,NEW,Cancelled
P049,2026-01-01,Nephrology,nakamura,NEW,Completed
P012,2026-06-22,Nephrology,delacruz,TELEHEALTH,NoShow
P027,2026-03-15,Neurology,delacruz,TELEHEALTH,Cancelled
P052,2026-04-22,Nephrology,delacruz,NEW,Completed
P037,2026-01-01,Neurology,delacruz,NEW,Completed
P034,2026-04-08,Nephrology,nakamura,NEW,Completed
P057,2026-03-01,Nephrology,delacruz,TELEHEALTH,Completed
P039,2026-03-15,Endocrinology,nakamura,TELEHEALTH,Completed
P005,2026-05-01,Cardiology,chen,FOLLOWUP,Completed
P058,2026-04-08,Endocrinology,ramirez,NEW,Completed
P055,2026-01-15,Neurology,chen,NEW,Completed
P002,2026-02-08,Endocrinology,delacruz,FOLLOWUP,NoShow
P024,2026-06-22,Neurology,nakamura,TELEHEALTH,Completed
P042,2026-06-08,Neurology,delacruz,TELEHEALTH,Completed
P004,2026-04-22,Neurology,nakamura,NEW,Completed
P003,2026-03-15,Endocrinology,ramirez,TELEHEALTH,Completed
P008,2026-02-22,Cardiology,ramirez,FOLLOWUP,Completed
P043,2026-01-15,Neurology,ramirez,NEW,Completed
P046,2026-04-08,Cardiology,okonkwo,NEW,Completed
P004,2026-04-22,Endocrinology,nakamura,NEW,Completed
P050,2026-02-08,Nephrology,chen,FOLLOWUP,Completed
P053,2026-05-01,Neurology,ramirez,FOLLOWUP,Completed
P014,2026-02-08,Neurology,nakamura,FOLLOWUP,Completed
P032,2026-02-22,Endocrinology,delacruz,FOLLOWUP,Completed
P019,2026-01-15,Nephrology,nakamura,NEW,Completed
P001,2026-01-01,Cardiology,okonkwo,NEW,Cancelled
P036,2026-06-22,Cardiology,okonkwo,TELEHEALTH,Completed
P004,2026-04-22,Cardiology,nakamura,NEW,Completed
P003,2026-03-15,Nephrology,ramirez,TELEHEALTH,NoShow
P024,2026-06-22,Cardiology,nakamura,TELEHEALTH,Completed
P045,2026-03-01,Endocrinology,chen,TELEHEALTH,Completed
P008,2026-02-22,Neurology,ramirez,FOLLOWUP,Completed
P001,2026-01-01,Nephrology,okonkwo,NEW,Completed
P017,2026-05-01,Nephrology,delacruz,FOLLOWUP,Completed
P014,2026-02-08,Neurology,nakamura,FOLLOWUP,Completed
P042,2026-06-08,Neurology,delacruz,TELEHEALTH,Completed
P037,2026-01-01,Nephrology,delacruz,NEW,Completed
P019,2026-01-15,Endocrinology,nakamura,NEW,Completed
P020,2026-02-22,Nephrology,chen,FOLLOWUP,NoShow
P029,2026-05-01,Endocrinology,nakamura,FOLLOWUP,Completed
P010,2026-04-08,Cardiology,chen,NEW,Cancelled
P047,2026-05-15,Endocrinology,delacruz,FOLLOWUP,NoShow
P041,2026-05-01,Nephrology,okonkwo,FOLLOWUP,Cancelled
P016,2026-04-22,Cardiology,okonkwo,NEW,NoShow
P012,2026-06-22,Endocrinology,delacruz,TELEHEALTH,Completed
P042,2026-06-08,Cardiology,delacruz,TELEHEALTH,Completed
P044,2026-02-22,Cardiology,nakamura,FOLLOWUP,Completed
P025,2026-01-01,Neurology,chen,NEW,Completed
P017,2026-05-01,Nephrology,delacruz,FOLLOWUP,Completed
P026,2026-02-08,Cardiology,okonkwo,FOLLOWUP,Completed
P031,2026-01-15,Endocrinology,okonkwo,NEW,Completed
P043,2026-01-15,Cardiology,ramirez,NEW,Cancelled
P051,2026-03-15,Nephrology,okonkwo,TELEHEALTH,Completed
P014,2026-02-08,Cardiology,nakamura,FOLLOWUP,Completed
P013,2026-01-01,Neurology,ramirez,NEW,NoShow
P017,2026-05-01,Cardiology,delacruz,FOLLOWUP,NoShow
P047,2026-05-15,Neurology,delacruz,FOLLOWUP,Completed
P046,2026-04-08,Neurology,okonkwo,NEW,Completed
P035,2026-05-15,Neurology,chen,FOLLOWUP,Completed
P019,2026-01-15,Neurology,nakamura,NEW,Completed
P001,2026-01-01,Cardiology,okonkwo,NEW,Completed
P047,2026-05-15,Endocrinology,delacruz,FOLLOWUP,Completed
P026,2026-02-08,Neurology,okonkwo,FOLLOWUP,Completed
P030,2026-06-08,Cardiology,chen,TELEHEALTH,Completed
P038,2026-02-08,Neurology,ramirez,FOLLOWUP,Completed
__EOF__
mkdir -p clinical
cat > clinical/vitals.csv <<'__EOF__'
patient_id,measured_on,measure,value,unit
P042,2026-06-08,SPO2,92,%
P008,2026-01-01,BPM,72,beats/min
P031,2026-01-15,BP,114/90,mmHg
P056,2026-03-15,TEMP,36.2,C
P035,2026-05-01,BPSYS,165,mmHg
P058,2026-06-22,BPSYS,160,mmHg
P019,2026-03-01,BPSYS,137,mmHg
P052,2026-05-01,BPM,105,beats/min
P020,2026-01-01,BPM,62,beats/min
P021,2026-05-01,BP,130/75,mmHg
P040,2026-05-01,BPM,57,beats/min
P002,2026-04-08,SPO2,99,%
P027,2026-01-01,BPSYS,151,mmHg
P058,2026-01-01,TEMP,38.5,C
P011,2026-05-01,BPSYS,102,mmHg
P033,2026-06-08,BPM,64,beats/min
P043,2026-02-22,BPM,75,beats/min
P009,2026-05-01,BP,136/71,mmHg
P018,2026-03-15,BPM,65,beats/min
P039,2026-03-15,SPO2,92,%
P033,2026-05-01,BP,101/100,mmHg
P050,2026-02-22,BPSYS,134,mmHg
P030,2026-04-22,BPSYS,164,mmHg
P030,2026-02-08,BP,144/75,mmHg
P059,2026-05-01,BPSYS,151,mmHg
P014,2026-02-22,BPSYS,113,mmHg
P020,2026-06-22,BP,113/95,mmHg
P007,2026-02-22,BPM,59,beats/min
P048,2026-03-01,BPM,74,beats/min
P031,2026-04-08,TEMP,36.9,C
P041,2026-01-01,SPO2,95,%
P006,2026-04-22,BPSYS,146,mmHg
P012,2026-03-01,BPM,79,beats/min
P052,2026-01-15,TEMP,36.9,C
P039,2026-02-08,TEMP,36.6,C
P032,2026-02-08,BPSYS,148,mmHg
P043,2026-05-15,SPO2,97,%
P004,2026-04-22,BP,109/80,mmHg
P054,2026-02-08,BP,136/79,mmHg
P034,2026-02-08,SPO2,90,%
P056,2026-02-08,BPSYS,128,mmHg
P055,2026-02-22,BPM,75,beats/min
P038,2026-03-01,TEMP,38.0,C
P032,2026-06-22,BP,131/90,mmHg
P047,2026-03-15,BP,157/61,mmHg
P028,2026-05-01,BPM,68,beats/min
P034,2026-01-01,TEMP,37.3,C
P010,2026-01-01,TEMP,38.0,C
P030,2026-03-15,BPM,58,beats/min
P008,2026-06-22,BP,103/77,mmHg
P044,2026-01-01,BPM,62,beats/min
P057,2026-03-01,SPO2,97,%
P053,2026-06-22,TEMP,36.4,C
P029,2026-06-22,TEMP,36.9,C
P033,2026-03-01,SPO2,95,%
P007,2026-05-15,SPO2,92,%
P024,2026-03-01,BPM,77,beats/min
P011,2026-06-08,TEMP,36.3,C
P052,2026-02-22,SPO2,94,%
P041,2026-05-15,BPSYS,108,mmHg
P056,2026-04-22,SPO2,93,%
P049,2026-05-01,SPO2,94,%
P030,2026-06-08,SPO2,97,%
P051,2026-02-08,TEMP,38.2,C
P031,2026-05-15,SPO2,93,%
P015,2026-01-01,BPSYS,110,mmHg
P049,2026-02-08,BPM,101,beats/min
P019,2026-02-22,BPM,76,beats/min
P041,2026-04-08,BPM,76,beats/min
P020,2026-04-22,SPO2,92,%
P055,2026-01-15,BP,148/60,mmHg
P024,2026-02-22,BP,135/91,mmHg
P054,2026-04-22,BPSYS,151,mmHg
P017,2026-03-01,BP,143/86,mmHg
P023,2026-04-22,BPM,104,beats/min
P011,2026-03-15,BP,155/85,mmHg
P048,2026-04-08,BPSYS,121,mmHg
P051,2026-06-22,BPM,103,beats/min
P053,2026-03-01,BP,159/78,mmHg
P050,2026-04-08,SPO2,92,%
P014,2026-03-01,TEMP,38.9,C
P001,2026-01-01,BP,124/81,mmHg
P004,2026-05-01,BPM,62,beats/min
P034,2026-06-22,BPSYS,122,mmHg
P003,2026-05-15,BP,100/75,mmHg
P043,2026-04-08,TEMP,37.1,C
P029,2026-04-08,BPM,91,beats/min
P014,2026-04-08,SPO2,92,%
P025,2026-05-01,SPO2,98,%
P055,2026-05-15,SPO2,96,%
P052,2026-04-22,BP,103/72,mmHg
P006,2026-03-15,BPM,56,beats/min
P038,2026-06-08,BP,102/93,mmHg
P053,2026-01-01,SPO2,94,%
P006,2026-06-08,SPO2,92,%
P028,2026-02-22,SPO2,91,%
P060,2026-04-08,BPSYS,102,mmHg
P007,2026-03-01,BPSYS,112,mmHg
P038,2026-02-22,BPSYS,165,mmHg
P039,2026-01-01,BPSYS,105,mmHg
P010,2026-05-15,BPM,78,beats/min
P047,2026-06-08,TEMP,38.8,C
P036,2026-04-08,BPSYS,148,mmHg
P037,2026-05-01,SPO2,92,%
P016,2026-02-22,SPO2,97,%
P049,2026-04-22,TEMP,37.5,C
P017,2026-01-01,SPO2,100,%
P028,2026-04-22,BP,118/69,mmHg
P055,2026-03-01,BPSYS,129,mmHg
P037,2026-03-15,BPSYS,131,mmHg
P002,2026-02-22,BPSYS,135,mmHg
P002,2026-01-15,BPM,87,beats/min
P033,2026-02-22,TEMP,38.3,C
P051,2026-05-15,BP,157/75,mmHg
P058,2026-02-08,SPO2,99,%
P003,2026-06-22,BPM,94,beats/min
P001,2026-03-15,BPSYS,121,mmHg
P020,2026-02-08,BPSYS,127,mmHg
P045,2026-01-15,BPSYS,140,mmHg
P046,2026-06-22,BPSYS,154,mmHg
P036,2026-05-15,TEMP,36.2,C
P007,2026-01-15,BP,135/61,mmHg
P036,2026-03-01,BPM,85,beats/min
P042,2026-05-01,TEMP,37.5,C
P060,2026-03-01,BPM,104,beats/min
P012,2026-04-08,BPSYS,135,mmHg
P035,2026-01-15,SPO2,90,%
P023,2026-06-08,TEMP,37.8,C
P009,2026-01-15,BPSYS,107,mmHg
P048,2026-06-22,SPO2,97,%
P022,2026-06-22,BPSYS,115,mmHg
P027,2026-02-08,TEMP,38.7,C
P003,2026-01-01,BPSYS,102,mmHg
P025,2026-01-01,BP,101/71,mmHg
P003,2026-03-15,SPO2,92,%
P035,2026-06-08,TEMP,37.2,C
P017,2026-06-22,TEMP,36.3,C
P029,2026-01-01,SPO2,97,%
P009,2026-02-22,TEMP,36.9,C
P046,2026-01-01,TEMP,38.8,C
P039,2026-05-15,BP,104/96,mmHg
P058,2026-05-15,BPM,84,beats/min
P042,2026-02-08,BP,142/88,mmHg
P060,2026-02-22,BP,135/65,mmHg
P002,2026-03-01,TEMP,37.2,C
P021,2026-06-08,BPM,56,beats/min
P015,2026-05-15,BP,157/86,mmHg
P038,2026-01-15,BPM,72,beats/min
P036,2026-02-22,BP,141/97,mmHg
P044,2026-06-22,BP,111/76,mmHg
P013,2026-01-01,BP,141/89,mmHg
P058,2026-04-08,BP,126/65,mmHg
P052,2026-06-08,BPSYS,141,mmHg
P021,2026-03-01,SPO2,99,%
P010,2026-02-08,SPO2,97,%
P013,2026-04-22,TEMP,36.5,C
P035,2026-03-15,BP,114/70,mmHg
P023,2026-05-01,BPSYS,157,mmHg
P001,2026-05-01,SPO2,96,%
P041,2026-06-22,TEMP,37.6,C
P060,2026-05-15,TEMP,36.3,C
P007,2026-04-08,TEMP,38.7,C
P021,2026-02-22,TEMP,37.6,C
P042,2026-03-15,BPM,100,beats/min
P022,2026-02-08,SPO2,100,%
P032,2026-01-01,BPM,88,beats/min
P006,2026-02-08,BP,153/73,mmHg
P012,2026-05-15,TEMP,37.6,C
P024,2026-06-22,SPO2,95,%
P026,2026-03-01,TEMP,36.2,C
P031,2026-03-01,BPSYS,160,mmHg
P046,2026-02-08,SPO2,91,%
P022,2026-01-01,TEMP,36.7,C
P031,2026-02-22,BPM,63,beats/min
P035,2026-04-22,BPM,107,beats/min
P024,2026-05-15,TEMP,38.6,C
P027,2026-03-15,SPO2,94,%
P032,2026-03-15,TEMP,36.3,C
P033,2026-01-15,BPSYS,152,mmHg
P027,2026-06-22,BPM,65,beats/min
P001,2026-02-08,BPM,66,beats/min
P045,2026-02-22,TEMP,37.0,C
P018,2026-02-08,BP,117/94,mmHg
P047,2026-01-15,SPO2,94,%
P014,2026-01-15,BPM,98,beats/min
P015,2026-02-08,TEMP,37.8,C
P040,2026-02-22,SPO2,94,%
P045,2026-03-01,SPO2,90,%
P050,2026-01-15,BPM,86,beats/min
P044,2026-03-15,TEMP,36.3,C
P043,2026-01-15,BP,105/64,mmHg
P005,2026-05-15,BPSYS,104,mmHg
P012,2026-06-22,SPO2,90,%
P057,2026-05-01,BP,103/78,mmHg
P025,2026-04-22,TEMP,37.9,C
P008,2026-04-22,SPO2,99,%
P046,2026-05-15,BPM,109,beats/min
P025,2026-02-08,BPM,89,beats/min
P023,2026-03-15,BP,146/67,mmHg
P044,2026-04-22,SPO2,90,%
P008,2026-03-15,TEMP,37.8,C
P043,2026-03-01,BPSYS,149,mmHg
P002,2026-06-08,BP,136/78,mmHg
P005,2026-01-01,SPO2,94,%
P048,2026-02-22,BP,133/77,mmHg
P016,2026-06-08,BPSYS,128,mmHg
P040,2026-04-22,BP,117/91,mmHg
P032,2026-04-22,SPO2,98,%
P020,2026-03-15,TEMP,36.2,C
P050,2026-06-08,BP,142/99,mmHg
P018,2026-05-01,TEMP,36.9,C
P045,2026-06-08,BPM,109,beats/min
P054,2026-06-08,SPO2,98,%
P044,2026-02-08,BPSYS,111,mmHg
P026,2026-02-22,BPSYS,109,mmHg
P022,2026-05-15,BPM,73,beats/min
P027,2026-05-15,BP,138/82,mmHg
P057,2026-06-08,BPM,91,beats/min
P047,2026-05-01,BPSYS,119,mmHg
P015,2026-03-15,SPO2,96,%
P012,2026-02-22,BP,129/85,mmHg
P025,2026-03-15,BPSYS,119,mmHg
P013,2026-05-01,SPO2,91,%
P011,2026-01-15,SPO2,91,%
P060,2026-06-22,SPO2,100,%
P013,2026-02-08,BPM,72,beats/min
P024,2026-04-08,BPSYS,145,mmHg
P037,2026-04-22,TEMP,37.2,C
P010,2026-06-22,BPSYS,102,mmHg
P059,2026-06-08,TEMP,37.4,C
P039,2026-06-22,BPM,86,beats/min
P057,2026-01-15,BPSYS,147,mmHg
P005,2026-04-08,BPM,59,beats/min
P016,2026-05-01,BPM,67,beats/min
P046,2026-04-08,BP,112/63,mmHg
P049,2026-03-15,BPSYS,151,mmHg
P004,2026-02-22,SPO2,99,%
P013,2026-03-15,BPSYS,122,mmHg
P019,2026-04-08,TEMP,38.2,C
P015,2026-06-22,BPM,93,beats/min
P011,2026-04-22,BPM,66,beats/min
P005,2026-06-22,TEMP,37.3,C
P008,2026-02-08,BPSYS,128,mmHg
P034,2026-04-08,BP,158/83,mmHg
P019,2026-01-15,BP,151/99,mmHg
P051,2026-03-15,SPO2,98,%
P006,2026-05-01,TEMP,38.2,C
P048,2026-05-15,TEMP,38.2,C
P037,2026-01-01,BP,139/61,mmHg
P029,2026-05-15,BPSYS,153,mmHg
P004,2026-01-15,TEMP,37.9,C
P055,2026-04-08,TEMP,37.1,C
P005,2026-03-01,BP,137/63,mmHg
P053,2026-05-15,BPSYS,136,mmHg
P041,2026-03-01,BP,106/79,mmHg
P001,2026-04-22,TEMP,38.6,C
P036,2026-06-22,SPO2,94,%
P018,2026-04-22,BPSYS,131,mmHg
P016,2026-04-22,BP,138/66,mmHg
P026,2026-04-08,SPO2,100,%
P014,2026-06-08,BP,145/62,mmHg
P018,2026-06-08,SPO2,95,%
P026,2026-01-15,BPM,78,beats/min
P034,2026-05-15,BPM,89,beats/min
P028,2026-06-08,BPSYS,148,mmHg
P057,2026-02-22,TEMP,36.2,C
P009,2026-06-08,BPM,79,beats/min
P003,2026-02-08,TEMP,37.3,C
P017,2026-05-15,BPSYS,157,mmHg
P023,2026-01-15,SPO2,93,%
P054,2026-05-01,TEMP,38.6,C
P026,2026-06-08,BP,133/71,mmHg
P010,2026-04-08,BP,106/65,mmHg
P051,2026-01-01,BPSYS,103,mmHg
P050,2026-03-01,TEMP,37.7,C
P056,2026-01-01,BPM,78,beats/min
P059,2026-01-15,SPO2,91,%
P019,2026-05-15,SPO2,91,%
P022,2026-04-08,BP,109/91,mmHg
P030,2026-05-01,TEMP,37.4,C
P017,2026-04-08,BPM,102,beats/min
P053,2026-04-08,BPM,69,beats/min
P054,2026-03-15,BPM,61,beats/min
P059,2026-04-22,BPM,92,beats/min
P038,2026-04-08,SPO2,97,%
P021,2026-01-15,BPSYS,130,mmHg
P049,2026-01-01,BP,149/93,mmHg
P037,2026-02-08,BPM,87,beats/min
P040,2026-06-08,BPSYS,156,mmHg
P042,2026-04-22,BPSYS,147,mmHg
P056,2026-06-22,BP,138/88,mmHg
P009,2026-03-01,SPO2,92,%
P016,2026-01-15,TEMP,37.3,C
P004,2026-06-08,BPSYS,132,mmHg
P028,2026-01-15,TEMP,37.8,C
P040,2026-01-15,TEMP,36.1,C
P045,2026-05-01,BP,120/79,mmHg
P047,2026-04-22,BPM,110,beats/min
P029,2026-03-01,BP,155/77,mmHg
P059,2026-03-15,BP,103/67,mmHg
__EOF__
mkdir -p clinical
cat > clinical/patients.csv <<'__EOF__'
patient_id
P 046
P047a
P017
P019
P12
P052
P053
P059
P026
P020
P045
P002
P043
P015
P003
P05O
P-049
P055
P039
P013
P023
P030
P048
P021
P022
P050
P054
PX01
P010
P006
P028
P044
P034
P049
P036
P051
P038
P042
P029
P041
P040
P009
P005
P1234
p045
P012
P018
P027
P014
P047
P001
P057
P037
045
P035
P025
P016
P056
P031
P024
P008
P011
P058
P007
P032
P060
P004
0P48
P046
P033
__EOF__
mkdir -p bio
cat > bio/sequences.txt <<'__EOF__'
BRCA1_exon2 ATGGATTTATCTGCTCTTCGCGTTGAAGAAGTACAAAATGTCATTAATGCTATGCAGAAAATCTTAGAGTGTCCCATCTGTCTGGAGTTGA
TP53_promoter GGGCCGTATAAAAGGGCAGCTCGCGGTATAAATGGCTCCTCGCAGTATAAAGGCTTATATAGCCC
EGFR_exon19 TATAAATGGCCAGCGTGGACAACCCCCACGTGTGCCGCCTGCTGGGCATCTGCCTCACCTCCACCGTGCAGCTCATCACGCAGCTCATGCC
BRCA1_utr TGCTTATATAAGCAGTACGTAGCCTATAAAGGGTAGACCAGATTTAGTCGTCATTATA
MYC_exon2 ATGCCCCTCAACGTTAGCTTCACCAACAGGAACTATGACCTCGACTACGACTCGGTGCAGCCGTATTTCTACTGCGACGAGGAGGAG
housekeeping_actb TATAAAAGGGCCTATAAAGCCTATAAAGGCTATATATAGCTATAAG
KRAS_exon2 ATGACTGAATATAAACTTGTGGTAGTTGGAGCTGGTGGCGTAGGCAAGAGTGCCTTGACGATACAGCTAATTCAGAATCATTTTGTGGACGAATATGATCC
TP53_exon5 TACTCCCCTGCCCTCAACAAGATGTTTTGCCAACTGGCCAAGACCTGCCCTGTGCAGCTGTGGGTTGATTCCACACCCCCGCCCGGCACCCGCGTCCGCGCCATGGCC
BRCA1_exon11 GTACGTAGAAGCATTGGATGGAAAGACTTCAGAGCGTGTCGGAAGCGTACGTAGTATAATCAGAGGCC
GAPDH_promoter CTATAAATTGAGCCCGCAGCCTCCCGCTTCGCTCTCTGCTCCTCCTGTTCGACAGTCAGCCGCATCTTCTTTTGCGTCGCCAG
__EOF__
mkdir -p logs
cat > logs/labs_import.log <<'__EOF__'
2026-03-01 08:00:00 INFO labs_import processed batch 486
2026-03-02 09:13:00 INFO labs_import processed batch 203
2026-03-03 10:26:00 INFO labs_import processed batch 38
2026-03-04 11:39:00 ERROR labs_import could not parse value 49
2026-03-05 12:52:00 INFO labs_import processed batch 299
2026-03-06 13:05:00 INFO labs_import processed batch 466
2026-03-07 14:18:00 ERROR labs_import could not parse value 110
2026-03-08 15:31:00 INFO labs_import processed batch 45
2026-03-09 16:44:00 WARN labs_import missing unit in row 215
2026-03-10 08:57:00 INFO labs_import processed batch 124
2026-03-11 09:10:00 INFO labs_import processed batch 283
2026-03-12 10:23:00 WARN labs_import missing unit in row 31
2026-03-13 11:36:00 ERROR labs_import could not parse value 64
2026-03-14 12:49:00 INFO labs_import processed batch 323
2026-03-15 13:02:00 ERROR labs_import could not parse value 486
2026-03-16 14:15:00 INFO labs_import processed batch 296
2026-03-17 15:28:00 ERROR labs_import could not parse value 204
2026-03-18 16:41:00 INFO labs_import processed batch 500
2026-03-19 08:54:00 INFO labs_import processed batch 24
2026-03-20 09:07:00 ERROR labs_import could not parse value 440
2026-03-21 10:20:00 INFO labs_import processed batch 149
2026-03-22 11:33:00 WARN labs_import missing unit in row 74
2026-03-23 12:46:00 ERROR labs_import could not parse value 61
2026-03-24 13:59:00 ERROR labs_import could not parse value 158
2026-03-25 14:12:00 ERROR labs_import could not parse value 418
2026-03-26 15:25:00 INFO labs_import processed batch 53
2026-03-27 16:38:00 ERROR labs_import could not parse value 293
2026-03-28 08:51:00 INFO labs_import processed batch 191
2026-03-01 09:04:00 INFO labs_import processed batch 281
2026-03-02 10:17:00 INFO labs_import processed batch 289
2026-03-03 11:30:00 INFO labs_import processed batch 317
2026-03-04 12:43:00 INFO labs_import processed batch 255
2026-03-05 13:56:00 ERROR labs_import could not parse value 219
2026-03-06 14:09:00 INFO labs_import processed batch 239
2026-03-07 15:22:00 ERROR labs_import could not parse value 473
2026-03-08 16:35:00 WARN labs_import missing unit in row 186
2026-03-09 08:48:00 INFO labs_import processed batch 128
2026-03-10 09:01:00 INFO labs_import processed batch 358
2026-03-11 10:14:00 INFO labs_import processed batch 42
2026-03-12 11:27:00 ERROR labs_import could not parse value 154
2026-03-13 12:40:00 ERROR labs_import could not parse value 254
2026-03-14 13:53:00 INFO labs_import processed batch 374
2026-03-15 14:06:00 WARN labs_import missing unit in row 148
2026-03-16 15:19:00 ERROR labs_import could not parse value 38
2026-03-17 16:32:00 INFO labs_import processed batch 263
2026-03-18 08:45:00 WARN labs_import missing unit in row 85
2026-03-19 09:58:00 INFO labs_import processed batch 78
2026-03-20 10:11:00 WARN labs_import missing unit in row 216
2026-03-21 11:24:00 INFO labs_import processed batch 493
2026-03-22 12:37:00 INFO labs_import processed batch 392
2026-03-23 13:50:00 ERROR labs_import could not parse value 294
2026-03-24 14:03:00 INFO labs_import processed batch 175
2026-03-25 15:16:00 INFO labs_import processed batch 305
2026-03-26 16:29:00 WARN labs_import missing unit in row 297
2026-03-27 08:42:00 WARN labs_import missing unit in row 36
2026-03-28 09:55:00 INFO labs_import processed batch 484
2026-03-01 10:08:00 INFO labs_import processed batch 243
2026-03-02 11:21:00 INFO labs_import processed batch 32
2026-03-03 12:34:00 INFO labs_import processed batch 332
2026-03-04 13:47:00 ERROR labs_import could not parse value 349
__EOF__
[ -f outputs/README.txt ] || echo "Save your results here (created by the setup script)." > outputs/README.txt
echo "Workspace ready: $ROOT"
echo "Spot check: clinical/labs.csv has $(wc -l < clinical/labs.csv) lines (expect 501), clinical/visits.csv has $(wc -l < clinical/visits.csv) lines (expect 241)."
