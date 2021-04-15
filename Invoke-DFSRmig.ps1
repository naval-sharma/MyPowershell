Invoke-Command aupdcinsv018.ap.jllnet.com -Credential $cred.ap -ScriptBlock {
    do {
       Get-Date
       dfsrmig /getmigrationstate
       Start-Sleep -Seconds 300
       } until ($False)
    }