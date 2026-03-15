#!/bin/bash
# ============================================================
# BIO2110 Midterm Exam -- Environment Setup Script
# Run ONCE at the start of the exam after completing Part 0.
# Do NOT run again after you have started working.
# ============================================================

echo "=============================================="
echo "  BIO2110 Midterm Exam -- Environment Setup"
echo "=============================================="
echo ""

echo "[1/3] Creating exam workspace at ~/exam/ ..."
mkdir -p ~/exam/data
mkdir -p ~/exam/outputs
mkdir -p ~/exam/scripts
echo "      Directories created."
echo ""

echo "[2/3] Populating data files..."

# patients.csv
cat > ~/exam/data/patients.csv << 'DATAEOF'
patient_id,last_name,first_name,dob,sex,status
P001,Torres,Ana,1985-03-12,F,Active
P002,Kim,Omar,1972-07-04,M,Active
P003,Patel,Mei,1990-11-28,F,Active
P004,Nguyen,David,1968-05-15,M,Inactive
P005,Hassan,Linh,1955-09-30,F,Active
P006,Rivera,Eric,1943-02-18,M,Active
P007,Chen,Fatima,1998-08-07,F,Active
P008,Smith,Tariq,1980-01-25,M,Inactive
P009,Garcia,Ivan,1963-12-03,M,Active
P010,Brown,Yuki,1975-06-19,F,Active
P011,Okafor,Amara,1988-04-11,F,Active
P012,Reyes,Marcus,1967-10-22,M,Inactive
P013,Zhao,Rosa,1952-07-08,F,Active
P014,Muller,Piero,1979-02-28,M,Active
P015,Singh,Ingrid,1994-05-17,F,Active
P016,Yamamoto,Sam,1961-09-04,M,Inactive
P017,Cohen,Dina,1984-12-31,F,Active
P018,Ferreira,Victor,1970-03-14,M,Active
P019,Ali,Will,1948-06-23,M,Active
P020,Park,Petra,1991-08-09,F,Inactive
P021,Johansson,Tara,1977-11-05,F,Active
P022,Mendez,Zane,1965-04-27,M,Active
P023,Ivanova,Bianca,1958-01-13,F,Active
P024,Nakamura,Bruno,1983-07-16,M,Inactive
P025,Kowalski,Dalia,1996-10-02,F,Active
P026,Diallo,James,1974-05-30,M,Active
P027,Andrade,Priya,1953-12-19,F,Active
P028,Petrov,Carlos,1987-03-06,M,Inactive
P029,Tanaka,David,1969-08-24,M,Active
P030,Weber,Linh,1993-02-11,F,Active
P031,Santos,Maria,1956-05-18,F,Active
P032,Fischer,Hassan,1982-09-29,M,Inactive
P033,Kumar,Nadia,1971-12-07,F,Active
P034,Larson,Ivan,1959-04-14,M,Active
P035,Romero,Yuki,1986-06-25,F,Active
P036,Dupont,Luis,1973-01-08,M,Inactive
P037,Sato,Leila,1964-10-31,F,Active
P038,Hoffman,Nate,1997-07-20,M,Active
P039,Choi,Piero,1978-03-03,M,Active
P040,Castro,Ingrid,1966-11-17,F,Inactive
P041,Guerrero,Sana,1950-08-12,F,Active
P042,Herrera,Tobias,1985-02-26,M,Active
P043,Ortega,Zoe,1972-06-09,F,Active
P044,Vega,Will,1989-10-23,M,Inactive
P045,Fleming,Petra,1960-04-15,F,Active
P046,Lindgren,Yusuf,1975-12-28,M,Active
P047,Bauer,Ayasha,1943-07-05,F,Active
P048,Rossi,Andre,1981-05-19,M,Inactive
P049,Bernard,Bruno,1968-01-07,M,Active
P050,Mori,Dalia,1994-09-14,F,Active
P051,Torres,Ana,1955-06-22,F,Active
P052,Kim,Omar,1978-11-01,M,Inactive
P053,Patel,Mei,1963-08-16,F,Active
P054,Nguyen,David,1971-03-25,M,Active
P055,Hassan,Linh,1987-01-11,F,Active
P056,Rivera,Eric,1952-09-03,M,Inactive
P057,Chen,Fatima,1990-07-28,F,Active
P058,Smith,Tariq,1967-04-06,M,Active
P059,Garcia,Ivan,1983-12-14,M,Active
P060,Brown,Yuki,1958-06-27,F,Inactive
P061,Okafor,Amara,1974-02-17,F,Active
P062,Reyes,Marcus,1961-11-09,M,Active
P063,Zhao,Rosa,1996-05-01,F,Active
P064,Muller,Piero,1979-08-20,M,Inactive
P065,Singh,Ingrid,1944-03-07,F,Active
P066,Yamamoto,Sam,1986-10-15,M,Active
P067,Cohen,Dina,1965-07-29,F,Active
P068,Ferreira,Victor,1992-12-04,M,Inactive
P069,Ali,Will,1956-04-21,M,Active
P070,Park,Petra,1969-09-10,F,Active
P071,Johansson,Tara,1984-06-03,F,Active
P072,Mendez,Zane,1948-01-26,M,Inactive
P073,Ivanova,Bianca,1977-10-18,F,Active
P074,Nakamura,Bruno,1963-05-08,M,Active
P075,Kowalski,Dalia,1988-02-22,F,Active
P076,Diallo,James,1953-11-15,M,Inactive
P077,Andrade,Priya,1971-07-31,F,Active
P078,Petrov,Carlos,1980-04-19,M,Active
P079,Tanaka,David,1967-09-02,M,Active
P080,Weber,Linh,1994-12-07,F,Inactive
P081,Santos,Maria,1959-06-16,F,Active
P082,Fischer,Hassan,1985-03-30,M,Active
P083,Kumar,Nadia,1972-08-11,F,Active
P084,Larson,Ivan,1946-05-24,M,Inactive
P085,Romero,Yuki,1989-01-03,F,Active
P086,Dupont,Luis,1976-10-27,M,Active
P087,Sato,Leila,1961-07-14,F,Active
P088,Hoffman,Nate,1982-04-02,M,Inactive
P089,Choi,Piero,1955-11-29,M,Active
P090,Castro,Ingrid,1968-08-07,F,Active
P091,Guerrero,Sana,1993-03-21,F,Active
P092,Herrera,Tobias,1975-12-01,M,Inactive
P093,Ortega,Zoe,1950-06-14,F,Active
P094,Vega,Will,1987-09-08,M,Active
P095,Fleming,Petra,1964-04-29,F,Active
P096,Lindgren,Yusuf,1979-01-16,M,Inactive
P097,Bauer,Ayasha,1941-08-03,F,Active
P098,Rossi,Andre,1973-05-12,M,Active
P099,Bernard,Bruno,1990-02-25,M,Active
P100,Mori,Dalia,1957-11-18,F,Inactive
DATAEOF

