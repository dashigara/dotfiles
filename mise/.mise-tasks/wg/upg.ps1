#MISE description="Winget Pakcage All Upgrade"
#MISE shell="pwsh -c"
winget list --upgrade-available
while ($true)
{
    $u = Read-Host "Upgrade Continue? [Y/n]"
    if ($u -eq "y" -or $u -eq "Y" -or $u -eq "")
    { break; 
    }
    if ($u -eq "n" -or $u -eq "N")
    { exit; 
    }
}
winget upgrade --all

