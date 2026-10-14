#!/usr/bin/env bash
# setup_module2_lab_assignment.sh
# Builds the workspace for the graded Lab Assignment 2 (Google Cloud Shell).
# Run from the repository root:
#   bash contents/module2/scripts/setup_module2_lab_assignment.sh
# Safe to run again. It rebuilds raw/ and scripts/, resets the script permission,
# and does not touch outputs/.

set -eu
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODULE="$(cd "$HERE/.." && pwd)"
git -C "$MODULE" config core.fileMode false >/dev/null 2>&1 || true
WORK="$MODULE/lab_assignment2"

mkdir -p "$WORK/raw" "$WORK/scripts" "$WORK/outputs"

cat > "$WORK/raw/encounters.csv" <<'EOF_ENC'
encounter_id,patient_id,department,visit_date,status
E001,P186,Pediatrics,2026-01-01,NoShow
E002,P174,Oncology,2026-01-02,Completed
E003,P144,Pediatrics,2026-01-03,Completed
E004,P103,Emergency,2026-01-04,Completed
E005,P190,Emergency,2026-01-05,Scheduled
E006,P198,Emergency,2026-01-06,Cancelled
E007,P122,Emergency,2026-01-07,Completed
E008,P132,Dermatology,2026-01-08,Cancelled
E009,P144,Emergency,2026-01-09,Completed
E010,P152,Oncology,2026-01-10,Scheduled
E011,P129,Cardiology,2026-01-11,Scheduled
E012,P176,Dermatology,2026-01-12,Completed
E013,P106,Oncology,2026-01-13,Completed
E014,P127,Cardiology,2026-01-14,Completed
E015,P113,Emergency,2026-01-15,Completed
E016,P180,Oncology,2026-01-16,NoShow
E017,P106,Neurology,2026-01-17,Completed
E018,P114,Neurology,2026-01-18,Completed
E019,P188,Cardiology,2026-01-19,Completed
E020,P176,Emergency,2026-01-20,Completed
E021,P189,Cardiology,2026-01-21,Completed
E022,P149,Oncology,2026-01-22,Completed
E023,P196,Emergency,2026-01-23,Completed
E024,P160,Emergency,2026-01-24,Completed
E025,P139,Emergency,2026-01-25,Completed
E026,P123,Emergency,2026-01-26,Completed
E027,P127,Dermatology,2026-01-27,Completed
E028,P125,Oncology,2026-01-28,Cancelled
E029,P170,Oncology,2026-02-01,Completed
E030,P149,Dermatology,2026-02-02,Completed
E031,P190,Pediatrics,2026-02-03,Completed
E032,P103,Emergency,2026-02-04,Scheduled
E033,P123,Emergency,2026-02-05,Completed
E034,P150,Pediatrics,2026-02-06,Completed
E035,P111,Pediatrics,2026-02-07,Cancelled
E036,P162,Emergency,2026-02-08,Completed
E037,P112,Emergency,2026-02-09,Completed
E038,P148,Oncology,2026-02-10,Completed
E039,P135,Neurology,2026-02-11,NoShow
E040,P125,Emergency,2026-02-12,NoShow
E041,P109,Emergency,2026-02-13,Scheduled
E042,P116,Cardiology,2026-02-14,Completed
E043,P191,Emergency,2026-02-15,Cancelled
E044,P121,Cardiology,2026-02-16,Completed
E045,P128,Emergency,2026-02-17,Completed
E046,P189,Cardiology,2026-02-18,Completed
E047,P179,Emergency,2026-02-19,Completed
E048,P161,Emergency,2026-02-20,Completed
E049,P167,Neurology,2026-02-21,Cancelled
E050,P161,Cardiology,2026-02-22,Completed
E051,P164,Emergency,2026-02-23,Completed
E052,P154,Emergency,2026-02-24,Cancelled
E053,P186,Neurology,2026-02-25,Completed
E054,P128,Oncology,2026-02-26,Cancelled
E055,P137,Pediatrics,2026-02-27,Completed
E056,P100,Pediatrics,2026-02-28,Completed
E057,P188,Emergency,2026-03-01,Completed
E058,P104,Cardiology,2026-03-02,Completed
E059,P165,Dermatology,2026-03-03,Completed
E060,P143,Oncology,2026-03-04,Scheduled
E061,P148,Emergency,2026-03-05,Scheduled
E062,P174,Cardiology,2026-03-06,Completed
E063,P141,Emergency,2026-03-07,NoShow
E064,P163,Pediatrics,2026-03-08,Completed
E065,P191,Emergency,2026-03-09,Completed
E066,P150,Cardiology,2026-03-10,Completed
E067,P187,Neurology,2026-03-11,Completed
E068,P137,Neurology,2026-03-12,Scheduled
E069,P139,Cardiology,2026-03-13,Cancelled
E070,P178,Emergency,2026-03-14,Completed
E071,P194,Oncology,2026-03-15,Completed
E072,P111,Cardiology,2026-03-16,NoShow
E073,P112,Pediatrics,2026-03-17,Completed
E074,P124,Emergency,2026-03-18,Completed
E075,P195,Cardiology,2026-03-19,Completed
E076,P185,Emergency,2026-03-20,Completed
E077,P154,Oncology,2026-03-21,Completed
E078,P116,Cardiology,2026-03-22,Cancelled
E079,P109,Pediatrics,2026-03-23,Completed
E080,P155,Cardiology,2026-03-24,Scheduled
E081,P104,Cardiology,2026-03-25,Completed
E082,P170,Pediatrics,2026-03-26,Scheduled
E083,P197,Emergency,2026-03-27,Completed
E084,P160,Cardiology,2026-03-28,Completed
E085,P113,Neurology,2026-04-01,Completed
E086,P194,Cardiology,2026-04-02,Completed
E087,P162,Pediatrics,2026-04-03,Scheduled
E088,P133,Oncology,2026-04-04,Completed
E089,P184,Emergency,2026-04-05,Completed
E090,P155,Oncology,2026-04-06,Completed
E091,P162,Oncology,2026-04-07,Scheduled
E092,P109,Pediatrics,2026-04-08,Completed
E093,P149,Cardiology,2026-04-09,Scheduled
E094,P121,Oncology,2026-04-10,Cancelled
E095,P146,Emergency,2026-04-11,Scheduled
E096,P131,Cardiology,2026-04-12,Completed
E097,P115,Neurology,2026-04-13,Scheduled
E098,P109,Emergency,2026-04-14,Completed
E099,P161,Cardiology,2026-04-15,Completed
E100,P156,Neurology,2026-04-16,Completed
E101,P161,Pediatrics,2026-04-17,Scheduled
E102,P160,Oncology,2026-04-18,Completed
E103,P149,Emergency,2026-04-19,Cancelled
E104,P107,Cardiology,2026-04-20,Completed
E105,P198,Cardiology,2026-04-21,Scheduled
E106,P188,Emergency,2026-04-22,Completed
E107,P107,Oncology,2026-04-23,Completed
E108,P180,Neurology,2026-04-24,Scheduled
E109,P197,Emergency,2026-04-25,Completed
E110,P170,Cardiology,2026-04-26,Scheduled
E111,P109,Oncology,2026-04-27,Scheduled
E112,P189,Emergency,2026-04-28,Completed
E113,P123,Cardiology,2026-05-01,Completed
E114,P173,Cardiology,2026-05-02,Completed
E115,P150,Oncology,2026-05-03,Completed
E116,P144,Emergency,2026-05-04,NoShow
E117,P123,Dermatology,2026-05-05,Cancelled
E118,P188,Cardiology,2026-05-06,Completed
E119,P147,Pediatrics,2026-05-07,Completed
E120,P107,Dermatology,2026-05-08,Scheduled
E121,P164,Cardiology,2026-05-09,Cancelled
E122,P166,Emergency,2026-05-10,Completed
E123,P118,Dermatology,2026-05-11,Scheduled
E124,P192,Cardiology,2026-05-12,Scheduled
E125,P196,Pediatrics,2026-05-13,Completed
E126,P188,Oncology,2026-05-14,Scheduled
E127,P123,Pediatrics,2026-05-15,Scheduled
E128,P110,Oncology,2026-05-16,Completed
E129,P110,Cardiology,2026-05-17,Scheduled
E130,P185,Emergency,2026-05-18,Completed
E131,P184,Emergency,2026-05-19,Completed
E132,P130,Cardiology,2026-05-20,Completed
E133,P146,Oncology,2026-05-21,Scheduled
E134,P177,Oncology,2026-05-22,NoShow
E135,P124,Cardiology,2026-05-23,Scheduled
E136,P156,Oncology,2026-05-24,Cancelled
E137,P166,Emergency,2026-05-25,Scheduled
E138,P165,Pediatrics,2026-05-26,Scheduled
E139,P196,Emergency,2026-05-27,Completed
E140,P130,Oncology,2026-05-28,Completed
E141,P192,Cardiology,2026-06-01,Completed
E142,P188,Cardiology,2026-06-02,Completed
E143,P147,Emergency,2026-06-03,Completed
E144,P174,Oncology,2026-06-04,Completed
E145,P145,Neurology,2026-06-05,Completed
E146,P143,Pediatrics,2026-06-06,Completed
E147,P157,Cardiology,2026-06-07,Completed
E148,P194,Cardiology,2026-06-08,Completed
E149,P120,Cardiology,2026-06-09,Cancelled
E150,P128,Pediatrics,2026-06-10,Completed
EOF_ENC

