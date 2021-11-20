export APP_DIR=/var/www

envsubst '\$DB_NAME \$DB_USER \$DB_PASSWORD \$DB_HOST' < /tmp/wp-config.php > $APP_DIR/wp-config.php

if [ ! "$(ls -A $APP_DIR/wp-admin)" ]; then     
  cp -r /tmp/wordpress/* $APP_DIR/
fi


DB_IS_STARTED=1
while [ $DB_IS_STARTED != 0 ]; do
  echo "waiting for db to be created";
  wp --path="$APP_DIR" plugin install redis-cache --activate --allow-root > /dev/null 2>&1;
  DB_IS_STARTED=$?;
  sleep 1;
done;

chmod -R +rw $APP_DIR
chown -R www-data:www-data $APP_DIR

exec "$@"
