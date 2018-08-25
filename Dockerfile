FROM apsl/thumbor:6.4.2

ENV HOME /usr/src/app
ENV SHELL bash
ENV WORKON_HOME /usr/src/app
WORKDIR /usr/src/app
RUN apt-get install -y --no-install-recommends pngquant
WORKDIR /usr/src/app
RUN pip install --use-wheel --trusted-host None --no-cache-dir thumbor-plugins
RUN echo "PNGQUANT_PATH = '/usr/bin/pngquant'" >> /usr/src/app/thumbor.conf.tpl
RUN echo "PNGQUANT_SPEED = 1" >> /usr/src/app/thumbor.conf.tpl
ENV OPTIMIZERS="['thumbor_plugins.optimizers.pngquant']"
ENV DETECTORS="['thumbor.detectors.face_detector']"
#ENV OPTIMIZERS="['thumbor.optimizers.jpegtran']"

