# loop_preview.sh
# Purpose: show the first 3 lines of each daily log.

for file in raw/day1.log raw/day2.log raw/day3.log
do
  echo "Checking $file"
  head -n 3 "$file"
done
