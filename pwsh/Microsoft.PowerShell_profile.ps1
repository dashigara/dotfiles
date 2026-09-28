oh-my-posh init pwsh --config $env:USERPROFILE/.posh/config.yaml | Invoke-Expression
Invoke-Expression (& { (zoxide init powershell | Out-String) })

Set-Alias -Name which -Value where.exe

# ========================================
# Alias
# ========================================

# ----------------------------------------
# tig
# ----------------------------------------
function tigref()
{ tig refs 
}
Set-Alias -Name tr -Value tigref

function tigsts()
{ tig status
}
Set-Alias -Name ts -Value tigsts

# ----------------------------------------
# git
# ----------------------------------------
function gitpull()
{ git pull
}
Set-Alias -Force -Name gp -Value gitpull

function gitfetch()
{ git fetch @args
}
Set-Alias -Name gf -Value gitfetch

# ----------------------------------------
# misc
# ----------------------------------------
function excur()
{ explorer . 
}
Set-Alias -Name e -Value excur

function mkdirAndCd()
{
    mkdir @args && Set-Location @args
}
Set-Alias -Name mkcd -Value mkdirAndCd

function miserun()
{ mise run @args
}
Set-Alias -Name mr -Value miserun

Set-Alias -Name n -Value nvim

Set-PSReadLineOption -Colors @{
    Parameter = "#7dcfff"
}
