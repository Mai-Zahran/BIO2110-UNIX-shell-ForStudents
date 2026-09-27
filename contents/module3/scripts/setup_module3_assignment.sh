#!/usr/bin/env bash
# setup_module3_assignment.sh
# Builds the practice workspace for BIO 2110 Module 3 with synthetic data.
# Safe to run again: data files are rewritten, outputs/ and student files are never touched.
set -e
HERE="$(cd "$(dirname "$0")" && pwd)"
ROOT="$HERE/../practice"
mkdir -p "$ROOT"
cd "$ROOT"
mkdir -p outputs
cat > labs.csv <<'__EOF__'
patient_id,collection_date,test_name,result_value,status
P051,2026-02-22,HbA1c,8.6,Critical
P015,2026-04-22,glucose,119,Abnormal
P009,2026-03-01,glucose,73,Normal
P020,2026-02-08,Hemoglobin,9.4,Abnormal
P038,2026-02-22,glucose,123,Abnormal
P055,2026-02-22,Creatinine,1.4,Abnormal
P034,2026-06-08,Lipid Panel,231,Abnormal
P013,2026-05-15,Glucose,199,Critical
P058,2026-06-08,HDL,70,Normal
P010,2026-01-01,Hemoglobin,9.1,Abnormal
P038,2026-04-08,HbA1c,5.9,Abnormal
P014,2026-01-15,Lipid Panel,121,Normal
P030,2026-03-15,Hemoglobin,12.6,Normal
P006,2026-03-15,HbA1c,7.5,Abnormal
P014,2026-05-15,Hemoglobin,17.5,Normal
P030,2026-01-15,HbA1c,5.8,Abnormal
P042,2026-03-01,LDL,89,Normal
P053,2026-03-01,Hemoglobin,10.7,Abnormal
P019,2026-05-15,Lipid Panel,263,Abnormal
P056,2026-02-08,HbA1c,9.4,Critical
P017,2026-02-08,HDL,35,Abnormal
P047,2026-01-01,Hemoglobin,8.8,Critical
P060,2026-04-22,Lipid Panel,244,Abnormal
P010,2026-02-08,HDL,59,Normal
P056,2026-01-15,Glucose,128,Critical
P043,2026-03-15,Creatinine,2.3,Abnormal
P026,2026-06-22,HbA1c,8.1,Critical
P053,2026-06-08,Hemoglobin,14.8,Normal
P027,2026-03-15,LDL,156,Abnormal
P023,2026-02-08,Glucose,107,Abnormal
P003,2026-06-08,Hemoglobin,10.3,Abnormal
P051,2026-06-08,Glucose,99,Normal
P029,2026-01-15,Lipid Panel,308,Critical
P009,2026-06-08,HDL,79,Normal
P049,2026-03-01,HbA1c,10.8,Critical
P037,2026-04-08,HDL,80,Normal
P055,2026-06-22,Hemoglobin,16.4,Normal
P025,2026-05-01,Creatinine,3.3,Critical
P035,2026-02-08,LDL,199,Critical
P038,2026-05-15,Hemoglobin,10.3,Abnormal
P040,2026-03-15,HbA1c,9.2,Critical
P038,2026-06-22,Hemoglobin,14.6,Normal
P043,2026-03-15,Lipid Panel,205,Abnormal
P008,2026-06-22,Glucose,180,Critical
P060,2026-01-15,HDL,84,Normal
P031,2026-04-22,Creatinine,3.0,Critical
P027,2026-03-15,Lipid Panel,158,Normal
P041,2026-06-22,HDL,52,Normal
P059,2026-01-01,Creatinine,3.3,Critical
P043,2026-01-15,Creatinine,2.5,Critical
P012,2026-05-15,HDL,29,Critical
P002,2026-02-08,HbA1c,6.7,Abnormal
P060,2026-06-08,Creatinine,0.8,Normal
P028,2026-04-22,Lipid Panel,196,Normal
P052,2026-01-01,Glucose,93,Normal
P046,2026-05-01,Lipid Panel,154,Normal
P010,2026-06-08,Glucose,179,Critical
P038,2026-04-22,Lipid Panel,201,Abnormal
P055,2026-02-08,LDL,85,Normal
P013,2026-04-08,HDL,85,Normal
P036,2026-04-08,HbA1c,4.7,Normal
P057,2026-04-22,Lipid Panel,267,Abnormal
P025,2026-06-22,Glucose,151,Critical
P024,2026-01-01,Creatinine,0.6,Normal
P038,2026-02-22,Creatinine,2.5,Critical
P041,2026-02-08,Hemoglobin,15.0,Normal
P009,2026-01-01,HbA1c,9.8,Critical
P051,2026-06-22,Creatinine,0.8,Normal
P053,2026-04-08,Glucose,146,Critical
P032,2026-03-15,LDL,89,Normal
P010,2026-02-22,Lipid Panel,199,Normal
P046,2026-01-01,Hemoglobin,9.1,Abnormal
P033,2026-06-22,LDL,120,Abnormal
P028,2026-04-22,HbA1c,5.7,Abnormal
P049,2026-06-08,Hemoglobin,10.4,Abnormal
P045,2026-05-01,Lipid Panel,176,Normal
P022,2026-04-22,HbA1c,5.0,Normal
P001,2026-05-15,Lipid Panel,251,Abnormal
P025,2026-02-08,Lipid Panel,164,Normal
P037,2026-04-08,LDL,159,Abnormal
P044,2026-01-01,HbA1c,9.3,Critical
P039,2026-06-22,HbA1c,9.4,Critical
P023,2026-05-15,Hemoglobin,13.7,Normal
P016,2026-04-22,Creatinine,1.9,Abnormal
P014,2026-04-08,HDL,25,Critical
P057,2026-01-15,LDL,208,Critical
P009,2026-02-22,LDL,180,Abnormal
P051,2026-04-08,Lipid Panel,287,Critical
P056,2026-01-01,HDL,48,Normal
P024,2026-04-08,HbA1c,4.8,Normal
P006,2026-03-01,HDL,73,Normal
P021,2026-03-15,Creatinine,2.2,Abnormal
P019,2026-04-08,Creatinine,1.2,Normal
P057,2026-03-01,HDL,59,Normal
P018,2026-05-15,Hemoglobin,12.6,Normal
P040,2026-03-01,Glucose,125,Abnormal
P059,2026-02-08,HbA1c,5.1,Normal
P029,2026-05-01,HDL,69,Normal
P039,2026-05-01,Glucose,166,Critical
P043,2026-06-08,LDL,105,Abnormal
P056,2026-06-08,Creatinine,2.6,Critical
P059,2026-04-22,Lipid Panel,284,Critical
P051,2026-03-01,Hemoglobin,14.4,Normal
P002,2026-03-01,LDL,151,Abnormal
P002,2026-04-08,Glucose,133,Critical
P004,2026-04-22,Lipid Panel,136,Normal
P008,2026-05-01,Glucose,159,Critical
P001,2026-05-15,HDL,83,Normal
P033,2026-01-15,Glucose,170,Critical
P049,2026-01-01,Creatinine,2.4,Abnormal
P007,2026-01-01,HbA1c,7.9,Abnormal
P031,2026-03-01,Lipid Panel,284,Critical
P051,2026-05-01,LDL,182,Abnormal
P019,2026-02-08,HbA1c,9.1,Critical
P011,2026-01-15,Lipid Panel,198,Normal
P045,2026-06-08,LDL,161,Abnormal
P039,2026-02-22,Lipid Panel,197,Normal
P035,2026-04-22,Lipid Panel,185,Normal
P060,2026-03-01,HbA1c,6.6,Abnormal
P009,2026-02-08,Lipid Panel,225,Abnormal
P052,2026-04-08,Hemoglobin,10.3,Abnormal
P008,2026-06-08,LDL,208,Critical
P026,2026-01-15,LDL,214,Critical
P034,2026-03-01,HbA1c,4.9,Normal
P007,2026-03-15,HDL,77,Normal
P005,2026-03-15,HDL,50,Normal
P001,2026-04-22,HbA1c,10.6,Critical
P014,2026-03-01,Lipid Panel,190,Normal
P015,2026-04-22,LDL,114,Abnormal
P044,2026-03-15,HDL,80,Normal
P033,2026-06-22,Hemoglobin,13.4,Normal
P056,2026-05-15,LDL,176,Abnormal
P053,2026-02-22,HbA1c,10.0,Critical
P006,2026-06-08,Lipid Panel,165,Normal
P042,2026-05-15,Hemoglobin,11.3,Abnormal
P026,2026-02-08,HDL,28,Critical
P034,2026-02-08,Creatinine,2.2,Abnormal
P027,2026-05-15,Hemoglobin,16.1,Normal
P027,2026-05-01,HbA1c,6.6,Abnormal
P022,2026-04-08,Hemoglobin,15.0,Normal
P026,2026-05-01,Creatinine,3.3,Critical
P050,2026-02-08,HDL,31,Abnormal
P028,2026-02-08,HDL,51,Normal
P027,2026-01-01,LDL,92,Normal
P019,2026-06-08,Hemoglobin,15.4,Normal
P045,2026-03-15,Creatinine,2.1,Abnormal
P055,2026-02-22,HDL,34,Abnormal
P054,2026-04-08,Glucose,155,Critical
P006,2026-02-22,Hemoglobin,10.6,Abnormal
P029,2026-02-22,Glucose,161,Critical
P035,2026-06-22,Hemoglobin,13.0,Normal
P048,2026-04-08,LDL,174,Abnormal
P056,2026-05-01,Hemoglobin,8.1,Critical
P050,2026-04-22,HbA1c,6.5,Abnormal
P032,2026-02-22,Creatinine,2.0,Abnormal
P015,2026-01-15,Hemoglobin,16.0,Normal
P031,2026-02-08,HbA1c,10.7,Critical
P021,2026-06-22,Lipid Panel,161,Normal
P057,2026-06-08,HbA1c,6.5,Abnormal
P037,2026-01-01,Hemoglobin,15.3,Normal
P027,2026-04-22,Lipid Panel,242,Abnormal
P021,2026-03-01,Glucose,115,Abnormal
P020,2026-06-08,LDL,120,Abnormal
P038,2026-02-22,HDL,78,Normal
P053,2026-03-15,Lipid Panel,256,Abnormal
P015,2026-06-22,Creatinine,2.4,Abnormal
P012,2026-02-08,Hemoglobin,9.2,Abnormal
P043,2026-06-22,Lipid Panel,318,Critical
P008,2026-01-01,Creatinine,0.9,Normal
P024,2026-06-22,Glucose,185,Critical
P018,2026-04-08,HbA1c,5.1,Normal
P039,2026-02-08,Hemoglobin,11.3,Abnormal
P011,2026-03-15,Glucose,131,Critical
P016,2026-04-22,Hemoglobin,15.8,Normal
P034,2026-03-15,Glucose,98,Normal
P044,2026-06-22,Glucose,155,Critical
P006,2026-02-08,Glucose,160,Critical
P044,2026-05-01,Lipid Panel,231,Abnormal
P036,2026-02-22,Hemoglobin,11.4,Abnormal
P034,2026-05-01,LDL,123,Abnormal
P002,2026-03-01,Creatinine,1.0,Normal
P032,2026-04-22,HbA1c,6.6,Abnormal
P036,2026-06-22,LDL,177,Abnormal
P003,2026-04-08,Hemoglobin,14.1,Normal
P026,2026-05-01,Lipid Panel,202,Abnormal
P004,2026-06-08,Glucose,129,Critical
P020,2026-06-22,Creatinine,2.1,Abnormal
P041,2026-01-15,Glucose,136,Critical
P040,2026-03-15,Lipid Panel,134,Normal
P023,2026-05-15,HbA1c,6.2,Abnormal
P055,2026-02-08,Glucose,131,Critical
P004,2026-06-08,Hemoglobin,11.2,Abnormal
P033,2026-01-01,Creatinine,3.2,Critical
P003,2026-02-22,HbA1c,6.3,Abnormal
P028,2026-03-01,LDL,75,Normal
P012,2026-04-08,Glucose,83,Normal
P058,2026-06-08,HbA1c,9.2,Critical
P016,2026-01-15,HDL,39,Abnormal
P044,2026-04-22,Hemoglobin,8.0,Critical
P018,2026-06-22,Lipid Panel,171,Normal
P017,2026-05-15,Creatinine,1.0,Normal
P008,2026-05-01,HbA1c,6.4,Abnormal
P014,2026-03-15,Glucose,179,Critical
P057,2026-04-22,Creatinine,0.9,Normal
P033,2026-05-15,Lipid Panel,190,Normal
P046,2026-03-15,Hemoglobin,14.2,Normal
P029,2026-05-01,Hemoglobin,11.9,Abnormal
P022,2026-03-01,LDL,211,Critical
P013,2026-04-08,Creatinine,2.1,Abnormal
P011,2026-05-15,HDL,43,Normal
P052,2026-06-22,LDL,184,Abnormal
P027,2026-05-01,Creatinine,2.9,Critical
P050,2026-01-15,Lipid Panel,129,Normal
P052,2026-03-01,Creatinine,1.1,Normal
P002,2026-02-08,Glucose,140,Critical
P054,2026-02-22,Glucose,120,Abnormal
P034,2026-02-08,HDL,50,Normal
P043,2026-01-15,Hemoglobin,14.9,Normal
P059,2026-06-22,Hemoglobin,14.3,Normal
P001,2026-04-22,Hemoglobin,16.6,Normal
P054,2026-04-08,Lipid Panel,194,Normal
P016,2026-02-08,Lipid Panel,137,Normal
P046,2026-01-01,Glucose,163,Critical
P052,2026-05-01,Lipid Panel,234,Abnormal
P044,2026-05-15,Creatinine,0.8,Normal
P058,2026-01-15,Creatinine,2.4,Abnormal
P045,2026-06-22,Glucose,150,Critical
P017,2026-02-22,HDL,81,Normal
P025,2026-03-15,LDL,194,Critical
P006,2026-02-22,Creatinine,2.5,Critical
P017,2026-04-22,Glucose,92,Normal
P041,2026-01-15,Creatinine,3.4,Critical
P025,2026-02-22,HDL,50,Normal
P032,2026-06-08,Lipid Panel,219,Abnormal
P022,2026-02-08,Creatinine,1.0,Normal
P058,2026-04-22,HbA1c,4.6,Normal
P045,2026-03-15,HDL,46,Normal
P011,2026-01-15,Glucose,145,Critical
P060,2026-04-08,Lipid Panel,247,Abnormal
P002,2026-06-08,Hemoglobin,16.6,Normal
P029,2026-05-15,HbA1c,8.4,Critical
P059,2026-06-22,LDL,97,Normal
P023,2026-01-01,LDL,75,Normal
P050,2026-02-08,LDL,86,Normal
P005,2026-01-01,Lipid Panel,265,Abnormal
P026,2026-04-22,Hemoglobin,10.2,Abnormal
P050,2026-03-15,Glucose,103,Abnormal
P049,2026-01-15,Hemoglobin,12.4,Normal
P003,2026-04-22,HDL,28,Critical
P007,2026-03-01,LDL,160,Abnormal
P017,2026-06-22,LDL,89,Normal
P054,2026-03-01,HbA1c,6.8,Abnormal
P031,2026-05-15,Glucose,79,Normal
P054,2026-05-15,Lipid Panel,215,Abnormal
P003,2026-05-15,LDL,98,Normal
P017,2026-02-22,HbA1c,5.0,Normal
P049,2026-01-01,Lipid Panel,172,Normal
P004,2026-02-22,HDL,86,Normal
P042,2026-01-01,Glucose,122,Abnormal
P033,2026-03-15,Hemoglobin,13.5,Normal
P018,2026-04-08,Glucose,179,Critical
P027,2026-04-08,HDL,59,Normal
P054,2026-02-08,LDL,210,Critical
P039,2026-04-22,HDL,64,Normal
P054,2026-02-08,HDL,73,Normal
P030,2026-03-01,HDL,43,Normal
P010,2026-03-01,Creatinine,2.4,Abnormal
P001,2026-04-08,HDL,79,Normal
P030,2026-04-22,HDL,47,Normal
P043,2026-01-01,Hemoglobin,10.3,Abnormal
P040,2026-03-01,Creatinine,3.3,Critical
P011,2026-02-08,Hemoglobin,8.0,Critical
P059,2026-05-15,Glucose,108,Abnormal
P003,2026-01-01,Creatinine,2.8,Critical
P005,2026-02-22,Glucose,165,Critical
P049,2026-04-08,LDL,134,Abnormal
P048,2026-02-08,Glucose,165,Critical
P017,2026-03-01,Creatinine,1.5,Abnormal
P004,2026-06-22,HbA1c,6.3,Abnormal
P037,2026-06-08,Glucose,81,Normal
P030,2026-01-01,LDL,117,Abnormal
P058,2026-05-01,LDL,78,Normal
P028,2026-03-01,Creatinine,2.8,Critical
P022,2026-01-15,HDL,62,Normal
P036,2026-05-15,Glucose,146,Critical
P053,2026-06-22,Hemoglobin,8.3,Critical
P020,2026-02-22,Lipid Panel,160,Normal
P019,2026-01-15,LDL,158,Abnormal
P005,2026-02-22,LDL,66,Normal
P059,2026-01-01,HDL,36,Abnormal
P047,2026-03-01,LDL,142,Abnormal
P008,2026-05-15,Lipid Panel,274,Abnormal
P054,2026-04-08,Hemoglobin,11.5,Abnormal
P047,2026-04-22,Creatinine,2.9,Critical
P032,2026-05-01,Creatinine,2.5,Critical
P058,2026-03-15,Hemoglobin,9.6,Abnormal
P023,2026-06-08,HDL,72,Normal
P035,2026-02-22,HDL,52,Normal
P042,2026-05-15,Creatinine,1.4,Abnormal
P007,2026-05-01,Lipid Panel,166,Normal
P058,2026-01-15,Glucose,184,Critical
P021,2026-01-15,HbA1c,8.7,Critical
P035,2026-03-15,Hemoglobin,9.5,Abnormal
P020,2026-06-08,Glucose,175,Critical
P055,2026-01-15,HbA1c,8.3,Critical
P024,2026-01-15,Lipid Panel,140,Normal
P024,2026-04-08,HDL,50,Normal
P043,2026-04-22,HDL,75,Normal
P046,2026-02-08,HDL,65,Normal
P018,2026-02-22,Creatinine,2.0,Abnormal
P013,2026-02-22,LDL,105,Abnormal
P056,2026-03-15,Lipid Panel,228,Abnormal
P037,2026-05-01,Creatinine,2.0,Abnormal
P059,2026-04-22,LDL,168,Abnormal
P047,2026-01-01,Lipid Panel,295,Critical
P047,2026-05-15,HDL,54,Normal
P048,2026-05-15,Lipid Panel,318,Critical
P010,2026-02-08,Lipid Panel,259,Abnormal
P017,2026-01-01,Creatinine,2.3,Abnormal
P013,2026-03-15,Hemoglobin,13.8,Normal
P014,2026-04-22,Creatinine,1.8,Abnormal
P022,2026-05-01,Lipid Panel,145,Normal
P008,2026-04-22,Hemoglobin,13.2,Normal
P044,2026-06-22,LDL,161,Abnormal
P004,2026-01-15,LDL,185,Abnormal
P003,2026-02-08,Lipid Panel,158,Normal
P017,2026-05-01,Lipid Panel,143,Normal
P008,2026-01-15,HDL,29,Critical
P013,2026-05-01,Lipid Panel,270,Abnormal
P049,2026-02-08,HDL,35,Abnormal
P043,2026-04-22,LDL,136,Abnormal
P060,2026-01-15,Glucose,142,Critical
P058,2026-02-22,Lipid Panel,208,Abnormal
P001,2026-03-01,Glucose,72,Normal
P011,2026-06-22,HbA1c,9.2,Critical
P054,2026-06-22,Creatinine,3.3,Critical
P005,2026-04-22,HbA1c,7.6,Abnormal
P057,2026-06-22,Glucose,116,Abnormal
P053,2026-06-22,Creatinine,2.5,Critical
P043,2026-02-08,HbA1c,9.6,Critical
P040,2026-02-08,Lipid Panel,124,Normal
P053,2026-04-08,LDL,109,Abnormal
P011,2026-04-08,Creatinine,0.8,Normal
P046,2026-01-15,LDL,136,Abnormal
P014,2026-01-15,LDL,92,Normal
P043,2026-06-22,Glucose,106,Abnormal
P011,2026-03-15,LDL,126,Abnormal
P020,2026-02-22,HbA1c,4.6,Normal
P025,2026-04-08,Lipid Panel,260,Abnormal
P013,2026-01-15,HbA1c,9.1,Critical
P016,2026-02-08,HbA1c,7.7,Abnormal
P019,2026-05-01,Glucose,166,Critical
P042,2026-02-08,HDL,45,Normal
P036,2026-02-22,HDL,83,Normal
P001,2026-02-08,Lipid Panel,153,Normal
P039,2026-01-01,Lipid Panel,302,Critical
P055,2026-06-08,Lipid Panel,173,Normal
P028,2026-02-22,Hemoglobin,11.1,Abnormal
P021,2026-05-15,Hemoglobin,8.6,Critical
P005,2026-02-22,Creatinine,1.7,Abnormal
P030,2026-04-08,Lipid Panel,234,Abnormal
P034,2026-04-22,LDL,178,Abnormal
P044,2026-03-01,Creatinine,0.8,Normal
P015,2026-02-08,Lipid Panel,123,Normal
P003,2026-03-15,LDL,217,Critical
P019,2026-05-15,HDL,36,Abnormal
P030,2026-02-22,Glucose,100,Abnormal
P020,2026-04-22,HDL,60,Normal
P022,2026-04-22,Glucose,142,Critical
P033,2026-02-22,HbA1c,6.8,Abnormal
P051,2026-03-01,HDL,81,Normal
P003,2026-04-08,Glucose,108,Abnormal
P018,2026-03-15,HDL,81,Normal
P024,2026-02-08,Hemoglobin,8.4,Critical
P009,2026-03-01,Glucose,151,Critical
P045,2026-04-22,HDL,49,Normal
P028,2026-02-22,Glucose,118,Abnormal
P030,2026-04-22,Creatinine,2.8,Critical
P057,2026-05-01,Glucose,186,Critical
P052,2026-03-15,Glucose,164,Critical
P048,2026-04-08,HbA1c,5.4,Normal
P005,2026-06-08,HDL,56,Normal
P002,2026-05-15,HDL,65,Normal
P041,2026-05-01,HbA1c,10.4,Critical
P048,2026-06-22,HDL,65,Normal
P023,2026-04-22,Lipid Panel,245,Abnormal
P001,2026-05-01,LDL,110,Abnormal
P012,2026-01-01,Creatinine,2.8,Critical
P015,2026-03-15,HbA1c,5.5,Normal
P014,2026-03-01,HbA1c,6.0,Abnormal
P012,2026-03-01,HbA1c,10.2,Critical
P015,2026-06-08,HDL,70,Normal
P041,2026-04-22,Lipid Panel,248,Abnormal
P045,2026-03-01,HbA1c,4.8,Normal
P012,2026-01-01,Lipid Panel,222,Abnormal
P033,2026-06-22,HDL,75,Normal
P010,2026-01-01,LDL,206,Critical
P060,2026-06-22,Hemoglobin,16.6,Normal
P026,2026-04-22,Glucose,75,Normal
P031,2026-01-01,HDL,34,Abnormal
P016,2026-02-22,LDL,80,Normal
P050,2026-05-15,Hemoglobin,10.5,Abnormal
P042,2026-02-22,Hemoglobin,15.8,Normal
P039,2026-04-08,Creatinine,2.0,Abnormal
P057,2026-04-22,Hemoglobin,16.0,Normal
P003,2026-03-15,LDL,144,Abnormal
P025,2026-01-15,HbA1c,5.2,Normal
P032,2026-01-15,HDL,75,Normal
P017,2026-05-15,Hemoglobin,17.5,Normal
P012,2026-01-01,LDL,145,Abnormal
P032,2026-04-22,Glucose,151,Critical
P031,2026-04-08,LDL,121,Abnormal
P046,2026-05-15,HbA1c,9.2,Critical
P047,2026-05-01,Glucose,75,Normal
P006,2026-01-01,Lipid Panel,241,Abnormal
P009,2026-05-15,Creatinine,1.6,Abnormal
P052,2026-06-08,HbA1c,9.1,Critical
P010,2026-05-01,HbA1c,8.8,Critical
P048,2026-04-08,Creatinine,2.7,Critical
P040,2026-05-15,Hemoglobin,17.4,Normal
P011,2026-05-15,Glucose,129,Critical
P031,2026-01-01,LDL,66,Normal
P036,2026-05-15,Creatinine,2.5,Critical
P027,2026-03-01,Glucose,113,Abnormal
P042,2026-06-08,Lipid Panel,134,Normal
P045,2026-05-15,Hemoglobin,10.1,Abnormal
P033,2026-04-08,Glucose,92,Normal
P032,2026-02-22,Hemoglobin,16.1,Normal
P048,2026-02-22,Hemoglobin,12.6,Normal
P058,2026-06-22,Glucose,105,Abnormal
P053,2026-01-15,HDL,58,Normal
P031,2026-03-15,Hemoglobin,9.0,Critical
P039,2026-03-01,LDL,122,Abnormal
P029,2026-02-22,Creatinine,2.0,Abnormal
P043,2026-02-08,Creatinine,0.8,Normal
P046,2026-01-01,Creatinine,1.9,Abnormal
P021,2026-03-01,HDL,27,Critical
P029,2026-01-01,LDL,70,Normal
P041,2026-05-01,LDL,141,Abnormal
P034,2026-04-08,Hemoglobin,17.2,Normal
P042,2026-05-01,Creatinine,3.0,Critical
P006,2026-03-15,Lipid Panel,187,Normal
P060,2026-06-08,LDL,88,Normal
P007,2026-01-01,Glucose,129,Critical
P035,2026-05-01,Glucose,102,Abnormal
P040,2026-05-01,HDL,56,Normal
P020,2026-03-01,Lipid Panel,302,Critical
P048,2026-06-22,LDL,68,Normal
P009,2026-05-01,Hemoglobin,9.8,Abnormal
P025,2026-01-15,Hemoglobin,11.2,Abnormal
P028,2026-05-01,Lipid Panel,123,Normal
P036,2026-04-08,Lipid Panel,275,Abnormal
P003,2026-06-22,Hemoglobin,16.1,Normal
P052,2026-01-01,HDL,43,Normal
P035,2026-04-08,LDL,149,Abnormal
P037,2026-04-08,HbA1c,5.9,Abnormal
P001,2026-06-22,Creatinine,1.2,Normal
P019,2026-05-01,LDL,195,Critical
P021,2026-01-15,LDL,126,Abnormal
P040,2026-06-08,LDL,71,Normal
P016,2026-06-22,Glucose,172,Critical
P037,2026-06-22,Lipid Panel,289,Critical
P007,2026-01-01,Hemoglobin,16.5,Normal
P023,2026-03-01,Creatinine,3.1,Critical
P018,2026-06-08,LDL,104,Abnormal
P038,2026-01-01,LDL,83,Normal
P032,2026-05-15,Creatinine,3.2,Critical
P004,2026-04-22,Creatinine,3.1,Critical
P050,2026-05-15,Creatinine,2.9,Critical
P047,2026-01-01,HbA1c,6.6,Abnormal
P006,2026-04-08,LDL,73,Normal
P035,2026-05-15,Creatinine,3.1,Critical
P002,2026-01-01,Lipid Panel,214,Abnormal
P003,2026-03-15,Lipid Panel,180,Normal
P049,2026-03-15,Glucose,122,Abnormal
P042,2026-06-08,HbA1c,9.6,Critical
P007,2026-05-01,Creatinine,3.2,Critical
P035,2026-02-22,HbA1c,8.2,Critical
P005,2026-03-15,Hemoglobin,13.7,Normal
P024,2026-03-01,LDL,121,Abnormal
__EOF__
[ -f outputs/README.txt ] || echo "Save your results here (created by the setup script)." > outputs/README.txt
echo "Workspace ready: $ROOT"
echo "Spot check: labs.csv has $(wc -l < labs.csv) lines (expect 481)."
