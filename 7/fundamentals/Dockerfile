FROM debian:bullseye-slim as mozjpeg
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


FROM mvhirsch/thumbor:7.5.2

RUN pip install --user --no-cache-dir thumbor-aws==0.6.0 thumbor-plugins

COPY --from=mozjpeg /usr/local/share/mozjpeg/build /usr/local/share/mozjpeg/build
RUN ln -s /usr/local/share/mozjpeg/build/cjpeg /usr/local/bin/mozjpeg

RUN apt-get update && \
    apt-get install -y --no-install-recommends pngquant && \
    rm -rf /var/lib/apt/lists/*

COPY fundamentals.sh /docker-entrypoint.init.d/
