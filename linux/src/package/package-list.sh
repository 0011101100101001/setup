# Packages to download and install

BROWSER=(
    "brave"
    "firefox"
    "tor"
)

COMPILATOR=(
    "clang"
    "clang++"
    "gcc"
    "g++"
)

DEBUGGER=(
    "gdb"
    "llvm"
)

EDITOR=(
    "neovim"
    "vim"
    "vscode"
    "zed"
)

LANGUAGE=(
    "golang"
    "perl"
    "python"
    "rust"
)

NOTE=(
    "notion"
    "obsidian"
)

REVERSE=(
    "binaryninja"
    "ghidra"
    "ida"
)

VIRTUALIZATION=(
    "virtualbox"
    "virt-manager"
)

VPN=(
    "openvpn"
    "protonvpn"
    "wireguard"
)

PACKAGE=(
    "${EDITOR[@]}"
    "${LANGUAGE[@]}"
    "${COMPILATOR[@]}"
    "${DEBUG_TOOL[@]}"
)

PACKAGE_CATEGORY=(
    "browser"
    # "compilator"
    # "debugger"
    "editor"
    # "language"
    # "note"
    # "reverse"
    # "virtualization"
    # "vpn"
)
