FROM debian:bullseye

RUN apt-get update && \
apt-get install -y nginx openssl

COPY ./conf/default.conf /etc/nginx/sites-available/default

EXPOSE  80


CMD ["nginx", "-g", "daemon off;"]

