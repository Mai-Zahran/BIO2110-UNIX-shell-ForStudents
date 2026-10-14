#!/usr/bin/env bash
# setup_module2_lab_activity.sh
# Builds the workspace for Lab Activity 2 (Google Cloud Shell).
# Run from the repository root:
#   bash contents/module2/scripts/setup_module2_lab_activity.sh
# Safe to run again. It rebuilds the data files and the two practice scripts,
# resets their permissions, restores tmp/delete_me.txt, and does not touch outputs/ or practice/.

set -eu
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODULE="$(cd "$HERE/.." && pwd)"
git -C "$MODULE" config core.fileMode false >/dev/null 2>&1 || true
WORK="$MODULE/lab_activity2"

mkdir -p "$WORK/clinical" "$WORK/bio" "$WORK/devices" "$WORK/permissions" "$WORK/outputs" "$WORK/practice" "$WORK/tmp"

cat > "$WORK/clinical/patients.csv" <<'EOF_PATIENTS'
patient_id,name,age,sex,insurance
P1,Patient1,83,M,Private
P2,Patient2,78,F,Private
P3,Patient3,59,F,Medicaid
P4,Patient4,56,F,Medicare
P5,Patient5,75,F,Private
P6,Patient6,59,M,Medicare
P7,Patient7,33,F,Uninsured
P8,Patient8,81,F,Private
P9,Patient9,77,M,Private
P10,Patient10,39,F,Medicare
P11,Patient11,37,F,Uninsured
P12,Patient12,84,F,Medicaid
P13,Patient13,44,F,Private
P14,Patient14,73,F,Private
P15,Patient15,61,M,Medicaid
P16,Patient16,76,F,Private
P17,Patient17,47,M,Medicare
P18,Patient18,26,M,Uninsured
P19,Patient19,69,M,Uninsured
P20,Patient20,22,F,Medicare
P21,Patient21,43,M,Private
P22,Patient22,40,F,Medicare
P23,Patient23,23,F,Medicaid
P24,Patient24,87,F,Private
P25,Patient25,24,F,Private
P26,Patient26,75,F,Private
P27,Patient27,42,F,Medicare
P28,Patient28,79,F,Uninsured
P29,Patient29,20,M,Medicare
P30,Patient30,34,M,Medicare
P31,Patient31,85,F,Medicare
P32,Patient32,45,F,Medicaid
P33,Patient33,84,F,Medicaid
P34,Patient34,35,F,Private
P35,Patient35,38,M,Private
P36,Patient36,41,F,Uninsured
P37,Patient37,67,F,Medicaid
P38,Patient38,52,F,Medicaid
P39,Patient39,72,M,Medicare
P40,Patient40,86,M,Private
P41,Patient41,71,F,Private
P42,Patient42,28,M,Medicaid
P43,Patient43,67,F,Private
P44,Patient44,57,F,Private
P45,Patient45,41,F,Private
P46,Patient46,62,F,Private
P47,Patient47,40,F,Medicare
P48,Patient48,51,F,Medicare
P49,Patient49,77,M,Private
P50,Patient50,81,F,Medicaid
P51,Patient51,71,M,Medicaid
P52,Patient52,54,M,Private
P53,Patient53,77,M,Medicaid
P54,Patient54,40,M,Medicare
P55,Patient55,59,M,Medicare
P56,Patient56,84,F,Private
P57,Patient57,79,F,Medicaid
P58,Patient58,74,F,Medicare
P59,Patient59,33,F,Private
P60,Patient60,85,F,Medicare
P61,Patient61,85,M,Private
P62,Patient62,53,M,Private
P63,Patient63,30,M,Private
P64,Patient64,45,M,Private
P65,Patient65,47,F,Medicare
P66,Patient66,18,M,Private
P67,Patient67,29,M,Uninsured
P68,Patient68,76,F,Medicare
P69,Patient69,60,M,Medicare
P70,Patient70,70,M,Medicare
P71,Patient71,87,F,Private
P72,Patient72,41,M,Medicare
P73,Patient73,21,M,Private
P74,Patient74,63,M,Uninsured
P75,Patient75,38,M,Medicaid
P76,Patient76,63,F,Private
P77,Patient77,86,M,Medicare
P78,Patient78,45,F,Private
P79,Patient79,32,M,Private
P80,Patient80,53,M,Private
P81,Patient81,45,M,Private
P82,Patient82,55,M,Medicaid
P83,Patient83,52,M,Private
P84,Patient84,34,M,Private
P85,Patient85,30,M,Medicare
P86,Patient86,51,M,Medicaid
P87,Patient87,30,F,Medicare
P88,Patient88,73,M,Medicaid
P89,Patient89,39,F,Medicaid
P90,Patient90,31,M,Medicare
P91,Patient91,25,M,Medicaid
P92,Patient92,63,M,Medicaid
P93,Patient93,41,M,Medicaid
P94,Patient94,31,M,Private
P95,Patient95,82,F,Private
P96,Patient96,58,F,Medicaid
P97,Patient97,53,F,Medicare
P98,Patient98,26,F,Medicare
P99,Patient99,55,F,Private
P100,Patient100,58,F,Private
EOF_PATIENTS

