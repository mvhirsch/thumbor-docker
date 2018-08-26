FROM python:2-slim
MAINTAINER Michael Hirschler <michael.vhirsch@gmail.com>

RUN apt-get update && \
    apt-get install -y -q --no-install-recommends \
        gcc build-essential \
        imagemagick webp coreutils gifsicle libvpx? \
        libvpx-dev libimage-exiftool-perl libcairo2-dev \
        ffmpeg libffi-dev \
        libcurl4-gnutls-dev libgnutls28-dev \
        python-dev python3-dev && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir thumbor==6.5.2 envtpl==0.6.0

COPY thumbor.conf.tpl /usr/local/etc/thumbor.conf.tpl
COPY docker-entrypoint.sh /docker-entrypoint.sh

CMD ["thumbor"]
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 8888
