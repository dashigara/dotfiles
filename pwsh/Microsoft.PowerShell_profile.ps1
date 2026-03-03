oh-my-posh init pwsh --config $env:USERPROFILE/.posh/config.yaml | Invoke-Expression
Set-Alias -Name which -Value where.exe
Invoke-Expression (& { (zoxide init powershell | Out-String) })
