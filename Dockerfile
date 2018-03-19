FROM alpine
MAINTAINER Armin Pipp <armin@pipp.at>
# 03/2018

RUN apk add --no-cache mosquitto-clients && \
    ln -s /usr/bin/mosquitto_pub /usr/local/bin/pub && \
    ln -s /usr/bin/mosquitto_sub /usr/local/bin/sub

RUN mkdir /scripts
ADD mosquitto_sub  /scripts/
ADD mosquitto_pub  /scripts/

VOLUME /opt/certs 

# Handles CTRL+C in container (ie if subscribe to topic)
RUN apk add --no-cache tini
# Tini is now available at /sbin/tini
ENTRYPOINT ["/sbin/tini", "--"]

