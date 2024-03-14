FROM debian:bullseye
RUN apt-get update -y
RUN apt-get install mariadb-server -y
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/script.sh /bin/
RUN chmod +x /bin/script.sh

CMD ["script.sh", "mysqld_safe"];