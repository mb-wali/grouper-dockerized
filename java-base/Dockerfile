FROM centos:centos7

MAINTAINER John Gasper <jgasper@unicon.net>

ENV JAVA_HOME=/opt/openjdk7

RUN java_version=7.0.95; \    
    yum update -y \
    && yum install -y wget tar \
    && yum clean all \
    \
    && echo 'Downloading the OpenJDK Zulu...' \ 
    && wget -q http://cdn.azul.com/zulu/bin/zulu7.13.0.1-jdk$java_version-linux_x64.tar.gz \
    && echo "00ed5a0c647ddf7ecd3f823cad23a3a8  zulu7.13.0.1-jdk$java_version-linux_x64.tar.gz" | md5sum -c - \
    && tar -zxvf zulu7.13.0.1-jdk$java_version-linux_x64.tar.gz -C /opt \
    && ln -s /opt/zulu7.13.0.1-jdk$java_version-linux_x64 $JAVA_HOME \
    && rm zulu7.13.0.1-jdk$java_version-linux_x64.tar.gz
