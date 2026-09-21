#!/usr/bin/env bash
#
# setup_module3_lab_activity.sh
# BIO 2110 - Module 3 (grep and basic regular expressions)
#
# Builds the workspace used by Lab Activity 3, in Google Cloud Shell.
#
# The lab page invokes this from the repository root as
#   ./contents/module3/scripts/setup_module3_lab_activity.sh
# so every path below is anchored to THIS SCRIPT's location, never to the
# directory the student happens to be standing in.
#
# Safe to run again: it regenerates the data files, and never touches
# anything the student created in outputs/ or practice/.

set -u

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
MODULE_DIR="$( cd "$SCRIPT_DIR/.." && pwd )"
BASE="$MODULE_DIR/lab_activity3"

echo "Setting up Lab Activity 3 in:"
echo "  $BASE"
echo

mkdir -p "$BASE"/{clinical,bio,logs,outputs,practice}
[ -f "$BASE/outputs/.gitkeep" ]  || : > "$BASE/outputs/.gitkeep"
[ -f "$BASE/practice/.gitkeep" ] || : > "$BASE/practice/.gitkeep"

# ---------------------------------------------------------------------------
# clinical/labs.csv
# patient_id,test_date,test_name,result_value,result_status
#
# result_status is the LAST field on purpose: the lab anchors patterns to the
# end of the line with $, and that only teaches anything if the status really
# is what the line ends with.
# ---------------------------------------------------------------------------
TESTS=("Glucose" "HbA1c" "Lipid Panel" "LDL" "HDL" "Creatinine" "Hemoglobin" "Glucose")

status_for () {
    local t="$1" v="$2"
    case "$t" in
        "Glucose")     [ "$v" -ge 200 ] && echo Critical && return
                       { [ "$v" -lt 70 ] || [ "$v" -gt 140 ]; } && echo Abnormal && return ;;
        "HbA1c")       [ "$v" -ge 9 ]   && echo Critical && return
                       [ "$v" -gt 6 ]   && echo Abnormal && return ;;
        "Lipid Panel") [ "$v" -ge 260 ] && echo Critical && return
                       [ "$v" -gt 200 ] && echo Abnormal && return ;;
        "LDL")         [ "$v" -ge 200 ] && echo Critical && return
                       [ "$v" -gt 160 ] && echo Abnormal && return ;;
        "HDL")         [ "$v" -lt 40 ]  && echo Abnormal && return ;;
        "Creatinine")  [ "$v" -ge 180 ] && echo Critical && return
                       { [ "$v" -lt 60 ] || [ "$v" -gt 130 ]; } && echo Abnormal && return ;;
        "Hemoglobin")  [ "$v" -lt 9 ]   && echo Critical && return
                       { [ "$v" -lt 12 ] || [ "$v" -gt 17 ]; } && echo Abnormal && return ;;
    esac
    echo Normal
}

value_for () {
    local t="$1" i="$2"
    case "$t" in
        "Glucose")     echo $(( 62  + (i * 17) % 155 )) ;;
        "HbA1c")       echo $(( 4   + (i * 3)  % 7   )) ;;
        "Lipid Panel") echo $(( 120 + (i * 23) % 165 )) ;;
        "LDL")         echo $(( 45  + (i * 19) % 175 )) ;;
        "HDL")         echo $(( 30  + (i * 11) % 55  )) ;;
        "Creatinine")  echo $(( 52  + (i * 13) % 140 )) ;;
        "Hemoglobin")  echo $(( 8   + (i * 7)  % 11  )) ;;
    esac
}

{
    echo "patient_id,test_date,test_name,result_value,result_status"
    i=0
    while [ "$i" -lt 60 ]; do
        pid=$(printf "P%03d" $(( 1 + (i % 23) )))
        day=$(( (i * 3) % 28 + 1 ))
        t="${TESTS[$(( i % 8 ))]}"
        v=$( value_for "$t" "$i" )
        s=$( status_for "$t" "$v" )
        printf "%s,2026-03-%02d,%s,%d,%s\n" "$pid" "$day" "$t" "$v" "$s"
        i=$(( i + 1 ))
    done
    # one lower-case spelling, so `grep 'Glucose'` and `grep -i 'glucose'`
    # genuinely disagree and the -i lesson has something to find
    echo "P024,2026-03-29,glucose,143,Abnormal"
} > "$BASE/clinical/labs.csv"

