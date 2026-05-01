#!/usr/bin/env bash

set -euo pipefail

ABS_PATH=$(dirname "$(readlink -f "$0")")

source "$ABS_PATH/package/package-browser.sh"
source "$ABS_PATH/package/package-editor.sh"
source "$ABS_PATH/package/package-language.sh"
source "$ABS_PATH/package/package-list.sh"
source "$ABS_PATH/package/package.sh"
source "$ABS_PATH/utils/env.sh"
source "$ABS_PATH/utils/exit.sh"
source "$ABS_PATH/utils/help.sh"
source "$ABS_PATH/utils/signal.sh"
source "$ABS_PATH/utils/styling.sh"
source "$ABS_PATH/utils/sudo.sh"

echo -e \
"${BOLD}${MAGENTA}${SETUP_HEADER}${RESET}\n" \
"${BOLD}${BLUE}  Architecture: ${WHITE}${ARCH}${RESET}\n" \
"${BOLD}${BLUE}  Distribution: ${WHITE}${DISTRO}${RESET}\n" \
"${BOLD}${BLUE}  Package manager: ${WHITE}${PKG_MANAGER}${RESET}\n"

if [[ "$#" -eq 0 ]]; then
    echo -e \
    "${BOLD}${WHITE}Which action to perform? ${BLUE}[i/u/q]
        ${BOLD}${BLUE}i: ${RESET}install
        ${BOLD}${BLUE}u: ${RESET}update
        ${BOLD}${BLUE}q: ${RESET}quit"
    while true; do
        read -r answer
        case "$answer" in
            i) setup_package install; break;;
            u) setup_package update; break;;
            h) display_help; break;;
            q) abort_setup;;
            *) echo -e \
                "${BOLD}${RED}Error:${RESET}" \
                "invalid option ${BOLD}${RED}${answer}${RESET}."
            ;;
        esac
    done
else
    mode=""
    package=""
    while getopts "iuhq" option; do
        case "$option" in
            i) if [[ -z $mode ]]; then mode="install"; fi;;
            u) if [[ -z $mode ]]; then mode="update"; fi;;
            h) display_help; break;;
            q) abort_setup;;
            *) if [[ -z $package ]]; then package="$option"; fi;;
        esac
    done

    if [[ -z $mode ]]; then abort_setup; fi

    if [[ ! -z $package ]]; then
        check_package $mode $package
    else
        setup_package $mode
    fi
fi

exit 0
