FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-client && \
    rm -rf /var/lib/apt/lists/*
# RUN chmod 777 /run/mysqld/mysqld.sock
RUN mkdir -p /run/mysqld
RUN chown mysql:mysql /run/mysqld

RUN sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf 

COPY ./tools/script.sh /docker-entrypoint-initdb.d/script.sh
RUN chmod +x /docker-entrypoint-initdb.d/script.sh

# EXPOSE 3306
# RUN sh /docker-entrypoint-initdb.d/script.sh
ENTRYPOINT ["sh", "/docker-entrypoint-initdb.d/script.sh"]
CMD ["mysqld"]
