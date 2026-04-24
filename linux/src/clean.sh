# Cleanup functions

source styling.sh

signal_handler() {
    echo -e \
    "\n${BOLD}${YELLOW}Signal(${UNBOLD}$1${BOLD}):" \
    "${WHITE}aborting setup...${RESET}"
    exit 1
}

trap 'signal_handler SIGINT' SIGINT
trap 'signal_handler SIGTERM' SIGTERM

abort_setup() {
    echo -e "\n${BOLD}${MAGENTA}Aborting...${RESET}"
    exit 0
}

quit_setup() {
    exit 0
}
