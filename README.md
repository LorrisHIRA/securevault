#  Secure Vault Challenge

This project is part of a cybersecurity training exercise.  
We build a **Secure Vault System** in Linux that can safely store secrets, control file access, allow secure updates, and monitor security risks.

---

## Project Structure

- `vault_setup.sh` → Creates the vault (`secure_vault` folder) with `keys.txt`, `secrets.txt`, and `logs.txt`.  
- `vault_permissions.sh` → Manages file permissions interactively, with defaults for security.  
- `vault_ops.sh` → Provides a menu system to add/update secrets, add logs, and restrict access to keys.  
- `vault_monitor.sh` → Scans vault files, reports size, last modified date, permissions, and detects security risks.  
- `vault_report.txt` → Generated report containing file information and warnings.

---

