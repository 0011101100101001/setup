# Packages to download and install

set -euo pipefail

EDITORS=(
    "neovim"
    "vim"
    "vscode"
    "zed"
)

LANGUAGES=(
    "golang"
    "perl"
    "python"
    "rust"
)

COMPILATOR=(
    "clang"
    "clang++"
    "gcc"
    "g++"
)

DEBUG_TOOLS=(
    "gdb"
    "llvm"
)

PACKAGE=(
    "${EDITORS[@]}"
    "${LANGUAGES[@]}"
    "${COMPILATOR[@]}"
    "${DEBUG_TOOLS[@]}"
)
