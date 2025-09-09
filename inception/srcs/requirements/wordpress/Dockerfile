FROM debian:bullseye

# Install PHP-FPM and extensions
RUN apt-get update && apt-get install -y \
    php-fpm \
    php-mysql \
    php-zip \
    php-redis \
    curl \
    vim \
    sendmail && \
    rm -rf /var/lib/apt/lists/*

# Configure PHP-FPM to listen on port 9000 instead of unix socket
RUN sed -i -e 's|listen = .*|listen = 9000|g' /etc/php/7.4/fpm/pool.d/www.conf

# Create runtime dir for php-fpm
RUN mkdir -p /run/php

# Install wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# Setup WordPress files
WORKDIR /var/www/html
RUN wp core download --allow-root && \
    chown -R www-data:www-data /var/www/html

# Run php-fpm in foreground
CMD ["php-fpm7.4", "-F"]
