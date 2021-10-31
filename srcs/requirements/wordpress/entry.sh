
chmod -R +rw /var/www

envsubst '\$DB_NAME \$DB_USER \$DB_PASSWORD \$DB_HOST' < /tmp/wp-config.php > /var/www/wp-config.php

exec "$@"
