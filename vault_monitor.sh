#!/bin/bash


VAULT_DIR="$HOME/secure_vault"
REPORT="$VAULT_DIR/vault_report.txt"

{
  echo "Vault Security Report - $(date)"
  echo "----------------------------------"
  for file in "$VAULT_DIR"/*; do
    name=$(basename "$file")
    size=$(stat -c%s "$file")
    modified=$(stat -c%y "$file")
    perms=$(stat -c%A "$file")

    echo "File: $name"
    echo "Size: $size bytes"
    echo "Last Modified: $modified"
    echo "Permissions: $perms"

    # Detect security risk
    permnum=$(stat -c%a "$file")
    if [ "$permnum" -gt 644 ]; then
      echo "SECURITY RISK DETECTED"
    fi
    echo "------------------------------"
  done
} > "$REPORT"

echo " Report created at $REPORT"


