#!/bin/sh

/usr/sbin/service cron start
/usr/sbin/service php7.0-fpm start
/usr/sbin/service php7.1-fpm start
/usr/sbin/service php7.2-fpm start
/usr/sbin/service php7.3-fpm start
/usr/sbin/service php7.4-fpm start
/usr/sbin/service php8.1-fpm start
/usr/sbin/service apache2 start
/usr/sbin/service memcached start

tail -f /dev/null
