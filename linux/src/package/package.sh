# Download and install all packages

setup_compilator() {
    local -n _count=$2

    ((++_count))
}

setup_debugger() {
    local -n _count=$2

    ((++_count))
}

setup_specific_package() {
    local cmd=$1
    local count=0

    echo -e \
"${BOLD}${WHITE}Choose between: ${BLUE}[cat1, cat2, catn.../q]
    ${BOLD}${BLUE}types: ${RESET}browser, compilator, debugger, editor,
              language, note, reverse, virtualization, vpn
    ${BOLD}${BLUE}q: ${RESET}quit"
    while true; do
        read -r answer
        case "$answer" in
            "browser") setup_browser cmd _count;;
            "compilator") setup_compilator cmd _count;;
            "editor") setup_editor cmd _count;;
            "debugger") setup_debugger cmd _count;;
            "q") abort_setup;;
        esac
    done
}

start_setup() {
    local cmd
    local mode=$1
    local which=$2
    local end_time
    local start_time
    local count=0

    if [[ $mode == "install" ]]; then
        cmd="$PKG_INSTALL"
    else
        cmd="$PKG_UPDATE"
    fi

    if [[ $which == "specific" ]]; then
        setup_specific_package cmd count
    else
        # start_time=$SECONDS
        start_time=$EPOCHREALTIME
        for function in "${PACKAGE_FUNCTION[@]}"; do
            $function cmd count
        done
        sleep 2
        # end_time=$SECONDS
        end_time=$EPOCHREALTIME
    fi
    elapsed=$(awk "BEGIN {print $end_time - $start_time}")
    echo -e \
    "${BOLD}${MAGENTA}Package:" \
    "${BLUE}${count}${WHITE} $mode in ${BLUE}${elapsed} seconds${RESET}"
}

check_package() {
    for package in "${PACKAGE[@]}"; do
        if [[ "$1" == "$package" ]]; then
            setup_specific_package $package
        else
            echo -e \
            "${BOLD}${RED}Error:"
            "${WHITE}no packages found with this input${RESET}"
        fi
    done
}

setup_package() {
    local header=""
    local mode=$1

    if [[ $mode == "install" ]]; then
        header=$INSTALL_HEADER
    else
        header=$UPDATE_HEADER
    fi
    echo -e "${BOLD}${MAGENTA}${header}${RESET}"
    echo -e \
"${BOLD}${WHITE}Which package to $mode? ${BLUE}[a/s/q]
    ${BOLD}${BLUE}a: ${RESET}all
    ${BOLD}${BLUE}s: ${RESET}specific
    ${BOLD}${BLUE}q: ${RESET}quit"
    while true; do
        read -r answer
        case "$answer" in
            a) start_setup $mode all; break;;
            s) start_setup $mode specific; break;;
            q) abort_setup;;
            *) check_package $mode answer;;
        esac
    done
}
