#!/bin/bash

set -e

cp -i /config_original/settings.json /config/settings.json

# Initiate the time machine daemons
service transmission-daemon start

/bin/bash
