# Editors to setup

setup_vscode() {
    if [[ $DOTFILES_ALREADY_MANAGED == "false" ]]; then manage_dotfiles; fi
}

setup_zed() {
    if [[ $DOTFILES_ALREADY_MANAGED == "false" ]]; then manage_dotfiles; fi
}

setup_vim() {
    if [[ $DOTFILES_ALREADY_MANAGED == "false" ]]; then manage_dotfiles; fi
}

setup_neovim() {
    if [[ $DOTFILES_ALREADY_MANAGED == "false" ]]; then manage_dotfiles; fi
}

setup_editor() {
    local cmd=$1
    local -n __count=$2

    setup_neovim cmd; ((++__count))
    setup_vim cmd; ((++__count))
    setup_vscode cmd; ((++__count))
    setup_zed cmd; ((++__count))
}
