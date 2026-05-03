<# .SYNOPSIS
    Download and install script for setup program
#>

$Reset   = "`e[0m"
$Bold    = "`e[1m"
$Yellow  = "`e[33m"
$Blue    = "`e[34m"
$Magenta = "`e[35m"
$White   = "`e[37m"

$Cmd = "setup"
$RepoDir = Join-Path $env:LOCALAPPDATA "setup"
$RepoCmdPath = Join-Path $RepoDir
$CmdDir = Join-Path $env:LOCALAPPDATA "bin"
$CmdDirPath = Join-Path $CmdDir $Cmd
$CmdWrapperPath = Join-Path $CmdDir "$Cmd.bat"

function Install-Git() {
    winget install --id Git.Git --exact --silent --accept-source-agreements
}

function Clone-Repository() {
    New-Item -ItemType Directory -Force -Path $RepoDir | Out-Null
    Write-Host "$Bold${Blue}Setup: ${White}cloning repo...$Reset"

    git clone https://github.com/0011101100101001/setup.git $RepoDir

    Remove-Item -Path (Join-Path $RepoDir "linux") -Recurse -Force
    Remove-Item -Path (Join-Path $RepoDir "README.md") -Force
    Remove-Item -Path (Join-Path $RepoDir ".gitignore") -Force
    Remove-Item -Path (Join-Path $RepoDir ".git") -Recurse -Force -Hidden
}

function Check-Repository() {
    if (-not (Test-Path $RepoDir)) {
        Clone-Repository
    } else {
        Write-Host `
        "$Bold${Yellow}Warning: `
        ${White}repository already exists in $Bold$Blue$RepoDir$Reset`n`
        Overwrite it or abort? $Bold$Blue[y/n]$Reset"
        while ($True) {
            $Answer = Read-Host
            switch ($Answer) {
                'y' {
                    Remove-Item -Path $RepoDir -Recurse -Force
                    Clone-Repository
                    break
                }
                'n' {
                    Write-Host "$Bold${Magenta}Aborting...$Reset"
                    exit
                }
            }
        }
    }
}

function Install-Executable() {
    New-Item -ItemType Directory -Force -Path "$CmdDir"
    Write-Host "$Bold${Blue}Setup: ${White}install executable...$Reset"
}

try {
    if (-not (Test-Path $CmdDirPath)) {
        Check-Repository
        Install-Executable
    } else {
        Write-Host `
            "$Bold${Yellow}Warning:" `
            "${White}executable already exist\n$Reset" `
            "Overwrite it or abort? $Bold${Blue}[y/n]$Reset"
        While ($True) {
            $Answer = Read-Host
            switch ($Answer) {
                'y','Y' { Remove-Item -Path $CmdDirPath -Force }
                'n','N' { Write-Host "$Bold${Magenta}Aborting...$Reset" exit 0 }
            }
        }
    }
    Write-Host "$Bold${Magenta}DONE$Reset"

} catch {
    Write-Host $_
}
