
echo ">>> Running MariaDB init script...

mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${mysql_database};"
mysql -u root -e "CREATE USER IF NOT EXISTS '${mysql_user}' IDENTIFIED BY '${pass}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON ${mysql_database}.* TO ${mysql_user};"
mysql -u "root" -p${mysql_root_password} -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${mysql_pass}';"
mysql -u root -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p"${mysql_pass}" shutdown

# Wait for shutdown
wait "$pid"
