# !bin/bash

# wait for mysql to start
# Install Wordpress
if [ ! -f /var/www/html/wp-config.php ]; then
    wp config create --dbname=$mysql_database --dbuser=$mysql_user \
        --dbpass=$mysql_pass --dbhost=$mysql_host --allow-root  --skip-check
    sleep 10

    wp core install --url=$domain_name --title="Inception" --admin_user=$wordpress_admin \
        --admin_password=$wordpress_admin_password --admin_email=$wordpress_admin_email \
        --allow-root

    wp user create $user $user_email --role=author --user_pass=$user_pass --allow-root

fi
exec "$@"
