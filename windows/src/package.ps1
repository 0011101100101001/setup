$Editor = @(
    "Microsoft.VisualStudioCode",
    "Neovim.Neovim",
    "Vim.Vim",
    "Zed.Zed"
)

$Language = @(
    "GoLang.Go",
    "Microsoft.PowerShell",
    "Rustlang.Rustup"
)

$NoteTaking = @(
    "Obsidian.Obsidian"
    "Notion.Notion"
)

$Terminal = @(
    "Alacritty.Alacritty",
    "Microsoft.WindowsTerminal"
)

$Virtualization = @(
    "Microsoft.WSL",
    "Docker.DockerDesktop",
    "Oracle.VirtualBox"
)

$Packages = @(
    $Editor,
    $Language,
    $Terminal,
    $NoteTaking
)

function Install-Package() {
    foreach ($package in $Packages) {

        if (winget list --name $Package) {
            Write-Host "$SetupError"

        } else {
            Write-Host `
            "$SetupPrint$Bold$White$Package has been installed.$Reset"
        }

        } else {

        }
    }
}
