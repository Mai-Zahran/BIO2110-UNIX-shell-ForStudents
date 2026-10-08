# report_one_day.sh
# Purpose: save the ALERT lines from the day 1 log in a report.
# Run it from the folder that contains raw/ and output/.

echo "Starting report"

# 1. Extract the alert lines
grep "ALERT" raw/day1.log > output/day1_alerts.txt

# 2. Verify the report
wc -l output/day1_alerts.txt

echo "Finished"
