#
# Windows PowerShell script for AD DS Deployment
#

Import-Module ADDSDeployment
Install-ADDSDomainController `
-NoGlobalCatalog:$false `
-CreateDnsDelegation:$true `
-CriticalReplicationOnly:$false `
-DatabasePath "E:\windows\NTDS" `
-DomainName "eu.JLLNET.com" `
-InstallationMediaPath "D:\ifm_robo" `
-InstallDns:$true `
-LogPath "E:\windows\NTDS" `
-NoRebootOnCompletion:$false `
-ReplicationSourceDC "EULILVMDC01.eu.JLLNET.COM" `
-SiteName "AmericasLag" `
-SysvolPath "F:\windows\SYSVOL" `
-Force:$true