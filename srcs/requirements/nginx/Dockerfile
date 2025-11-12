FROM debian:bullseye

RUN apt-get update && \
apt-get install -y nginx openssl

COPY ./conf/default.conf /etc/nginx/sites-available/default

RUN mkdir -p /etc/ssl/private /etc/ssl/certs && \
    chmod 700 /etc/ssl/private && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/ssl/private/ajamshid.key \
        -out /etc/ssl/certs/ajamshid.crt \
        -subj "/C=FR/ST=ile-de-france/L=paris/O=inception/OU=ajamshid/CN=ajamshid.42.fr"

EXPOSE  443


CMD ["nginx", "-g", "daemon off;"]

