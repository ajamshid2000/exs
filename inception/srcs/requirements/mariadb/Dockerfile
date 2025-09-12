FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

COPY ./tools/script.sh /docker-entrypoint-initdb.d/script.sh
RUN chmod +x /docker-entrypoint-initdb.d/script.sh

EXPOSE 3306
# RUN sh /docker-entrypoint-initdb.d/script.sh
CMD ["mysqld_safe"]
