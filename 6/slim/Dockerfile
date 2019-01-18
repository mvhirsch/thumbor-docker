FROM python:2-slim
MAINTAINER Michael Hirschler <michael.vhirsch@gmail.com>

RUN groupadd --gid 1000 thumbor && \
    useradd --uid 1000 --gid thumbor --shell /bin/sh thumbor
RUN mkdir /usr/local/thumbor && chown thumbor:thumbor /usr/local/thumbor

RUN apt-get update && \
    apt-get install -y -q --no-install-recommends \
        gcc \
        imagemagick webp coreutils gifsicle libvpx? \
        libvpx-dev libimage-exiftool-perl libcairo2-dev \
        ffmpeg libffi-dev \
        libcurl4-gnutls-dev libgnutls28-dev \
        python-dev && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir thumbor==6.7.0 envtpl==0.6.0

COPY thumbor.conf.tpl /usr/local/etc/thumbor.conf.tpl
COPY docker-entrypoint.sh /docker-entrypoint.sh

USER thumbor
WORKDIR /usr/local/thumbor
ENV HOME /usr/local/thumbor

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["thumbor"]

EXPOSE 8888
