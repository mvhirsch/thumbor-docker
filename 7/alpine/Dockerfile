FROM python:3.10-alpine
MAINTAINER Michael Hirschler <michael.vhirsch@gmail.com>

RUN apk add --update --no-cache \
        cairo \
        exiftool \
        gifsicle \
        openjpeg-tools \
        imagemagick \
        libcurl \
        libjpeg-turbo  \
        libvpx \
        libwebp \
        tiff \
        zlib \
        libc-dev binutils \
      && rm -rf /var/cache/apk/*

RUN apk add --update --no-cache --virtual .build-deps \
      blas-dev \
      eigen-dev \
      ffmpeg-dev \
      freetype-dev \
      glew-dev \
      gstreamer-dev \
      harfbuzz-dev \
      hdf5-dev \
      lapack-dev \
      libdc1394-dev \
      libgphoto2-dev \
      libtbb-dev \
      mesa-dev \
      openexr-dev \
      openjpeg-dev \
      py3-setuptools \
      qt5-qtbase-dev \
      vtk-dev \
      cmake \
    	samurai \
      python3-dev \
      cairo-dev \
      curl-dev \
      gcc \
      g++ \
      libjpeg-turbo-dev \
      libffi-dev \
      libressl-dev \
      libwebp-dev \
      python3-dev \
      tiff-dev \
      zlib-dev \
    && pip install --no-cache numpy \
    && pip install --no-cache-dir thumbor==7.0.1 envtpl==0.6.0 \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/* \
    && rm -rf /root/.cache

COPY thumbor.conf.tpl /usr/local/etc/thumbor.conf.tpl
COPY docker-entrypoint.sh /docker-entrypoint.sh

WORKDIR /usr/local/thumbor

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["thumbor"]

EXPOSE 8888
