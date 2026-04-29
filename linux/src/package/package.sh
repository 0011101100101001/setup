# Download and install all packages

manage_browser() {
    return
}

manage_compilator() {
    return
}

manage_debugger() {
    return
}

manage_editor() {
    local -n __count=$1

    ((++__count))
}

manage_specific_package() {
    echo -e \
"${BOLD}${WHITE}Choose between: ${BLUE}[cat1, cat2, catn.../q]
    ${BOLD}${BLUE}types: ${RESET}browser, compilator, debugger, editor,
              language, note, reverse, virtualization, vpn
    ${BOLD}${BLUE}q: ${RESET}quit"
    while true; do
        read -r answer
        case "$answer" in
            "browser") manage_browser;;
            "compilator") manage_compilator;;
            "editor") manage_editor;;
            "debugger") manage_debugger;;
        esac
    done
}

manage_package() {
    local -n _count=$3

    manage_browser _count
    manage_editor _count
}

setup_package() {
    local count=0
    local mod=$2

    echo -e "${BOLD}${MAGENTA}$1${RESET}"
    echo -e \
"${BOLD}${WHITE}Which package to $mod? ${BLUE}[a/s/q]
    ${BOLD}${BLUE}a: ${RESET}all
    ${BOLD}${BLUE}s: ${RESET}specific
    ${BOLD}${BLUE}q: ${RESET}quit"
    while true; do
        read -r answer
        case "$answer" in
            "a") manage_package $mod all count; break;;
            "s") manage_package $mod specific count; break;;
            "q") setup_abort;;
        esac
    done
    echo -e \
    "${BOLD}${MAGENTA}Package: ${BLUE}${count}${WHITE} $mod"
}
