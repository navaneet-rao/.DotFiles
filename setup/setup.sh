#!/bin/sh -e

# add variables to top level so can easily be accessed by all functions
PACKAGER=""
SUDO_CMD=""
SUGROUP=""
GITPATH=""


## TODO: need to add condections for this


checkShell() {
    echo "${YELLOW}Checking for type of shell...${RC}"

    if [ "$SHELL" = "/bin/zsh" ] || [ "$SHELL" = "/usr/bin/zsh" ]; then
        ## for zsh
        RC=$'\033[0m'
        RED=$'\033[31m'
        YELLOW=$'\033[33m'
        GREEN=$'\033[32m'
        
        # ~/.zshrc
        # eval "$(starship init zsh)"
        echo "${GREEN}Zsh detected${RC}"
    else
        ## for bash or other shells
        RC='\033[0m'
        RED='\033[31m'
        YELLOW='\033[33m'
        GREEN='\033[32m'
        echo "${GREEN}Bash or other shell detected${RC}"
    fi
}

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

checkEnv() {
    
    echo "${YELLOW}Checking for requirements...${RC}"

    ## Check for requirements.
    REQUIREMENTS='curl groups sudo'
    for req in $REQUIREMENTS; do
        if ! command_exists "$req"; then
            echo "${RED}To run me, you need: $REQUIREMENTS${RC}"
            exit 1
        fi
    done

    ## Check Package Handler
    PACKAGEMANAGER='nala apt dnf yum pacman zypper emerge xbps-install nix-env'
    for pgm in $PACKAGEMANAGER; do
        if command_exists "$pgm"; then
            PACKAGER="$pgm"
            echo "Using $pgm"
            break
        fi
    done

    if [ -z "$PACKAGER" ]; then
        echo "${RED}Can't find a supported package manager${RC}"
        exit 1
    fi

    if command_exists sudo; then
        SUDO_CMD="sudo"
    elif command_exists doas && [ -f "/etc/doas.conf" ]; then
        SUDO_CMD="doas"
    else
        SUDO_CMD="su -c"
    fi

    echo "Using $SUDO_CMD as privilege escalation software"

    ## Check if the current directory is writable.
    GITPATH=$(dirname "$(realpath "$0")")
    if [ ! -w "$GITPATH" ]; then
        echo "${RED}Can't write to $GITPATH${RC}"
        exit 1
    fi

    ## Check SuperUser Group
    SUPERUSERGROUP='wheel sudo root'
    for sug in $SUPERUSERGROUP; do
        if groups | grep -q "$sug"; then
            SUGROUP="$sug"
            echo "Super user group $SUGROUP"
            break
        fi
    done

    ## Check if member of the sudo group.
    if ! groups | grep -q "$SUGROUP"; then
        echo "${RED}You need to be a member of the sudo group to run me!${RC}"
        exit 1
    fi
}

installDepend() {

    echo "${YELLOW}Checking for dependencies...${RC}"

}


checkShell
checkEnv
installDepend

