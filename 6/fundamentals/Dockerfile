FROM debian:stretch-slim as mozjpeg
ENV VERSION 3.3.1

RUN apt-get update && \
    apt-get install -y --no-install-recommends autoconf automake checkinstall libpng-dev libtool make nasm pkg-config && \
    rm -rf /var/lib/apt/lists/*

ADD https://github.com/mozilla/mozjpeg/archive/v$VERSION.tar.gz /usr/local/share

WORKDIR /usr/local/share
RUN mkdir mozjpeg && \
    tar --strip-components=1 --extract --file v$VERSION.tar.gz -C mozjpeg mozjpeg-$VERSION/

WORKDIR /usr/local/share/mozjpeg
RUN autoreconf -fiv && \
    mkdir build

WORKDIR /usr/local/share/mozjpeg/build
RUN ../configure && make


# thumbor-fundamentals
FROM mvhirsch/thumbor:slim
MAINTAINER Michael Hirschler <michael.vhirsch@gmail.com>

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends pngquant && \
    rm -rf /var/lib/apt/lists/*

# install jpegtran (with mozjpeg)
COPY --from=mozjpeg /usr/local/share/mozjpeg/build /usr/local/share/mozjpeg/build
RUN ln -s /usr/local/share/mozjpeg/build/cjpeg /usr/local/bin/mozjpeg

RUN pip install --no-cache-dir thumbor-plugins tc_mongodb tc_aws CairoSVG==1.0.22 sentry-sdk==0.10.2

ENV OPTIMIZERS="['thumbor_plugins.optimizers.pngquant', 'thumbor_plugins.optimizers.mozjpeg']"

COPY docker-entrypoint.sh /docker-entrypoint.init.d/
USER thumbor
