FROM centos:centos7

MAINTAINER John Gasper <jgasper@unicon.net>

ENV JAVA_HOME=/opt/openjdk7

RUN java_version=8.0.131; \ 
    zulu_version=8.21.0.1; \   
    yum update -y \
    && yum install -y wget tar \
    && yum clean all \
    \
    && echo 'Downloading the OpenJDK Zulu...' \ 
    && wget -q http://cdn.azul.com/zulu/bin/zulu$zulu_version-jdk$java_version-linux_x64.tar.gz \
    && echo "1931ed3beedee0b16fb7fd37e069b162  zulu$zulu_version-jdk$java_version-linux_x64.tar.gz" | md5sum -c - \
    && tar -zxvf zulu$zulu_version-jdk$java_version-linux_x64.tar.gz -C /opt \
    && ln -s /opt/zulu$zulu_version-jdk$java_version-linux_x64 $JAVA_HOME \
    && rm zulu$zulu_version-jdk$java_version-linux_x64.tar.gz
