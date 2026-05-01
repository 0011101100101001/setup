# Editors to setup

setup_vscode() {
    return
}

setup_zed() {
    return
}

setup_vim() {
    return
}

setup_neovim() {
    return
}

setup_editor() {
    local cmd=$1
    local -n __count=$2

    setup_neovim; ((++__count))
    setup_vim; ((++__count))
    setup_vscode; ((++__count))
    setup_zed; ((++__count))
}