cat > "$WORK/clinical/visits.csv" <<'EOF_VISITS'
visit_id,patient_id,department,room,visit_date,status
V1,P74,Cardiology,103,2026-01-01,Scheduled
V2,P59,Emergency,102,2026-01-02,Completed
V3,P82,Emergency,102,2026-01-03,Completed
V4,P52,Oncology,102,2026-01-04,Cancelled
V5,P52,Emergency,103,2026-01-05,Scheduled
V6,P3,Oncology,104,2026-01-06,Completed
V7,P71,Oncology,101,2026-01-07,Scheduled
V8,P92,Radiology,102,2026-01-08,Completed
V9,P43,Cardiology,105,2026-01-09,Scheduled
V10,P87,Cardiology,103,2026-01-10,NoShow
V11,P53,Emergency,103,2026-01-11,Completed
V12,P44,Emergency,101,2026-01-12,Completed
V13,P13,Oncology,101,2026-01-13,Completed
V14,P87,Radiology,101,2026-01-14,Completed
V15,P99,Cardiology,102,2026-01-15,Scheduled
V16,P64,Cardiology,104,2026-01-16,Completed
V17,P87,Cardiology,102,2026-01-17,NoShow
V18,P82,Cardiology,101,2026-01-18,Cancelled
V19,P86,Cardiology,104,2026-01-19,Cancelled
V20,P98,Emergency,105,2026-01-20,Scheduled
V21,P70,Cardiology,105,2026-01-21,Completed
V22,P67,Radiology,101,2026-01-22,Completed
V23,P27,Emergency,103,2026-01-23,Completed
V24,P55,Emergency,103,2026-01-24,Completed
V25,P46,Cardiology,102,2026-01-25,Completed
V26,P83,Oncology,101,2026-01-26,Cancelled
V27,P43,Pediatrics,102,2026-01-27,Completed
V28,P8,Cardiology,101,2026-01-28,Completed
V29,P52,Oncology,104,2026-02-01,NoShow
V30,P93,Radiology,105,2026-02-02,Completed
V31,P23,Cardiology,104,2026-02-03,Completed
V32,P2,Oncology,103,2026-02-04,Completed
V33,P35,Neurology,103,2026-02-05,Scheduled
V34,P72,Cardiology,103,2026-02-06,Cancelled
V35,P90,Neurology,105,2026-02-07,Completed
V36,P33,Neurology,103,2026-02-08,Completed
V37,P17,Pediatrics,104,2026-02-09,Completed
V38,P43,Emergency,101,2026-02-10,Completed
V39,P75,Emergency,104,2026-02-11,Scheduled
V40,P83,Pediatrics,105,2026-02-12,Completed
V41,P79,Cardiology,101,2026-02-13,Completed
V42,P54,Pediatrics,101,2026-02-14,Completed
V43,P100,Cardiology,101,2026-02-15,Completed
V44,P61,Emergency,102,2026-02-16,Completed
V45,P62,Pediatrics,101,2026-02-17,Completed
V46,P44,Oncology,104,2026-02-18,NoShow
V47,P2,Emergency,101,2026-02-19,NoShow
V48,P5,Radiology,105,2026-02-20,Completed
V49,P97,Radiology,103,2026-02-21,NoShow
V50,P29,Neurology,101,2026-02-22,Completed
V51,P82,Cardiology,104,2026-02-23,Scheduled
V52,P16,Radiology,102,2026-02-24,Scheduled
V53,P85,Cardiology,105,2026-02-25,Cancelled
V54,P35,Radiology,103,2026-02-26,Completed
V55,P42,Oncology,103,2026-02-27,NoShow
V56,P3,Radiology,105,2026-02-28,Completed
V57,P100,Emergency,101,2026-03-01,Completed
V58,P27,Radiology,103,2026-03-02,Completed
V59,P59,Cardiology,104,2026-03-03,Completed
V60,P66,Oncology,101,2026-03-04,Completed
V61,P36,Cardiology,102,2026-03-05,Completed
V62,P80,Pediatrics,105,2026-03-06,Completed
V63,P81,Radiology,101,2026-03-07,Scheduled
V64,P48,Radiology,101,2026-03-08,Completed
V65,P11,Pediatrics,102,2026-03-09,Completed
V66,P72,Emergency,105,2026-03-10,Scheduled
V67,P89,Emergency,104,2026-03-11,Scheduled
V68,P25,Emergency,103,2026-03-12,Scheduled
V69,P69,Pediatrics,102,2026-03-13,Completed
V70,P99,Radiology,103,2026-03-14,Completed
V71,P2,Emergency,102,2026-03-15,Completed
V72,P13,Pediatrics,105,2026-03-16,Cancelled
V73,P20,Radiology,102,2026-03-17,Completed
V74,P43,Radiology,104,2026-03-18,Completed
V75,P29,Cardiology,102,2026-03-19,Completed
V76,P60,Oncology,102,2026-03-20,Cancelled
V77,P27,Emergency,103,2026-03-21,Scheduled
V78,P78,Cardiology,101,2026-03-22,Completed
V79,P87,Oncology,105,2026-03-23,Completed
V80,P22,Radiology,102,2026-03-24,Completed
V81,P91,Emergency,105,2026-03-25,Completed
V82,P40,Emergency,103,2026-03-26,Scheduled
V83,P11,Oncology,102,2026-03-27,Scheduled
V84,P73,Oncology,105,2026-03-28,Completed
V85,P54,Pediatrics,101,2026-04-01,Scheduled
V86,P92,Cardiology,104,2026-04-02,Completed
V87,P67,Emergency,101,2026-04-03,Completed
V88,P88,Cardiology,102,2026-04-04,Cancelled
V89,P76,Emergency,103,2026-04-05,Completed
V90,P72,Cardiology,104,2026-04-06,Completed
V91,P18,Cardiology,102,2026-04-07,Completed
V92,P14,Neurology,102,2026-04-08,Cancelled
V93,P4,Radiology,103,2026-04-09,Cancelled
V94,P35,Neurology,104,2026-04-10,Cancelled
V95,P54,Radiology,101,2026-04-11,Scheduled
V96,P6,Cardiology,104,2026-04-12,Completed
V97,P24,Cardiology,101,2026-04-13,Completed
V98,P71,Emergency,101,2026-04-14,Completed
V99,P94,Emergency,104,2026-04-15,Completed
V100,P66,Cardiology,104,2026-04-16,Scheduled
EOF_VISITS