# lab_results.tsv
printf '%s\n' 'patient_id\tvisit_date\ttest_name\tresult_value\tunit\tstatus\nP001\t2025-01-10\tGlucose\t103\tmg/dL\tFinal\nP002\t2025-01-11\tHbA1c\t4.1\t%\tFinal\nP003\t2025-01-12\tLipidPanel\t210\tmg/dL\tFinal\nP004\t2025-01-13\tCreatinine\t12\tmg/dL\tPending\nP005\t2025-01-14\tWBC\t63\tK/uL\tFinal\nP006\t2025-01-15\tGlucose\t110\tmg/dL\tFinal\nP007\t2025-01-16\tHbA1c\t7.7\t%\tFinal\nP008\t2025-01-17\tLipidPanel\t279\tmg/dL\tPending\nP009\t2025-01-18\tCreatinine\t7\tmg/dL\tFinal\nP010\t2025-01-19\tWBC\t110\tK/uL\tFinal\nP011\t2025-01-10\tGlucose\t183\tmg/dL\tFinal\nP012\t2025-01-11\tHbA1c\t4.2\t%\tPending\nP013\t2025-01-12\tLipidPanel\t163\tmg/dL\tFinal\nP014\t2025-01-13\tCreatinine\t11\tmg/dL\tFinal\nP015\t2025-01-14\tWBC\t64\tK/uL\tFinal\nP016\t2025-01-15\tGlucose\t204\tmg/dL\tPending\nP017\t2025-01-16\tHbA1c\t7.0\t%\tFinal\nP018\t2025-01-17\tLipidPanel\t190\tmg/dL\tFinal\nP019\t2025-01-18\tCreatinine\t25\tmg/dL\tFinal\nP020\t2025-01-19\tWBC\t104\tK/uL\tPending\nP021\t2025-01-10\tGlucose\t182\tmg/dL\tFinal\nP022\t2025-01-11\tHbA1c\t5.1\t%\tFinal\nP023\t2025-01-12\tLipidPanel\t211\tmg/dL\tFinal\nP024\t2025-01-13\tCreatinine\t5\tmg/dL\tPending\nP025\t2025-01-14\tWBC\t55\tK/uL\tFinal\nP026\t2025-01-15\tGlucose\t183\tmg/dL\tFinal\nP027\t2025-01-16\tHbA1c\t5.7\t%\tFinal\nP028\t2025-01-17\tLipidPanel\t179\tmg/dL\tPending\nP029\t2025-01-18\tCreatinine\t11\tmg/dL\tFinal\nP030\t2025-01-19\tWBC\t78\tK/uL\tFinal\nP031\t2025-01-10\tGlucose\t101\tmg/dL\tFinal\nP032\t2025-01-11\tHbA1c\t4.5\t%\tPending\nP033\t2025-01-12\tLipidPanel\t164\tmg/dL\tFinal\nP034\t2025-01-13\tCreatinine\t16\tmg/dL\tFinal\nP035\t2025-01-14\tWBC\t79\tK/uL\tFinal\nP036\t2025-01-15\tGlucose\t142\tmg/dL\tPending\nP037\t2025-01-16\tHbA1c\t8.0\t%\tFinal\nP038\t2025-01-17\tLipidPanel\t257\tmg/dL\tFinal\nP039\t2025-01-18\tCreatinine\t22\tmg/dL\tFinal\nP040\t2025-01-19\tWBC\t50\tK/uL\tPending\nP041\t2025-01-10\tGlucose\t171\tmg/dL\tFinal\nP042\t2025-01-11\tHbA1c\t4.4\t%\tFinal\nP043\t2025-01-12\tLipidPanel\t215\tmg/dL\tFinal\nP044\t2025-01-13\tCreatinine\t25\tmg/dL\tPending\nP045\t2025-01-14\tWBC\t114\tK/uL\tFinal\nP046\t2025-01-15\tGlucose\t167\tmg/dL\tFinal\nP047\t2025-01-16\tHbA1c\t6.9\t%\tFinal\nP048\t2025-01-17\tLipidPanel\t157\tmg/dL\tPending\nP049\t2025-01-18\tCreatinine\t6\tmg/dL\tFinal\nP050\t2025-01-19\tWBC\t119\tK/uL\tFinal\nP001\t2025-01-10\tGlucose\t133\tmg/dL\tFinal\nP002\t2025-01-11\tHbA1c\t7.9\t%\tPending\nP003\t2025-01-12\tLipidPanel\t160\tmg/dL\tFinal\nP004\t2025-01-13\tCreatinine\t12\tmg/dL\tFinal\nP005\t2025-01-14\tWBC\t47\tK/uL\tFinal\nP006\t2025-01-15\tGlucose\t172\tmg/dL\tPending\nP007\t2025-01-16\tHbA1c\t5.4\t%\tFinal\nP008\t2025-01-17\tLipidPanel\t233\tmg/dL\tFinal\nP009\t2025-01-18\tCreatinine\t10\tmg/dL\tFinal\nP010\t2025-01-19\tWBC\t82\tK/uL\tPending\nP011\t2025-01-10\tGlucose\t165\tmg/dL\tFinal\nP012\t2025-01-11\tHbA1c\t5.0\t%\tFinal\nP013\t2025-01-12\tLipidPanel\t208\tmg/dL\tFinal\nP014\t2025-01-13\tCreatinine\t25\tmg/dL\tPending\nP015\t2025-01-14\tWBC\t44\tK/uL\tFinal\nP016\t2025-01-15\tGlucose\t118\tmg/dL\tFinal\nP017\t2025-01-16\tHbA1c\t6.7\t%\tFinal\nP018\t2025-01-17\tLipidPanel\t202\tmg/dL\tPending\nP019\t2025-01-18\tCreatinine\t10\tmg/dL\tFinal\nP020\t2025-01-19\tWBC\t94\tK/uL\tFinal\nP021\t2025-01-10\tGlucose\t172\tmg/dL\tFinal\nP022\t2025-01-11\tHbA1c\t5.3\t%\tPending\nP023\t2025-01-12\tLipidPanel\t196\tmg/dL\tFinal\nP024\t2025-01-13\tCreatinine\t15\tmg/dL\tFinal\nP025\t2025-01-14\tWBC\t42\tK/uL\tFinal\nP026\t2025-01-15\tGlucose\t133\tmg/dL\tPending\nP027\t2025-01-16\tHbA1c\t8.1\t%\tFinal\nP028\t2025-01-17\tLipidPanel\t220\tmg/dL\tFinal\nP029\t2025-01-18\tCreatinine\t17\tmg/dL\tFinal\nP030\t2025-01-19\tWBC\t69\tK/uL\tPending\nP031\t2025-01-10\tGlucose\t91\tmg/dL\tFinal\nP032\t2025-01-11\tHbA1c\t5.1\t%\tFinal\nP033\t2025-01-12\tLipidPanel\t220\tmg/dL\tFinal\nP034\t2025-01-13\tCreatinine\t11\tmg/dL\tPending\nP035\t2025-01-14\tWBC\t118\tK/uL\tFinal\nP036\t2025-01-15\tGlucose\t202\tmg/dL\tFinal\nP037\t2025-01-16\tHbA1c\t6.0\t%\tFinal\nP038\t2025-01-17\tLipidPanel\t257\tmg/dL\tPending\nP039\t2025-01-18\tCreatinine\t9\tmg/dL\tFinal\nP040\t2025-01-19\tWBC\t68\tK/uL\tFinal\nP041\t2025-01-10\tGlucose\t110\tmg/dL\tFinal\nP042\t2025-01-11\tHbA1c\t5.2\t%\tPending\nP043\t2025-01-12\tLipidPanel\t277\tmg/dL\tFinal\nP044\t2025-01-13\tCreatinine\t13\tmg/dL\tFinal\nP045\t2025-01-14\tWBC\t109\tK/uL\tFinal\nP046\t2025-01-15\tGlucose\t184\tmg/dL\tPending\nP047\t2025-01-16\tHbA1c\t8.5\t%\tFinal\nP048\t2025-01-17\tLipidPanel\t242\tmg/dL\tFinal\nP049\t2025-01-18\tCreatinine\t16\tmg/dL\tFinal\nP050\t2025-01-19\tWBC\t63\tK/uL\tPending\nP001\t2025-01-10\tGlucose\t110\tmg/dL\tFinal\nP002\t2025-01-11\tHbA1c\t6.5\t%\tFinal\nP003\t2025-01-12\tLipidPanel\t163\tmg/dL\tFinal\nP004\t2025-01-13\tCreatinine\t6\tmg/dL\tPending\nP005\t2025-01-14\tWBC\t49\tK/uL\tFinal\nP006\t2025-01-15\tGlucose\t114\tmg/dL\tFinal\nP007\t2025-01-16\tHbA1c\t7.1\t%\tFinal\nP008\t2025-01-17\tLipidPanel\t248\tmg/dL\tPending\nP009\t2025-01-18\tCreatinine\t24\tmg/dL\tFinal\nP010\t2025-01-19\tWBC\t43\tK/uL\tFinal\nP011\t2025-01-10\tGlucose\t173\tmg/dL\tFinal\nP012\t2025-01-11\tHbA1c\t5.9\t%\tPending\nP013\t2025-01-12\tLipidPanel\t259\tmg/dL\tFinal\nP014\t2025-01-13\tCreatinine\t21\tmg/dL\tFinal\nP015\t2025-01-14\tWBC\t67\tK/uL\tFinal\nP016\t2025-01-15\tGlucose\t77\tmg/dL\tPending\nP017\t2025-01-16\tHbA1c\t7.4\t%\tFinal\nP018\t2025-01-17\tLipidPanel\t169\tmg/dL\tFinal\nP019\t2025-01-18\tCreatinine\t22\tmg/dL\tFinal\nP020\t2025-01-19\tWBC\t69\tK/uL\tPending' > ~/exam/data/lab_results.tsv

