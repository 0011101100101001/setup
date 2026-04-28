# Initialize variables for setup process

set -euo pipefail

source /etc/os-release

SCRIPT_DIR=$(cd ..; pwd)
LOG_DIR="$SCRIPT_DIR/log"
ARCHITECTURE="$(uname -m)"
DISTRIBUTION=""
PACKAGE_MANAGER=""
CHECK_OPTION=""
INSTALL_OPTION=""
UPDATE_OPTION=""
CLEAN_OPTION=""

if [[ "$NAME" =~ [Ff]edora ]]; then
    DISTRIBUTION="Fedora"
    PACKAGE_MANAGER="dnf"
    CHECK_OPTION=(list --installed)
    INSTALL_OPTION=(install -y)
    UPDATE_OPTION=(upgrade -y)
    CLEAN_OPTION="remove"

elif [[ "$NAME" =~ [Dd]ebian ]]; then
    DISTRIBUTION="Debian"
    PACKAGE_MANAGER="apt"
    CHECK_OPTION=(list --installed)
    INSTALL_OPTION=(install -y)
    UPDATE_OPTION=(install --only-upgrade -y)
    CLEAN_OPTION="uninstall"

elif [[ "$NAME" =~ [Aa]rch ]]; then
    DISTRIBUTION="Arch"
    PACKAGE_MANAGER="pacman"
    CHECK_OPTION="-Q"
    INSTALL_OPTION=(-S --noconfirm)
    UPDATE_OPTION=(-Syu --noconfirm)
    CLEAN_OPTION="-R"
fi
