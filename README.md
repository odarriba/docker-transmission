# docker-transmission

A docker image to run the latest version of **Transmission BitTorrent client** inside a container.

The current built image has the *version 2.84* of Transmission client.

## Installation

To download the docker container and execute it, simply run:

`sudo docker run -h transmission --name transmission -d -v /route/to/your/downloads:/downloads -v /route/to/your/config_dir:/config -t -i -p 9091:9091 -p 51413:51413/udp -p 51413:51413/tcp odarriba/transmission`

## Configuration

The default config of the container is placed at `/config` directory inside the container. 

If you hace attached a volume to that path, you can modify your settings.json as you wish. Otherwise, you can attach the container and modify the file from inside.

Default credentials for web access are **user** as the user and **pass** as the password.

## Auto start the service

To auto start the container, use the *restart* option when you create the container.

## Usage

Just access using your web browser (`http://your_server_ip:9091`) and start downloading your favourite torrents!

## Disclaimer

This docker container is not aimed to be used to download copyrighted material, so I am not responsible of the use others make of it :D

## Contributors

* Óscar de Arriba (odarriba@gmail.com)