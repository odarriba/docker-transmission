#!/bin/bash

set -e

# Need to initialize?
if [ ! -e /.initialized ]; then
    if [ -z $USER ]; then
        echo "no USER specified, using default value ('admin')"
        USER="admin"
    fi

    if [ -z $PASSWORD ]; then
        echo "no PASSWORD specified, using default value ('admin')"
        PASSWORD="admin"
    fi

    if [ -z $IP_WHITELIST ]; then
        echo "no IP_WHITELIST specified, using default value ('*.*.*.*')"
        IP_WHITELIST="*.*.*.*"
    fi

    # Make a copy of default config
    cp /home/transmission/.config/transmission-daemon/settings.json /home/transmission/.config/transmission-daemon/settings.json.bak

    # Make the changes
    sed -i "s/\"rpc-username\": \"user\"/\"rpc-username\": \"${USER}\"/g" /home/transmission/.config/transmission-daemon/settings.json
    sed -i "s/\"rpc-password\": \"pass\"/\"rpc-password\": \"${PASSWORD}\"/g" /home/transmission/.config/transmission-daemon/settings.json
    sed -i "s/\"rpc-whitelist\": \"*.*.*.*\"/\"rpc-whitelist\": \"${IP_WHITELIST}\"/g" /home/transmission/.config/transmission-daemon/settings.json

    
    chown -R transmission:transmission /home/transmission/.config/transmission-daemon/

    touch /.initialized
fi

# Initiate the time machine daemons
service transmission-daemon start

/bin/bash
