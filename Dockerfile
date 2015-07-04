FROM ubuntu:14.04
MAINTAINER Óscar de Arriba <odarriba@gmail.com>

# Install transmission
RUN apt-get update && \
	apt-get dist-upgrade -y && \
    apt-get install build-essential automake autoconf libtool pkg-config intltool libcurl4-openssl-dev \
    	libglib2.0-dev libevent-dev libminiupnpc-dev libappindicator-dev wget -y && \
    apt-get clean && \
    rm -rf /tmp/*

WORKDIR /tmp

RUN wget http://download.transmissionbt.com/files/transmission-2.84.tar.xz && \
	tar xf transmission-2.84.tar.xz && \
	cd transmission-2.84 && \
	./configure -q --enable-daemon --disable-mac && \
	make -s && \
	make install

COPY config/transmission-daemon /etc/init.d/transmission-daemon

RUN chmod +x /etc/init.d/transmission-daemon && \
	chown root:root /etc/init.d/transmission-daemon && \
	adduser --disabled-password transmission && \
	mkdir -p /home/transmission/.config/transmission-daemon/

COPY config/settings.json /home/transmission/.config/transmission-daemon/settings.json
COPY start_service.sh /start_service.sh


VOLUME ["/downloads"]

EXPOSE 9091 51413/tcp 51413/udp

CMD ["/bin/bash", "/start_service.sh"]