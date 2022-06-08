#!/bin/sh

/usr/sbin/service cron start
/usr/sbin/service php7.1-fpm start
/usr/sbin/service apache2 start

tail -f /dev/null
