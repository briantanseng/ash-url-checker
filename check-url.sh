#!/bin/sh
INPUT="/app/input/data.txt"
OUTPUT="/app/output/results.csv"

COUNTER=0
while IFS= read -r URL 
do
    COUNTER=$(expr $COUNTER + 1)
    echo "$(date),$URL,$(curl -I $URL 2>/dev/null | head -n 1 | cut -d$' ' -f2)" >> $OUTPUT
done < "$INPUT"
echo "$(date)"
echo "Total lines read: $COUNTER"
