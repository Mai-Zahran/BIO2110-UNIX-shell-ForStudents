#!/usr/bin/env bash
# setup_module5_practice_assignment.sh
# Builds the workspace for Practice Assignment 5 (Google Cloud Shell).
# Run from the repository root:
#   bash contents/module5/scripts/setup_module5_practice_assignment.sh
# Safe to run again. It rebuilds raw/ and scripts/ and does not touch output/ or work/.

set -eu
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODULE="$(cd "$HERE/.." && pwd)"
git -C "$MODULE" config core.fileMode false >/dev/null 2>&1 || true
WORK="$MODULE/practice_assignment"

mkdir -p "$WORK/raw" "$WORK/scripts" "$WORK/output" "$WORK/work"
rm -f "$WORK"/raw/*.log "$WORK"/scripts/*.sh

cat > "$WORK/raw/day1.log" <<'EOF_LOG'
2026-03-09 09:00 P051 glucose 101 OK
2026-03-09 09:05 P063 heart_rate 128 ALERT
2026-03-09 09:10 P072 oxygen 98 OK
2026-03-09 09:15 P084 glucose 96 OK
2026-03-09 09:20 P051 heart_rate 80 OK
2026-03-09 09:25 P063 oxygen 88 ALERT
2026-03-09 09:30 P072 glucose 115 OK
2026-03-09 09:35 P084 heart_rate 73 OK
2026-03-09 09:40 P051 oxygen 97 OK
2026-03-09 09:45 P063 glucose 109 OK
2026-03-09 09:50 P072 heart_rate 86 OK
2026-03-09 09:55 P084 oxygen 99 OK
2026-03-09 10:00 P051 glucose 244 ALERT
2026-03-09 10:05 P072 oxygen 97 OK
EOF_LOG

cat > "$WORK/raw/day2.log" <<'EOF_LOG'
2026-03-10 09:00 P051 heart_rate 78 OK
2026-03-10 09:05 P063 glucose 105 OK
2026-03-10 09:10 P072 oxygen 98 OK
2026-03-10 09:15 P084 heart_rate 70 OK
2026-03-10 09:20 P051 glucose 112 OK
2026-03-10 09:25 P063 oxygen 96 OK
2026-03-10 09:30 P072 heart_rate 83 OK
2026-03-10 09:35 P084 glucose 258 ALERT
2026-03-10 09:40 P051 oxygen 98 OK
2026-03-10 09:45 P063 heart_rate 91 OK
2026-03-10 09:50 P072 glucose 100 OK
2026-03-10 09:55 P084 oxygen 97 OK
2026-03-10 10:00 P051 heart_rate 77 OK
2026-03-10 10:05 P063 glucose 98 OK
EOF_LOG

cat > "$WORK/raw/day3.log" <<'EOF_LOG'
2026-03-11 09:00 P051 oxygen 85 ALERT
2026-03-11 09:05 P063 heart_rate 89 OK
2026-03-11 09:10 P072 glucose 271 ALERT
2026-03-11 09:15 P084 oxygen 98 OK
2026-03-11 09:20 P051 glucose 107 OK
2026-03-11 09:25 P063 glucose 102 OK
2026-03-11 09:30 P072 heart_rate 134 ALERT
2026-03-11 09:35 P084 heart_rate 72 OK
2026-03-11 09:40 P051 heart_rate 79 OK
2026-03-11 09:45 P063 oxygen 97 OK
2026-03-11 09:50 P072 oxygen 96 OK
2026-03-11 09:55 P084 glucose 249 ALERT
2026-03-11 10:00 P051 oxygen 97 OK
2026-03-11 10:05 P063 heart_rate 85 OK
EOF_LOG

cat > "$WORK/scripts/starter_report.sh" <<'EOF_SCRIPT'
# starter_report.sh
# Purpose: save the ALERT lines from the day 1 log in a report.
# Run it from the folder that contains raw/ and output/.

echo "Starting report"

# 1. Extract the alert lines
grep "ALERT" raw/day1.log > output/day1_alerts.txt

# 2. Verify the report
wc -l output/day1_alerts.txt

echo "Finished"
EOF_SCRIPT

cat > "$WORK/scripts/variable_report.sh" <<'EOF_SCRIPT'
# variable_report.sh
# Purpose: save the ALERT lines from one daily log, with the file names stored in variables.

INPUT="raw/day1.log"
OUTPUT="output/day1_alerts.txt"

# 1. Extract the alert lines
grep "ALERT" "$INPUT" > "$OUTPUT"

# 2. Verify the report
wc -l "$OUTPUT"
EOF_SCRIPT

cat > "$WORK/scripts/loop_template.sh" <<'EOF_SCRIPT'
# loop_template.sh
# Purpose: print the ALERT lines from three daily logs.
# Replace the blank with the command that finds lines containing a word.

for file in raw/day1.log raw/day2.log raw/day3.log
do
  __________ "ALERT" "$file"
done
EOF_SCRIPT

if [ ! -f "$WORK/output/README.txt" ]; then
  echo "Files created by your scripts are saved in this folder." > "$WORK/output/README.txt"
fi
if [ ! -f "$WORK/work/README.txt" ]; then
  echo "Save your own copies of scripts in this folder." > "$WORK/work/README.txt"
fi

echo "Module 5 practice_assignment is ready in:"
echo "  $WORK"
echo "Spot check: the three logs have this many lines in total:"
cat "$WORK"/raw/day1.log "$WORK"/raw/day2.log "$WORK"/raw/day3.log | wc -l
