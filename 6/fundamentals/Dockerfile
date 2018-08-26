FROM mvhirsch/thumbor:slim
MAINTAINER Michael Hirschler <michael.vhirsch@gmail.com>

USER root

RUN apt-get update && \
    #apt-get install -y --no-install-recommends pngquant mozjpeg && \
    apt-get install -y --no-install-recommends pngquant && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir thumbor-plugins

ENV OPTIMIZERS="['thumbor_plugins.optimizers.pngquant', 'thumbor_plugins.optimizers.mozjpeg']"
#ENV DETECTORS="['thumbor.detectors.face_detector']"
#ENV OPTIMIZERS="['thumbor.optimizers.jpegtran']"

COPY docker-entrypoint.sh /docker-entrypoint.init.d/
USER thumbor
