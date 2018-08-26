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
COPY conf/thumbor.conf.tpl /app/thumbor.conf.tpl

CMD ["thumbor"]

EXPOSE 8888
