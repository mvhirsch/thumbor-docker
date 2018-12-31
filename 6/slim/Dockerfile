FROM python:3-slim
MAINTAINER Michael Hirschler <michael.vhirsch@gmail.com>

RUN groupadd --gid 1000 thumbor && \
    useradd --uid 1000 --gid thumbor --shell /bin/sh thumbor
RUN mkdir /usr/local/thumbor && chown thumbor:thumbor /usr/local/thumbor

RUN apt-get update && \
    apt-get install -y -q --no-install-recommends \
        gcc \
        imagemagick webp coreutils gifsicle libvpx? \
        libvpx? libvpx-dev libimage-exiftool-perl libcairo2 libcairo2-dev \
        ffmpeg libffi6 libffi-dev \
        libcurl4-gnutls-dev libgnutls28-dev \
        python python-dev && \
    pip install --no-cache-dir thumbor==6.6.0 envtpl==0.6.0 tc_aws && \
    apt-get remove \
    	gcc \
    	libcairo2-dev \
    	libcurl4-gnutls-dev \
    	libffi-dev \
    	libgnutls28-dev \
    	libvpx-dev \
    	python-dev && \
    rm -rf /var/lib/apt/lists/*

COPY thumbor.conf.tpl /usr/local/etc/thumbor.conf.tpl
COPY docker-entrypoint.sh /docker-entrypoint.sh

USER thumbor
WORKDIR /usr/local/thumbor
ENV HOME /usr/local/thumbor

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["thumbor"]

EXPOSE 8888
