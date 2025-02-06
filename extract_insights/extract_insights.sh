#!/bin/bash 

INPUT_FILE="raw_data/satelite_temperature_data.csv"
OUTPUT_DIR="extract_insights"

mkdir -p "$OUTPUT_DIR"

echo "Extracting top 10 highest temperatures..."
head -n 1 "$INPUT_FILE" > "$OUTPUT_DIR/highest_temp.csv" 
tail -n +2 "$INPUT_FILE" | sort -t',' -k2 -nr | head -10 >> "$OUTPUT_DIR/highest_temp.csv"

echo "Top 10 highest temperatures saved in '$OUTPUT_DIR/highest_temp.csv'"

COUNTRY="Burundi"
echo "Extracting data for $COUNTRY sorted by humidity..."
head -n 1 "$INPUT_FILE" > "$OUTPUT_DIR/humidity_data_${COUNTRY}.csv" 
grep "$COUNTRY" "$INPUT_FILE" | sort -t',' -k4 -nr >> "$OUTPUT_DIR/humidity_data_${COUNTRY}.csv"

echo "Humidity data for $COUNTRY saved in '$OUTPUT_DIR/humidity_data_${COUNTRY}.csv'"

