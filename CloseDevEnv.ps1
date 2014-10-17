<#-- add-type -AssemblyName microsoft.VisualBasic
add-type -AssemblyName System.Windows.Forms

Get-Process | Where-Object {$_.MainWindowTitle -like "*Untitled*"} | Select-Object MainWindowTitle 
[Microsoft.VisualBasic.Interaction]::AppActivate("TestWindow") 
[System.Windows.Forms.SendKeys]::SendWait("%{F4}")
--#>
param($vsTitleText)

add-type -AssemblyName microsoft.VisualBasic
add-type -AssemblyName System.Windows.Forms
 
$Process = Get-Process | Where-Object {$_.ProcessName.ToLower() -eq "devenv" -and $_.MainWindowTitle -like "%$vsTitleText%" } | ForEach-Object {
    Write-Host "Title: $_.MainWindowTitle"
    [Microsoft.VisualBasic.Interaction]::AppActivate($_.Id)
    [System.Windows.Forms.SendKeys]::SendWait("%{F4}")
    Start-Sleep -Seconds 3
}
