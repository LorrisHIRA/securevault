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
  echo "-----------
