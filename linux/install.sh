#!/usr/bin/env bash

set -euo pipefail

RESET="\e[0m"
BOLD="\e[1m"
YELLOW="\e[33m"
BLUE="\e[34m"
MAGENTA="\e[35m"
WHITE="\e[37m"

CMD="setup"
CMD_DIR="$HOME/.local/bin"
CMD_PATH="$CMD_DIR/$CMD"
REPO_PATH="$HOME/.local/share"
REPO_DIR="$REPO_PATH/setup"
REPO_CMD_PATH="$REPO_DIR/linux/src/setup.sh"

clone_repository() {
    echo -e "${BOLD}${BLUE}Setup: ${WHITE}cloning repo...${RESET}"
    mkdir -p "$REPO_DIR"
    cd "$REPO_PATH"
    git clone https://github.com/0011101100101001/setup.git
}

check_repository() {
    if [[ ! -d "$REPO_DIR" ]]; then
        clone_repository
    else
        echo -e \
        "${BOLD}${YELLOW}Setup:" \
        "${WHITE}repository already exist in" \
        "${BOLD}${BLUE}${REPO_PATH}${RESET}\n" \
        "Overwrite it or abort? ${BOLD}${BLUE}[y/n]${RESET}"
        while true; do
            read -r answer
            case "$answer" in
                "y") rm -rf "$REPO_DIR"; clone_repository; break;;

                "n") echo -e "${BOLD}${MAGENTA}Aborting...${RESET}"; exit 0;;
            esac
        done
    fi
}

install_executable() {
    echo -e \
    "${BOLD}${BLUE}Setup: ${WHITE}install executable${RESET}"
    mkdir -p "$CMD_DIR"
    ln -sf "$REPO_CMD_PATH" "$CMD_PATH"
    chmod u+x "$REPO_CMD_PATH"
}

echo -e "${BOLD}${MAGENTA}SETUP - INSTALLATION${RESET}"

if [[ ! -f "$CMD_PATH" ]]; then
    check_repository
    install_executable
else
    echo -e \
        "${BOLD}${YELLOW}Setup:" \
        "${WHITE}executable already exist\n${RESET}" \
        "Overwrite it or abort? ${BOLD}${BLUE}[y/n]${RESET}"
    while true; do
        read -r answer
        case "$answer" in
            "y") rm -rf "$CMD_DIR"; check_repository; break;;

            "n") echo -e "${BOLD}${MAGENTA}Aborting...${RESET}"; exit 0;;
        esac
    done
    install_executable
fi

echo -e "\n${BOLD}${MAGENTA}DONE${RESET}"

exit 0
