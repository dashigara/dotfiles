oh-my-posh init pwsh --config $env:USERPROFILE/.posh/config.yaml | Invoke-Expression
Invoke-Expression (& { (zoxide init powershell | Out-String) })

Set-Alias -Name which -Value where.exe

function excur() { explorer . }
Set-Alias -Name e -Value excur

Set-PSReadLineOption -Colors @{
    Parameter = "#7dcfff"
}