# medications.csv
cat > ~/exam/data/medications.csv << 'DATAEOF'
patient_id,drug_name,dose_mg,frequency,start_date,active
P001,Metformin,500,once_daily,2024-01-10,yes
P002,Glipizide,5,twice_daily,2024-03-15,yes
P003,Atorvastatin,10,once_daily,2024-06-01,yes
P004,Lisinopril,5,twice_daily,2024-08-22,no
P005,Amlodipine,5,once_daily,2023-11-05,yes
P006,Omeprazole,20,once_daily,2024-02-28,yes
P007,Levothyroxine,25,twice_daily,2024-05-14,yes
P008,Sertraline,50,once_daily,2023-09-30,no
P009,Hydrochlorothiazide,12,twice_daily,2024-07-11,yes
P010,Aspirin,81,once_daily,2024-04-03,yes
P011,Metformin,1000,once_daily,2024-01-10,yes
P012,Glipizide,10,twice_daily,2024-03-15,no
P013,Atorvastatin,20,once_daily,2024-06-01,yes
P014,Lisinopril,10,twice_daily,2024-08-22,yes
P015,Amlodipine,10,once_daily,2023-11-05,yes
P016,Omeprazole,40,once_daily,2024-02-28,no
P017,Levothyroxine,50,twice_daily,2024-05-14,yes
P018,Sertraline,100,once_daily,2023-09-30,yes
P019,Hydrochlorothiazide,25,twice_daily,2024-07-11,yes
P020,Aspirin,325,once_daily,2024-04-03,no
P021,Metformin,500,once_daily,2024-01-10,yes
P022,Glipizide,5,twice_daily,2024-03-15,yes
P023,Atorvastatin,40,once_daily,2024-06-01,yes
P024,Lisinopril,20,twice_daily,2024-08-22,no
P025,Amlodipine,5,once_daily,2023-11-05,yes
P026,Omeprazole,20,once_daily,2024-02-28,yes
P027,Levothyroxine,75,twice_daily,2024-05-14,yes
P028,Sertraline,50,once_daily,2023-09-30,no
P029,Hydrochlorothiazide,12,twice_daily,2024-07-11,yes
P030,Aspirin,81,once_daily,2024-04-03,yes
P031,Metformin,1000,once_daily,2024-01-10,yes
P032,Glipizide,10,twice_daily,2024-03-15,no
P033,Atorvastatin,10,once_daily,2024-06-01,yes
P034,Lisinopril,5,twice_daily,2024-08-22,yes
P035,Amlodipine,10,once_daily,2023-11-05,yes
P036,Omeprazole,40,once_daily,2024-02-28,no
P037,Levothyroxine,25,twice_daily,2024-05-14,yes
P038,Sertraline,100,once_daily,2023-09-30,yes
P039,Hydrochlorothiazide,25,twice_daily,2024-07-11,yes
P040,Aspirin,325,once_daily,2024-04-03,no
P041,Metformin,500,once_daily,2024-01-10,yes
P042,Glipizide,5,twice_daily,2024-03-15,yes
P043,Atorvastatin,20,once_daily,2024-06-01,yes
P044,Lisinopril,10,twice_daily,2024-08-22,no
P045,Amlodipine,5,once_daily,2023-11-05,yes
P046,Omeprazole,20,once_daily,2024-02-28,yes
P047,Levothyroxine,50,twice_daily,2024-05-14,yes
P048,Sertraline,50,once_daily,2023-09-30,no
P049,Hydrochlorothiazide,12,twice_daily,2024-07-11,yes
P050,Aspirin,81,once_daily,2024-04-03,yes
P051,Metformin,1000,once_daily,2024-01-10,yes
P052,Glipizide,10,twice_daily,2024-03-15,no
P053,Atorvastatin,40,once_daily,2024-06-01,yes
P054,Lisinopril,20,twice_daily,2024-08-22,yes
P055,Amlodipine,10,once_daily,2023-11-05,yes
P056,Omeprazole,40,once_daily,2024-02-28,no
P057,Levothyroxine,75,twice_daily,2024-05-14,yes
P058,Sertraline,100,once_daily,2023-09-30,yes
P059,Hydrochlorothiazide,25,twice_daily,2024-07-11,yes
P060,Aspirin,325,once_daily,2024-04-03,no
P001,Metformin,500,once_daily,2024-01-10,yes
P002,Glipizide,5,twice_daily,2024-03-15,yes
P003,Atorvastatin,10,once_daily,2024-06-01,yes
P004,Lisinopril,5,twice_daily,2024-08-22,no
P005,Amlodipine,5,once_daily,2023-11-05,yes
P006,Omeprazole,20,once_daily,2024-02-28,yes
P007,Levothyroxine,25,twice_daily,2024-05-14,yes
P008,Sertraline,50,once_daily,2023-09-30,no
P009,Hydrochlorothiazide,12,twice_daily,2024-07-11,yes
P010,Aspirin,81,once_daily,2024-04-03,yes
P011,Metformin,1000,once_daily,2024-01-10,yes
P012,Glipizide,10,twice_daily,2024-03-15,no
P013,Atorvastatin,20,once_daily,2024-06-01,yes
P014,Lisinopril,10,twice_daily,2024-08-22,yes
P015,Amlodipine,10,once_daily,2023-11-05,yes
P016,Omeprazole,40,once_daily,2024-02-28,no
P017,Levothyroxine,50,twice_daily,2024-05-14,yes
P018,Sertraline,100,once_daily,2023-09-30,yes
P019,Hydrochlorothiazide,25,twice_daily,2024-07-11,yes
P020,Aspirin,325,once_daily,2024-04-03,no
P021,Metformin,500,once_daily,2024-01-10,yes
P022,Glipizide,5,twice_daily,2024-03-15,yes
P023,Atorvastatin,40,once_daily,2024-06-01,yes
P024,Lisinopril,20,twice_daily,2024-08-22,no
P025,Amlodipine,5,once_daily,2023-11-05,yes
P026,Omeprazole,20,once_daily,2024-02-28,yes
P027,Levothyroxine,75,twice_daily,2024-05-14,yes
P028,Sertraline,50,once_daily,2023-09-30,no
P029,Hydrochlorothiazide,12,twice_daily,2024-07-11,yes
P030,Aspirin,81,once_daily,2024-04-03,yes
P031,Metformin,1000,once_daily,2024-01-10,yes
P032,Glipizide,10,twice_daily,2024-03-15,no
P033,Atorvastatin,10,once_daily,2024-06-01,yes
P034,Lisinopril,5,twice_daily,2024-08-22,yes
P035,Amlodipine,10,once_daily,2023-11-05,yes
P036,Omeprazole,40,once_daily,2024-02-28,no
P037,Levothyroxine,25,twice_daily,2024-05-14,yes
P038,Sertraline,100,once_daily,2023-09-30,yes
P039,Hydrochlorothiazide,25,twice_daily,2024-07-11,yes
P040,Aspirin,325,once_daily,2024-04-03,no
P041,Metformin,500,once_daily,2024-01-10,yes
P042,Glipizide,5,twice_daily,2024-03-15,yes
P043,Atorvastatin,20,once_daily,2024-06-01,yes
P044,Lisinopril,10,twice_daily,2024-08-22,no
P045,Amlodipine,5,once_daily,2023-11-05,yes
DATAEOF

