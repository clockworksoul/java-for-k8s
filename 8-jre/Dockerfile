FROM openjdk:8-jre

ADD dynamic-memory-opts /usr/bin/dynamic-memory-opts
ADD entrypoint.sh /tmp/entrypoint.sh

ENTRYPOINT ["/tmp/entrypoint.sh"]
