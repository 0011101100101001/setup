<# .SYNOPSIS
     Windows setup script
#>

. "$PSScriptRoot\styling.ps1"
. "$PSScriptRoot\package.ps1"
. "$PSScriptRoot\bloatware.ps1"

try {
    Write-Host "$Bold$Italic${Magenta}$Header$Reset"

    $Input = Read-Host ""

    Write-Host $Input

    Debloat-Windows
    Install-Package

} catch {
    Write-Host "$ErrorPrint$Bold$White$_"
}