# clinical_notes.txt
cat > ~/exam/data/clinical_notes.txt << 'DATAEOF'
=== BIO2110 Clinical Notes Demo File ===
Facility: City Tech Medical Informatics Training Center
Period: January 10-19, 2025

[2025-01-10] P001: Patient presents with mild fatigue.
  Glucose result reviewed.
  All values within normal range. Continue current plan.

[2025-01-11] P002: Patient presents with elevated glucose.
  HbA1c result reviewed.
  Patient advised to monitor diet. Follow-up in 2 weeks.
[2025-01-12] P003: Patient presents with routine checkup.
  LipidPanel result reviewed.
  Medication adjustment discussed. Referral placed.
[2025-01-13] P004: Patient presents with medication review.
  Creatinine result reviewed.
  No acute changes noted. Labs pending.
ERROR: Lab system timeout on 2025-01-13. P004 results delayed.
ERROR: Retransmission successful. Results recorded as Final.
[2025-01-14] P005: Patient presents with follow-up visit.
  Glucose result reviewed.
  Elevated values noted. Immediate counseling initiated.
[2025-01-15] P006: Patient presents with dietary counseling.
  HbA1c result reviewed.
  Patient education provided. Compliance discussed.

[2025-01-16] P007: Patient presents with lab results reviewed.
  LipidPanel result reviewed.
  Borderline result. Repeat in 30 days.
