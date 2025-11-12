# sleep 10
set -ex

mysqld &

until mysqladmin ping --silent; do
    sleep 1
done

mysql -u root -p"${mysql_pass}" -e "CREATE DATABASE IF NOT EXISTS ${mysql_database};"
mysql -u root -p"${mysql_pass}" -e "CREATE USER IF NOT EXISTS '${mysql_user}' IDENTIFIED BY '${mysql_pass}';"
mysql -u root -p"${mysql_pass}" -e "GRANT ALL PRIVILEGES ON ${mysql_database}.* TO ${mysql_user};"
mysql -u root -p"${mysql_pass}" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${mysql_pass}';"
mysql -u root -p"${mysql_pass}" -e "FLUSH PRIVILEGES";

mysqladmin -u root -p"${mysql_pass}" shutdown

exec "$@"