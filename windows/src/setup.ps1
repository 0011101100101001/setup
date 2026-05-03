<# .SYNOPSIS
     Windows setup script
#>

. "$PSScriptRoot\package\debloat.ps1"
. "$PSScriptRoot\package\package.ps1"
. "$PSScriptRoot\utils\exit.ps1"
. "$PSScriptRoot\utils\styling.ps1"

[CmdletBinding()]
param(
    [Parameter(Mandatory=$false)]
    [Alias("i")]
    [switch]$Install,

    [Alias("u")]
    [switch]$Update,

    [Alias("d")]
    [switch]$Debloat,

    [Alias("q")]
    [switch]$Quit
)

try {
    Write-Host "$Bold$Magenta$SetupHeader$Reset"
    if ($args.Count -eq 0) {
        Write-Host `
        "$Bold${White}Which action to perform? $Blue[i/u/d/q]"
        "$Bold${Blue}    i: ${Reset}install"
        "$Bold${Blue}    u: ${Reset}update"
        "$Bold${Blue}    d: ${Reset}debloat"
        "$Bold${Blue}    q: ${Reset}quit"
        while ($True) {
            $Answer = Read-Host
            switch ($Answer) {
                'i' { Setup-Package install; break }
                'u' { Setup-Package update; break }
                'h' { Display-Help; break}
                'd' { Debloat-Windows }
                'q' { Abort-Setup }
                Default {
                    Write-Host `
                    ("$Bold${Red}Error:${Reset}" +
                    " invalid option $Bold$Red$Answer$Reset.")
                }
            }
        }
    } else {
        if ($Quit) { Abort-Setup }
        if ($Install) { Setup-Package install }
        if ($Update) { Setup-Package update }
        if ($Debloat) { Debloat-Windows }
    }
} catch {
    Write-Host "$ErrorPrint$Bold$White$_"
}