[2025-01-17] P008: Patient presents with referral placed.
  Creatinine result reviewed.
  Values improved since last visit. Continue medication.
[2025-01-18] P009: Patient presents with mild fatigue.
  Glucose result reviewed.
  All values within normal range. Continue current plan.
[2025-01-19] P010: Patient presents with elevated glucose.
  HbA1c result reviewed.
  Patient advised to monitor diet. Follow-up in 2 weeks.
[2025-01-10] P011: Patient presents with routine checkup.
  LipidPanel result reviewed.
  Medication adjustment discussed. Referral placed.
ERROR: Lab system timeout on 2025-01-10. P011 results delayed.
ERROR: Retransmission successful. Results recorded as Final.

[2025-01-11] P012: Patient presents with medication review.
  Creatinine result reviewed.
  No acute changes noted. Labs pending.
[2025-01-12] P013: Patient presents with follow-up visit.
  Glucose result reviewed.
  Elevated values noted. Immediate counseling initiated.
[2025-01-13] P014: Patient presents with dietary counseling.
  HbA1c result reviewed.
  Patient education provided. Compliance discussed.
[2025-01-14] P015: Patient presents with lab results reviewed.
  LipidPanel result reviewed.
  Borderline result. Repeat in 30 days.
[2025-01-15] P016: Patient presents with referral placed.
  Creatinine result reviewed.
  Values improved since last visit. Continue medication.

