if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole("Administrators")) { Start-Process powershell.exe "-File `"$PSCommandPath`"" -Verb RunAs; exit }
if (!Test-Path $env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1) {
    if (!Test-Path $env:USERPROFILE\Documents\PowerShell\) {
        New-Item -ItemType Directory $env:USERPROFILE\Documents\PowerShell
    }
    New-Item -ItemType SymbolicLink -Path $env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 -Value .\pwsh\Microsoft.PowerShell_profile.ps1
}
if (!Test-Path $env:USERPROFILE\.posh\config.yaml) {
    if (!Test-Path $env:USERPROFILE\.posh\) {
        New-Item -ItemType Directory $env:USERPROFILE\.posh
    }
    New-Item -ItemType SymbolicLink -Path $env:USERPROFILE\.posh -Value .\pwsh\config.yaml
}