# ---------------------------------------------------------------------------
# clinical/visits.csv
# patient_id,visit_date,department,provider,visit_type,visit_status
# ---------------------------------------------------------------------------
DEPTS=("Cardiology" "Neurology" "Endocrinology" "Cardiology" "Nephrology" "Neurology")
PROVIDERS=("okonkwo" "ramirez" "chen" "delacruz" "nakamura")
VTYPES=("NEW" "FOLLOWUP" "URGENT" "FOLLOWUP" "TELEHEALTH")
VSTATUS=("Completed" "Completed" "Cancelled" "Completed" "NoShow")

{
    echo "patient_id,visit_date,department,provider,visit_type,visit_status"
    i=0
    while [ "$i" -lt 48 ]; do
        pid=$(printf "P%03d" $(( 1 + (i % 23) )))
        day=$(( (i * 5) % 28 + 1 ))
        printf "%s,2026-03-%02d,%s,%s,%s,%s\n" \
            "$pid" "$day" \
            "${DEPTS[$(( i % 6 ))]}" \
            "${PROVIDERS[$(( i % 5 ))]}" \
            "${VTYPES[$(( i % 5 ))]}" \
            "${VSTATUS[$(( i % 4 ))]}"
        i=$(( i + 1 ))
    done
} > "$BASE/clinical/visits.csv"

# ---------------------------------------------------------------------------
# clinical/patients.csv
#
# ONE COLUMN on purpose. The lab anchors patterns with ^ and $ against whole
# lines (^P[0-9]{3}$), and that only works if the id IS the whole line. A
# multi-column CSV would make every one of those drills return nothing.
#
# The list deliberately mixes well-formed ids with near misses, so the
# anchored patterns actually separate things, and two entries start with a
# digit so that ^[0-9] and ^[^0-9] both find something.
# ---------------------------------------------------------------------------
cat > "$BASE/clinical/patients.csv" <<'PATIENTS'
patient_id
P001
P002
P003
P004
P005
P006
P007
P008
P009
P010
P011
P012
P013
P014
P015
P016
P017
P018
P019
P020
P021
P022
P023
P0007
P9999
P9999999
P07
P7
PATIENT001
p001
0007P
12345
P001A
PATIENTS

# ---------------------------------------------------------------------------
# clinical/vitals.csv
#
# The measure column holds BP as a word of its own, so that grep -w 'BP'
# and plain grep 'BP' give different answers (BPM and BPSYS are the foils).
# ---------------------------------------------------------------------------
{
    echo "patient_id,measured_on,measure,reading,units"
    i=0
    MEASURES=("BP" "BPM" "TEMP" "BP" "SPO2" "BPSYS" "BP" "RESP")
    while [ "$i" -lt 40 ]; do
        pid=$(printf "P%03d" $(( 1 + (i % 23) )))
        day=$(( (i * 7) % 28 + 1 ))
        m="${MEASURES[$(( i % 8 ))]}"
        case "$m" in
            BP)    r="$(( 104 + (i * 3) % 50 ))/$(( 64 + (i * 2) % 32 ))"; u="mmHg" ;;
            BPSYS) r="$(( 104 + (i * 5) % 50 ))";                          u="mmHg" ;;
            BPM)   r="$(( 54 + (i * 3) % 46 ))";                           u="beats/min" ;;
            TEMP)  r="3$(( 6 + i % 3 )).$(( i % 10 ))";                    u="C" ;;
            SPO2)  r="$(( 92 + i % 8 ))";                                  u="%" ;;
            RESP)  r="$(( 12 + i % 9 ))";                                  u="breaths/min" ;;
        esac
        printf "%s,2026-03-%02d,%s,%s,%s\n" "$pid" "$day" "$m" "$r" "$u"
        i=$(( i + 1 ))
    done
} > "$BASE/clinical/vitals.csv"
echo "  clinical/ built"

# ---------------------------------------------------------------------------
# bio/
#
# Lab Activity 3 as currently written never opens these files. They are here
# because the lab's verification step runs `ls -F contents/module3/lab_activity3`
# and tells students to expect a bio/ folder, and because the regex activities
# are easy to extend onto sequence data if you want them.
# ---------------------------------------------------------------------------
cat > "$BASE/bio/sequences.txt" <<'SEQS'
BRCA1_exon11    ATGGCTAGCTAGGTACGTAGCCTAGGATCCGTACGTAGCTAGCTAGGCATCGATCGTAGC
BRCA1_promoter  TATATATAGCGCGCGATCGGCTAGCTAGCTAGGTACGTAGCTTACGGATCCGATCGATCG
BRCA2_exon3     GGCATCGATCGATCGTAGCTAGCTAGCATCGGCTAGCTAGCTAGCATCGATCGATCGTAG
TP53_promoter   TATATATATAGGCGCGGCTAGCTAGCATCGATCGGCTAGCTAGCATCGATCGGCTAGCTA
TCF7L2_intron2  CTAGCTAGCATCGATCGGCTAGCTAGCATCGATCGATCGGCTAGCTAGCATCGATCGATC
LDLR_exon4      GCTAGCTAGCATCGGTACGTAGCATCGATCGATCGGCTAGCTAGCATCGATCGATCGGCT
MYC_enhancer    TATATATATATAGGCGCGCGGCTAGCTAGCATCGATCGGCTAGCTAGCATCGATCGATCG
EGFR_exon19     GGCTAGCTAGCATCGATCGATCGGTACGTAGCATCGATCGGCTAGCTAGCATCGATCGAT
SEQS

