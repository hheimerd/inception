#!/bin/sh

/usr/bin/mysql_install_db --datadir="/var/lib/mysql"

mysqld_safe &

is_mysql_alive() {
  mysql > /dev/null 2>&1
  returned_value=$?
  echo ${returned_value}
}

until [ "$(is_mysql_alive)" -eq 0 ]
do
  sleep 1
  echo "Waiting for MySQL to be ready..." 
done

mysql -uroot --skip-password -e  "
CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY '$DB_ROOT_PASSWORD';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;"


mysql -uroot --skip-password -e  "CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;"

(mysql --user="root" --skip-password -D $DB_NAME) < /tmp/init.sql

/etc/init.d/mysql stop

echo end
exec "$@"