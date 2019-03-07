#!/bin/sh

if [ ! -f /usr/local/etc/thumbor.conf ]; then
  envtpl /usr/local/etc/thumbor.conf.tpl  --allow-missing --keep-template --output /usr/local/thumbor/thumbor.conf
fi

# If log level is defined we configure it, else use default log_level = info
if [ -n "$LOG_LEVEL" ]; then
    LOG_PARAMETER="-l $LOG_LEVEL"
fi

# Check if thumbor port is defined -> (default port 8888)
if [ -z ${THUMBOR_PORT+x} ]; then
    THUMBOR_PORT=8888
fi


for f in /docker-entrypoint.init.d/*; do
			case "$f" in
				*.sh) # this should match the set of files we check for below
                    . $f
					break
					;;
			esac
done

if [ "$1" = 'thumbor' ]; then
    exec python -m thumbor/server --port=$THUMBOR_PORT --conf=/usr/local/thumbor/thumbor.conf $LOG_PARAMETER
fi

exec "$@"
