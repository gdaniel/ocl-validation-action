FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

SHELL ["/bin/bash", "-c"] 

RUN apt-get update && \
		apt-get upgrade -y && \
		apt-get install wget -y && \
		apt-get install tar -y && \
		apt-get install openjdk-17-jdk -y && \
		apt-get install git -y

RUN cd /opt && \
	wget -O- https://dlcdn.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.tar.gz | tar -xzv && \
	chmod +x /opt/apache-maven-3.8.6/bin/mvn && \
	ln -s /opt/apache-maven-3.8.6/bin/mvn /usr/local/bin

COPY scripts /scripts

RUN scripts/build-dependencies.sh

WORKDIR /

ENTRYPOINT ["/scripts/entrypoint.sh"]