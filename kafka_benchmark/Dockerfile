FROM debian:stretch
# update sources
RUN sed -i s/deb.debian.org/archive.debian.org/g /etc/apt/sources.list
RUN sed -i 's|security.debian.org|archive.debian.org/|g' /etc/apt/sources.list
RUN sed -i '/stretch-updates/d' /etc/apt/sources.list

RUN apt update
RUN apt install -y wget
RUN apt install -y net-tools tcpdump openjdk-8-jdk

ENV JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk-amd64"
RUN wget https://downloads.apache.org/kafka/3.4.0/kafka_2.13-3.4.0.tgz
RUN tar zxf kafka_2.13-3.4.0.tgz
WORKDIR /kafka_2.13-3.4.0
RUN mkdir -p /data/kafka
COPY ./kafka-start.sh ./
RUN chmod a+x ./kafka-start.sh
CMD ["sh", "./kafka-start.sh"]