$DotfilesAlreadyManager = $false

function Manage-Dotfiles() {
    if ($DotfilesAlreadyManaged)
        return

    $DotfilesDir = Join-Path $env:USERPROFILE "dotfiles"
    if (Test-Path $DotfilesDir) {
        Write-Host `
        "${Bold}${Yellow}Warning:" `
        "${White}dotfiles directory already exist in" `
        "${Bold}${Blue}${dotfiles_dir}${Reset}\n" `
        "Overwrite it or abort? ${Bold}${Blue}[y/n]${Reset}"
        while ($True) {
            $Answer = Read-Host
            switch ($Answer) {
                'y','Y' { Remove-Item -Path $DotfilesDir -Force -Recurse break}
                'n', 'N' { break }
            }
        }
    } else {
        Write-Host `
        "${Bold}${Blue}Dotfiles:" `
        "${White}download and install repository...${Reset}"
        git clone https://github.com/0011101100101001/dotfiles.git $DotfilesDir
    }
    $DotfilesAlreadyManaged = $true
}
