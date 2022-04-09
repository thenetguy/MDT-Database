Import-Module .\MDTDB.psm1
Connect-MDTDatabase -sqlServer mdt -database MDT
$computers = Import-Csv .\computers.csv


$output=ForEach($computers In $computers)

{
new-mdtcomputer -MAC $computers.MAC -description $computers.Description -serialNumber $computers.Serial -assetTag $computers.assettag -settings @{OSInstall=’YES’; OSDComputerName=$computers.OSDComputerName}
}


$output | Set-MDTComputerRole -roles @('Global','Test','Mexico')


pause