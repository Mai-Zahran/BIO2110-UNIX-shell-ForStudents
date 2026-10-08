# report_variables.sh
# Purpose: the same report, with the file names stored in variables.

INPUT="raw/day1.log"
OUTPUT="output/day1_variable_alerts.txt"

# 1. Extract the alert lines
grep "ALERT" "$INPUT" > "$OUTPUT"

# 2. Verify the report
wc -l "$OUTPUT"
