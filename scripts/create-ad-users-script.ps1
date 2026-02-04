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
