# Update all already installed packages

is_installed() {
   if $PKG_MANAGER $PKG_OPTION $1 &> /dev/null; then
        return 0
   fi
   return 1
}

update_editor() {
    for package in "${EDITOR[@]}"; do
        echo -e "${BOLD}${BLUE}Update: ${WHITE}${package}${RESET}"
        if is_installed $package; then
            sudo $PKG_MANAGER "${UPDATE_OPTION[@]}" $package
            (($1++))
        fi
    done
}

setup_update() {
    local header=\
"╦ ╦╔═╗╔╦╗╔═╗╔╦╗╔═╗
║ ║╠═╝ ║║╠═╣ ║ ║╣
╚═╝╩  ═╩╝╩ ╩ ╩ ╚═╝"
    local count=0

    echo -e "${BOLD}${MAGENTA}${header}${RESET}"
    get_sudo_privilege
    update_editor $count
    echo $count
}
