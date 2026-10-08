# all_alerts.sh
# Purpose: collect the ALERT lines from three daily logs in one report.

# 1. Start with an empty report
> output/all_alerts.txt

# 2. Add the alert lines from each day
for file in raw/day1.log raw/day2.log raw/day3.log
do
  grep "ALERT" "$file" >> output/all_alerts.txt
done

# 3. Verify the report
wc -l output/all_alerts.txt
