
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

### 2. Users Created in Active Directory

<img
  src="https://github.com/user-attachments/assets/9a8833a2-fa4f-427b-9aab-1d0ff0562f89"
  alt="Active Directory users created via PowerShell script"
  width="600"
/>

*Active Directory Users and Computers showing multiple user accounts successfully created in the user-accounts organizational unit using the PowerShell automation script.
This confirms that the script executed correctly and that users were provisioned according to domain standards.*

---

## PowerShell Script

```powershell
Import-Module ActiveDirectory

$users = Import-Csv ".\users.csv"

foreach ($User in $users) {

    $FullName = "$($User.FirstName) $($User.LastName)"

    New-ADUser `
        -Name $FullName `
        -GivenName $User.FirstName `
        -Surname $User.LastName `
        -SamAccountName $User.Username `
        -UserPrincipalName "$($User.Username)@d.evans.adlab" `
        -Path "OU=user-accounts,DC=d,DC=evans,DC=adlab" `
        -AccountPassword (ConvertTo-SecureString $User.Password -AsPlainText -Force) `
        -Enabled $true `
        -ChangePasswordAtLogon $true
}

