#!/usr/bin/env bash

set -euo pipefail

source env.sh
source package.sh
source styling.sh
source clean.sh
source update.sh
source install.sh

echo -e \
"${BOLD}${MAGENTA}${HEADER}${RESET}\n" \
"${BOLD}${BLUE}  Architecture: ${WHITE}${ARCHITECTURE}${RESET}\n" \
"${BOLD}${BLUE}  Distribution: ${WHITE}${DISTRIBUTION}${RESET}\n" \
"${BOLD}${BLUE}  Package manager: ${WHITE}${PACKAGE_MANAGER}${RESET}\n"

echo -e \
"${BOLD}${WHITE}" \
"Which action to perform? ${BLUE}[i/u/q]
    ${BLUE}-i ${WHITE}complete installation
    ${BLUE}-u ${WHITE}update packages already installed
    ${BLUE}-q ${WHITE}abort and quit${RESET}"

while true; do
    read -r answer
    case "$answer" in
        "i") install_setup; break ;;
        "u") update_setup; break ;;
        "q") abort_setup ;;
        *) echo -e "${BOLD}${RED}Error:${RESET}" \
                "invalid option ${BOLD}${RED}$answer${RESET}."
    esac
done

exit 0
