FROM centos:centos7

MAINTAINER John Gasper <jgasper@unicon.net>

ENV JAVA_HOME=/opt/jdk1.7.0_79

RUN java_version=7u79; \    
    yum update -y \
    && yum install -y wget tar \
    && yum clean all \
    \
    && echo 'Downloading the JDK...' \ 
    && wget -q --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    http://download.oracle.com/otn-pub/java/jdk/$java_version-b15/jdk-$java_version-linux-x64.tar.gz \
    && echo "9222e097e624800fdd9bfb568169ccad  jdk-$java_version-linux-x64.tar.gz" | md5sum -c - \
    && tar -zxvf jdk-$java_version-linux-x64.tar.gz -C /opt \
    && rm jdk-$java_version-linux-x64.tar.gz
