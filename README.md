# docker-transmission

A docker image to run the latest version of **Transmission BitTorrent client** inside a container.

The current built image has the *version 2.84* of Transmission client.

## Installation

To download the docker container and execute it, simply run:

`sudo docker run -h transmission --name transmission -e USER=<YOUR_USER> -e PASSWORD=<YOUR_PASS> -e IP_WHITELIST=<IPS_ALLOWED> -d -v /route/to/your/downloads:/downloads -t -i -p 9091:9091 -p 51413:51413/udp -p 51413:51413/tcp odarriba/transmission`

## Configuration

The environment variables available on this Docker image are:

* **USER.** The username used to login into the control panel and remote control applications. Default: admin.
* **PASSWORD.** The pasword used to login into the control panel and remote control applications. Default: admin.
* **IP_WHITELIST.** The list of IPs that are allowed to connect with the `transmission` daemon to control it (via web or remote application). Default: '\*.\*.\*.\*'.

These configuration variables should be passed during the first run because there are readed only once to initialize the container.

If you want to customize your copy, you can attach to the docker container and edit the settings file located at `/home/transmission/.config/transmission-daemon/settings.json`.

## Auto start the service

This repository contains a script to run the container at boot time **in Ubuntu-based distros**, but **it requires that the container have been run manually at least one time**.

To install the script, just execute `sudo cp config/transmission.conf /etc/init/transmission.conf`.

* To start the service: `sudo service transmission start`
* To stop the service: `sudo service transmission stop`

**Note:** when you stop the service, the container keeps running. Yo must execute `sudo docker stop transmission`in order to stop the server.

## Usage

Just access using your web browser (`http://your_server_ip:9091`) and start downloading your favourite torrents!

## Disclaimer

This docker container is not aimed to be used to download copyrighted material, so I am not responsible of the use others make of it :D

## Contributors

* Óscar de Arriba (odarriba@gmail.com)