FROM unicon/grouper-api:2.3.0


RUN yum install --assumeyes \
      https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
RUN yum install --assumeyes postgresql96-server


# install server
RUN yum install -y postgresql96 postgresql96-server postgresql96-contrib postgresql96-libs

# initialize DB data files
RUN su - postgres -c '/usr/pgsql-9.6/bin/initdb -D /var/lib/pgsql/data'

# set permissions to allow logins, trust the bridge, this is the default for docker YMMV
RUN echo "host    all             all             0.0.0.0/0           md5" >> /var/lib/pgsql/data/pg_hba.conf

#listen on all interfaces
RUN echo "listen_addresses='*'" >> /var/lib/pgsql/data/postgresql.conf

COPY seed-data/ /seed-data/
COPY conf/ /opt/grouper.apiBinary-2.3.0/conf/

#expose 5432
EXPOSE 5432

### Creates initial empty database and database user
# Switches user executing next command
USER postgres

# set correct collate value
RUN /usr/pgsql-9.6/bin/initdb --auth ident  --lc-collate C --locale en_US.UTF-8 --pgdata /var/lib/pgsql/9.6/data

# Creates user and database
# change postgresl user password
RUN /usr/pgsql-9.6/bin/pg_ctl -D /var/lib/pgsql/data -w start \
 && /usr/pgsql-9.6/bin/psql --command "CREATE USER de WITH SUPERUSER PASSWORD 'testpassword';" \
 && /usr/pgsql-9.6/bin/psql --command "ALTER USER postgres PASSWORD 'testpassword';" \
 && /usr/pgsql-9.6/bin/createdb -O de de \
 && /usr/pgsql-9.6/bin/createdb -O de metadata \
 && /usr/pgsql-9.6/bin/createdb -O de notifications \
 && /usr/pgsql-9.6/bin/createdb -O de permissions \
 && /usr/pgsql-9.6/bin/createdb -O de grouper \
 && /usr/pgsql-9.6/bin/psql grouper < /seed-data/sisData.sql \
  && /usr/pgsql-9.6/bin/psql grouper < /seed-data/grouper.sql \
 && /usr/pgsql-9.6/bin/pg_ctl -D /var/lib/pgsql/data -w stop

USER root
RUN cd /opt/grouper.apiBinary-$GROUPER_VERSION \
    && mkdir logs

USER postgres

### Add VOLUMEs to allow persistence of database
VOLUME  ["/usr/pgsql-9.6", "/var/lib/pgsql/data"]

### Starts database as soon as container is being started
CMD ["/usr/pgsql-9.6/bin/postgres", "-D", "/var/lib/pgsql/data/", "-i"]


### run this scripts to initiate db:
# cd /opt/grouper.apiBinary-$GROUPER_VERSION
# bin/gsh -registry -check -runscript -noprompt
# bin/gsh /seed-data/bootstrap.gsh
