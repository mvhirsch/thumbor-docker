FROM alpine:3.8
MAINTAINER Michael Hirschler <michael.vhirsch@gmail.com>
RUN apk add --no-cache --virtual .build-deps \
        cairo-dev \
        curl-dev \
        gcc \
        libc-dev \
        libjpeg-turbo-dev \
        libffi-dev \
        libressl-dev \
        libwebp-dev \
        python-dev \
        tiff-dev \
        zlib-dev \
    && apk add --no-cache \
        cairo \
        coreutils \
        exiftool \
        ffmpeg \
        gifsicle \
        imagemagick \
        libcurl \
        libjpeg-turbo  \
        libvpx \
        libwebp \
        python \
        py-pip \
        tiff \
        zlib \
    && pip --disable-pip-version-check install thumbor envtpl tc_aws \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/* \
    && rm -rf /root/.cache \
    && thumbor --version

WORKDIR /usr/local/thumbor

COPY thumbor.conf.tpl /usr/local/etc/thumbor.conf.tpl
COPY docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 8888
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["thumbor"]

