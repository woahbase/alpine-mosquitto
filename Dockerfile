# syntax=docker/dockerfile:1
#
ARG IMAGEBASE=frommakefile
#
FROM ${IMAGEBASE}
#
RUN set -xe \
    && apk add --no-cache --purge -uU \
        mosquitto \
        mosquitto-libs \
        mosquitto-clients \
    && rm -rf /var/cache/apk/* /tmp/*
#
COPY root/ /
#
VOLUME /mosquitto/
#
EXPOSE 1883 8883 8884 8080 8081
#
ENTRYPOINT ["/init"]
