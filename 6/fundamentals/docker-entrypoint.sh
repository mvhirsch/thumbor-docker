#/bin/bash

echo "PNGQUANT_PATH = '/usr/bin/pngquant'" >> /usr/local/thumbor/thumbor.conf
echo "PNGQUANT_SPEED = 3" >> /usr/local/thumbor/thumbor.conf

echo "MOZJPEG_PATH = '/usr/local/bin/mozjpeg'" >> /usr/local/thumbor/thumbor.conf
echo "MOZJPEG_QUALITY = 80" >> /usr/local/thumbor/thumbor.conf
