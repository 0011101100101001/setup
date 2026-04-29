# Initialize variables for setup process

source /etc/os-release

SCRIPT_DIR=$(cd ..; pwd)
LOG_DIR="$SCRIPT_DIR/log"
ARCH="$(uname -m)"
DISTRO="${ID^}"
PKG_MANAGER=""
PKG_REPO_UPDATE=""
PKG_CHECK=""
PKG_INSTALL=""
PKG_UPDATE=""
PKG_REMOVE=""

if [[ "$DISTRO" =~ Fedora ]]; then
    PKG_MANAGER="dnf"
    PKG_REPO_UPDATE="makecache"
    PKG_CHECK=(list --installed)
    PKG_INSTALL=(install -y)
    PKG_UPDATE=(upgrade -y)
    PKG_REMOVE=(remove -y)

elif [[ "$DISTRO" =~ Debian|Kali|Parrot ]]; then
    PKG_MANAGER="apt"
    PKG_REPO_UPDATE="update"
    PKG_CHECK=(list --installed)
    PKG_INSTALL=(install -y)
    PKG_UPDATE=(install --only-upgrade -y)
    PKG_REMOVE=(remove -y)

elif [[ "$DISTRO" =~ Arch ]]; then
    PKG_MANAGER="pacman"
    PKG_REPO_UPDATE=(-Sy --noconfirm)
    PKG_CHECK=(-Q)
    PKG_INSTALL=(-S --noconfirm)
    PKG_UPDATE=(-Syu --noconfirm)
    PKG_REMOVE=(-Rs --noconfirm)
fi
