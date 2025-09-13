# sleep 10
set -ex
echo ">>> Running MariaDB init script..."

mysqld &

until mysqladmin ping --silent; do
    sleep 1
done

echo ">>> after running mysqld"

mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${mysql_database};"
# mysql -u root -e "CREATE USER IF NOT EXISTS '${mysql_user}' IDENTIFIED BY '${pass}';"
# mysql -u root -e "GRANT ALL PRIVILEGES ON ${mysql_database}.* TO ${mysql_user};"
# mysql -u "root" -p${mysql_root_password} -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${mysql_pass}';"
# mysql -u root -e "FLUSH PRIVILEGES;"

mysqladmin shutdown
# mysqladmin -u root -p"${mysql_pass}" shutdown
echo ">>> ending MariaDB init script..."
# Wait for shutdown
# wait "$pid"
exec "$@"