function Setup-Specific-Package() {
    return
}

function Start-Setup() {
    return
}

function Check-Package() {
    return
}

function Setup-Package() {
    foreach ($package in $Packages) {
        if (winget list --name $package) {
            Write-Host "$SetupError"

        } else {
            Write-Host `
            "$SetupPrint$Bold$White$package has been installed.$Reset"
        }
    }
}
