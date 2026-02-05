
<#
.SYNOPSIS
Collects hardware and identity information from Active Directory domain-joined computers.

.DESCRIPTION
This script queries Active Directory for all computer objects, attempts to remotely
collect system information using CIM, and exports the results to a CSV file.
Offline or unreachable systems are recorded with a status indicator.

.AUTHOR
Dmitri Evans

.LAB
Windows AD VirtualBox Lab
#>

# Import Active Directory module
Import-Module ActiveDirectory

# Output file (absolute path to avoid confusion)
$OutputPath = "C:\ad-lab-scripts\device-collection\domain-device-inventory.csv"

# Get all domain computers
$Computers = Get-ADComputer -Filter * | Select-Object -ExpandProperty Name

# Collect inventory data
$Inventory = foreach ($Computer in $Computers) {

    try {
        # Query system information remotely
        $ComputerSystem = Get-CimInstance Win32_ComputerSystem -ComputerName $Computer -ErrorAction Stop
        $BIOS = Get-CimInstance Win32_BIOS -ComputerName $Computer
        $SystemProduct = Get-CimInstance Win32_ComputerSystemProduct -ComputerName $Computer

        # Return successful result
        [PSCustomObject]@{
            ComputerName  = $Computer
            Domain        = $ComputerSystem.Domain
            LoggedOnUser  = $ComputerSystem.UserName
            Manufacturer  = $ComputerSystem.Manufacturer
            Model         = $ComputerSystem.Model
            SerialNumber  = $BIOS.SerialNumber
            BIOSUUID      = $SystemProduct.UUID
            Status        = "Online"
        }
    }
    catch {
        # Return fallback object for offline/unreachable systems
        [PSCustomObject]@{
            ComputerName  = $Computer
            Domain        = "N/A"
            LoggedOnUser  = "N/A"
            Manufacturer  = "N/A"
            Model         = "N/A"
            SerialNumber  = "N/A"
            BIOSUUID      = "N/A"
            Status        = "Offline or Unreachable"
        }
    }
}

# Export inventory to CSV
$Inventory | Export-Csv -Path $OutputPath -NoTypeInformation

