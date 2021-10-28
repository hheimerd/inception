#!/bin/sh

# /usr/bin/mysql_install_db --datadir="/var/lib/mysql"

/etc/init.d/mariadb setup

echo '/etc/init'
service mysql start

mysql -u root --skip-password -e  "CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;"

# /etc/init.d/mysql start


# sudo mysql  < /init.sql 

mysql -u root  < /tmp/init.sql

mysql -u root --skip-password -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';"

service mysql stop

echo end
# /usr/bin/mysql_secure_installation