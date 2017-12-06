#!/bin/sh

rm -Rf /tmp/openjdk

git clone https://github.com/docker-library/openjdk.git /tmp/openjdk

for v in $(find /tmp/openjdk | grep 'Dockerfile' | sed 's|/Dockerfile||g' | sed 's|/tmp/openjdk/||g' | sed 's|/|-|g'); do
	rm -Rf $v
	mkdir $v
	cp dynamic-memory-opts $v/
	cp entrypoint.sh $v/

	cat <<EOT >> $v/Dockerfile
FROM openjdk:$v

ADD dynamic-memory-opts /usr/bin/dynamic-memory-opts
ADD entrypoint.sh /tmp/entrypoint.sh

ENTRYPOINT ["/tmp/entrypoint.sh"]
EOT

	cd $v
	docker pull openjdk:$v
	docker build -t clockworksoul/java-for-k8s:$v .
	docker push clockworksoul/java-for-k8s:$v

	docker rmi clockworksoul/java-for-k8s:$v
	docker rmi openjdk:$v
	cd ..
done

rm -Rf /tmp/openjdk