cat > "$WORK/clinical/labs.csv" <<'EOF_LABS'
lab_id,patient_id,test_name,result_value,unit,visit_date
L1,P53,Glucose,86,mg/dL,2026-01-01
L2,P47,Glucose,152,mg/dL,2026-01-02
L3,P19,Glucose,183,mg/dL,2026-01-03
L4,P91,HbA1c,7.3,percent,2026-01-04
L5,P12,HbA1c,8.7,percent,2026-01-05
L6,P64,Hemoglobin,15.6,g/dL,2026-01-06
L7,P47,Glucose,97,mg/dL,2026-01-07
L8,P78,Creatinine,1.0,mg/dL,2026-01-08
L9,P46,Glucose,131,mg/dL,2026-01-09
L10,P25,Glucose,161,mg/dL,2026-01-10
L11,P82,Glucose,185,mg/dL,2026-01-11
L12,P35,Hemoglobin,12.9,g/dL,2026-01-12
L13,P46,Creatinine,1.8,mg/dL,2026-01-13
L14,P42,Glucose,128,mg/dL,2026-01-14
L15,P68,Glucose,166,mg/dL,2026-01-15
L16,P6,Sodium,132,mmol/L,2026-01-16
L17,P74,Creatinine,1.1,mg/dL,2026-01-17
L18,P14,Glucose,128,mg/dL,2026-01-18
L19,P10,Creatinine,1.2,mg/dL,2026-01-19
L20,P20,Glucose,166,mg/dL,2026-01-20
L21,P52,HbA1c,9.3,percent,2026-01-21
L22,P24,Glucose,100,mg/dL,2026-01-22
L23,P3,Sodium,138,mmol/L,2026-01-23
L24,P38,Potassium,4.9,mmol/L,2026-01-24
L25,P4,Hemoglobin,15.1,g/dL,2026-01-25
L26,P28,HbA1c,7.7,percent,2026-01-26
L27,P54,Glucose,145,mg/dL,2026-01-27
L28,P68,Potassium,5.0,mmol/L,2026-01-28
L29,P91,HbA1c,9.1,percent,2026-02-01
L30,P5,Creatinine,1.5,mg/dL,2026-02-02
L31,P81,Hemoglobin,14.7,g/dL,2026-02-03
L32,P62,HbA1c,9.3,percent,2026-02-04
L33,P80,Creatinine,0.8,mg/dL,2026-02-05
L34,P22,HbA1c,5.2,percent,2026-02-06
L35,P46,Creatinine,1.3,mg/dL,2026-02-07
L36,P72,Hemoglobin,12.0,g/dL,2026-02-08
L37,P65,Potassium,4.5,mmol/L,2026-02-09
L38,P3,Glucose,166,mg/dL,2026-02-10
L39,P100,Potassium,5.1,mmol/L,2026-02-11
L40,P23,Glucose,101,mg/dL,2026-02-12
L41,P64,Glucose,133,mg/dL,2026-02-13
L42,P88,Sodium,137,mmol/L,2026-02-14
L43,P39,Hemoglobin,11.2,g/dL,2026-02-15
L44,P2,Potassium,4.9,mmol/L,2026-02-16
L45,P86,Glucose,73,mg/dL,2026-02-17
L46,P15,Hemoglobin,16.2,g/dL,2026-02-18
L47,P3,Potassium,5.3,mmol/L,2026-02-19
L48,P76,Glucose,126,mg/dL,2026-02-20
L49,P36,HbA1c,5.4,percent,2026-02-21
L50,P80,Hemoglobin,15.5,g/dL,2026-02-22
L51,P4,Hemoglobin,15.4,g/dL,2026-02-23
L52,P29,Sodium,144,mmol/L,2026-02-24
L53,P77,Creatinine,1.0,mg/dL,2026-02-25
L54,P69,Glucose,112,mg/dL,2026-02-26
L55,P39,Glucose,118,mg/dL,2026-02-27
L56,P75,HbA1c,8.3,percent,2026-02-28
L57,P95,Creatinine,1.1,mg/dL,2026-03-01
L58,P89,HbA1c,8.6,percent,2026-03-02
L59,P86,Glucose,150,mg/dL,2026-03-03
L60,P68,Creatinine,1.2,mg/dL,2026-03-04
L61,P32,HbA1c,5.1,percent,2026-03-05
L62,P31,Hemoglobin,15.0,g/dL,2026-03-06
L63,P66,Creatinine,1.3,mg/dL,2026-03-07
L64,P16,Glucose,94,mg/dL,2026-03-08
L65,P31,Hemoglobin,16.5,g/dL,2026-03-09
L66,P20,Hemoglobin,15.8,g/dL,2026-03-10
L67,P71,Hemoglobin,11.1,g/dL,2026-03-11
L68,P57,Glucose,180,mg/dL,2026-03-12
L69,P55,Creatinine,1.7,mg/dL,2026-03-13
L70,P9,Glucose,166,mg/dL,2026-03-14
L71,P53,Glucose,126,mg/dL,2026-03-15
L72,P14,HbA1c,6.9,percent,2026-03-16
L73,P34,Creatinine,0.6,mg/dL,2026-03-17
L74,P10,Creatinine,1.5,mg/dL,2026-03-18
L75,P79,HbA1c,8.9,percent,2026-03-19
L76,P54,HbA1c,7.6,percent,2026-03-20
L77,P34,Glucose,102,mg/dL,2026-03-21
L78,P67,Creatinine,1.5,mg/dL,2026-03-22
L79,P26,Sodium,135,mmol/L,2026-03-23
L80,P44,HbA1c,7.7,percent,2026-03-24
L81,P48,Sodium,142,mmol/L,2026-03-25
L82,P49,Glucose,181,mg/dL,2026-03-26
L83,P62,Glucose,115,mg/dL,2026-03-27
L84,P70,Sodium,145,mmol/L,2026-03-28
L85,P91,Sodium,136,mmol/L,2026-04-01
L86,P47,Glucose,102,mg/dL,2026-04-02
L87,P82,Sodium,141,mmol/L,2026-04-03
L88,P9,HbA1c,5.2,percent,2026-04-04
L89,P5,Creatinine,0.7,mg/dL,2026-04-05
L90,P37,HbA1c,7.0,percent,2026-04-06
L91,P7,Creatinine,1.3,mg/dL,2026-04-07
L92,P51,Hemoglobin,16.1,g/dL,2026-04-08
L93,P82,HbA1c,5.2,percent,2026-04-09
L94,P56,HbA1c,5.7,percent,2026-04-10
L95,P21,Potassium,3.7,mmol/L,2026-04-11
L96,P10,HbA1c,8.6,percent,2026-04-12
L97,P12,Potassium,4.5,mmol/L,2026-04-13
L98,P15,Sodium,136,mmol/L,2026-04-14
L99,P18,Creatinine,1.4,mg/dL,2026-04-15
L100,P83,Glucose,91,mg/dL,2026-04-16
EOF_LABS

