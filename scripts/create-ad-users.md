
# Active Directory User Creation Script

## Purpose 
This script automates the cration of Active direcotry user accounts from a CSV file.
It is intended to simulate etnerprise onboarding workflows and reduce repetitive administrative tasks.

---

## Script Overview
- Creates multiple AD users in a single run
- Assigns users to the **user-accounts** organizational unit (OU)
- Enables accounts on creation
- Forces password change at first logon

## Evidence

### 1. PowerShell User Creation Script

<img
  src="https://github.com/user-attachments/assets/8bc5180d-36fb-4594-bbd1-3b0024eba66a"
  alt="PowerShell script for Active Directory user creation"
  width="600"
/>

*PowerShell script used to automate Active Directory user creation by importing user data from a CSV file.
The script creates accounts in the user-accounts organizational unit, enables them on creation, and enforces a password change at first logon.*


