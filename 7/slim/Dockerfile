FROM python:3.10-slim
MAINTAINER Michael Hirschler <michael@hirschler.me>

RUN groupadd --gid 1000 thumbor \
    && useradd --uid 1000 --gid thumbor --shell /bin/sh thumbor

RUN mkdir /usr/local/thumbor
ENV HOME /usr/local/thumbor
ENV PATH $PATH:/usr/local/thumbor/.local/bin
ENV OPTIMIZERS "['thumbor.optimizers.jpegtran']"

RUN apt-get update \
    && apt-get install --yes --quiet --no-install-recommends \
        gcc g++ python3-dev python3-all-dev \
        # libraries: py3exiv2 deps
        libexiv2-dev libboost-python-dev \
        # libraries: pycurl deps (libcurl4 is required at runtime)
        libcurl4-openssl-dev libgnutls28-dev libssl-dev libcurl4 \
        # libraries: cairosvg deps (libcairo2 is required at runtime)
        libffi-dev libcairo2 \
        # extensions
        libjpeg-progs gifsicle ffmpeg \
    && ln -s /usr/lib/x86_64-linux-gnu/libboost_python39.so /usr/local/lib/libboost_python310.so \
    && pip install --user --no-cache-dir cairosvg pycurl py3exiv2 thumbor[all]==7.5.2 envtpl==0.7.2 \
    && apt-get autoremove --yes gcc g++ libffi-dev python3-dev python3-all-dev libcurl4-openssl-dev libgnutls28-dev libexiv2-dev \
    && rm -rf /var/lib/apt/lists/* \
    && chown -R thumbor:thumbor /usr/local/thumbor

WORKDIR /usr/local/thumbor
COPY --chown=thumbor:thumbor thumbor.conf.tpl /usr/local/etc/thumbor.conf.tpl
COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["thumbor"]

EXPOSE 8888