cat > "$WORK/raw/orders.tsv" <<'EOF_ORD'
order_id	patient_id	drug	dose	route
O001	P164	Hydrocortisone	1 percent	topical
O002	P175	Vancomycin	1 g	IV
O003	P197	Ceftriaxone	2 g	IV
O004	P181	Metformin	500 mg	oral
O005	P129	Lisinopril	10 mg	oral
O006	P160	Metformin	500 mg	oral
O007	P193	Lisinopril	10 mg	oral
O008	P133	Lisinopril	10 mg	oral
O009	P108	Atorvastatin	20 mg	oral
O010	P105	Metformin	500 mg	oral
O011	P175	Lisinopril	10 mg	oral
O012	P113	Lisinopril	10 mg	oral
O013	P161	Albuterol	90 mcg	inhaled
O014	P171	Ceftriaxone	2 g	IV
O015	P183	Ceftriaxone	2 g	IV
O016	P106	Metformin	500 mg	oral
O017	P161	Vancomycin	1 g	IV
O018	P130	Albuterol	90 mcg	inhaled
O019	P192	Vancomycin	1 g	IV
O020	P128	Metformin	500 mg	oral
O021	P130	Vancomycin	1 g	IV
O022	P102	Vancomycin	1 g	IV
O023	P175	Atorvastatin	20 mg	oral
O024	P141	Metformin	500 mg	oral
O025	P180	Budesonide	180 mcg	inhaled
O026	P124	Atorvastatin	20 mg	oral
O027	P191	Metformin	500 mg	oral
O028	P189	Budesonide	180 mcg	inhaled
O029	P178	Metformin	500 mg	oral
O030	P143	Vancomycin	1 g	IV
O031	P156	Lisinopril	10 mg	oral
O032	P183	Metformin	500 mg	oral
O033	P150	Metformin	500 mg	oral
O034	P149	Lisinopril	10 mg	oral
O035	P123	Hydrocortisone	1 percent	topical
O036	P188	Hydrocortisone	1 percent	topical
O037	P128	Metformin	500 mg	oral
O038	P111	Hydrocortisone	1 percent	topical
O039	P135	Ceftriaxone	2 g	IV
O040	P159	Vancomycin	1 g	IV
O041	P101	Hydrocortisone	1 percent	topical
O042	P147	Ceftriaxone	2 g	IV
O043	P185	Lisinopril	10 mg	oral
O044	P199	Metformin	500 mg	oral
O045	P175	Ceftriaxone	2 g	IV
O046	P195	Vancomycin	1 g	IV
O047	P184	Atorvastatin	20 mg	oral
O048	P131	Vancomycin	1 g	IV
O049	P146	Metformin	500 mg	oral
O050	P112	Lisinopril	10 mg	oral
O051	P101	Ceftriaxone	2 g	IV
O052	P136	Metformin	500 mg	oral
O053	P132	Lisinopril	10 mg	oral
O054	P183	Lisinopril	10 mg	oral
O055	P102	Hydrocortisone	1 percent	topical
O056	P178	Mupirocin	2 percent	topical
O057	P141	Mupirocin	2 percent	topical
O058	P193	Mupirocin	2 percent	topical
O059	P136	Vancomycin	1 g	IV
O060	P164	Albuterol	90 mcg	inhaled
O061	P185	Lisinopril	10 mg	oral
O062	P161	Atorvastatin	20 mg	oral
O063	P118	Ceftriaxone	2 g	IV
O064	P180	Atorvastatin	20 mg	oral
O065	P102	Ceftriaxone	2 g	IV
O066	P105	Lisinopril	10 mg	oral
O067	P112	Atorvastatin	20 mg	oral
O068	P122	Atorvastatin	20 mg	oral
O069	P118	Metformin	500 mg	oral
O070	P137	Albuterol	90 mcg	inhaled
O071	P132	Ceftriaxone	2 g	IV
O072	P176	Mupirocin	2 percent	topical
O073	P170	Lisinopril	10 mg	oral
O074	P144	Atorvastatin	20 mg	oral
O075	P115	Metformin	500 mg	oral
O076	P125	Atorvastatin	20 mg	oral
O077	P150	Mupirocin	2 percent	topical
O078	P196	Atorvastatin	20 mg	oral
O079	P141	Lisinopril	10 mg	oral
O080	P145	Mupirocin	2 percent	topical
O081	P111	Lisinopril	10 mg	oral
O082	P100	Albuterol	90 mcg	inhaled
O083	P106	Ceftriaxone	2 g	IV
O084	P185	Vancomycin	1 g	IV
O085	P140	Atorvastatin	20 mg	oral
O086	P171	Vancomycin	1 g	IV
O087	P141	Mupirocin	2 percent	topical
O088	P193	Ceftriaxone	2 g	IV
O089	P169	Albuterol	90 mcg	inhaled
O090	P155	Vancomycin	1 g	IV
O091	P152	Atorvastatin	20 mg	oral
O092	P148	Mupirocin	2 percent	topical
O093	P153	Hydrocortisone	1 percent	topical
O094	P152	Atorvastatin	20 mg	oral
O095	P191	Vancomycin	1 g	IV
O096	P196	Ceftriaxone	2 g	IV
O097	P192	Albuterol	90 mcg	inhaled
O098	P197	Ceftriaxone	2 g	IV
O099	P165	Vancomycin	1 g	IV
O100	P131	Vancomycin	1 g	IV
O101	P162	Metformin	500 mg	oral
O102	P172	Metformin	500 mg	oral
O103	P105	Mupirocin	2 percent	topical
O104	P127	Atorvastatin	20 mg	oral
O105	P104	Atorvastatin	20 mg	oral
O106	P138	Hydrocortisone	1 percent	topical
O107	P135	Ceftriaxone	2 g	IV
O108	P143	Budesonide	180 mcg	inhaled
O109	P171	Metformin	500 mg	oral
O110	P182	Albuterol	90 mcg	inhaled
O111	P177	Atorvastatin	20 mg	oral
O112	P171	Lisinopril	10 mg	oral
O113	P130	Hydrocortisone	1 percent	topical
O114	P103	Lisinopril	10 mg	oral
O115	P150	Lisinopril	10 mg	oral
O116	P192	Metformin	500 mg	oral
O117	P194	Metformin	500 mg	oral
O118	P106	Budesonide	180 mcg	inhaled
O119	P137	Metformin	500 mg	oral
O120	P189	Ceftriaxone	2 g	IV
EOF_ORD

cat > "$WORK/scripts/summary.sh" <<'EOF_SH'
#!/usr/bin/env bash
# summary.sh: prints the number of data rows in each raw file.
# Run it from the lab_assignment2 folder.
echo "Encounters (data rows):"
tail -n +2 raw/encounters.csv | wc -l
echo "Orders (data rows):"
tail -n +2 raw/orders.tsv | wc -l
EOF_SH

chmod -x "$WORK/scripts/summary.sh"
if [ ! -f "$WORK/outputs/README.txt" ]; then
  echo "Save every file you create for the assignment in this folder." > "$WORK/outputs/README.txt"
fi

echo "Module 2 lab_assignment2 is ready in:"
echo "  $WORK"
echo "Spot check: the two raw files have this many lines in total:"
cat "$WORK"/raw/encounters.csv "$WORK"/raw/orders.tsv | wc -l
