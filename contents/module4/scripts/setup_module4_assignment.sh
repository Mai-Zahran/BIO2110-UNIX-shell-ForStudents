#!/bin/bash
# BIO 2110 Module 4: build the Practice Assignment 4 workspace (practice/)
# Run from the repository root with:
#   bash contents/module4/scripts/setup_module4_assignment.sh
# Safe to run again: it rebuilds the data files and never touches your reports/ folder.
set -e
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MOD="$(dirname "$HERE")"
git -C "$HERE" config core.fileMode false 2>/dev/null || true
W="$MOD/practice"
mkdir -p "$W/data" "$W/reports"
cat > "$W/data/clinic_patients.txt" <<'EOF_ROSTER'
PatientID,Name,Age,Diagnosis,BMI,Glucose
401,Rashid Rossi,66,Healthy,21.1,99
402,Aaliyah Novak,65,Cancer,26.8,144
403,Malik Mensah,66,Cancer,28.8,124
404,Tomas Petrov,37,Hypertension,30.6,128
405,Mei Castillo,76,Cancer,26.8,136
406,Hugo Castillo,27,Diabetes,32.9,230
407,Camila Mensah,51,Diabetes,27.7,200
408,Kwame Kim,80,Cancer,23.1,150
409,Amara Nguyen,56,Cancer,24.8,120
410,Kwame Osei,62,Cancer,25.8,139
411,Ingrid Castillo,86,Asthma,28.0,125
412,Tomas Novak,48,Asthma,24.3,121
413,Fatima Mensah,47,Hypertension,30.6,157
414,Leila Fischer,48,Diabetes,32.6,230
415,Marcus Fischer,67,Diabetes,27.3,200
416,Mei Osei,59,Diabetes,28.2,185
417,Amara Rossi,41,Diabetes,29.2,200
418,Ingrid Nguyen,47,Cancer,24.4,128
419,Elena Ali,78,Healthy,21.6,103
420,Omar Hernandez,47,Asthma,23.0,105
421,Felix Mensah,24,Asthma,30.6,108
422,Hugo Silva,74,Diabetes,30.3,165
423,Andre Osei,47,Diabetes,30.3,205
424,Aaliyah Silva,66,Asthma,23.9,126
425,Diego Mensah,56,Healthy,22.7,103
426,Tomas Rossi,52,Healthy,22.5,93
427,Malik Nguyen,84,Hypertension,31.1,157
428,Elena Alvarez,57,Healthy,20.6,96
429,Aaliyah Okafor,80,Diabetes,29.7,190
430,Andre Alvarez,86,Hypertension,30.5,128
431,Malik Rossi,50,Healthy,23.1,101
432,Rosa Tanaka,61,Healthy,22.1,105
433,Tomas Tanaka,25,Cancer,28.3,124
434,Hugo Nguyen,82,Asthma,26.6,113
435,Hugo Tanaka,69,Healthy,21.4,99
436,Fatima Campbell,63,Cancer,23.5,122
437,Malik Tanaka,28,Cancer,24.5,141
438,Priya Silva,29,Diabetes,29.0,220
439,Amara Petrov,66,Healthy,22.1,101
440,Aaliyah Alvarez,52,Cancer,23.3,146
441,Pedro Osei,39,Hypertension,26.8,145
442,Andre Okafor,47,Asthma,29.9,108
443,Amara Bailey,57,Hypertension,30.0,134
444,Amara Silva,53,Diabetes,30.9,200
445,Sana Mensah,74,Cancer,27.8,118
446,Andre Bailey,72,Cancer,25.6,140
447,Elena Nguyen,59,Asthma,28.1,118
448,Tomas Okafor,55,Hypertension,31.1,148
449,Omar Kim,75,Cancer,22.9,149
450,Rashid Nguyen,47,Hypertension,29.3,143
451,Ingrid Osei,76,Hypertension,28.6,163
452,Hannah Rossi,77,Healthy,22.4,100
453,Nadia Bailey,55,Healthy,24.7,100
454,Sana Petrov,37,Diabetes,28.7,230
455,Fatima Fischer,79,Asthma,27.9,126
456,Felix Novak,82,Asthma,29.1,109
457,Victor Chowdhury,37,Healthy,23.0,88
458,Marcus Okafor,36,Healthy,21.4,93
459,Hugo Chowdhury,86,Asthma,29.1,105
460,Ivan Okafor,30,Cancer,26.8,138
EOF_ROSTER
cat > "$W/data/lab_results.csv" <<'EOF_LABS'
PatientID,Date,Test,Result,Unit,Status
406,2026-07-01,Creatinine,1.9,mg/dL,Corrected
408,2026-07-01,Cholesterol,261,mg/dL,Final
415,2026-07-01,Glucose,115,mg/dL,Final
422,2026-07-01,Sodium,146,mmol/L,Final
424,2026-07-01,Glucose,183,mg/dL,Final
430,2026-07-01,Cholesterol,165,mg/dL,Corrected
435,2026-07-01,Glucose,130,mg/dL,Final
437,2026-07-01,HbA1c,5.7,%,Final
439,2026-07-01,Creatinine,0.8,mg/dL,Corrected
450,2026-07-01,Glu,236,mg/dL,Final
454,2026-07-01,Creatinine,1.7,mg/dL,Final
456,2026-07-01,Glucose,140,mg/dL,Final
407,2026-07-02,HbA1c,6.1,%,Final
429,2026-07-02,Sodium,136,mmol/L,Final
439,2026-07-02,Sodium,128,mmol/L,Corrected
420,2026-07-03,HbA1c,4.8,%,Final
425,2026-07-03,HbA1c,6.2,%,Final
428,2026-07-03,Glucose,203,mg/dL,Final
429,2026-07-03,Glucose,172,mg/dL,Final
442,2026-07-03,Sodium,144,mmol/L,Corrected
455,2026-07-03,Glucose,245,mg/dL,Final
401,2026-07-04,Glu,175,mg/dL,Final
414,2026-07-04,Glucose,108,mg/dL,Prelim
417,2026-07-04,HbA1c,6.7,%,Final
430,2026-07-04,Creatinine,1.1,mg/dL,Final
445,2026-07-04,HbA1c,6.1,%,Final
415,2026-07-05,Sodium,130,mmol/L,Prelim
423,2026-07-05,Sodium,129,mmol/L,Final
437,2026-07-05,Glucose,232,mg/dL,Final
443,2026-07-05,Cholesterol,246,mg/dL,Final
401,2026-07-06,Sodium,140,mmol/L,Final
402,2026-07-06,Glu,259,mg/dL,Final
419,2026-07-06,Cholesterol,217,mg/dL,Final
425,2026-07-06,Creatinine,2.2,mg/dL,Prelim
446,2026-07-06,Creatinine,1.6,mg/dL,Final
447,2026-07-06,Creatinine,1.8,mg/dL,Final
418,2026-07-07,Sodium,135,mmol/L,Final
437,2026-07-07,Glucose,73,mg/dL,Final
446,2026-07-07,HbA1c,5.4,%,Final
446,2026-07-07,Glucose,88,mg/dL,Final
405,2026-07-08,HbA1c,11.5,%,Prelim
407,2026-07-08,Glu,167,mg/dL,Final
415,2026-07-08,HbA1c,11.2,%,Final
425,2026-07-08,HbA1c,9.7,%,Final
437,2026-07-08,Creatinine,1.2,mg/dL,Prelim
442,2026-07-08,Glucose,137,mg/dL,Final
446,2026-07-08,Cholesterol,245,mg/dL,Final
458,2026-07-08,Glucose,158,mg/dL,Final
433,2026-07-09,glucose,225,mg/dL,Prelim
442,2026-07-09,Cholesterol,253,mg/dL,Prelim
448,2026-07-09,glucose,178,mg/dL,Final
449,2026-07-09,HbA1c,8.6,%,Final
411,2026-07-10,Creatinine,1.4,mg/dL,Final
424,2026-07-10,Sodium,136,mmol/L,Final
434,2026-07-10,Creatinine,0.9,mg/dL,Corrected
438,2026-07-10,Glu,254,mg/dL,Final
449,2026-07-10,HbA1c,9.2,%,Prelim
417,2026-07-11,Sodium,128,mmol/L,Final
418,2026-07-11,Glu,137,mg/dL,Final
437,2026-07-11,Sodium,128,mmol/L,Corrected
452,2026-07-11,Sodium,131,mmol/L,Final
401,2026-07-12,Glu,139,mg/dL,Final
417,2026-07-12,Creatinine,1.1,mg/dL,Final
443,2026-07-12,Cholesterol,144,mg/dL,Corrected
447,2026-07-12,Glu,76,mg/dL,Corrected
460,2026-07-12,Glu,235,mg/dL,Final
406,2026-07-13,HbA1c,11.0,%,Prelim
411,2026-07-13,HbA1c,8.6,%,Corrected
430,2026-07-13,Glu,237,mg/dL,Final
444,2026-07-13,Creatinine,1.4,mg/dL,Final
445,2026-07-13,Sodium,140,mmol/L,Final
453,2026-07-13,Glucose,108,mg/dL,Final
455,2026-07-13,Glu,116,mg/dL,Final
401,2026-07-14,Creatinine,1.9,mg/dL,Final
411,2026-07-14,Glu,185,mg/dL,Final
432,2026-07-14,Cholesterol,290,mg/dL,Final
456,2026-07-14,HbA1c,6.9,%,Corrected
413,2026-07-15,Sodium,133,mmol/L,Corrected
415,2026-07-15,Creatinine,0.7,mg/dL,Final
445,2026-07-15,Glucose,249,mg/dL,Final
459,2026-07-15,glucose,227,mg/dL,Corrected
409,2026-07-16,Creatinine,2.0,mg/dL,Final
413,2026-07-16,Creatinine,1.9,mg/dL,Prelim
436,2026-07-16,Glu,134,mg/dL,Corrected
439,2026-07-16,HbA1c,5.3,%,Final
446,2026-07-16,Cholesterol,266,mg/dL,Final
412,2026-07-17,Glucose,208,mg/dL,Corrected
413,2026-07-17,HbA1c,7.4,%,Prelim
416,2026-07-17,Cholesterol,148,mg/dL,Final
420,2026-07-17,Glu,167,mg/dL,Final
460,2026-07-17,Glucose,178,mg/dL,Prelim
420,2026-07-18,Sodium,142,mmol/L,Final
421,2026-07-18,Creatinine,1.0,mg/dL,Prelim
433,2026-07-18,Glu,138,mg/dL,Final
439,2026-07-18,Cholesterol,255,mg/dL,Final
442,2026-07-18,HbA1c,5.9,%,Corrected
449,2026-07-18,Creatinine,2.2,mg/dL,Final
450,2026-07-18,Sodium,147,mmol/L,Prelim
424,2026-07-19,Sodium,128,mmol/L,Final
445,2026-07-19,Sodium,137,mmol/L,Final
451,2026-07-19,glucose,91,mg/dL,Final
453,2026-07-19,Cholesterol,231,mg/dL,Prelim
457,2026-07-19,Glu,145,mg/dL,Prelim
410,2026-07-20,Glucose,169,mg/dL,Final
411,2026-07-20,Creatinine,1.7,mg/dL,Prelim
425,2026-07-20,glucose,158,mg/dL,Final
430,2026-07-20,Creatinine,2.3,mg/dL,Final
449,2026-07-20,Sodium,130,mmol/L,Final
459,2026-07-20,Sodium,140,mmol/L,Prelim
404,2026-07-21,Glu,199,mg/dL,Prelim
406,2026-07-21,HbA1c,8.9,%,Final
408,2026-07-21,Creatinine,1.0,mg/dL,Final
409,2026-07-21,Creatinine,1.3,mg/dL,Final
450,2026-07-21,Glu,214,mg/dL,Corrected
452,2026-07-21,HbA1c,7.8,%,Prelim
454,2026-07-21,Sodium,144,mmol/L,Prelim
454,2026-07-21,Glu,254,mg/dL,Final
454,2026-07-21,HbA1c,7.8,%,Final
457,2026-07-21,Glu,228,mg/dL,Final
417,2026-07-22,Glucose,150,mg/dL,Final
426,2026-07-22,HbA1c,9.9,%,Final
406,2026-07-23,Glucose,86,mg/dL,Corrected
411,2026-07-23,Glu,88,mg/dL,Prelim
427,2026-07-23,Sodium,128,mmol/L,Final
433,2026-07-23,Creatinine,1.3,mg/dL,Corrected
434,2026-07-23,Sodium,136,mmol/L,Final
434,2026-07-23,Sodium,133,mmol/L,Corrected
437,2026-07-23,Cholesterol,223,mg/dL,Final
449,2026-07-23,Creatinine,1.8,mg/dL,Final
454,2026-07-23,Sodium,143,mmol/L,Prelim
456,2026-07-23,Cholesterol,236,mg/dL,Final
409,2026-07-24,HbA1c,7.7,%,Prelim
411,2026-07-24,HbA1c,10.7,%,Final
417,2026-07-24,Glu,161,mg/dL,Final
417,2026-07-24,Creatinine,1.3,mg/dL,Corrected
429,2026-07-24,HbA1c,6.2,%,Final
435,2026-07-24,HbA1c,10.2,%,Final
402,2026-07-25,Glucose,180,mg/dL,Corrected
422,2026-07-25,Cholesterol,268,mg/dL,Final
429,2026-07-25,Cholesterol,233,mg/dL,Final
431,2026-07-25,Glucose,222,mg/dL,Final
448,2026-07-25,Glucose,177,mg/dL,Corrected
445,2026-07-26,Creatinine,1.0,mg/dL,Prelim
459,2026-07-26,Cholesterol,175,mg/dL,Final
460,2026-07-26,Glu,118,mg/dL,Prelim
406,2026-07-27,Glucose,212,mg/dL,Final
409,2026-07-27,Sodium,137,mmol/L,Final
440,2026-07-27,Glucose,213,mg/dL,Final
460,2026-07-27,Cholesterol,141,mg/dL,Final
408,2026-07-28,Cholesterol,196,mg/dL,Final
433,2026-07-28,HbA1c,9.2,%,Final
439,2026-07-28,Glu,237,mg/dL,Final
456,2026-07-28,Cholesterol,NA,mg/dL,Final
402,2026-08-01,glucose,232,mg/dL,Corrected
407,2026-08-01,Sodium,145,mmol/L,Final
407,2026-08-01,HbA1c,8.1,%,Corrected
418,2026-08-01,Cholesterol,220,mg/dL,Final
418,2026-08-01,Glu,88,mg/dL,Final
421,2026-08-01,Glucose,79,mg/dL,Prelim
423,2026-08-01,Cholesterol,240,mg/dL,Prelim
433,2026-08-01,Glu,130,mg/dL,Final
440,2026-08-01,Glucose,145,mg/dL,Final
444,2026-08-01,Sodium,147,mmol/L,Prelim
445,2026-08-01,Sodium,129,mmol/L,Corrected
415,2026-08-02,Cholesterol,196,mg/dL,Final
418,2026-08-02,HbA1c,5.3,%,Final
421,2026-08-02,glucose,109,mg/dL,Corrected
421,2026-08-02,Cholesterol,285,mg/dL,Final
435,2026-08-02,Glucose,213,mg/dL,Final
447,2026-08-02,Cholesterol,224,mg/dL,Final
455,2026-08-02,Creatinine,1.6,mg/dL,Final
420,2026-08-03,Glucose,237,mg/dL,Final
429,2026-08-03,HbA1c,9.6,%,Corrected
432,2026-08-03,Creatinine,1.7,mg/dL,Prelim
439,2026-08-03,Glucose,134,mg/dL,Final
440,2026-08-03,Sodium,136,mmol/L,Final
402,2026-08-04,Sodium,140,mmol/L,Corrected
408,2026-08-04,HbA1c,6.1,%,Final
413,2026-08-04,Cholesterol,220,mg/dL,Final
415,2026-08-04,HbA1c,8.3,%,Prelim
457,2026-08-04,Glucose,110,mg/dL,Final
458,2026-08-04,glucose,134,mg/dL,Corrected
412,2026-08-05,glucose,236,mg/dL,Final
421,2026-08-05,Creatinine,2.2,mg/dL,Final
422,2026-08-05,HbA1c,NA,%,Prelim
444,2026-08-05,Creatinine,2.0,mg/dL,Corrected
460,2026-08-05,Glucose,207,mg/dL,Corrected
431,2026-08-06,Glu,NA,mg/dL,Final
451,2026-08-06,Glucose,245,mg/dL,Final
453,2026-08-06,glucose,179,mg/dL,Corrected
403,2026-08-07,Cholesterol,179,mg/dL,Final
409,2026-08-07,Cholesterol,172,mg/dL,Prelim
417,2026-08-07,HbA1c,5.8,%,Final
427,2026-08-07,Creatinine,1.3,mg/dL,Final
429,2026-08-07,Sodium,132,mmol/L,Final
459,2026-08-07,Sodium,146,mmol/L,Final
401,2026-08-08,Glu,98,mg/dL,Prelim
406,2026-08-08,glucose,95,mg/dL,Final
422,2026-08-08,Glu,171,mg/dL,Final
438,2026-08-08,HbA1c,9.8,%,Corrected
443,2026-08-08,Cholesterol,279,mg/dL,Final
443,2026-08-08,HbA1c,5.4,%,Corrected
444,2026-08-08,glucose,151,mg/dL,Prelim
449,2026-08-08,Glucose,91,mg/dL,Final
401,2026-08-09,Cholesterol,199,mg/dL,Final
421,2026-08-09,Glucose,187,mg/dL,Final
431,2026-08-09,Creatinine,0.6,mg/dL,Final
446,2026-08-09,Sodium,145,mmol/L,Final
448,2026-08-09,Cholesterol,221,mg/dL,Corrected
451,2026-08-09,Cholesterol,144,mg/dL,Final
407,2026-08-10,glucose,131,mg/dL,Final
426,2026-08-10,Cholesterol,216,mg/dL,Final
432,2026-08-10,Sodium,138,mmol/L,Final
443,2026-08-10,Sodium,141,mmol/L,Prelim
413,2026-08-11,Cholesterol,282,mg/dL,Corrected
427,2026-08-11,Cholesterol,243,mg/dL,Final
434,2026-08-11,glucose,187,mg/dL,Corrected
439,2026-08-11,Creatinine,1.1,mg/dL,Corrected
412,2026-08-12,Glucose,70,mg/dL,Final
423,2026-08-12,Glu,91,mg/dL,Final
433,2026-08-12,glucose,179,mg/dL,Final
447,2026-08-12,Cholesterol,245,mg/dL,Prelim
449,2026-08-12,Creatinine,1.3,mg/dL,Prelim
456,2026-08-12,Glu,181,mg/dL,Prelim
458,2026-08-12,Glucose,102,mg/dL,Final
459,2026-08-12,HbA1c,11.2,%,Final
403,2026-08-13,Glu,224,mg/dL,Final
406,2026-08-13,Sodium,139,mmol/L,Final
417,2026-08-13,Sodium,148,mmol/L,Prelim
430,2026-08-13,Glu,87,mg/dL,Final
437,2026-08-13,Cholesterol,255,mg/dL,Corrected
446,2026-08-13,Glucose,222,mg/dL,Final
427,2026-08-14,Cholesterol,187,mg/dL,Final
433,2026-08-14,Glucose,70,mg/dL,Prelim
445,2026-08-14,Glucose,220,mg/dL,Final
411,2026-08-15,Sodium,142,mmol/L,Final
415,2026-08-15,HbA1c,5.7,%,Final
417,2026-08-15,Cholesterol,160,mg/dL,Corrected
433,2026-08-15,Creatinine,1.2,mg/dL,Final
437,2026-08-15,Sodium,140,mmol/L,Corrected
440,2026-08-15,Creatinine,1.4,mg/dL,Final
444,2026-08-15,Glu,160,mg/dL,Final
401,2026-08-16,Glucose,201,mg/dL,Final
403,2026-08-16,Creatinine,2.2,mg/dL,Prelim
405,2026-08-16,HbA1c,7.4,%,Final
431,2026-08-16,Creatinine,2.4,mg/dL,Prelim
459,2026-08-16,Sodium,143,mmol/L,Final
460,2026-08-16,Sodium,140,mmol/L,Prelim
411,2026-08-17,Creatinine,NA,mg/dL,Final
416,2026-08-17,Cholesterol,259,mg/dL,Prelim
421,2026-08-17,Sodium,147,mmol/L,Prelim
438,2026-08-17,Glucose,235,mg/dL,Prelim
450,2026-08-17,HbA1c,10.9,%,Prelim
454,2026-08-17,Creatinine,1.6,mg/dL,Final
459,2026-08-17,Cholesterol,267,mg/dL,Final
460,2026-08-17,Cholesterol,267,mg/dL,Final
413,2026-08-18,Cholesterol,275,mg/dL,Corrected
419,2026-08-18,Glucose,253,mg/dL,Corrected
424,2026-08-18,Glucose,252,mg/dL,Prelim
430,2026-08-18,Glu,140,mg/dL,Final
438,2026-08-18,Glu,101,mg/dL,Prelim
413,2026-08-19,Glu,214,mg/dL,Final
417,2026-08-19,Cholesterol,146,mg/dL,Final
429,2026-08-19,Creatinine,1.4,mg/dL,Final
440,2026-08-19,Glu,100,mg/dL,Corrected
445,2026-08-19,Sodium,143,mmol/L,Final
449,2026-08-19,Glucose,185,mg/dL,Final
459,2026-08-19,HbA1c,5.3,%,Final
411,2026-08-20,Glu,123,mg/dL,Final
427,2026-08-20,Creatinine,0.7,mg/dL,Prelim
433,2026-08-20,Sodium,128,mmol/L,Final
458,2026-08-20,HbA1c,11.4,%,Corrected
407,2026-08-21,glucose,233,mg/dL,Final
417,2026-08-21,Glu,79,mg/dL,Prelim
421,2026-08-21,Cholesterol,257,mg/dL,Corrected
426,2026-08-21,Sodium,133,mmol/L,Final
438,2026-08-21,HbA1c,9.3,%,Corrected
454,2026-08-21,Glu,156,mg/dL,Final
459,2026-08-21,Glucose,242,mg/dL,Final
404,2026-08-22,Creatinine,1.9,mg/dL,Final
409,2026-08-22,Cholesterol,211,mg/dL,Corrected
422,2026-08-22,Glucose,97,mg/dL,Final
428,2026-08-22,Creatinine,1.0,mg/dL,Final
453,2026-08-22,Glu,161,mg/dL,Final
410,2026-08-23,Glu,158,mg/dL,Final
412,2026-08-23,Glucose,239,mg/dL,Prelim
419,2026-08-23,Creatinine,1.4,mg/dL,Prelim
421,2026-08-23,Sodium,137,mmol/L,Final
423,2026-08-23,Creatinine,1.3,mg/dL,Final
424,2026-08-23,Creatinine,2.3,mg/dL,Final
429,2026-08-23,Cholesterol,201,mg/dL,Final
433,2026-08-23,Glu,151,mg/dL,Final
404,2026-08-24,Creatinine,2.1,mg/dL,Final
413,2026-08-24,HbA1c,8.2,%,Final
452,2026-08-24,HbA1c,10.1,%,Final
402,2026-08-25,Cholesterol,254,mg/dL,Corrected
415,2026-08-25,Glu,224,mg/dL,Final
432,2026-08-25,Glucose,78,mg/dL,Prelim
439,2026-08-25,Sodium,143,mmol/L,Prelim
407,2026-08-26,Cholesterol,219,mg/dL,Prelim
445,2026-08-26,Glucose,222,mg/dL,Final
412,2026-08-27,glucose,97,mg/dL,Final
414,2026-08-27,Cholesterol,286,mg/dL,Corrected
421,2026-08-27,Glucose,74,mg/dL,Final
445,2026-08-27,Glucose,101,mg/dL,Prelim
446,2026-08-27,Cholesterol,193,mg/dL,Final
450,2026-08-27,Creatinine,0.9,mg/dL,Final
458,2026-08-27,Sodium,135,mmol/L,Prelim
459,2026-08-27,Cholesterol,244,mg/dL,Corrected
421,2026-08-28,HbA1c,8.2,%,Final
451,2026-08-28,Glu,182,mg/dL,Final
453,2026-08-28,HbA1c,5.7,%,Prelim
455,2026-08-28,glucose,221,mg/dL,Final
404,2026-09-01,Cholesterol,272,mg/dL,Final
416,2026-09-01,HbA1c,8.9,%,Corrected
422,2026-09-01,Glucose,138,mg/dL,Final
434,2026-09-01,HbA1c,5.5,%,Prelim
406,2026-09-02,HbA1c,10.6,%,Final
435,2026-09-02,Glu,234,mg/dL,Final
437,2026-09-02,HbA1c,6.7,%,Final
445,2026-09-02,Cholesterol,213,mg/dL,Final
456,2026-09-02,Sodium,128,mmol/L,Prelim
456,2026-09-02,Cholesterol,162,mg/dL,Final
459,2026-09-02,Glucose,100,mg/dL,Corrected
460,2026-09-02,Cholesterol,238,mg/dL,Prelim
401,2026-09-03,Cholesterol,237,mg/dL,Final
430,2026-09-03,HbA1c,5.8,%,Prelim
439,2026-09-03,Glucose,222,mg/dL,Prelim
441,2026-09-03,glucose,74,mg/dL,Final
444,2026-09-03,Sodium,133,mmol/L,Prelim
451,2026-09-03,Glu,255,mg/dL,Final
401,2026-09-04,HbA1c,4.9,%,Final
414,2026-09-04,Glu,167,mg/dL,Corrected
416,2026-09-04,Cholesterol,149,mg/dL,Corrected
448,2026-09-04,Creatinine,1.3,mg/dL,Final
452,2026-09-04,Glu,87,mg/dL,Prelim
405,2026-09-05,Glu,235,mg/dL,Final
417,2026-09-05,Glu,179,mg/dL,Final
417,2026-09-05,HbA1c,6.7,%,Final
420,2026-09-05,Creatinine,1.4,mg/dL,Final
426,2026-09-05,Creatinine,2.3,mg/dL,Corrected
441,2026-09-05,Glu,188,mg/dL,Corrected
453,2026-09-05,Cholesterol,245,mg/dL,Prelim
459,2026-09-05,Cholesterol,163,mg/dL,Prelim
429,2026-09-06,HbA1c,8.2,%,Final
444,2026-09-06,Creatinine,1.2,mg/dL,Final
447,2026-09-06,Creatinine,2.0,mg/dL,Prelim
449,2026-09-06,Creatinine,2.2,mg/dL,Corrected
425,2026-09-07,Creatinine,1.1,mg/dL,Final
438,2026-09-07,Cholesterol,149,mg/dL,Corrected
439,2026-09-07,Creatinine,2.3,mg/dL,Final
448,2026-09-07,Glucose,76,mg/dL,Final
456,2026-09-07,Cholesterol,192,mg/dL,Corrected
457,2026-09-07,Creatinine,2.0,mg/dL,Final
405,2026-09-08,Sodium,133,mmol/L,Final
434,2026-09-08,Sodium,140,mmol/L,Final
438,2026-09-08,HbA1c,10.5,%,Final
451,2026-09-08,Cholesterol,168,mg/dL,Final
459,2026-09-08,HbA1c,8.5,%,Final
428,2026-09-09,Glucose,74,mg/dL,Final
428,2026-09-09,Cholesterol,168,mg/dL,Prelim
430,2026-09-09,Glu,73,mg/dL,Prelim
432,2026-09-09,Glucose,232,mg/dL,Prelim
433,2026-09-09,Sodium,132,mmol/L,Prelim
438,2026-09-09,Sodium,135,mmol/L,Corrected
438,2026-09-09,Glucose,193,mg/dL,Final
442,2026-09-09,Glucose,122,mg/dL,Final
449,2026-09-09,HbA1c,9.3,%,Corrected
455,2026-09-09,Cholesterol,147,mg/dL,Final
456,2026-09-09,Glu,201,mg/dL,Prelim
405,2026-09-10,Sodium,140,mmol/L,Prelim
407,2026-09-10,Cholesterol,195,mg/dL,Final
421,2026-09-10,Cholesterol,186,mg/dL,Corrected
422,2026-09-10,Glucose,106,mg/dL,Final
448,2026-09-10,Cholesterol,195,mg/dL,Corrected
458,2026-09-10,HbA1c,7.8,%,Final
408,2026-09-11,HbA1c,8.6,%,Final
409,2026-09-11,Cholesterol,184,mg/dL,Final
416,2026-09-11,Sodium,131,mmol/L,Prelim
431,2026-09-11,Sodium,129,mmol/L,Final
450,2026-09-11,Creatinine,1.2,mg/dL,Final
457,2026-09-11,Sodium,146,mmol/L,Final
418,2026-09-12,Glucose,84,mg/dL,Corrected
419,2026-09-12,Cholesterol,219,mg/dL,Prelim
429,2026-09-12,HbA1c,10.5,%,Final
447,2026-09-12,Cholesterol,217,mg/dL,Prelim
452,2026-09-12,Sodium,148,mmol/L,Final
456,2026-09-12,Creatinine,0.7,mg/dL,Final
412,2026-09-13,Sodium,130,mmol/L,Final
426,2026-09-13,HbA1c,7.4,%,Final
429,2026-09-13,Sodium,136,mmol/L,Final
438,2026-09-13,Cholesterol,207,mg/dL,Prelim
449,2026-09-13,Sodium,148,mmol/L,Final
401,2026-09-14,Sodium,145,mmol/L,Final
403,2026-09-14,Glucose,142,mg/dL,Prelim
407,2026-09-14,HbA1c,9.9,%,Final
414,2026-09-14,Glucose,240,mg/dL,Final
415,2026-09-14,Glu,136,mg/dL,Final
425,2026-09-14,Glucose,222,mg/dL,Final
428,2026-09-14,Cholesterol,263,mg/dL,Final
432,2026-09-14,HbA1c,8.0,%,Final
433,2026-09-14,HbA1c,11.0,%,Final
459,2026-09-14,HbA1c,9.0,%,Prelim
403,2026-09-15,Sodium,148,mmol/L,Corrected
403,2026-09-15,Cholesterol,160,mg/dL,Final
411,2026-09-15,Cholesterol,151,mg/dL,Final
417,2026-09-15,Sodium,147,mmol/L,Final
418,2026-09-15,Sodium,148,mmol/L,Final
426,2026-09-15,Creatinine,2.2,mg/dL,Corrected
431,2026-09-15,Creatinine,1.9,mg/dL,Prelim
438,2026-09-15,Cholesterol,144,mg/dL,Corrected
445,2026-09-15,HbA1c,5.9,%,Corrected
454,2026-09-15,Glucose,201,mg/dL,Corrected
416,2026-09-16,Cholesterol,222,mg/dL,Final
418,2026-09-16,Glucose,138,mg/dL,Final
420,2026-09-16,Glucose,98,mg/dL,Prelim
429,2026-09-16,HbA1c,9.2,%,Prelim
452,2026-09-16,Sodium,143,mmol/L,Final
460,2026-09-16,Glucose,140,mg/dL,Final
408,2026-09-17,Glucose,255,mg/dL,Final
409,2026-09-17,HbA1c,8.7,%,Final
430,2026-09-17,Creatinine,1.0,mg/dL,Prelim
439,2026-09-17,HbA1c,9.0,%,Final
442,2026-09-17,Sodium,137,mmol/L,Corrected
446,2026-09-17,Glu,122,mg/dL,Final
403,2026-09-18,Cholesterol,217,mg/dL,Final
418,2026-09-18,Cholesterol,150,mg/dL,Final
421,2026-09-18,Glu,113,mg/dL,Corrected
423,2026-09-18,Glucose,126,mg/dL,Final
428,2026-09-18,Creatinine,1.3,mg/dL,Final
430,2026-09-18,Sodium,145,mmol/L,Corrected
442,2026-09-18,Glu,164,mg/dL,Corrected
450,2026-09-18,Glu,88,mg/dL,Prelim
417,2026-09-19,Glucose,243,mg/dL,Corrected
443,2026-09-19,Cholesterol,219,mg/dL,Final
445,2026-09-19,Glucose,127,mg/dL,Corrected
450,2026-09-19,Glu,187,mg/dL,Final
453,2026-09-19,HbA1c,5.6,%,Corrected
453,2026-09-19,Creatinine,1.6,mg/dL,Final
420,2026-09-20,Glucose,151,mg/dL,Prelim
430,2026-09-20,HbA1c,5.3,%,Prelim
442,2026-09-20,Creatinine,1.0,mg/dL,Final
406,2026-09-21,Cholesterol,145,mg/dL,Prelim
417,2026-09-21,Sodium,134,mmol/L,Prelim
432,2026-09-21,glucose,239,mg/dL,Prelim
441,2026-09-21,Creatinine,1.3,mg/dL,Corrected
404,2026-09-22,Glucose,255,mg/dL,Final
423,2026-09-22,Sodium,130,mmol/L,Corrected
436,2026-09-22,Glu,70,mg/dL,Corrected
440,2026-09-22,glucose,73,mg/dL,Final
446,2026-09-22,Creatinine,1.9,mg/dL,Final
406,2026-09-23,HbA1c,6.3,%,Final
408,2026-09-23,Glu,187,mg/dL,Final
426,2026-09-23,HbA1c,7.3,%,Final
430,2026-09-23,Glucose,213,mg/dL,Prelim
435,2026-09-23,Cholesterol,185,mg/dL,Corrected
441,2026-09-23,Creatinine,1.9,mg/dL,Corrected
454,2026-09-23,Glucose,214,mg/dL,Prelim
401,2026-09-24,Cholesterol,250,mg/dL,Final
410,2026-09-24,Cholesterol,219,mg/dL,Corrected
411,2026-09-24,Glu,83,mg/dL,Final
417,2026-09-24,Creatinine,1.8,mg/dL,Prelim
430,2026-09-24,Cholesterol,141,mg/dL,Corrected
460,2026-09-24,glucose,231,mg/dL,Corrected
428,2026-09-25,Glucose,163,mg/dL,Final
433,2026-09-25,HbA1c,11.0,%,Final
437,2026-09-25,Cholesterol,275,mg/dL,Corrected
439,2026-09-26,Creatinine,2.3,mg/dL,Final
440,2026-09-27,Sodium,139,mmol/L,Final
444,2026-09-27,Glu,165,mg/dL,Final
447,2026-09-27,Sodium,144,mmol/L,Prelim
453,2026-09-27,Sodium,135,mmol/L,Final
459,2026-09-27,Creatinine,1.4,mg/dL,Prelim
403,2026-09-28,Cholesterol,214,mg/dL,Final
404,2026-09-28,HbA1c,11.1,%,Final
409,2026-09-28,Cholesterol,285,mg/dL,Corrected
409,2026-09-28,Glucose,134,mg/dL,Prelim
418,2026-09-28,Sodium,131,mmol/L,Prelim
435,2026-09-28,Creatinine,1.9,mg/dL,Final
436,2026-09-28,Glu,233,mg/dL,Final
EOF_LABS
cat > "$W/data/clinic_logs.txt" <<'EOF_LOGS'
[INFO] 2026-09-14 06:19 - Routine equipment check completed
[INFO] 2026-09-14 06:48 - Blood test results ready for PatientID 416
[ERROR] 2026-09-14 07:07 - Failed to update patient records for PatientID 432
[ERROR] 2026-09-14 07:26 - System timeout while accessing patient records
[ERROR] 2026-09-14 07:35 - Failed to retrieve lab results for PatientID 445
[INFO] 2026-09-14 07:58 - Routine equipment check completed
[INFO] 2026-09-14 08:26 - Medication administered to PatientID 425
[ERROR] 2026-09-14 08:36 - Database connection lost
[WARNING] 2026-09-14 08:58 - Irregular heartbeat detected for PatientID 458
[WARNING] 2026-09-14 09:23 - Irregular heartbeat detected for PatientID 405
[ERROR] 2026-09-14 09:45 - System timeout while accessing patient records
[WARNING] 2026-09-14 10:10 - Low oxygen levels detected in Ward C
[INFO] 2026-09-14 10:30 - Medication administered to PatientID 435
[INFO] 2026-09-14 10:59 - Successful data backup completed
[INFO] 2026-09-14 11:15 - Pharmacy inventory update completed
[WARNING] 2026-09-14 11:38 - Irregular heartbeat detected for PatientID 415
[WARNING] 2026-09-14 11:52 - Low oxygen levels detected in Ward B
[INFO] 2026-09-14 12:07 - Pharmacy inventory update completed
[WARNING] 2026-09-14 12:36 - Delayed response from lab system
[INFO] 2026-09-14 12:46 - Patient admitted to Ward B
[INFO] 2026-09-14 13:02 - Routine equipment check completed
[INFO] 2026-09-14 13:27 - Nurse shift change completed
[INFO] 2026-09-14 13:52 - Routine equipment check completed
[ERROR] 2026-09-14 14:08 - Failed to retrieve lab results for PatientID 406
[ERROR] 2026-09-14 14:31 - System timeout while accessing patient records
[INFO] 2026-09-14 15:00 - Medication administered to PatientID 413
[INFO] 2026-09-14 15:11 - Medication administered to PatientID 448
[INFO] 2026-09-14 15:29 - PatientID 401 discharged
[INFO] 2026-09-14 15:42 - Patient admitted to Ward B
[INFO] 2026-09-14 15:54 - Routine equipment check completed
[INFO] 2026-09-14 16:03 - Nurse shift change completed
[INFO] 2026-09-14 16:14 - Medication administered to PatientID 438
[INFO] 2026-09-14 16:41 - Successful data backup completed
[WARNING] 2026-09-14 17:10 - Irregular heartbeat detected for PatientID 426
[INFO] 2026-09-14 17:31 - Nurse shift change completed
[INFO] 2026-09-14 17:41 - Patient admitted to Ward A
[INFO] 2026-09-14 18:08 - Routine equipment check completed
[ERROR] 2026-09-14 18:34 - Analyzer calibration failed in Lab B
[INFO] 2026-09-14 18:57 - Routine equipment check completed
[INFO] 2026-09-14 19:04 - Pharmacy inventory update completed
[WARNING] 2026-09-14 19:21 - Refrigerator temperature above range in Lab C
[ERROR] 2026-09-14 19:30 - Analyzer calibration failed in Lab C
[INFO] 2026-09-14 19:53 - PatientID 451 discharged
[WARNING] 2026-09-14 20:20 - Delayed response from lab system
[WARNING] 2026-09-14 20:39 - Low oxygen levels detected in Ward C
[ERROR] 2026-09-14 20:58 - Analyzer calibration failed in Lab C
[ERROR] 2026-09-14 21:26 - Database connection lost
[ERROR] 2026-09-14 21:39 - Label printer offline in Lab A
[INFO] 2026-09-14 21:54 - Successful data backup completed
[WARNING] 2026-09-14 22:14 - Irregular heartbeat detected for PatientID 454
[INFO] 2026-09-14 22:30 - Pharmacy inventory update completed
[INFO] 2026-09-14 22:44 - Nurse shift change completed
[INFO] 2026-09-14 22:58 - Nurse shift change completed
[WARNING] 2026-09-14 23:08 - Refrigerator temperature above range in Lab B
[WARNING] 2026-09-14 23:33 - High blood pressure detected in PatientID 451
[ERROR] 2026-09-14 23:40 - Analyzer calibration failed in Lab A
[ERROR] 2026-09-14 23:50 - Analyzer calibration failed in Lab C
[INFO] 2026-09-15 00:15 - PatientID 456 discharged
[WARNING] 2026-09-15 00:32 - High blood pressure detected in PatientID 455
[WARNING] 2026-09-15 00:59 - High blood pressure detected in PatientID 453
EOF_LOGS
cat > "$W/data/gene_panel.txt" <<'EOF_GENES'
Gene,Sequence
TP53,ATGGAGGAGCCGCAGTCAGATCCT
BRCA2,GAAGTTGCCGTACTAAATTATGAC
EGFR,ATGGGGATCTTCCCGCAAATAGGG
KRAS,GTCGCAATCGCATCTAATTACCAC
MYC,TAGATTCAAGTCTGCATATAATCA
PTEN,ATGCGTTGAGAACGTCCAGACTTG
ATM,CTCACTTATGTCGGACATTATTGG
APC,ATGTATTGGATCGCGATAGTAAGA
VHL,TATAGCGCACTGGACAACACCGTG
RB1,AAGACGACCCTGCTGCGTCGTGAT
ALK,CCGTTAAGTTCTGCGAGTATATAT
BRAF,ATGTATTGATATAGCCATAATTCG
JAK2,ATGGGTTGGACCACAGGAAAATAG
KIT,ACACTATACGATATAACCAGTATA
RET,CCGACCCATCCCAGACTATACTGA
MET,TCCCGAACCAGAATACGGCTGGAT
NRAS,ATTTACAAAGCAGTCTGCGTCGTG
IDH1,GGATTGATAGCAACGTTATACCCC
CDH1,GGCTATGAAACACATGCGCAGGGT
SMAD4,CTGACATTACTAGTCCCATATATA
ERBB2,ATGCACTATAGCGCCCAGCTACTC
FGFR3,CAAACGAATGTACGACAAACAACC
NOTCH1,ATGTAACAGTATCGAGCTGACGGG
PIK3CA,TCAAAGTTTCACCCTAATATGATA
CHEK2,ATGCTAGCCGCCCGTCTAACTCCG
MLH1,ATGCTATATGTGACGCGGCAGTGC
MSH2,AGACAACTAGCGACGGCCTCGGAG
PALB2,CCTGCCTTTGCTATAAAAGCATCT
STK11,ATGGCTCTGTCCATCGATTACATG
CDKN2A,CGGACTGATCTTTACTGTAACTCA
TP53,ATGGAGGAGCCGCAGTCAGATCAT
EOF_GENES
echo "Practice Assignment 4 workspace is ready in contents/module4/practice"
echo "Spot check (expect 61, 481, 60 and 32 lines):"
wc -l "$W/data/clinic_patients.txt" "$W/data/lab_results.csv" "$W/data/clinic_logs.txt" "$W/data/gene_panel.txt" | sed "s|$W/||"
