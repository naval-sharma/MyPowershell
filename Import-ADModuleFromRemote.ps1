$S = New-PSSession -ComputerName MyDomainController

Export-PSsession -Session $S -Module ActiveDirectory -OutputModule RemoteAD

Remove-PSSession -Session $S

Import-Module RemoteAD