[2025-01-16] P017: Patient presents with mild fatigue.
  Glucose result reviewed.
  All values within normal range. Continue current plan.
[2025-01-17] P018: Patient presents with elevated glucose.
  HbA1c result reviewed.
  Patient advised to monitor diet. Follow-up in 2 weeks.
ERROR: Lab system timeout on 2025-01-17. P018 results delayed.
ERROR: Retransmission successful. Results recorded as Final.
[2025-01-18] P019: Patient presents with routine checkup.
  LipidPanel result reviewed.
  Medication adjustment discussed. Referral placed.
[2025-01-19] P020: Patient presents with medication review.
  Creatinine result reviewed.
  No acute changes noted. Labs pending.
[2025-01-10] P021: Patient presents with follow-up visit.
  Glucose result reviewed.
  Elevated values noted. Immediate counseling initiated.

[2025-01-11] P022: Patient presents with dietary counseling.
  HbA1c result reviewed.
  Patient education provided. Compliance discussed.
[2025-01-12] P023: Patient presents with lab results reviewed.
  LipidPanel result reviewed.
  Borderline result. Repeat in 30 days.
[2025-01-13] P024: Patient presents with referral placed.
  Creatinine result reviewed.
  Values improved since last visit. Continue medication.
[2025-01-14] P025: Patient presents with mild fatigue.
  Glucose result reviewed.
  All values within normal range. Continue current plan.
ERROR: Lab system timeout on 2025-01-14. P025 results delayed.
ERROR: Retransmission successful. Results recorded as Final.


















DATAEOF

echo "      Data files written."
echo ""

echo "[3/3] Verifying workspace..."
echo ""
echo "  File       Lines"
echo "  --------   -----"
for f in ~/exam/data/*.csv ~/exam/data/*.tsv ~/exam/data/*.txt; do
    printf "  %-20s %s\n" "$(basename $f)" "$(wc -l < $f)"
done
echo ""
echo "=============================================="
echo "  Setup complete. Your workspace is ~/exam/"
echo "  Good luck!"
echo "=============================================="
