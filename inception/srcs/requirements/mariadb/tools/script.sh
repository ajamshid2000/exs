# sleep 10
set -ex
echo ">>> Running MariaDB init script..."

mysqld &

until mysqladmin ping --silent; do
    sleep 1
done

echo ">>> after running mysqld"

mysql -e "CREATE DATABASE IF NOT EXISTS ${mysql_database};"
mysql -e "CREATE USER IF NOT EXISTS '${mysql_user}' IDENTIFIED BY '${mysql_pass}';"
mysql -e "GRANT ALL PRIVILEGES ON ${mysql_database}.* TO ${mysql_user};"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${mysql_pass}';"
mysql -u root -p"${mysql_pass}" -e "FLUSH PRIVILEGES";

mysqladmin -u root -p"${mysql_pass}" shutdown

echo ">>> ending MariaDB init script..."

exec "$@"