cat > "$WORK/bio/gene_counts.tsv" <<'EOF_GENES'
gene_id	sample	count	pathway
GENE001	S01	4272	Apoptosis
GENE002	S01	1060	Immune
GENE003	S08	2024	Signaling
GENE004	S01	2667	Apoptosis
GENE005	S06	4727	Immune
GENE006	S08	2601	Immune
GENE007	S07	1850	Apoptosis
GENE008	S08	2173	Glycolysis
GENE009	S05	2213	Glycolysis
GENE010	S05	110	Apoptosis
GENE011	S04	2320	DNA_repair
GENE012	S01	1394	Glycolysis
GENE013	S06	4634	DNA_repair
GENE014	S04	2242	DNA_repair
GENE015	S02	3940	Immune
GENE016	S05	2280	DNA_repair
GENE017	S07	3766	Immune
GENE018	S02	4241	Apoptosis
GENE019	S09	609	Glycolysis
GENE020	S10	4501	Glycolysis
GENE021	S09	1055	Immune
GENE022	S05	2178	Apoptosis
GENE023	S01	2182	Immune
GENE024	S08	3257	Immune
GENE025	S01	64	Apoptosis
GENE026	S09	1469	Glycolysis
GENE027	S01	3201	Immune
GENE028	S09	760	Immune
GENE029	S04	3033	Immune
GENE030	S05	3308	Signaling
GENE031	S10	4576	Immune
GENE032	S09	62	Signaling
GENE033	S02	4580	Glycolysis
GENE034	S06	3	Glycolysis
GENE035	S02	569	Apoptosis
GENE036	S06	448	Glycolysis
GENE037	S03	130	Immune
GENE038	S05	351	Immune
GENE039	S02	2568	Apoptosis
GENE040	S02	1073	Glycolysis
GENE041	S02	152	DNA_repair
GENE042	S07	172	Apoptosis
GENE043	S10	4010	Immune
GENE044	S03	420	Signaling
GENE045	S09	144	Apoptosis
GENE046	S08	4860	Glycolysis
GENE047	S03	886	Glycolysis
GENE048	S08	3634	Glycolysis
GENE049	S09	416	Signaling
GENE050	S10	1628	Apoptosis
GENE051	S05	4869	Apoptosis
GENE052	S08	1276	Glycolysis
GENE053	S06	4036	Glycolysis
GENE054	S05	1645	Glycolysis
GENE055	S04	1792	Apoptosis
GENE056	S08	317	Glycolysis
GENE057	S02	3058	DNA_repair
GENE058	S07	3710	Glycolysis
GENE059	S03	269	DNA_repair
GENE060	S07	1633	DNA_repair
GENE061	S03	296	DNA_repair
GENE062	S07	2554	DNA_repair
GENE063	S01	4302	Signaling
GENE064	S08	4125	Apoptosis
GENE065	S07	3911	DNA_repair
GENE066	S07	3677	Apoptosis
GENE067	S09	4334	Immune
GENE068	S04	789	Glycolysis
GENE069	S06	3444	Apoptosis
GENE070	S04	3275	Apoptosis
GENE071	S08	635	Glycolysis
GENE072	S04	861	DNA_repair
GENE073	S03	2503	Glycolysis
GENE074	S02	3282	Glycolysis
GENE075	S06	1952	Apoptosis
GENE076	S03	2912	Immune
GENE077	S05	685	Apoptosis
GENE078	S10	656	Glycolysis
GENE079	S07	41	Apoptosis
GENE080	S01	1521	Glycolysis
GENE081	S10	232	Signaling
GENE082	S01	2009	Apoptosis
GENE083	S06	4191	Glycolysis
GENE084	S03	1968	Apoptosis
GENE085	S04	318	Immune
GENE086	S03	407	Glycolysis
GENE087	S10	2501	Immune
GENE088	S03	45	Apoptosis
GENE089	S06	1688	DNA_repair
GENE090	S04	28	Glycolysis
GENE091	S10	57	DNA_repair
GENE092	S04	2534	DNA_repair
GENE093	S10	1365	Glycolysis
GENE094	S05	3195	Signaling
GENE095	S09	1612	Signaling
GENE096	S10	3629	Glycolysis
GENE097	S02	708	Signaling
GENE098	S06	3529	Glycolysis
GENE099	S07	4034	Apoptosis
GENE100	S09	807	Immune
EOF_GENES

