# Higher privlege management

get_sudo_privilege() {
    echo -e \
    "${BOLD}${YELLOW}Sudo:" \
    "${WHITE}higher privilege are required to continue${RESET}"
    if ! sudo -v; then
        abort_setup
    fi
}
