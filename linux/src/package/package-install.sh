# Download and install all packages

install_editor() {
    echo $1
}

setup_install() {
    local HEADER=\
"╦╔╗╔╔═╗╔╦╗╔═╗╦  ╦
║║║║╚═╗ ║ ╠═╣║  ║
╩╝╚╝╚═╝ ╩ ╩ ╩╩═╝╩═╝"
    local count=0

    echo -e "${BOLD}${MAGENTA}${HEADER}${RESET}"
    get_sudo_privilege
    install_editor $count
    echo $count
}
