###This code collects the DCs in the domain and the size of the NTDS.dit on each DC###
$dcs = (Get-ADDomainController).Name
$dbs = Invoke-Command -ComputerName $dcs -ScriptBlock {
    Get-ItemProperty -Path HKLM:\System\CurrentControlSet\Services\NTDS\Parameters
} | Select-Object PSComputerName,'DSA Database File'
$dbs | ForEach-Object {
    $output = @{}
    $path = $_.'DSA Database File'
    $output.Add('DomainController', $_.PSComputerName)
    $size = Invoke-Command -ComputerName $_.PSComputerName -ScriptBlock {
        (Get-ItemProperty -Path $using:path).Length /1GB
    }
    $output.Add('DatabaseSizeDB', $size)
    [pscustomobject]$output
}