cat > "$WORK/devices/ecg_events.txt" <<'EOF_ECG'
event_id|device|timestamp|event
E1|D2|2026-06-01T00:00:00|Normal
E2|D5|2026-06-01T00:12:00|Normal
E3|D5|2026-06-01T00:24:00|Normal
E4|D1|2026-06-01T00:36:00|Normal
E5|D2|2026-06-01T00:48:00|Normal
E6|D3|2026-06-01T01:00:00|Normal
E7|D3|2026-06-01T01:12:00|Normal
E8|D5|2026-06-01T01:24:00|Normal
E9|D3|2026-06-01T01:36:00|ALERT
E10|D4|2026-06-01T01:48:00|ALERT
E11|D2|2026-06-01T02:00:00|ALERT
E12|D3|2026-06-01T02:12:00|Normal
E13|D2|2026-06-01T02:24:00|ALERT
E14|D4|2026-06-01T02:36:00|Normal
E15|D2|2026-06-01T02:48:00|ALERT
E16|D4|2026-06-01T03:00:00|Normal
E17|D3|2026-06-01T03:12:00|Normal
E18|D3|2026-06-01T03:24:00|Artifact
E19|D1|2026-06-01T03:36:00|Normal
E20|D5|2026-06-01T03:48:00|Normal
E21|D2|2026-06-01T04:00:00|ALERT
E22|D1|2026-06-01T04:12:00|Normal
E23|D3|2026-06-01T04:24:00|ALERT
E24|D5|2026-06-01T04:36:00|Artifact
E25|D2|2026-06-01T04:48:00|Normal
E26|D1|2026-06-01T05:00:00|Normal
E27|D4|2026-06-01T05:12:00|Artifact
E28|D1|2026-06-01T05:24:00|Normal
E29|D5|2026-06-01T05:36:00|Artifact
E30|D1|2026-06-01T05:48:00|Normal
E31|D4|2026-06-01T06:00:00|Normal
E32|D4|2026-06-01T06:12:00|Normal
E33|D1|2026-06-01T06:24:00|Missing
E34|D3|2026-06-01T06:36:00|Normal
E35|D2|2026-06-01T06:48:00|Normal
E36|D4|2026-06-01T07:00:00|ALERT
E37|D5|2026-06-01T07:12:00|Normal
E38|D2|2026-06-01T07:24:00|Normal
E39|D3|2026-06-01T07:36:00|Normal
E40|D5|2026-06-01T07:48:00|Normal
E41|D5|2026-06-01T08:00:00|Normal
E42|D2|2026-06-01T08:12:00|Missing
E43|D3|2026-06-01T08:24:00|Normal
E44|D1|2026-06-01T08:36:00|Normal
E45|D2|2026-06-01T08:48:00|Normal
E46|D3|2026-06-01T09:00:00|ALERT
E47|D1|2026-06-01T09:12:00|Normal
E48|D2|2026-06-01T09:24:00|ALERT
E49|D2|2026-06-01T09:36:00|Normal
E50|D2|2026-06-01T09:48:00|Normal
E51|D1|2026-06-01T10:00:00|Artifact
E52|D4|2026-06-01T10:12:00|Normal
E53|D2|2026-06-01T10:24:00|Normal
E54|D3|2026-06-01T10:36:00|Normal
E55|D1|2026-06-01T10:48:00|Normal
E56|D5|2026-06-01T11:00:00|ALERT
E57|D2|2026-06-01T11:12:00|Normal
E58|D1|2026-06-01T11:24:00|Normal
E59|D3|2026-06-01T11:36:00|ALERT
E60|D1|2026-06-01T11:48:00|Normal
E61|D1|2026-06-01T12:00:00|Normal
E62|D4|2026-06-01T12:12:00|Normal
E63|D3|2026-06-01T12:24:00|Normal
E64|D3|2026-06-01T12:36:00|Normal
E65|D2|2026-06-01T12:48:00|Artifact
E66|D1|2026-06-01T13:00:00|ALERT
E67|D1|2026-06-01T13:12:00|Normal
E68|D5|2026-06-01T13:24:00|ALERT
E69|D4|2026-06-01T13:36:00|Normal
E70|D2|2026-06-01T13:48:00|Normal
E71|D4|2026-06-01T14:00:00|Normal
E72|D2|2026-06-01T14:12:00|Normal
E73|D1|2026-06-01T14:24:00|Normal
E74|D3|2026-06-01T14:36:00|Normal
E75|D4|2026-06-01T14:48:00|Artifact
E76|D4|2026-06-01T15:00:00|Normal
E77|D5|2026-06-01T15:12:00|Normal
E78|D4|2026-06-01T15:24:00|ALERT
E79|D1|2026-06-01T15:36:00|Missing
E80|D1|2026-06-01T15:48:00|ALERT
E81|D3|2026-06-01T16:00:00|Normal
E82|D1|2026-06-01T16:12:00|Missing
E83|D3|2026-06-01T16:24:00|Normal
E84|D4|2026-06-01T16:36:00|Normal
E85|D4|2026-06-01T16:48:00|Normal
E86|D5|2026-06-01T17:00:00|ALERT
E87|D3|2026-06-01T17:12:00|Normal
E88|D2|2026-06-01T17:24:00|Normal
E89|D4|2026-06-01T17:36:00|Normal
E90|D1|2026-06-01T17:48:00|Artifact
E91|D3|2026-06-01T18:00:00|Normal
E92|D1|2026-06-01T18:12:00|Normal
E93|D2|2026-06-01T18:24:00|Normal
E94|D1|2026-06-01T18:36:00|Normal
E95|D5|2026-06-01T18:48:00|Normal
E96|D4|2026-06-01T19:00:00|Normal
E97|D1|2026-06-01T19:12:00|ALERT
E98|D2|2026-06-01T19:24:00|Normal
E99|D5|2026-06-01T19:36:00|Normal
E100|D5|2026-06-01T19:48:00|Normal
EOF_ECG

cat > "$WORK/permissions/run_after_chmod.sh" <<'EOF_SH1'
#!/usr/bin/env bash
# A tiny script. It only prints one line.
echo "Script ran successfully after chmod u+x."
EOF_SH1

cat > "$WORK/permissions/run_student_report.sh" <<'EOF_SH2'
#!/usr/bin/env bash
# A second tiny script for Guided Practice 5.
echo "Student report: the permissions practice is complete."
EOF_SH2

chmod -x "$WORK/permissions/run_after_chmod.sh" "$WORK/permissions/run_student_report.sh"

echo "This file exists so that you can practice deleting a file safely." > "$WORK/tmp/delete_me.txt"
if [ ! -f "$WORK/outputs/README.txt" ]; then
  echo "Save the files you create with > and >> in this folder." > "$WORK/outputs/README.txt"
fi
if [ ! -f "$WORK/practice/README.txt" ]; then
  echo "Create your own working folders inside this folder." > "$WORK/practice/README.txt"
fi

echo "Module 2 lab_activity2 is ready in:"
echo "  $WORK"
echo "Spot check: the three clinical files have this many lines in total:"
cat "$WORK"/clinical/patients.csv "$WORK"/clinical/visits.csv "$WORK"/clinical/labs.csv | wc -l
