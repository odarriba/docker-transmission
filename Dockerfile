FROM odarriba/base:latest
MAINTAINER Óscar de Arriba <odarriba@gmail.com>

# Install transmission
RUN apt-get update && \
    apt-get install build-essential automake autoconf libtool pkg-config intltool libcurl4-openssl-dev \
    	libglib2.0-dev libevent-dev libminiupnpc-dev libminiupnpc5 libappindicator-dev && \
    apt-get clean && \
    rm -rf /tmp/*

WORKDIR /tmp

RUN wget http://download.transmissionbt.com/files/transmission-2.84.tar.xz && \
	tar xf transmission-2.84.tar.xz && \
	cd transmission-2.84 && \
	./configure -q --enable-daemon --disable-gtk --disable-mac && º
	make -s && \
	make install

COPY transmission-daemon /etc/init.d/transmission-daemon
COPY start_service.sh /start_service.sh

RUN chmod +x /etc/init.d/transmission-daemon && \
	chown root:root /etc/init.d/transmission-daemon && \
	adduser --disabled-password transmission && \


VOLUME ["/downloads", "/incomplete_downloads"]

EXPOSE 9091 51413/tcp 51413/udp

CMD ["/start_service.sh"]