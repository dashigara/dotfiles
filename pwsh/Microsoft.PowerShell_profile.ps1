oh-my-posh init pwsh --config $env:USERPROFILE/.posh/config.yaml | Invoke-Expression
Invoke-Expression (& { (zoxide init powershell | Out-String) })

Set-Alias -Name which -Value where.exe

function tigref()
{ tig refs 
}
Set-Alias -Name tr -Value tigref

function tigsts()
{ tig status
}
Set-Alias -Name ts -Value tigsts

function gitpull()
{ git pull
}
Set-Alias -Force -Name gp -Value gitpull

function gitfetch()
{ git fetch
}
Set-Alias -Name gf -Value gitfetch

function gitfetchprune()
{ git fetch --prune
}
Set-Alias -Name gfp -Value gitfetchprune

function excur()
{ explorer . 
}
Set-Alias -Name e -Value excur

Set-PSReadLineOption -Colors @{
    Parameter = "#7dcfff"
}
