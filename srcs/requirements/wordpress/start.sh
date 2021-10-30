
chmod -R +rw /var/www

cp /tmp/wp-config.php /var/www/wp-config.php

/usr/sbin/php-fpm7.3 -F -R