if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole("Administrators")) {
    Start-Process powershell.exe "-ExecutionPolicy RemoteSigned -File `"$PSCommandPath`"" -Verb RunAs
    exit 
}

function  New-ConfigLink {
    param($targetPath, $fileName)
    
    if (!(Test-Path $targetPath)) {
        New-Item -ItemType Directory $targetPath
    }
    
    if (!(Test-Path $targetPath\$fileName)) {
        New-Item -ItemType SymbolicLink -Path $targetPath\$fileName -Value $PSScriptRoot\$fileName
    }
}

@(
    @{ targetPath = "$env:LOCALAPPDATA"; fileName = "nvim" }
) | ForEach-Object { New-ConfigLink @_ }

