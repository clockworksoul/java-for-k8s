FROM openjdk:9-jdk

ADD dynamic-memory-opts /usr/bin/dynamic-memory-opts
ADD entrypoint.sh /tmp/entrypoint.sh

ENTRYPOINT ["/tmp/entrypoint.sh"]
