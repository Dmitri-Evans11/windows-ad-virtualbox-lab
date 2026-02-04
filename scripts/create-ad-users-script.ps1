<#
.SYNOPSIS
Creates Active Directory user accounts from a CSV file.

.DESCRIPTION
Imports user data from a CSV file and creates Active Directory users
in the specified Organizational Unit (OU). Accounts are enabled on
creation and users are required to change their password at first logon.

.NOTES
Author: Dmitri Evans
Lab: Windows AD VirtualBox Lab
Requires: ActiveDirectory PowerShell module
#>

# Import Active Directory module
Import-Module ActiveDirectory

# Import users from CSV file
$Users = Import-Csv ".\users.csv"

# Loop through each user and create AD account
foreach ($User in $Users) {

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

Write-Host "User creation process completed successfully." -ForegroundColor Green

