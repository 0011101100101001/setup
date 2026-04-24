# Update all already installed packages

set -euo pipefail

source package.sh
source styling.sh
source env.sh

is_installed() {
   if $PACKAGE_MANAGER $CHECK_OPTION $1; then
        return 0
   fi
   return 1
}

update_editor() {
    for editor in "${EDITORS[@]}"; do
        echo -e "${BOLD}${BLUE}Update: ${WHITE}${editor}${RESET}"
        if is_installed $editor; then
            sudo $PACKAGE_MANAGER "${UPDATE_OPTION[@]}" $editor

        fi
    done
}

get_sudo_priviledge() {
    echo -e \
    "${BOLD}${YELLOW}Sudo:" \
    "${WHITE}higher priviledge are required to run the script${RESET}"
    if ! sudo -v; then
        abort_setup
    fi
    echo
}

update_setup() {
    local HEADER=\
"╦ ╦╔═╗╔╦╗╔═╗╔╦╗╔═╗
║ ║╠═╝ ║║╠═╣ ║ ║╣
╚═╝╩  ═╩╝╩ ╩ ╩ ╚═╝"

    echo -e "\n${BOLD}${MAGENTA}${HEADER}${RESET}"
    get_sudo_priviledge
    update_editor
}
