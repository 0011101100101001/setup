function Display-Help() {
    Write-Host `
"$Bold${Blue}Usage: ${White}[-i/u/h] (package name)${Reset}\n
    ${Bold}${Blue}i: ${Reset}install package
    ${Bold}${Blue}u: ${Reset}update package
    ${Bold}${Blue}h: ${Reset}display this message"
}