cat > "$BASE/bio/gene_panel.tsv" <<'PANEL'
gene	chromosome	condition	inheritance
BRCA1	chr17	Hereditary breast and ovarian cancer	autosomal dominant
BRCA2	chr13	Hereditary breast and ovarian cancer	autosomal dominant
TP53	chr17	Li-Fraumeni syndrome	autosomal dominant
LDLR	chr19	Familial hypercholesterolemia	autosomal dominant
TCF7L2	chr10	Type 2 diabetes susceptibility	complex
UMOD	chr16	Autosomal dominant tubulointerstitial kidney disease	autosomal dominant
APOE	chr19	Late onset Alzheimer disease risk	complex
EGFR	chr7	Non small cell lung cancer, somatic	somatic
PANEL

# ---------------------------------------------------------------------------
# logs/
#
# Same note as bio/: the lab expects the folder to exist. These files also
# give Activity 5 somewhere realistic to practise capturing errors from.
# ---------------------------------------------------------------------------
cat > "$BASE/logs/import.log" <<'IMPORTLOG'
2026-03-01 08:02:11 INFO  import started source=clinical/labs.csv
2026-03-01 08:02:12 INFO  47 rows read
2026-03-01 08:02:13 WARN  row 18 has an empty result_value, kept as NA
2026-03-01 08:02:14 Error parsing row 22: unexpected field count
2026-03-01 08:02:14 INFO  row 22 skipped
2026-03-01 08:02:15 WARN  patient_id p001 does not match the expected pattern
2026-03-01 08:02:16 INFO  import complete, 46 rows loaded
2026-03-02 08:00:09 INFO  import started source=clinical/visits.csv
2026-03-02 08:00:11 Error opening clinical/visits_2026_02.csv: No such file or directory
2026-03-02 08:00:11 INFO  continuing with the files that were found
2026-03-02 08:00:14 INFO  import complete, 48 rows loaded
2026-03-03 07:58:44 INFO  import started source=clinical/vitals.csv
2026-03-03 07:58:47 WARN  measure BPSYS is not in the controlled vocabulary
2026-03-03 07:58:49 INFO  import complete, 40 rows loaded
IMPORTLOG

cat > "$BASE/logs/access.log" <<'ACCESSLOG'
10.0.14.2 - - [01/Mar/2026:08:02:11] "GET /api/labs HTTP/1.1" 200 4821
10.0.14.9 - - [01/Mar/2026:08:02:44] "GET /api/patients/P001 HTTP/1.1" 200 331
10.0.14.9 - - [01/Mar/2026:08:03:02] "GET /api/patients/P0007 HTTP/1.1" 404 57
172.16.3.41 - - [01/Mar/2026:08:05:02] "POST /api/import HTTP/1.1" 500 212
192.168.1.77 - - [02/Mar/2026:08:19:55] "PUT /api/reports HTTP/1.1" 403 98
10.0.14.2 - - [03/Mar/2026:08:31:02] "GET /api/runs HTTP/1.1" 200 1812
ACCESSLOG
echo "  bio/ and logs/ built"

# ---------------------------------------------------------------------------
# Report and spot check.
# ---------------------------------------------------------------------------
echo
echo "Done. lab_activity3/ now contains:"
echo "  clinical/  $(ls -1 "$BASE/clinical" | wc -l) files"
echo "  bio/       $(ls -1 "$BASE/bio" | wc -l) files"
echo "  logs/      $(ls -1 "$BASE/logs" | wc -l) files"
echo "  outputs/   your saved results go here"
echo "  practice/  your practice copies go here"
echo
echo "Spot check, so you know the data loaded correctly:"
echo "  clinical/labs.csv should have 62 lines (61 results plus a header)"
echo "  it actually has: $(wc -l < "$BASE/clinical/labs.csv")"
echo
echo "If those two numbers do not match, run this script again before you"
echo "start the lab."
