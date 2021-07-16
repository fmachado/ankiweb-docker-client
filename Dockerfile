FROM ubuntu:20.04

LABEL maintainer="Fernando Machado fm@fmachado.com"

ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV DISPLAY :0

WORKDIR /opt

RUN set -ex && \
	apt-get update && \
	apt-get install -y --no-install-recommends \
			wget ca-certificates python3.9 python3-qtpy xdg-utils \
			libnss3 libxcomposite1 libxcursor1 libxi6 libxkbcommon-x11-0 libxrandr2 mplayer \
			locales links && \
	rm -rf /var/lib/apt/lists/* && \
	localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

RUN wget --quiet https://github.com/ankitects/anki/releases/download/2.1.44/anki-2.1.44-linux.tar.bz2 && \
	echo "4926c6956f83edc88b6af7e96a77094f553ed721bbaad767049b34bd07a5a505 *anki-2.1.44-linux.tar.bz2" > anki-2.1.44-linux.tar.sha && \
	sha256sum -c anki-2.1.44-linux.tar.sha && \
	tar -xjvf anki-2.1.44-linux.tar.bz2 && \
	rm anki-2.1.44-linux.tar.bz2 && \
	cd /opt/anki-2.1.44-linux && \
	sh ./install.sh

ENTRYPOINT [ "anki", "--no-sandbox" ]
