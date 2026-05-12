#!/bin/bash

total_errors=0
total_warnings=0

for file in "$1"/*.log
do
  errors=$(grep "ERROR" "$file" | wc -l)
  warnings=$(grep "WARNING" "$file" | wc -l)

  total_errors=$((total_errors + errors))
  total_warnings=$((total_warnings + warnings))

  echo "File: $(basename "$file") | Errors: $errors | Warnings: $warnings"
done

echo "----------------------"
echo "Total Errors: $total_errors"
echo "Total Warnings: $total_warnings"
