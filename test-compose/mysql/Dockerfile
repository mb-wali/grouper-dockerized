FROM ubuntu:trusty

MAINTAINER John Gasper <jgasper@unicon.net>
 
COPY seed-data/ /

#MySql shamelessly stolen from https://github.com/dockerfile/mysql/blob/master/Dockerfile
RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server-5.6 && \
  sed -i 's/^\(bind-address\s.*\)/# \1/' /etc/mysql/my.cnf && \
  sed -i 's/^\(log_error\s.*\)/# \1/' /etc/mysql/my.cnf && \
  sed -i 's/\[mysqld\]/\[mysqld\]\ncharacter_set_server = utf8/' /etc/mysql/my.cnf && \
  sed -i 's/\[mysqld\]/\[mysqld\]\ncollation_server = utf8_general_ci/' /etc/mysql/my.cnf && \
  cat  /etc/mysql/my.cnf && \
  echo "mysqld_safe &" > /tmp/config && \
  echo "mysqladmin --silent --wait=30 ping || exit 1" >> /tmp/config && \
  echo "mysql -e 'GRANT ALL PRIVILEGES ON *.* TO \"root\"@\"%\" WITH GRANT OPTION;'" >> /tmp/config && \
  echo "mysql -e 'CREATE DATABASE grouper CHARACTER SET utf8 COLLATE utf8_bin;'" >> /tmp/config && \
  bash /tmp/config && \
  rm -f /tmp/config && \
  mysql grouper < /sisData.sql
