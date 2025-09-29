#!/bin/bash


VAULT_DIR="$HOME/secure_vault"
SECRETS="$VAULT_DIR/secrets.txt"
LOGS="$VAULT_DIR/logs.txt"
KEYS="$VAULT_DIR/keys.txt"

while true; do
  echo "----- Secure Vault Menu -----"
  echo "1) Add Secret"
  echo "2) Update Secret"
  echo "3) Add Log Entry"
  echo "4) Access Keys"
  echo "5) Exit"
  echo "-----------------------------"
  read -p "Choose an option: " choice

  case $choice in
    1)
      read -p "Enter new secret: " secret
      echo "$secret" >> "$SECRETS"
      echo " Secret added."
      ;;
    2)
      read -p "Enter secret to update: " old
      read -p "Enter new value: " new
      if grep -q "$old" "$SECRETS"; then
        sed -i "s/$old/$new/" "$SECRETS"
        echo " Secret updated."
      else
        echo "No match found."
      fi
      ;;
    3)
      entry="$(date): New log entry"
      echo "$entry" >> "$LOGS"
      echo " Log added."
      ;;
    4)
      echo "ACCESS DENIED "
      ;;
    5)
      echo " Exiting Secure Vault."
      break
      ;;
    *)
      echo " Invalid choice."
      ;;
  esac
done

