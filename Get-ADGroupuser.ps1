$Cred=Get-StoredCredential -Target nsap
get-adgroupmember "JBC_UKPAM_AP" -Server AP -Credential $Cred |
where {$_.objectclass -eq 'user'} |
Get-ADUser -properties *|
Select UserPrincipalName , DistinguishedName,SamAccountName,GivenName, Surname,Country,LastLogonDate,Description, CN, WhenCreated, Department, Manager |
Export-Csv d:\Temp\JBC_UKPAM_AP.csv -NoTypeInformation