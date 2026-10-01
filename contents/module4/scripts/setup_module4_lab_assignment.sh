#!/bin/bash
# BIO 2110 Module 4: build the Graded Lab Assignment 4 workspace (lab_assignment4/)
# Run from the repository root with:
#   bash contents/module4/scripts/setup_module4_lab_assignment.sh
# Safe to run again: it rebuilds the data files and never touches your reports/ folder.
set -e
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MOD="$(dirname "$HERE")"
git -C "$HERE" config core.fileMode false 2>/dev/null || true
W="$MOD/lab_assignment4"
mkdir -p "$W/data" "$W/reports"
cat > "$W/data/icu_patients.csv" <<'EOF_ICU_PATIENTS'
PatientID,Name,Age,Diagnosis,ICU_Admission,Status,Oxygen_Saturation
001,John Smith,65,Pneumonia,2024-01-02,On Ventilator,88
002,Jane Doe,72,COVID-19,2024-01-04,On Ventilator,92
003,Michael Johnson,58,Sepsis,2024-01-06,Off Ventilator,85
004,Emily Davis,49,Stroke,2024-01-08,Off Ventilator,80
005,Robert Brown,77,Heart Failure,2024-01-10,On Ventilator,95
006,Linda Wilson,60,ARDS,2024-01-12,On Ventilator,90
007,James Miller,55,Kidney Failure,2024-01-15,Off Ventilator,76
008,Elizabeth Garcia,81,COPD,2024-01-18,On Ventilator,100
009,William Martinez,45,Brain Injury,2024-01-20,Off Ventilator,82
010,Barbara Anderson,68,Pneumonia,2024-01-22,On Ventilator,87
011,David Thomas,51,Sepsis,2024-01-24,Off Ventilator,75
012,Susan Hernandez,59,Stroke,2024-01-26,Off Ventilator,78
013,Richard Martinez,70,Heart Attack,2024-01-28,On Ventilator,97
014,Jessica Clark,53,COVID-19,2024-01-30,On Ventilator,91
015,Charles Rodriguez,61,Organ Failure,2024-02-01,Off Ventilator,85
016,Patricia Lewis,75,Respiratory Failure,2024-02-03,On Ventilator,98
017,Christopher Walker,43,Brain Hemorrhage,2024-02-05,Off Ventilator,83
018,Nancy Hall,79,Diabetes Complications,2024-02-07,On Ventilator,90
019,Daniel Allen,64,Multiple Organ Dysfunction,2024-02-09,On Ventilator,92
020,Jennifer Young,57,Liver Cirrhosis,2024-02-11,Off Ventilator,81
021,Matthew King,69,Heart Failure,2024-02-13,On Ventilator,94
022,Betty Wright,46,Severe Asthma,2024-02-15,Off Ventilator,78
023,Anthony Scott,52,Kidney Infection,2024-02-17,Off Ventilator,77
024,Dorothy Green,80,Stroke,2024-02-19,On Ventilator,95
025,Mark Adams,47,COPD,2024-02-21,Off Ventilator,80
026,Sandra Nelson,73,Pneumonia,2024-02-23,On Ventilator,89
027,Steven Baker,56,Sepsis,2024-02-25,Off Ventilator,76
028,Ashley Perez,48,Brain Tumor,2024-02-27,Off Ventilator,79
029,Brian Gonzalez,66,Organ Failure,2024-03-01,On Ventilator,96
030,Kimberly Carter,50,Diabetes Complications,2024-03-03,On Ventilator,91
031,Edward Mitchell,58,Lung Cancer,2024-03-05,Off Ventilator,83
032,Deborah Rivera,74,Heart Attack,2024-03-07,On Ventilator,97
033,Ronald Evans,49,Pulmonary Embolism,2024-03-09,On Ventilator,88
034,Sharon Parker,77,Respiratory Failure,2024-03-11,On Ventilator,99
035,Frank Howard,53,Organ Transplant Recovery,2024-03-13,Off Ventilator,82
036,Kathleen Diaz,68,Cardiac Arrest,2024-03-15,On Ventilator,95
037,Henry Bell,42,Severe Burns,2024-03-17,Off Ventilator,84
038,Amanda Murphy,71,Pneumonia,2024-03-19,On Ventilator,89
039,Jason Torres,55,Liver Failure,2024-03-21,Off Ventilator,79
040,Cynthia Ramirez,60,Diabetes Complications,2024-03-23,On Ventilator,92
041,Paul Sanders,48,Sepsis,2024-03-25,Off Ventilator,77
042,Laura Coleman,75,Stroke,2024-03-27,On Ventilator,96
043,George Foster,52,Heart Failure,2024-03-29,On Ventilator,94
044,Rebecca Perry,58,COPD,2024-03-31,Off Ventilator,80
045,Dennis Long,65,COVID-19,2024-04-02,On Ventilator,90
046,Rachel Hughes,61,Kidney Failure,2024-04-04,Off Ventilator,78
047,Carl Simmons,70,Multiple Organ Dysfunction,2024-04-06,On Ventilator,97
048,Teresa Butler,59,Sepsis,2024-04-08,Off Ventilator,76
049,Jose Foster,46,Brain Hemorrhage,2024-04-10,Off Ventilator,82
050,Angela Russell,73,Respiratory Failure,2024-04-12,On Ventilator,93
051,Patrick Foster,68,Heart Attack,2024-04-14,On Ventilator,94
052,Christine Morgan,54,Sepsis,2024-04-16,Off Ventilator,79
053,Gregory Adams,61,COPD,2024-04-18,On Ventilator,90
054,Melissa Gonzalez,50,Respiratory Failure,2024-04-20,On Ventilator,97
055,Jeffrey Reed,70,Stroke,2024-04-22,On Ventilator,93
056,Karen Torres,45,Kidney Failure,2024-04-24,Off Ventilator,83
057,Jonathan Jenkins,74,Pneumonia,2024-04-26,On Ventilator,92
058,Stephanie Murray,57,Diabetes Complications,2024-04-28,Off Ventilator,81
059,Adam Lopez,62,Liver Cirrhosis,2024-04-30,Off Ventilator,79
060,Rebecca Martinez,67,COVID-19,2024-05-02,On Ventilator,95
061,Timothy Carter,53,Organ Failure,2024-05-04,Off Ventilator,82
062,Linda Allen,75,Multiple Organ Dysfunction,2024-05-06,On Ventilator,98
063,Harold Baker,49,Severe Asthma,2024-05-08,Off Ventilator,80
064,Anna Perez,60,Heart Failure,2024-05-10,On Ventilator,96
065,Nicholas Brooks,42,Brain Hemorrhage,2024-05-12,Off Ventilator,85
066,Teresa Ross,77,Diabetes Complications,2024-05-14,On Ventilator,91
067,Eric Simmons,55,Sepsis,2024-05-16,Off Ventilator,79
068,Diane Nelson,69,Stroke,2024-05-18,On Ventilator,94
069,Paul Watson,58,Pneumonia,2024-05-20,On Ventilator,92
070,Kimberly Griffin,46,COPD,2024-05-22,Off Ventilator,78
071,Stephen James,51,Heart Attack,2024-05-24,On Ventilator,95
072,Brenda Ford,62,Liver Failure,2024-05-26,Off Ventilator,80
073,Frank Ramirez,74,Cardiac Arrest,2024-05-28,On Ventilator,97
074,Susan Foster,49,Diabetes Complications,2024-05-30,On Ventilator,89
075,Mark Coleman,57,Respiratory Failure,2024-06-01,On Ventilator,98
076,Jessica Ward,68,Kidney Failure,2024-06-03,Off Ventilator,84
077,Brian Morris,43,Brain Injury,2024-06-05,Off Ventilator,86
078,Rachel Butler,61,Sepsis,2024-06-07,Off Ventilator,82
079,James Peterson,59,COVID-19,2024-06-09,On Ventilator,93
080,Deborah Sanders,50,Pneumonia,2024-06-11,On Ventilator,89
081,Edward Torres,66,Organ Failure,2024-06-13,On Ventilator,95
082,Sharon Price,72,Multiple Organ Dysfunction,2024-06-15,On Ventilator,99
083,Anthony Hall,48,Heart Failure,2024-06-17,Off Ventilator,81
084,Karen Evans,56,Severe Asthma,2024-06-19,Off Ventilator,80
085,Matthew Rodriguez,70,Liver Cirrhosis,2024-06-21,Off Ventilator,79
086,Nancy Long,58,Stroke,2024-06-23,On Ventilator,94
087,Joshua Russell,47,COPD,2024-06-25,Off Ventilator,82
088,Christine Simmons,52,Sepsis,2024-06-27,Off Ventilator,83
089,Patrick Jenkins,61,Diabetes Complications,2024-06-29,On Ventilator,91
090,Lisa Morgan,65,Heart Attack,2024-07-01,On Ventilator,97
091,Timothy Adams,49,Respiratory Failure,2024-07-03,On Ventilator,96
092,Betty Bell,73,Pneumonia,2024-07-05,On Ventilator,92
093,Charles Brooks,46,Brain Hemorrhage,2024-07-07,Off Ventilator,84
094,Rebecca Mitchell,55,Kidney Failure,2024-07-09,Off Ventilator,81
095,Gregory Foster,67,Lung Cancer,2024-07-11,Off Ventilator,79
096,Amanda Carter,60,Diabetes Complications,2024-07-13,On Ventilator,95
097,Jeffrey Ward,43,Sepsis,2024-07-15,Off Ventilator,83
098,Melissa Green,74,Organ Transplant Recovery,2024-07-17,Off Ventilator,82
099,Daniel Griffin,59,COVID-19,2024-07-19,On Ventilator,90
100,Dorothy James,50,Multiple Organ Dysfunction,2024-07-21,On Ventilator,98
101,Henry Collins,69,Heart Attack,2024-07-23,On Ventilator,94
102,Victoria Russell,54,Sepsis,2024-07-25,Off Ventilator,79
103,Samuel Bennett,61,COPD,2024-07-27,On Ventilator,90
104,Isabella Patterson,50,Respiratory Failure,2024-07-29,On Ventilator,97
105,Andrew Griffin,70,Stroke,2024-07-31,On Ventilator,93
106,Charlotte Powell,45,Kidney Failure,2024-08-02,Off Ventilator,83
107,Ethan Barnes,74,Pneumonia,2024-08-04,On Ventilator,92
108,Abigail Murphy,57,Diabetes Complications,2024-08-06,Off Ventilator,81
109,Logan Simmons,62,Liver Cirrhosis,2024-08-08,Off Ventilator,79
110,Scarlett Butler,67,COVID-19,2024-08-10,On Ventilator,95
111,Christopher Foster,53,Organ Failure,2024-08-12,Off Ventilator,82
112,Madeline Bryant,75,Multiple Organ Dysfunction,2024-08-14,On Ventilator,98
113,Gabriel Torres,49,Severe Asthma,2024-08-16,Off Ventilator,80
114,Avery Morgan,60,Heart Failure,2024-08-18,On Ventilator,96
115,Julian Cook,42,Brain Hemorrhage,2024-08-20,Off Ventilator,85
116,Eleanor Jenkins,77,Diabetes Complications,2024-08-22,On Ventilator,91
117,Dylan White,55,Sepsis,2024-08-24,Off Ventilator,79
118,Natalie Perez,69,Stroke,2024-08-26,On Ventilator,94
119,Caleb Adams,58,Pneumonia,2024-08-28,On Ventilator,92
120,Penelope Mitchell,46,COPD,2024-08-30,Off Ventilator,78
121,Benjamin Carter,51,Heart Attack,2024-09-01,On Ventilator,95
122,Leah Foster,62,Liver Failure,2024-09-03,Off Ventilator,80
123,Lucas James,74,Cardiac Arrest,2024-09-05,On Ventilator,97
124,Zoe Watson,49,Diabetes Complications,2024-09-07,On Ventilator,89
125,Daniel Reed,57,Respiratory Failure,2024-09-09,On Ventilator,98
126,Aria Simmons,68,Kidney Failure,2024-09-11,Off Ventilator,84
127,Christian Price,43,Brain Injury,2024-09-13,Off Ventilator,86
128,Samantha Long,61,Sepsis,2024-09-15,Off Ventilator,82
129,John Russell,59,COVID-19,2024-09-17,On Ventilator,93
130,Stella Bell,50,Pneumonia,2024-09-19,On Ventilator,89
131,Elijah Hall,66,Organ Failure,2024-09-21,On Ventilator,95
132,Lucy Sanders,72,Multiple Organ Dysfunction,2024-09-23,On Ventilator,99
133,Isaiah Griffin,48,Heart Failure,2024-09-25,Off Ventilator,81
134,Victoria Murphy,56,Severe Asthma,2024-09-27,Off Ventilator,80
135,Julian Adams,70,Liver Cirrhosis,2024-09-29,Off Ventilator,79
136,Amelia Thomas,58,Stroke,2024-10-01,On Ventilator,94
137,Jonathan Cooper,47,COPD,2024-10-03,Off Ventilator,82
138,Claire Jenkins,52,Sepsis,2024-10-05,Off Ventilator,83
139,William Baker,61,Diabetes Complications,2024-10-07,On Ventilator,91
140,Hailey Martinez,65,Heart Attack,2024-10-09,On Ventilator,97
141,Adam Parker,49,Respiratory Failure,2024-10-11,On Ventilator,96
142,Rebecca Scott,73,Pneumonia,2024-10-13,On Ventilator,92
143,Michael Nelson,46,Brain Hemorrhage,2024-10-15,Off Ventilator,84
144,Audrey Gonzalez,55,Kidney Failure,2024-10-17,Off Ventilator,81
145,James Edwards,67,Lung Cancer,2024-10-19,Off Ventilator,79
146,Ella Ross,60,Diabetes Complications,2024-10-21,On Ventilator,95
147,Ryan Torres,43,Sepsis,2024-10-23,Off Ventilator,83
148,Natalie Watson,74,Organ Transplant Recovery,2024-10-25,Off Ventilator,82
149,Jacob Carter,59,COVID-19,2024-10-27,On Ventilator,90
150,Lily Bell,50,Multiple Organ Dysfunction,2024-10-29,On Ventilator,98
151,Daniel Rogers,68,Heart Attack,2024-11-01,On Ventilator,94
152,Sophia Patterson,55,Sepsis,2024-11-03,Off Ventilator,80
153,Alexander Russell,62,COPD,2024-11-05,On Ventilator,92
154,Emily Griffin,50,Respiratory Failure,2024-11-07,On Ventilator,95
155,Benjamin Powell,72,Stroke,2024-11-09,On Ventilator,96
156,Madeline Barnes,45,Kidney Failure,2024-11-11,Off Ventilator,82
157,Noah Murphy,74,Pneumonia,2024-11-13,On Ventilator,91
158,Charlotte Simmons,59,Diabetes Complications,2024-11-15,Off Ventilator,80
159,Lucas Butler,64,Liver Cirrhosis,2024-11-17,Off Ventilator,78
160,Evelyn Foster,70,COVID-19,2024-11-19,On Ventilator,94
161,Nathan Bryant,53,Organ Failure,2024-11-21,Off Ventilator,81
162,Aria Torres,76,Multiple Organ Dysfunction,2024-11-23,On Ventilator,97
163,Henry Morgan,49,Severe Asthma,2024-11-25,Off Ventilator,79
164,Victoria Cook,60,Heart Failure,2024-11-27,On Ventilator,96
165,Julian White,44,Brain Hemorrhage,2024-11-29,Off Ventilator,83
166,Eleanor James,78,Diabetes Complications,2024-12-01,On Ventilator,91
167,Dylan Mitchell,57,Sepsis,2024-12-03,Off Ventilator,78
168,Natalie Adams,70,Stroke,2024-12-05,On Ventilator,93
169,Caleb Robinson,58,Pneumonia,2024-12-07,On Ventilator,92
170,Penelope Walker,46,COPD,2024-12-09,Off Ventilator,77
171,Benjamin Hall,52,Heart Attack,2024-12-11,On Ventilator,94
172,Leah Price,61,Liver Failure,2024-12-13,Off Ventilator,79
173,Lucas Edwards,73,Cardiac Arrest,2024-12-15,On Ventilator,96
174,Zoe Sanders,50,Diabetes Complications,2024-12-17,On Ventilator,88
175,Daniel Baker,56,Respiratory Failure,2024-12-19,On Ventilator,98
176,Aria Gonzalez,69,Kidney Failure,2024-12-21,Off Ventilator,83
177,Christian Carter,43,Brain Injury,2024-12-23,Off Ventilator,85
178,Samantha Phillips,61,Sepsis,2024-12-25,Off Ventilator,81
179,John Murphy,59,COVID-19,2024-12-27,On Ventilator,92
180,Stella Martin,50,Pneumonia,2024-12-29,On Ventilator,88
181,Elijah Bell,67,Organ Failure,2025-01-01,On Ventilator,95
182,Lucy Ross,72,Multiple Organ Dysfunction,2025-01-03,On Ventilator,98
183,Isaiah Griffin,48,Heart Failure,2025-01-05,Off Ventilator,80
184,Victoria Torres,56,Severe Asthma,2025-01-07,Off Ventilator,79
185,Julian Adams,71,Liver Cirrhosis,2025-01-09,Off Ventilator,78
186,Amelia Thomas,59,Stroke,2025-01-11,On Ventilator,93
187,Jonathan Cooper,48,COPD,2025-01-13,Off Ventilator,81
188,Claire Jenkins,53,Sepsis,2025-01-15,Off Ventilator,82
189,William Baker,62,Diabetes Complications,2025-01-17,On Ventilator,90
190,Hailey Martinez,66,Heart Attack,2025-01-19,On Ventilator,96
191,Adam Parker,50,Respiratory Failure,2025-01-21,On Ventilator,95
192,Rebecca Scott,74,Pneumonia,2025-01-23,On Ventilator,91
193,Michael Nelson,47,Brain Hemorrhage,2025-01-25,Off Ventilator,83
194,Audrey Gonzalez,56,Kidney Failure,2025-01-27,Off Ventilator,80
195,James Edwards,68,Lung Cancer,2025-01-29,Off Ventilator,78
196,Ella Ross,61,Diabetes Complications,2025-01-31,On Ventilator,94
197,Ryan Torres,44,Sepsis,2025-02-02,Off Ventilator,82
198,Natalie Watson,75,Organ Transplant Recovery,2025-02-04,Off Ventilator,81
199,Jacob Carter,60,COVID-19,2025-02-06,On Ventilator,89
200,Lily Bell,51,Multiple Organ Dysfunction,2025-02-08,On Ventilator,97
EOF_ICU_PATIENTS
cat > "$W/data/gene_variants.csv" <<'EOF_GENE_VARIANTS'
Gene,Variant,Sequence,Mutation_Type,Mutation_Position
BRCA1,V1,ATGCGTACGTAGCTAGCTACGATC,None,N/A
BRCA1,V2,ATGCGTACGTAGCTAGCTACCATC,Substitution (G → C),16
BRCA1,V3,ATGCGTACGTAGCTAGCTA_GATC,Deletion (-C),17
BRCA1,V4,ATGCGTACGTAGCTAGCTAACGATC,Insertion (+A),15
BRCA2,V1,CGTAGCTAGCTAGCTGGATCGAATC,None,N/A
BRCA2,V2,CGTAGCTAGCTAGCTGGATCGAAGC,Substitution (T → G),22
BRCA2,V3,CGTAGCTAGCTAGCTGG_TCGAATC,Deletion (-A),18
BRCA2,V4,CGTAGCTAGCTAGCTGGAATCGAATC,Insertion (+A),20
TP53,V1,TCGTACGTAGCTAGTCCGATCGATT,None,N/A
TP53,V2,TCGTACGTAGCTAGTCCGACCGAAT,Substitution (T → C),19
TP53,V3,TCGTACGTAGCTAGTCC_ATCGATT,Deletion (-G),10
TP53,V4,TCGTACGTAGCTAGTCCGAATCGATT,Insertion (+A),14
EGFR,V1,GTAGCTAGTACGTAGTGGCTAGCGT,None,N/A
EGFR,V2,GTAGCTAGTACGTAGTGGCTTGCAT,Substitution (G → T),21
EGFR,V3,GTAGCTAGTACGTAGTG_CTGCAT,Deletion (-G),16
EGFR,V4,GTAGCTAGTACGTAGTGGAATGCAT,Insertion (+A),19
KRAS,V1,GATCGATCGATCGTACGTACGTAG,None,N/A
KRAS,V2,GATCGATCGATCGTACGTGCGTAG,Substitution (A → G),18
KRAS,V3,GATCGATCGATCGTACGTAC_TAG,Deletion (-G),14
KRAS,V4,GATCGATCGATCGTACGTACAGTAG,Insertion (+A),15
PIK3CA,V1,ATCGTAGCTACGTAGCGTATGCTACG,None,N/A
PIK3CA,V2,ATCGTAGCTACGTAGCGTATGGTACG,Substitution (C → G),20
PIK3CA,V3,ATCGTAGCTACGTAGCGT_TGCTACG,Deletion (-A),17
PIK3CA,V4,ATCGTAGCTACGTAGCGTATAGCTACG,Insertion (+A),19
ALK,V1,ATCGTAGCTACGTAGCGTATGCTACG,None,N/A
ALK,V2,ATCGTAGCTACGTAGCGTATCCTACG,Substitution (G → C),18
ALK,V3,ATCGTAGCTACGTAGCGTA_GCTACG,Deletion (-T),20
ALK,V4,ATCGTAGCTACGTAGCGTATGACTACG,Insertion (+A),21
BRAF,V1,CTAGCTAGCGTAGCTGATCGTAGCA,None,N/A
BRAF,V2,CTAGCTAGCGTAGCTGATCGGAGCA,Substitution (T → G),15
BRAF,V3,CTAGCTAGCGTAGCTGAT_GTAGCA,Deletion (-C),18
BRAF,V4,CTAGCTAGCGTAGCTGATCGTAGCAA,Insertion (+A),22
MYC,V1,GTCAGTCGATCGTACGTAGCTAGTA,None,N/A
MYC,V2,GTCAGTCGATCGTACGTAGCCAGTA,Substitution (T → C),17
MYC,V3,GTCAGTCGATCGTACGTAG_TAGTA,Deletion (-C),12
MYC,V4,GTCAGTCGATCGTACGTAGCTTAGTA,Insertion (+T),14
PTEN,V1,TGCTAGCTAGCTACGATCGTAGCTA,None,N/A
PTEN,V2,TGCTAGCTAGCTACGATCGTGGCTA,Substitution (A → G),18
PTEN,V3,TGCTAGCTAGCTACG_TCAGCTA,Deletion (-G),20
PTEN,V4,TGCTAGCTAGCTACGATCGTACGCTA,Insertion (+A),19
ATM,V1,ATCGATCGTAGCTAGCTAGCTAGTC,None,N/A
ATM,V2,ATCGATCGTAGCTAGCTAGCTCGTC,Substitution (A → C),15
ATM,V3,ATCGATCGTAGCTAGCTA_CTAGTC,Deletion (-G),14
ATM,V4,ATCGATCGTAGCTAGCTAGCTAAGTC,Insertion (+A),16
CDK2,V1,CTGATCGTAGCTAGCTGATCGTAGT,None,N/A
CDK2,V2,CTGATCGTAGCTAGCTGATCGCAGT,Substitution (T → C),17
CDK2,V3,CTGATCGTAGCTAGC_GATCGTAGT,Deletion (-T),19
CDK2,V4,CTGATCGTAGCTAGCTGATCGTAGTA,Insertion (+A),21
MDM2,V1,GCGTACGTAGCTAGCTAGCGTAGTC,None,N/A
MDM2,V2,GCGTACGTAGCTAGCTAGCGCAGTC,Substitution (T → C),16
MDM2,V3,GCGTACGTAGCTAGCTAG_GTAGTC,Deletion (-C),15
MDM2,V4,GCGTACGTAGCTAGCTAGCGTAGTCA,Insertion (+A),18
APC,V1,GTAGCTAGCGTAGCTAGCTAGCTAG,None,N/A
APC,V2,GTAGCTAGCGTAGCTAGCTAACGTAG,Substitution (G → A),14
APC,V3,GTAGCTAGCGTAGCTAGC_TAGCTAG,Deletion (-T),12
APC,V4,GTAGCTAGCGTAGCTAGCTAGCTAGT,Insertion (+T),20
FGFR2,V1,ATCGTAGCTACGTAGCTAGCTAGCA,None,N/A
FGFR2,V2,ATCGTAGCTACGTAGCTAGCGTAGCA,Substitution (T → G),19
FGFR2,V3,ATCGTAGCTACGTAGC_TAGCTAGCA,Deletion (-A),15
FGFR2,V4,ATCGTAGCTACGTAGCTAGCTAGCAA,Insertion (+A),21
GATA3,V1,CGTAGCTAGCTGATCGTAGCTAGT,None,N/A
GATA3,V2,CGTAGCTAGCTGATCGTAGCAAGT,Substitution (T → A),17
GATA3,V3,CGTAGCTAGCTGATC_TAGCTAGT,Deletion (-G),15
GATA3,V4,CGTAGCTAGCTGATCGTAGCTAGTA,Insertion (+A),20
JAK2,V1,TGATCGTAGCTAGCTAGCGTAGCTA,None,N/A
JAK2,V2,TGATCGTAGCTAGCTAGCGCAGCTA,Substitution (T → C),16
JAK2,V3,TGATCGTAGCTAGCTAGC_TAGCTA,Deletion (-A),14
JAK2,V4,TGATCGTAGCTAGCTAGCGTAGCTAA,Insertion (+A),21
MEK1,V1,ATCGATCGTAGCTAGCTAGCTAGTC,None,N/A
MEK1,V2,ATCGATCGTAGCTAGCTAGCTAGCC,Substitution (T → C),22
MEK1,V3,ATCGATCGTAGCTAGC_TAGCTAGTC,Deletion (-A),20
MEK1,V4,ATCGATCGTAGCTAGCTAGCTAGTCC,Insertion (+C),19
SMAD4,V1,GTAGCTAGCGTAGCTAGCTAGCTAG,None,N/A
SMAD4,V2,GTAGCTAGCGTAGCTAGCTAGCCAG,Substitution (T → C),19
SMAD4,V3,GTAGCTAGCGTAGCTAGC_TAGCTAG,Deletion (-A),14
SMAD4,V4,GTAGCTAGCGTAGCTAGCTAGCTAGA,Insertion (+A),21
VHL,V1,GCTAGCTAGCTAGCGTAGCTAGCTAG,None,N/A
VHL,V2,GCTAGCTAGCTAGCGTAGCCAGCTAG,Substitution (T → C),17
VHL,V3,GCTAGCTAGCTAGC_TAGCTAGCTAG,Deletion (-G),12
VHL,V4,GCTAGCTAGCTAGCGTAGCTAGCTAGA,Insertion (+A),19
NOTCH1,V1,TGATCGTAGCTAGCTAGCTAGCTA,None,N/A
NOTCH1,V2,TGATCGTAGCTAGCTAGCTGGCTA,Substitution (A → G),14
NOTCH1,V3,TGATCGTAGCTAGCTAG_TAGCTA,Deletion (-C),13
NOTCH1,V4,TGATCGTAGCTAGCTAGCTAGCTAAC,Insertion (+C),16
RB1,V1,CGTAGCTAGCTAGCTGATCGTAGCT,None,N/A
RB1,V2,CGTAGCTAGCTAGCTGATCGCAGCT,Substitution (T → C),18
RB1,V3,CGTAGCTAGCTAGC_GATCGTAGCT,Deletion (-T),15
RB1,V4,CGTAGCTAGCTAGCTGATCGTAGCTA,Insertion (+A),21
CCND1,V1,CTAGCTAGCGTAGCTAGCTAGCTA,None,N/A
CCND1,V2,CTAGCTAGCGTAGCTAGCTCGCTA,Substitution (A → C),13
CCND1,V3,CTAGCTAGCGTAGC_TAGCTAGCTA,Deletion (-T),12
CCND1,V4,CTAGCTAGCGTAGCTAGCTAGCTACA,Insertion (+A),19
TSC1,V1,ATCGTAGCTACGTAGCTAGCTAGTC,None,N/A
TSC1,V2,ATCGTAGCTACGTAGCTAGCGAGTC,Substitution (T → G),17
TSC1,V3,ATCGTAGCTACGTAGC_TAGCTAGTC,Deletion (-A),16
TSC1,V4,ATCGTAGCTACGTAGCTAGCTAGTCC,Insertion (+C),18
NTRK1,V1,GCGTACGTAGCTAGCTAGCGTAGT,None,N/A
NTRK1,V2,GCGTACGTAGCTAGCTAGCGTAGG,Substitution (T → G),14
NTRK1,V3,GCGTACGTAGCTAGCTAGC_TAGT,Deletion (-A),13
NTRK1,V4,GCGTACGTAGCTAGCTAGCGTAGTT,Insertion (+T),19
SRC,V1,TGCTAGCTAGCTACGATCGTAGCTAG,None,N/A
SRC,V2,TGCTAGCTAGCTACGATCGCAGCTAG,Substitution (T → C),15
SRC,V3,TGCTAGCTAGCTACG_TAGTAGCTAG,Deletion (-C),14
SRC,V4,TGCTAGCTAGCTACGATCGTAGCTAGA,Insertion (+A),20
ABL1,V1,GTAGCTAGCGTAGCTAGCTAGCTGA,None,N/A
ABL1,V2,GTAGCTAGCGTAGCTAGCTAGCGGA,Substitution (T → G),18
ABL1,V3,GTAGCTAGCGTAGCTAGC_TAGCTGA,Deletion (-A),15
ABL1,V4,GTAGCTAGCGTAGCTAGCTAGCTGAA,Insertion (+A),21
RET,V1,ATCGATCGTAGCTAGCTAGCTAGCGT,None,N/A
RET,V2,ATCGATCGTAGCTAGCTAGCTCGCGT,Substitution (A → C),19
RET,V3,ATCGATCGTAGCTAGC_TAGCTAGCGT,Deletion (-T),17
RET,V4,ATCGATCGTAGCTAGCTAGCTAGCGTG,Insertion (+G),22
KIT,V1,CTGATCGTAGCTAGCTGATCGTAGCT,None,N/A
KIT,V2,CTGATCGTAGCTAGCTGATCGTAGGT,Substitution (C → G),16
KIT,V3,CTGATCGTAGCTAGCTGATCG_TAGCT,Deletion (-A),14
KIT,V4,CTGATCGTAGCTAGCTGATCGTAGCTA,Insertion (+A),21
PDGFRA,V1,GCGTACGTAGCTAGCTAGCGTAGC,None,N/A
PDGFRA,V2,GCGTACGTAGCTAGCTAGCGCAGC,Substitution (T → C),18
PDGFRA,V3,GCGTACGTAGCTAGC_TAGCGTAGC,Deletion (-A),15
PDGFRA,V4,GCGTACGTAGCTAGCTAGCGTAGCG,Insertion (+G),22
ROS1,V1,GTAGCTAGCGTAGCTAGCTAGCTAG,None,N/A
ROS1,V2,GTAGCTAGCGTAGCTAGCTCGCTAG,Substitution (A → C),17
ROS1,V3,GTAGCTAGCGTAGC_TAGCTAGCTAG,Deletion (-T),16
ROS1,V4,GTAGCTAGCGTAGCTAGCTAGCTAGA,Insertion (+A),19
FLI1,V1,ATCGTAGCTACGTAGCTAGCTAGCT,None,N/A
FLI1,V2,ATCGTAGCTACGTAGCTAGCTCGCT,Substitution (A → C),14
FLI1,V3,ATCGTAGCTACGTAGC_TAGCTAGCT,Deletion (-T),12
FLI1,V4,ATCGTAGCTACGTAGCTAGCTAGCTA,Insertion (+A),19
ERBB2,V1,CGTAGCTAGCTGATCGTAGCTAGCT,None,N/A
ERBB2,V2,CGTAGCTAGCTGATCGTAGCGAGCT,Substitution (T → G),18
ERBB2,V3,CGTAGCTAGCTGATC_TAGTAGCT,Deletion (-A),15
ERBB2,V4,CGTAGCTAGCTGATCGTAGCTAGTCA,Insertion (+C),21
NFKB1,V1,TGATCGTAGCTAGCTAGCGTAGCTA,None,N/A
NFKB1,V2,TGATCGTAGCTAGCTAGCGGAGCTA,Substitution (T → G),16
NFKB1,V3,TGATCGTAGCTAGCTAGCG_TAGCTA,Deletion (-C),13
NFKB1,V4,TGATCGTAGCTAGCTAGCGTAGCTAG,Insertion (+G),18
CCNE1,V1,ATCGATCGTAGCTAGCTAGCTAGCT,None,N/A
CCNE1,V2,ATCGATCGTAGCTAGCTAGCTCGCT,Substitution (A → C),17
CCNE1,V3,ATCGATCGTAGCTAGC_TAGCTAGCT,Deletion (-T),14
CCNE1,V4,ATCGATCGTAGCTAGCTAGCTAGCTG,Insertion (+G),21
CHEK2,V1,GTAGCTAGCGTAGCTAGCTAGCTAG,None,N/A
CHEK2,V2,GTAGCTAGCGTAGCTAGCTCGCTAG,Substitution (A → C),16
CHEK2,V3,GTAGCTAGCGTAGC_TAGCTAGCTAG,Deletion (-T),13
CHEK2,V4,GTAGCTAGCGTAGCTAGCTAGCTAGA,Insertion (+A),19
CDKN2A,V1,GCTAGCTAGCTAGCGTAGCTAGCT,None,N/A
CDKN2A,V2,GCTAGCTAGCTAGCGTAGCGGCT,Substitution (T → G),15
CDKN2A,V3,GCTAGCTAGCTAGC_TAGCTAGCT,Deletion (-A),14
CDKN2A,V4,GCTAGCTAGCTAGCGTAGCTAGCTA,Insertion (+A),20
BCL2,V1,TGATCGTAGCTAGCTAGCTAGCTAG,None,N/A
BCL2,V2,TGATCGTAGCTAGCTAGCTGGCTAG,Substitution (A → G),16
BCL2,V3,TGATCGTAGCTAGCTAGCTAGCTAG,Deletion (-C),12
BCL2,V4,TGATCGTAGCTAGCTAGCTAGCTAGC,Insertion (+C),18
CDH1,V1,CGTAGCTAGCTAGCTGATCGTAGCT,None,N/A
CDH1,V2,CGTAGCTAGCTAGCTGATCGCAGCT,Substitution (T → C),18
CDH1,V3,CGTAGCTAGCTAGC_GATCGTAGCT,Deletion (-T),15
CDH1,V4,CGTAGCTAGCTAGCTGATCGTAGCTA,Insertion (+A),21
GNAS,V1,CTAGCTAGCGTAGCTAGCTAGCTAG,None,N/A
GNAS,V2,CTAGCTAGCGTAGCTAGCTCGCTAG,Substitution (A → C),17
GNAS,V3,CTAGCTAGCGTAGC_TAGCTAGCTAG,Deletion (-T),16
GNAS,V4,CTAGCTAGCGTAGCTAGCTAGCTAGA,Insertion (+A),19
FANCA,V1,ATCGTAGCTACGTAGCTAGCTAGCA,None,N/A
FANCA,V2,ATCGTAGCTACGTAGCTAGCGCAGC,Substitution (T → C),18
FANCA,V3,ATCGTAGCTACGTAGC_TAGCTAGCA,Deletion (-A),15
FANCA,V4,ATCGTAGCTACGTAGCTAGCTAGCAG,Insertion (+G),22
BRIP1,V1,GATCGTAGCTAGCTGATCGTAGCT,None,N/A
BRIP1,V2,GATCGTAGCTAGCTGATCGCGTAG,Substitution (A → C),17
BRIP1,V3,GATCGTAGCTAGC_GATCGTAGCT,Deletion (-T),14
BRIP1,V4,GATCGTAGCTAGCTGATCGTAGCTAG,Insertion (+A),20
FOXA1,V1,TGATCGTAGCTAGCTAGCGTAGCTA,None,N/A
FOXA1,V2,TGATCGTAGCTAGCTAGCGGAGCTA,Substitution (T → G),16
FOXA1,V3,TGATCGTAGCTAGCTAGCG_TAGCTA,Deletion (-C),13
FOXA1,V4,TGATCGTAGCTAGCTAGCGTAGCTAG,Insertion (+G),18
RAD51,V1,ATCGATCGTAGCTAGCTAGCTAGCT,None,N/A
RAD51,V2,ATCGATCGTAGCTAGCTAGCTCGCT,Substitution (A → C),17
RAD51,V3,ATCGATCGTAGCTAGC_TAGCTAGCT,Deletion (-T),14
RAD51,V4,ATCGATCGTAGCTAGCTAGCTAGCTG,Insertion (+G),21
HIF1A,V1,GTAGCTAGCGTAGCTAGCTAGCTAG,None,N/A
HIF1A,V2,GTAGCTAGCGTAGCTAGCTCGCTAG,Substitution (A → C),16
HIF1A,V3,GTAGCTAGCGTAGC_TAGCTAGCTAG,Deletion (-T),13
HIF1A,V4,GTAGCTAGCGTAGCTAGCTAGCTAGA,Insertion (+A),19
CCNB1,V1,GCTAGCTAGCTAGCGTAGCTAGCT,None,N/A
CCNB1,V2,GCTAGCTAGCTAGCGTAGCGGCT,Substitution (T → G),15
CCNB1,V3,GCTAGCTAGCTAGC_TAGCTAGCT,Deletion (-A),14
CCNB1,V4,GCTAGCTAGCTAGCGTAGCTAGCTA,Insertion (+A),20
CDK4,V1,TGATCGTAGCTAGCTAGCTAGCTAG,None,N/A
CDK4,V2,TGATCGTAGCTAGCTAGCTGGCTAG,Substitution (A → G),16
CDK4,V3,TGATCGTAGCTAGCTAGCTAGCTAG,Deletion (-C),12
CDK4,V4,TGATCGTAGCTAGCTAGCTAGCTAGC,Insertion (+C),18
SPOP,V1,CGTAGCTAGCTAGCTGATCGTAGCT,None,N/A
SPOP,V2,CGTAGCTAGCTAGCTGATCGCAGCT,Substitution (T → C),18
SPOP,V3,CGTAGCTAGCTAGC_GATCGTAGCT,Deletion (-T),15
SPOP,V4,CGTAGCTAGCTAGCTGATCGTAGCTA,Insertion (+A),21
MEN1,V1,CTAGCTAGCGTAGCTAGCTAGCTAG,None,N/A
MEN1,V2,CTAGCTAGCGTAGCTAGCTCGCTAG,Substitution (A → C),17
MEN1,V3,CTAGCTAGCGTAGC_TAGCTAGCTAG,Deletion (-T),16
MEN1,V4,CTAGCTAGCGTAGCTAGCTAGCTAGA,Insertion (+A),19
EOF_GENE_VARIANTS
cat > "$W/data/hospital_alerts.txt" <<'EOF_HOSPITAL_ALERTS'
[INFO] 2024-01-05 08:15 - Patient John Doe admitted to ICU
[WARNING] 2024-01-12 10:30 - Blood pressure monitor malfunction detected
[ERROR] 2024-01-20 12:45 - Failed to retrieve lab results for PatientID 105
[INFO] 2024-01-28 15:10 - Routine checkup completed for PatientID 142
[ERROR] 2024-02-03 09:20 - CT scan machine failure in Radiology Department
[WARNING] 2024-02-10 14:55 - Unusual oxygen level fluctuations detected in ICU
[INFO] 2024-02-18 07:50 - New doctor assigned to Emergency Unit
[ERROR] 2024-02-25 11:35 - Unauthorized access attempt detected in medical database
[INFO] 2024-03-02 16:40 - Patient Alice Brown discharged from surgery recovery
[WARNING] 2024-03-09 13:25 - High fever recorded for multiple patients in Pediatrics
[ERROR] 2024-03-17 19:05 - Blood test analysis delayed due to system overload
[INFO] 2024-03-23 22:00 - Successful organ transplant completed for PatientID 211
[WARNING] 2024-04-01 06:30 - Power fluctuations in surgical ward backup generator
[ERROR] 2024-04-08 12:10 - Failed to update prescription records for PatientID 178
[INFO] 2024-04-16 18:20 - Newborn delivered safely in Maternity Ward
[WARNING] 2024-04-24 09:15 - Delayed blood transfusion for PatientID 129 due to supply issues
[ERROR] 2024-05-02 14:35 - MRI scanner not operational due to technical issues
[INFO] 2024-05-11 11:45 - Daily rounds completed in General Surgery Ward
[WARNING] 2024-05-20 20:05 - Ventilator malfunction detected in ICU
[ERROR] 2024-05-27 08:50 - Lost patient file recovered from backup server
[INFO] 2024-06-05 17:30 - Research trial initiated for new cancer treatment
[WARNING] 2024-06-13 06:40 - Temperature fluctuations in vaccine storage unit
[ERROR] 2024-06-21 23:55 - Security breach detected in patient records database
[INFO] 2024-06-29 12:15 - Emergency response drill successfully conducted
[WARNING] 2024-07-07 09:30 - Medication shortage reported for critical care patients
[ERROR] 2024-07-15 19:20 - Radiology department experiencing extended processing delays
[INFO] 2024-07-23 07:50 - Patient recovery milestone achieved for orthopedic case
[WARNING] 2024-07-31 16:05 - Elevated heart rates detected in post-surgery patients
[ERROR] 2024-08-08 10:55 - Power outage affecting multiple departments
[INFO] 2024-08-16 14:45 - New research study approved for neurological conditions
[WARNING] 2024-08-24 22:30 - Irregularities detected in glucose monitoring systems
[ERROR] 2024-09-01 06:20 - Failure in operating room sterilization system
[INFO] 2024-09-09 11:55 - Successful cataract surgery performed on 10 patients
[WARNING] 2024-09-17 18:05 - Unusual increase in emergency room admissions
[ERROR] 2024-09-25 09:40 - Delay in ambulance dispatch system due to software crash
[INFO] 2024-10-03 15:25 - AI-assisted diagnosis trial started for skin cancer detection
[WARNING] 2024-10-11 21:15 - Abnormal respiration rates in ICU patients flagged for review
[ERROR] 2024-10-19 13:50 - Lab test contamination suspected, retests ordered
[INFO] 2024-10-27 08:30 - Annual fire drill successfully completed
[WARNING] 2024-11-04 14:40 - Increase in flu cases reported hospital-wide
[ERROR] 2024-11-12 19:30 - Failure in dialysis equipment affecting three patients
[INFO] 2024-11-20 05:45 - Patient monitoring system upgraded successfully
[WARNING] 2024-11-28 11:50 - Medical supply chain disruption affecting deliveries
[ERROR] 2024-12-06 23:20 - Cyberattack attempt blocked by hospital IT team
[INFO] 2024-12-14 09:10 - Seasonal vaccination campaign launched
[WARNING] 2024-12-22 16:35 - Reports of increased patient falls in Rehabilitation Unit
[ERROR] 2024-12-30 20:45 - Loss of connectivity to cloud-based patient records system
[INFO] 2024-02-05 07:45 - Patient discharge processed for PatientID 203
[WARNING] 2024-02-06 08:15 - Oxygen supply running low in ICU
[ERROR] 2024-02-07 09:00 - MRI machine failure during scan of PatientID 342
[INFO] 2024-02-08 10:30 - Lab test results ready for PatientID 129
[ERROR] 2024-02-09 12:10 - Unauthorized access attempt detected in hospital database
[WARNING] 2024-02-10 14:20 - Abnormal vitals detected for PatientID 221 in ICU
[INFO] 2024-02-11 16:00 - Successful surgery completed for PatientID 315
[ERROR] 2024-02-12 18:45 - System crash during radiology report generation
[WARNING] 2024-02-13 21:10 - High blood pressure detected for PatientID 417
[INFO] 2024-02-14 23:55 - Routine night shift check completed
[ERROR] 2024-02-15 04:30 - Failed data backup for ICU patient records
[INFO] 2024-02-16 06:45 - Newborn delivery successful in Maternity Ward
[WARNING] 2024-02-17 08:20 - Delayed medication supply for ICU patients
[INFO] 2024-02-18 09:40 - Doctor reassignment completed for PatientID 189
[ERROR] 2024-02-19 11:15 - Network failure in electronic prescription system
[WARNING] 2024-02-20 13:00 - Unusual spikes in heart rate monitor readings
[INFO] 2024-02-21 15:45 - Pharmacy inventory successfully updated
[ERROR] 2024-02-22 17:20 - Power outage detected in Emergency Room
[INFO] 2024-02-23 19:05 - PatientID 278 scheduled for cardiac surgery
[WARNING] 2024-02-24 21:40 - Ventilator alert: Low oxygen flow detected
[ERROR] 2024-02-25 23:10 - Data corruption detected in pathology records
[INFO] 2024-02-26 01:30 - Night shift nurse rounds completed
[WARNING] 2024-02-27 03:15 - Unusual delay in blood test processing
[ERROR] 2024-02-28 05:50 - Server overload detected in medical imaging system
[INFO] 2024-02-29 07:10 - Patient transfer request approved for PatientID 340
[WARNING] 2024-03-02 09:25 - Low temperature detected in blood storage unit
[ERROR] 2024-03-03 11:45 - Failed to generate discharge summary for PatientID 255
[INFO] 2024-03-04 14:00 - New hospital guidelines implemented for patient data security
[WARNING] 2024-03-05 16:35 - Inconsistent medication dosing detected for PatientID 372
[ERROR] 2024-03-06 18:10 - Emergency Room capacity exceeded
[INFO] 2024-03-07 20:20 - Routine maintenance completed on ventilators
[WARNING] 2024-03-08 22:55 - Irregular heartbeat detected in ICU patient
[ERROR] 2024-03-09 01:40 - Failure in automated drug dispensing machine
[INFO] 2024-03-10 03:20 - Successful post-operative care for PatientID 415
[WARNING] 2024-03-11 05:05 - Nurse shortage reported in Pediatric Ward
[ERROR] 2024-03-12 06:50 - Backup generator failed in Surgery Wing
[INFO] 2024-03-13 08:30 - New interns assigned to Cardiology Department
[WARNING] 2024-03-14 10:10 - Unusual delay in blood transfusion process
[ERROR] 2024-03-15 12:20 - Unauthorized login attempt on radiology database
[INFO] 2024-03-16 14:05 - Successful lab accreditation renewal completed
[WARNING] 2024-03-17 16:45 - High patient influx in emergency ward
[ERROR] 2024-03-18 18:30 - Fatal error in patient monitoring software
[INFO] 2024-03-19 20:15 - Routine hand hygiene audit passed
[WARNING] 2024-03-20 22:05 - Ventilator alert: Possible obstruction detected
[ERROR] 2024-03-21 23:55 - Emergency crash cart unavailable in Surgery Room 2
[INFO] 2024-03-22 02:30 - New patient intake procedures revised
[WARNING] 2024-03-23 04:15 - Hospital security team alerted for patient disturbance
[INFO] 2024-03-24 06:00 - New equipment installed in Radiology Department
[WARNING] 2024-03-25 08:15 - Delay in chemotherapy drug supply
[ERROR] 2024-03-26 10:30 - System outage in ICU patient monitoring
[INFO] 2024-03-27 12:10 - Doctor reassigned to Emergency Ward
[WARNING] 2024-03-28 14:45 - Blood pressure spike detected in PatientID 289
[ERROR] 2024-03-29 16:20 - Cardiac arrest detected in ICU PatientID 176
[INFO] 2024-03-30 18:00 - Staff training completed for new medical software
[ERROR] 2024-03-31 20:35 - Hospital database backup failed
[WARNING] 2024-04-01 22:10 - Patient John Miller showing allergic reaction to medication
[INFO] 2024-04-02 00:50 - Routine sanitation inspection completed
[ERROR] 2024-04-03 03:15 - Major fire alarm triggered in Wing C
[WARNING] 2024-04-04 05:40 - Blood bank supply critically low
[INFO] 2024-04-05 07:20 - Successful post-surgical recovery of PatientID 317
[ERROR] 2024-04-06 09:55 - MRI scanner malfunction, maintenance required
[WARNING] 2024-04-07 12:30 - Irregular heartbeat detected in PatientID 198
[INFO] 2024-04-08 14:05 - Pharmacy restocked with essential medications
[ERROR] 2024-04-09 16:50 - Unresponsive ICU monitor detected for PatientID 411
[WARNING] 2024-04-10 19:15 - Excessive patient wait time reported in Outpatient Department
[INFO] 2024-04-11 21:00 - New protocol implemented for infectious disease control
[ERROR] 2024-04-12 23:45 - Hospital generator failure, backup power activated
[INFO] 2024-04-13 02:10 - Successful kidney transplant for PatientID 522
[WARNING] 2024-04-14 04:35 - Possible medication overdose detected for PatientID 341
[ERROR] 2024-04-15 07:00 - Data corruption found in blood test records
[INFO] 2024-04-16 09:20 - Medical interns rotated to new departments
[WARNING] 2024-04-17 11:45 - Unusual delay in pathology test results
[ERROR] 2024-04-18 14:00 - Cybersecurity breach detected in hospital email system
[INFO] 2024-04-19 16:25 - Successful cardiac surgery performed on PatientID 634
[WARNING] 2024-04-20 18:50 - Low oxygen saturation recorded for ICU patient
[ERROR] 2024-04-21 21:10 - CT scan machine error during scan of PatientID 415
[INFO] 2024-04-22 23:30 - New ICU unit expansion completed
[WARNING] 2024-04-23 02:05 - Unusual spike in respiratory distress cases
[ERROR] 2024-04-24 04:50 - Medication inventory miscalculation detected
[INFO] 2024-04-25 07:15 - Doctor briefing on new patient care protocols
[WARNING] 2024-04-26 09:40 - Increased admissions due to flu outbreak
[ERROR] 2024-04-27 12:05 - Emergency paging system failure
[INFO] 2024-04-28 14:30 - Electronic records system upgrade completed
[WARNING] 2024-04-29 17:00 - Incorrect medication label detected
[ERROR] 2024-04-30 19:20 - Delay in ambulance dispatch for critical patient
[INFO] 2024-05-01 21:50 - End-of-shift nursing report completed
[WARNING] 2024-05-02 00:10 - Overcrowding in pediatric ward
[ERROR] 2024-05-03 02:40 - Power fluctuation detected in operating theater
[INFO] 2024-05-04 05:00 - Routine safety drill completed in ICU
[WARNING] 2024-05-05 07:30 - Delayed lab results due to backlog
[ERROR] 2024-05-06 10:15 - Unauthorized modification attempt on patient records
[INFO] 2024-05-07 12:45 - Successful completion of annual compliance training
[WARNING] 2024-05-08 15:20 - Suspicious spike in allergic reactions reported
[ERROR] 2024-05-09 18:00 - Failure in real-time patient monitoring system
[INFO] 2024-05-10 20:35 - New medical interns onboarded in Neurology
[WARNING] 2024-05-11 23:10 - Unexpected medication interaction observed
[ERROR] 2024-05-12 01:45 - Failed blood transfusion alert for PatientID 528
[WARNING] 2024-05-13 04:20 - Increased hospital-acquired infections detected
[INFO] 2024-05-14 06:55 - Routine staff vaccination program initiated
[ERROR] 2024-05-15 09:30 - Surgical equipment sterilization failure
[WARNING] 2024-05-16 12:05 - Elevated stress levels reported among ER staff
[INFO] 2024-05-17 14:40 - Successful emergency C-section for PatientID 439
[ERROR] 2024-05-18 17:15 - Data corruption in cardiac monitor logs
[WARNING] 2024-05-19 19:50 - Delayed lab results impacting surgery schedules
[INFO] 2024-05-20 22:25 - Electronic medication tracking system deployed
[ERROR] 2024-05-21 01:00 - Power outage in maternity ward backup system
[WARNING] 2024-05-22 03:35 - High patient intake due to local virus outbreak
[INFO] 2024-05-23 06:10 - Staff CPR training refresher completed
[ERROR] 2024-05-24 08:45 - Radiology image storage failure detected
[WARNING] 2024-05-25 11:20 - Shortage of critical surgical gloves reported
[INFO] 2024-05-26 13:55 - First successful robotic-assisted surgery performed
[ERROR] 2024-05-27 16:30 - Blood sample mislabeling detected in Pathology
[WARNING] 2024-05-28 19:05 - Increase in post-operative infections observed
[INFO] 2024-05-29 21:40 - Hospital awarded excellence in patient care
[ERROR] 2024-05-30 00:15 - MRI scan results mismatch detected for PatientID 689
[WARNING] 2024-06-01 02:50 - Delayed ambulance response reported
[INFO] 2024-06-02 05:25 - Successful pediatric heart transplant completed
[ERROR] 2024-06-03 08:00 - ICU ventilator malfunction reported
[WARNING] 2024-06-04 10:35 - High patient turnover affecting nursing staff
[INFO] 2024-06-05 13:10 - Routine emergency preparedness drill completed
[ERROR] 2024-06-06 15:45 - CT scanner overheating issue detected
[WARNING] 2024-06-07 18:20 - Increased demand for ICU beds due to heatwave
[INFO] 2024-06-08 20:55 - Successful separation of conjoined twins completed
[ERROR] 2024-06-09 23:30 - Unauthorized modification attempt in hospital records
[WARNING] 2024-06-10 02:05 - Increased bedsores reported in ICU patients
[INFO] 2024-06-11 04:40 - New AI-assisted diagnostic tool launched
[ERROR] 2024-06-12 07:15 - Medical device recall issued for infusion pumps
[WARNING] 2024-06-13 09:50 - Delayed cancer biopsy results reported
[INFO] 2024-06-14 12:25 - Successful deep brain stimulation therapy performed
[ERROR] 2024-06-15 15:00 - Missing patient prescription records detected
[WARNING] 2024-06-16 17:35 - Increased antibiotic resistance detected in lab samples
[INFO] 2024-06-17 20:10 - New cancer treatment protocol approved
[ERROR] 2024-06-18 22:45 - Unexpected cardiac event in ICU PatientID 731
[WARNING] 2024-06-19 01:20 - Critical shortage of ventilators reported
[INFO] 2024-06-20 03:55 - First successful womb transplant in hospital history
[ERROR] 2024-06-21 06:30 - Data loss detected in emergency room logs
[WARNING] 2024-06-22 09:05 - Increased noise levels affecting patient recovery
[INFO] 2024-06-23 11:40 - Medical imaging AI tool successfully integrated
[ERROR] 2024-06-24 14:15 - Delayed chemotherapy treatment for PatientID 890
[WARNING] 2024-06-25 16:50 - Power fluctuation detected in ICU monitoring system
[INFO] 2024-06-26 19:25 - Expanded hospital parking for patient convenience
[ERROR] 2024-06-27 22:00 - Data breach attempt detected on medical server
[WARNING] 2024-06-28 00:35 - Increased emergency room wait times observed
[INFO] 2024-06-29 03:10 - Mobile health unit launched for rural outreach
[ERROR] 2024-06-30 05:45 - Failed medication order transmission to pharmacy
EOF_HOSPITAL_ALERTS
cat > "$W/data/patient_tests.csv" <<'EOF_PATIENT_TESTS'
PatientID,Name,Age,Cholesterol,Glucose,BloodPressure
1,John Smith,75,190,210,140/90
2,Jane Doe,52,170,180,130/85
3,Alice Johnson,39,250,240,160/100
4,Bob Williams,48,180,150,125/80
5,Emily Brown,33,230,220,145/95
6,Michael Davis,55,195,200,135/88
7,Sarah Wilson,41,205,185,140/85
8,David Martinez,50,180,160,128/78
9,Laura Anderson,29,220,210,150/95
10,James Thomas,60,175,170,130/82
11,Linda Jackson,43,200,190,145/88
12,Robert White,37,190,180,135/80
13,Barbara Harris,76,240,230,155/90
14,William Martin,51,185,160,130/85
15,Elizabeth Thompson,42,210,195,140/83
16,Richard Garcia,38,225,205,145/92
17,Jessica Martinez,47,215,200,150/95
18,Thomas Robinson,53,195,175,135/85
19,Mary Clark,44,205,185,140/90
20,Joseph Lewis,35,180,170,125/78
21,Patricia Walker,49,225,215,155/98
22,Christopher Hall,56,190,180,140/85
23,Karen Allen,40,210,195,145/88
24,Daniel Young,34,185,165,130/82
25,Nancy King,45,230,220,160/105
26,Paul Wright,52,195,175,135/80
27,Lisa Scott,79,205,190,140/85
28,Mark Green,50,180,160,125/78
29,Susan Adams,47,220,210,155/95
30,Steven Baker,41,175,170,130/80
31,Dorothy Gonzalez,55,250,235,160/98
32,Andrew Nelson,38,190,180,140/85
33,Margaret Carter,43,210,200,150/95
34,Charles Mitchell,79,185,165,130/82
35,Betty Perez,51,225,215,155/98
36,Edward Roberts,36,195,175,135/80
37,Helen Phillips,76,205,190,140/85
38,Joshua Evans,54,180,160,125/78
39,Anna Turner,40,220,210,155/95
40,Matthew Parker,44,175,170,130/80
41,Sandra Collins,50,195,180,140/85
42,Kevin Edwards,37,210,200,150/95
43,Donna Stewart,45,185,165,130/82
44,Brian Morris,53,225,215,155/98
45,Carol Rogers,41,195,175,135/80
46,Timothy Reed,48,205,190,140/85
47,Sharon Cook,39,180,160,125/78
48,Ronald Bell,55,220,210,155/95
49,Kathleen Murphy,42,175,170,130/80
50,Jeffrey Rivera,36,250,240,165/105
51,Emma Johnson,30,195,180,140/85
52,Liam Smith,55,210,200,150/95
53,Olivia Williams,40,185,165,130/82
54,Noah Brown,38,225,215,155/98
55,Ava Martinez,42,195,175,135/80
56,William Davis,60,205,190,140/85
57,Sophia Garcia,33,180,160,125/78
58,James Rodriguez,47,220,210,155/95
59,Mia Anderson,29,175,170,130/80
60,Elijah Thomas,50,250,240,165/105
61,Charlotte Jackson,45,195,180,140/85
62,Benjamin White,37,210,200,150/95
63,Amelia Harris,41,185,165,130/82
64,Lucas Martin,51,225,215,155/98
65,Harper Thompson,32,195,175,135/80
66,Ethan Robinson,39,205,190,140/85
67,Evelyn Clark,44,180,160,125/78
68,Michael Lewis,83,220,210,155/95
69,Abigail Walker,36,175,170,130/80
70,Alexander Hall,28,250,240,165/105
71,Scarlett Allen,48,195,180,140/85
72,Daniel Young,58,210,200,150/95
73,Victoria King,95,185,165,130/82
74,Matthew Wright,31,225,215,155/98
75,Elizabeth Scott,40,195,175,135/80
76,Henry Green,52,205,190,140/85
77,Avery Adams,38,180,160,125/78
78,Samuel Baker,49,220,210,155/95
79,Sofia Nelson,47,175,170,130/80
80,David Carter,82,250,240,165/105
81,Emily Mitchell,55,195,180,140/85
82,Jack Perez,94,210,200,150/95
83,Madison Roberts,39,185,165,130/82
84,Joseph Turner,50,225,215,155/98
85,Chloe Phillips,45,195,175,135/80
86,William Evans,37,205,190,140/85
87,Mila Torres,46,180,160,125/78
88,Oliver Sanders,54,220,210,155/95
89,Nora Ross,40,175,170,130/80
90,Isaac Parker,84,250,240,165/105
91,Stella Collins,50,195,180,140/85
92,Levi Edwards,38,210,200,150/95
93,Hannah Stewart,45,185,165,130/82
94,Dylan Morris,53,225,215,155/98
95,Lily Rogers,41,195,175,135/80
96,Owen Reed,48,205,190,140/85
97,Eleanor Cook,39,180,160,125/78
98,Julian Bell,55,220,210,155/95
99,Grace Murphy,42,175,170,130/80
100,Caleb Rivera,36,250,240,165/105
101,Emma Johnson,30,195,180,140/85
102,Liam Smith,55,210,200,150/95
103,Olivia Williams,40,185,165,130/82
104,Noah Brown,38,225,215,155/98
105,Ava Martinez,42,195,175,135/80
106,William Davis,60,205,190,140/85
107,Sophia Garcia,33,180,160,125/78
108,James Rodriguez,47,220,210,155/95
109,Mia Anderson,29,175,170,130/80
110,Elijah Thomas,50,250,240,165/105
111,Charlotte Jackson,45,195,180,140/85
112,Benjamin White,37,210,200,150/95
113,Amelia Harris,81,185,165,130/82
114,Lucas Martin,51,225,215,155/98
115,Harper Thompson,32,195,175,135/80
116,Ethan Robinson,39,205,190,140/85
117,Evelyn Clark,44,180,160,125/78
118,Michael Lewis,53,220,210,155/95
119,Abigail Walker,36,175,170,130/80
120,Alexander Hall,28,250,240,165/105
121,Scarlett Allen,48,195,180,140/85
122,Daniel Young,58,210,200,150/95
123,Victoria King,35,185,165,130/82
124,Matthew Wright,31,225,215,155/98
125,Elizabeth Scott,40,195,175,135/80
126,Henry Green,52,205,190,140/85
127,Avery Adams,38,180,160,125/78
128,Samuel Baker,49,220,210,155/95
129,Sofia Nelson,47,175,170,130/80
130,David Carter,42,250,240,165/105
131,Emily Mitchell,55,195,180,140/85
132,Jack Perez,34,210,200,150/95
133,Madison Roberts,39,185,165,130/82
134,Joseph Turner,80,225,215,155/98
135,Chloe Phillips,45,195,175,135/80
136,William Evans,37,205,190,140/85
137,Mila Torres,46,180,160,125/78
138,Oliver Sanders,54,220,210,155/95
139,Nora Ross,40,175,170,130/80
140,Isaac Parker,44,250,240,165/105
141,Stella Collins,50,195,180,140/85
142,Levi Edwards,38,210,200,150/95
143,Hannah Stewart,45,185,165,130/82
144,Dylan Morris,53,225,215,155/98
145,Lily Rogers,81,195,175,135/80
146,Owen Reed,48,205,190,140/85
147,Eleanor Cook,39,180,160,125/78
148,Julian Bell,55,220,210,155/95
149,Grace Murphy,42,175,170,130/80
150,Caleb Rivera,36,250,240,165/105
151,Nathan Carter,57,210,200,150/95
152,Lucy Walker,29,185,165,130/82
153,Oscar Lewis,61,225,215,155/98
154,Lily Adams,47,195,175,135/80
155,Connor Green,39,205,190,140/85
156,Isabella Hall,45,180,160,125/78
157,Zachary White,52,220,210,155/95
158,Claire Thompson,48,175,170,130/80
159,Daniel Brooks,41,250,240,165/105
160,Natalie King,33,195,180,140/85
161,Caleb Mitchell,56,210,200,150/95
162,Sophie Parker,43,185,165,130/82
163,Logan Reed,39,225,215,155/98
164,Charlotte Morris,46,195,175,135/80
165,Jacob Collins,54,205,190,140/85
166,Hailey Rivera,82,180,160,125/78
167,Brayden Cook,58,220,210,155/95
168,Brianna Murphy,45,175,170,130/80
169,Eric Stewart,40,250,240,165/105
170,Leah Bell,49,195,180,140/85
171,Aiden Turner,50,195,180,140/85
172,Zoe Carter,38,210,200,150/95
173,Nolan Mitchell,45,185,165,130/82
174,Isabelle Parker,53,225,215,155/98
175,Gabriel Reed,41,195,175,135/80
176,Scarlett Morris,48,205,190,140/85
177,Evan Collins,79,180,160,125/78
178,Stella Rivera,55,220,210,155/95
179,Wyatt Cook,42,175,170,130/80
180,Violet Murphy,36,250,240,165/105
181,Daniel Stewart,57,210,200,150/95
182,Elena Bell,29,185,165,130/82
183,Leo Brooks,61,225,215,155/98
184,Lillian King,47,195,175,135/80
185,Grayson Adams,39,205,190,140/85
186,Addison White,45,180,160,125/78
187,Julian Thompson,52,220,210,155/95
188,Lucy Hall,48,175,170,130/80
189,Carson Green,41,250,240,165/105
190,Sadie Lewis,33,195,180,140/85
191,Theodore Mitchell,56,210,200,150/95
192,Naomi Parker,43,185,165,130/82
193,Cooper Reed,39,225,215,155/98
194,Willow Morris,76,195,175,135/80
195,Bennett Collins,54,205,190,140/85
196,Aria Rivera,32,180,160,125/78
197,Hudson Cook,58,220,210,155/95
198,Delilah Murphy,45,175,170,130/80
199,Easton Stewart,40,250,240,165/105
200,Clara Bell,49,195,180,140/85
EOF_PATIENT_TESTS
echo "Graded Lab Assignment 4 workspace is ready in contents/module4/lab_assignment4"
echo "Spot check (expect 201, 197, 192 and 201 lines):"
wc -l "$W/data/icu_patients.csv" "$W/data/gene_variants.csv" "$W/data/hospital_alerts.txt" "$W/data/patient_tests.csv" | sed "s|$W/||"
