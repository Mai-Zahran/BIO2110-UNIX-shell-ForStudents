# report_any_day.sh
# Purpose: count the ALERT lines in the log file named on the command line.
# Example: bash scripts/report_any_day.sh raw/day2.log

INPUT="$1"

echo "Alert lines in $INPUT:"
grep "ALERT" "$INPUT" | wc -l
