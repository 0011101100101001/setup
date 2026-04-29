#!/usr/bin/env bash

set -euo pipefail

ABS_PATH=$(dirname "$(readlink -f "$0")")

source "$ABS_PATH/package/package-list.sh"
source "$ABS_PATH/package/package.sh"
source "$ABS_PATH/utils/clean.sh"
source "$ABS_PATH/utils/env.sh"
source "$ABS_PATH/utils/styling.sh"
source "$ABS_PATH/utils/sudo.sh"

echo -e \
"${BOLD}${MAGENTA}${SETUP_HEADER}${RESET}\n" \
"${BOLD}${BLUE}  Architecture: ${WHITE}${ARCH}${RESET}\n" \
"${BOLD}${BLUE}  Distribution: ${WHITE}${DISTRO}${RESET}\n" \
"${BOLD}${BLUE}  Package manager: ${WHITE}${PKG_MANAGER}${RESET}\n"

echo -e \
"${BOLD}${WHITE}Which action to perform? ${BLUE}[i/u/q]
    ${BOLD}${BLUE}i: ${RESET}install
    ${BOLD}${BLUE}u: ${RESET}update
    ${BOLD}${BLUE}q: ${RESET}quit"

while true; do
    read -r answer
    case "$answer" in
        "i") setup_package "$INSTALL_HEADER" install; break;;
        "u") setup_package "$UPDATE_HEADER" update; break;;
        "q") setup_abort;;
        *) echo -e \
            "${BOLD}${RED}Error:${RESET}" \
            "invalid option ${BOLD}${RED}${answer}${RESET}."
        ;;
    esac
done

exit 0
