# Browsers to setup

setup_brave() {
    return
}

setup_firefox() {
    return
}

setup_tor() {
    return
}

setup_browser() {
    local cmd=$1
    local -n __count=$2

    setup_brave cmd; ((++__count))
    setup_firefox cmd; ((++__count))
    setup_tor cmd; ((++__count))
}
