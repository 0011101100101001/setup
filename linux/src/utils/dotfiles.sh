# Setup dotfiles

DOTFILES_ALREADY_MANAGED=false

manage_dotfiles() {
    if [[ $DOTFILES_ALREADY_MANAGED == "true" ]]; then return; fi

    local dotfiles_dir="$HOME/dotfiles"

    echo -e \
    "${BOLD}${BLUE}Dotfiles: ${WHITE}start to check for install...${RESET}"
    if [[ -d "$dotfiles_dir" ]]; then
        echo -e \
        "${BOLD}${YELLOW}Warning:" \
        "${WHITE}dotfiles directory already exist in" \
        "${BOLD}${BLUE}${dotfiles_dir}${RESET}\n" \
        "Overwrite it or abort? ${BOLD}${BLUE}[y/n]${RESET}"
        while true; do
            read -r answer
            case "$answer" in
                y|Y) rm -rf "$dotfiles_dir"; abort_setup; break;;
                n|N) break;;
            esac
        done
    else
        echo -e \
        "${BOLD}${BLUE}Dotfiles:"
        "${WHITE}download and install repository...${RESET}"
        git clone https://github.com/0011101100101001/dotfiles.git "$dotfiles_dir"
    fi
    DOTFILES_ALREADY_MANAGED=true
}
