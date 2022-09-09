#!/bin/sh

# Start the local hardhat node
start_node() {
    yarn node:local
    
    set -e
    if [ "${1#-}" != "${1}" ] || [ -z "$(command -v "${1}")" ]; then
        set -- node "$@"
    fi   
    exec "$@"
}

# Keep container alive so it does not shit down after starting up
keep_alive() {
    while true
        do sleep 7d
    done
}

# Change to app dir
cd /usr/src/app

# Parse CLI args
option="${1}" 
case ${option} in
    -r) # Get the role
        role="${2}"
        echo "Role is: ${2}"
    ;;
    *)  
        echo "`basename ${0}`:usage: [-r role]" 
        exit 1
      ;; 
esac

# Switch on container role
case ${role} in
    node)
        start_node
    ;;
    dev) 
        keep_alive
    ;;
    client)
        yarn client:local
    ;;
    *) 
        echo "Invalid value for -r (role). Supported values are node or dev."
        exit 1
    ;;
esac
