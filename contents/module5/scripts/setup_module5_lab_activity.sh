#!/usr/bin/env bash
# setup_module5_lab_activity.sh
# Builds the workspace for Lab Activity 5 (Google Cloud Shell).
# Run from the repository root:
#   bash contents/module5/scripts/setup_module5_lab_activity.sh
# Safe to run again. It rebuilds raw/ and scripts/ and does not touch output/ or practice/.

set -eu
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODULE="$(cd "$HERE/.." && pwd)"
git -C "$MODULE" config core.fileMode false >/dev/null 2>&1 || true
WORK="$MODULE/lab_activity"

mkdir -p "$WORK/raw" "$WORK/scripts" "$WORK/output" "$WORK/practice"
rm -f "$WORK"/raw/*.log "$WORK"/scripts/*.sh

cat > "$WORK/raw/day1.log" <<'EOF_LOG'
2026-03-02 08:00 P014 heart_rate 82 OK
2026-03-02 08:05 P022 glucose 104 OK
2026-03-02 08:10 P031 oxygen 97 OK
2026-03-02 08:15 P014 glucose 251 ALERT
2026-03-02 08:20 P045 heart_rate 76 OK
2026-03-02 08:25 P022 oxygen 98 OK
2026-03-02 08:30 P031 heart_rate 88 OK
2026-03-02 08:35 P045 glucose 99 OK
2026-03-02 08:40 P014 oxygen 96 OK
2026-03-02 08:45 P031 heart_rate 131 ALERT
2026-03-02 08:50 P022 heart_rate 71 OK
2026-03-02 08:55 P045 oxygen 99 OK
EOF_LOG

cat > "$WORK/raw/day2.log" <<'EOF_LOG'
2026-03-03 08:00 P014 heart_rate 79 OK
2026-03-03 08:05 P022 oxygen 87 ALERT
2026-03-03 08:10 P031 glucose 110 OK
2026-03-03 08:15 P045 heart_rate 74 OK
2026-03-03 08:20 P014 glucose 118 OK
2026-03-03 08:25 P022 heart_rate 90 OK
2026-03-03 08:30 P031 oxygen 98 OK
2026-03-03 08:35 P045 glucose 262 ALERT
2026-03-03 08:40 P014 oxygen 97 OK
2026-03-03 08:45 P022 glucose 101 OK
2026-03-03 08:50 P031 heart_rate 84 OK
2026-03-03 08:55 P045 oxygen 98 OK
EOF_LOG

cat > "$WORK/raw/day3.log" <<'EOF_LOG'
2026-03-04 08:00 P014 glucose 108 OK
2026-03-04 08:05 P022 heart_rate 69 OK
2026-03-04 08:10 P031 heart_rate 136 ALERT
2026-03-04 08:15 P045 oxygen 97 OK
2026-03-04 08:20 P014 heart_rate 81 OK
2026-03-04 08:25 P022 glucose 97 OK
2026-03-04 08:30 P031 oxygen 96 OK
2026-03-04 08:35 P045 heart_rate 77 OK
2026-03-04 08:40 P014 oxygen 86 ALERT
2026-03-04 08:45 P022 oxygen 99 OK
2026-03-04 08:50 P031 glucose 112 OK
2026-03-04 08:55 P045 glucose 103 OK
EOF_LOG

cat > "$WORK/scripts/01_report_one_day.sh" <<'EOF_SCRIPT'
# 01_report_one_day.sh
# Purpose: save the ALERT lines from the day 1 log in a report.
# Run it from the folder that contains raw/ and output/.

echo "Starting report"

# 1. Extract the alert lines
grep "ALERT" raw/day1.log > output/day1_alerts.txt

# 2. Verify the report
wc -l output/day1_alerts.txt

echo "Finished"
EOF_SCRIPT

cat > "$WORK/scripts/02_report_variables.sh" <<'EOF_SCRIPT'
# 02_report_variables.sh
# Purpose: the same report, with the file names stored in variables.

INPUT="raw/day1.log"
OUTPUT="output/day1_variable_alerts.txt"

# 1. Extract the alert lines
grep "ALERT" "$INPUT" > "$OUTPUT"

# 2. Verify the report
wc -l "$OUTPUT"
EOF_SCRIPT

cat > "$WORK/scripts/03_loop_preview.sh" <<'EOF_SCRIPT'
# 03_loop_preview.sh
# Purpose: show the first 3 lines of each daily log.

for file in raw/day1.log raw/day2.log raw/day3.log
do
  echo "Checking $file"
  head -n 3 "$file"
done
EOF_SCRIPT

cat > "$WORK/scripts/buggy_alert_loop.sh" <<'EOF_SCRIPT'
# buggy_alert_loop.sh
# Purpose: collect the ALERT lines from three daily logs in one report.

for file in raw/day1.log raw/day2.log raw/day3.log
do
  grep "ALERT" "$file" > output/all_alerts_buggy.txt
done

echo "Report saved in output/all_alerts_buggy.txt"
EOF_SCRIPT

if [ ! -f "$WORK/output/README.txt" ]; then
  echo "Files created by your scripts are saved in this folder." > "$WORK/output/README.txt"
fi
if [ ! -f "$WORK/practice/README.txt" ]; then
  echo "Save your own copies of scripts in this folder." > "$WORK/practice/README.txt"
fi

echo "Module 5 lab_activity is ready in:"
echo "  $WORK"
echo "Spot check: the three logs have this many lines in total:"
cat "$WORK"/raw/day1.log "$WORK"/raw/day2.log "$WORK"/raw/day3.log | wc -l
