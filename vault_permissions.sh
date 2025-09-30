#!/usr/bin/env bash

set -euo pipefail

VAULT_DIR="$HOME/secure_vault"

if [ ! -d "$VAULT_DIR" ]; then
  echo "Error: secure_vault does not exist in your home directory. Run vault_setup.sh first."
  exit 1
fi

declare -A DEFAULTS
DEFAULTS[keys.txt]=600
DEFAULTS[secrets.txt]=640
DEFAULTS[logs.txt]=644

update_permission() {
  local file="$1"
  local default_perm="$2"
  local fullpath="$VAULT_DIR/$file"

  echo
  echo "Current permissions for $file:"
  ls -l "$fullpath"

  
  read -r -p "Do you want to update permissions for $file? (y/n) [Press Enter => apply default $default_perm]: " answer

  if [ -z "$answer" ]; then
    
    chmod "$default_perm" "$fullpath"
    echo "Default permission $default_perm applied to $file."
    return
  fi


  answer_lc=$(echo "$answer" | tr '[:upper:]' '[:lower:]')

  if [[ "$answer_lc" =~ ^(y|yes)$ ]]; then
    read -r -p "Enter new permission for $file (e.g. 600): " newperm
    if [ -z "$newperm" ]; then
      echo "No permission entered. Leaving as-is."
    else
      
      if [[ "$newperm" =~ ^[0-7]{3,4}$ ]]; then
        chmod "$newperm" "$fullpath"
        echo "Permission $newperm applied to $file."
      else
        echo "Invalid permission format. Leaving as-is."
      fi
    fi
  else
    echo "Leaving permissions for $file unchanged."
  fi
}


for fname in keys.txt secrets.txt logs.txt; do
  update_permission "$fname" "${DEFAULTS[$fname]}"
done

echo
echo "Final permissions for secure_vault files:"
ls -l "$VAULT_DIR"



