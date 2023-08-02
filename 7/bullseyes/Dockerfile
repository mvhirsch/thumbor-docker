FROM python:3.10.12
MAINTAINER Michael Hirschler <michael@hirschler.me>

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y autoremove && \
    apt-get install --no-install-recommends -y \
        curl \
        libssl-dev \
        libcurl4-openssl-dev \
        libjpeg-dev \
        libwebp-dev \
        libjpeg-progs \
        zlib1g-dev \
        gifsicle \
        gcc \
        ffmpeg \
        libcairo2-dev \
        build-essential && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

ENV HOME /usr/local/thumbor
ENV SHELL bash
ENV WORKON_HOME /usr/local/thumbor
WORKDIR /usr/local/thumbor

RUN pip3 install --no-cache-dir wheel && \
    pip3 install --no-cache-dir thumbor[all]==7.5.2 envtpl==0.7.2

COPY thumbor.conf.tpl /usr/local/thumbor/thumbor.conf.tpl
COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["thumbor"]

EXPOSE 8888
