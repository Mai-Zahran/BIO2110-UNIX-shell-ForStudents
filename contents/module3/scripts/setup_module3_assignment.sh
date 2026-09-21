#!/usr/bin/env bash
#
# setup_module3_assignment.sh
# BIO 2110 - Module 3, Practice Assignment 3
#
# Builds the workspace for the ungraded practice assignment, in Google
# Cloud Shell.
#
# The assignment page has students cd into this scripts/ folder and run
#   ./setup_module3_assignment.sh
# so paths are anchored to THIS SCRIPT's location rather than to the
# working directory.
#
# The data here is deliberately NOT the same as the lab's data. An answer
# a student remembers from Lab Activity 3 will be wrong here, which is the
# point of a practice assignment.
#
# Safe to run again. It regenerates labs.csv and never touches outputs/.

set -u

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
MODULE_DIR="$( cd "$SCRIPT_DIR/.." && pwd )"
BASE="$MODULE_DIR/practice"

echo "Setting up Practice Assignment 3 in:"
echo "  $BASE"
echo

mkdir -p "$BASE/outputs"
[ -f "$BASE/outputs/.gitkeep" ] || : > "$BASE/outputs/.gitkeep"

TESTS=("Glucose" "HbA1c" "Lipid Panel" "LDL" "Creatinine" "Glucose" "HDL" "Hemoglobin")

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
        "Glucose")     echo $(( 64  + (i * 23) % 152 )) ;;
        "HbA1c")       echo $(( 4   + (i * 5)  % 7   )) ;;
        "Lipid Panel") echo $(( 118 + (i * 29) % 168 )) ;;
        "LDL")         echo $(( 48  + (i * 31) % 172 )) ;;
        "Creatinine")  echo $(( 54  + (i * 19) % 142 )) ;;
        "HDL")         echo $(( 31  + (i * 13) % 54  )) ;;
        "Hemoglobin")  echo $(( 8   + (i * 11) % 11  )) ;;
    esac
}

{
    echo "patient_id,test_date,test_name,result_value,result_status"
    i=0
    while [ "$i" -lt 72 ]; do
        pid=$(printf "P%03d" $(( 101 + (i % 29) )))
        day=$(( (i * 5) % 28 + 1 ))
        t="${TESTS[$(( i % 8 ))]}"
        v=$( value_for "$t" "$i" )
        s=$( status_for "$t" "$v" )
        printf "%s,2026-04-%02d,%s,%d,%s\n" "$pid" "$day" "$t" "$v" "$s"
        i=$(( i + 1 ))
    done
} > "$BASE/labs.csv"

echo "Done."
echo
echo "  labs.csv   $(wc -l < "$BASE/labs.csv") lines, including the header row"
echo "  outputs/   save your task results here"
echo
echo "Spot check, so you know the data loaded correctly:"
echo "  labs.csv should have 73 lines (72 results plus a header)"
echo "  it actually has: $(wc -l < "$BASE/labs.csv")"
echo
echo "If those two numbers do not match, run this script again before you start."
