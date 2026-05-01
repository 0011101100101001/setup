# Cleanup functions

signal_handler() {
    echo -e \
    "\n${BOLD}${YELLOW}Signal(${UNBOLD}$1${BOLD}):" \
    "${WHITE}aborting setup...${RESET}"
    exit 1
}

trap 'signal_handler SIGINT' SIGINT
trap 'signal_handler SIGTERM' SIGTERM
