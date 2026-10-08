# overwrite_loop.sh
# Purpose: collect the ALERT lines from three daily logs in one report.

for file in raw/day1.log raw/day2.log raw/day3.log
do
  grep "ALERT" "$file" > output/all_alerts_overwrite.txt
done

echo "Report saved in output/all_alerts_overwrite.txt"
