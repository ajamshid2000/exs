FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y mariadb-server 
# && \
#     rm -rf /var/lib/apt/lists/*
# RUN chmod 777 /run/mysqld/mysqld.sock
RUN mkdir -p /run/mysqld
RUN chown mysql:mysql /run/mysqld

COPY ./tools/script.sh /docker-entrypoint-initdb.d/script.sh
RUN chmod +x /docker-entrypoint-initdb.d/script.sh

# EXPOSE 3306
ENTRYPOINT ["sh", "/docker-entrypoint-initdb.d/script.sh"]
CMD ["mysqld_safe"]
