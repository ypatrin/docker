FROM ubuntu:22.04
#FROM --platform=linux/x86_64 ubuntu:22.04

ENV LC_ALL C
ENV TZ UTC
ENV DEBIAN_FRONTEND noninteractive

RUN sed -i 's/# deb/deb/g' /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y tzdata locales \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && dpkg-reconfigure tzdata \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
    && sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
    && echo 'LANG="en_US.UTF-8"'>/etc/default/locale \
    && dpkg-reconfigure locales \
    && update-locale LANG=en_US.UTF-8

ENV LANG en_US.utf8
ENV LANGUAGE en_US.utf8
ENV LC_ALL en_US.utf8

# UNMINIMIZE
#RUN yes | unminimize

RUN apt-get update && apt-get install -y ubuntu-server landscape-common\
    && apt-get install -y apt-utils apt-doc aptitude synaptic wajig dpkg-dev gnupg gnupg2 gnupg1 \
    && apt-get -y upgrade \
    && apt-get install -y lsb-release ca-certificates apt-transport-https software-properties-common sudo \
    && update-ca-certificates \
    && apt-get install -y gcc g++ make autoconf dpkg-dev dpkg pkgconf xdg-utils net-tools curl wget vim nano tar man openssl openssh-server gettext bzip2 tar libtool

# Install apache2
RUN apt install -y apache2

# Install php
RUN add-apt-repository ppa:ondrej/php
RUN apt update

# Install php 7.1
RUN apt install -y php7.1-common php7.1-intl php7.1-cli php7.1-fpm php7.1-dev php7.1-pdo php7.1-pdo-mysql php7.1-mysql \
    php7.1-mysqli php7.1-curl php7.1-xml php7.1-xsl php7.1-xmlrpc php7.1-simplexml php7.1-yaml php7.1-xmlwriter \
    php7.1-xmlreader php7.1-ctype php7.1-zip php7.1-mbstring php7.1-gd php7.1-memcached php7.1-sockets \
    php7.1-soap php7.1-iconv php7.1-ssh2 

# Install php 7.2
RUN apt install -y php7.2-common php7.2-intl php7.2-cli php7.2-fpm php7.2-dev php7.2-pdo php7.2-pdo-mysql php7.2-mysql \
    php7.2-mysqli php7.2-curl php7.2-xml php7.2-xsl php7.2-xmlrpc php7.2-simplexml php7.2-yaml php7.2-xmlwriter \
    php7.2-xmlreader php7.2-ctype php7.2-zip php7.2-mbstring php7.2-gd php7.2-memcached php7.2-sockets \
    php7.2-soap php7.2-iconv php7.2-ssh2 

# Install php 7.3
RUN apt install -y php7.3-common php7.3-intl php7.3-cli php7.3-fpm php7.3-dev php7.3-pdo php7.3-pdo-mysql php7.3-mysql \
    php7.3-mysqli php7.3-curl php7.3-xml php7.3-xsl php7.3-xmlrpc php7.3-simplexml php7.3-yaml php7.3-xmlwriter \
    php7.3-xmlreader php7.3-ctype php7.3-zip php7.3-mbstring php7.3-gd php7.3-memcached php7.3-sockets \
    php7.3-soap php7.3-iconv php7.3-ssh2 

# Install php 7.4
RUN apt install -y php7.4-common php7.4-intl php7.4-cli php7.4-fpm php7.4-dev php7.4-pdo php7.4-pdo-mysql php7.4-mysql \
    php7.4-mysqli php7.4-curl php7.4-xml php7.4-xsl php7.4-xmlrpc php7.4-simplexml php7.4-yaml php7.4-xmlwriter \
    php7.4-xmlreader php7.4-ctype php7.4-zip php7.4-mbstring php7.4-gd php7.4-memcached php7.4-sockets \
    php7.4-soap php7.4-iconv php7.4-ssh2 

# Install php 8.1
RUN apt install -y php8.1-common php8.1-intl php8.1-cli php8.1-fpm php8.1-dev php8.1-pdo php8.1-pdo-mysql php8.1-mysql \
    php8.1-mysqli php8.1-curl php8.1-xml php8.1-xsl php8.1-xmlrpc php8.1-simplexml php8.1-yaml php8.1-xmlwriter \
    php8.1-xmlreader php8.1-ctype php8.1-zip php8.1-mbstring php8.1-gd php8.1-memcached php8.1-sockets \
    php8.1-soap php8.1-iconv php8.1-ssh2

# Configure apache2 & enable php7.4
COPY apache2.conf /etc/apache2/apache2.conf
RUN a2enmod proxy_fcgi setenvif rewrite

# Composer
RUN curl https://getcomposer.org/download/2.2.5/composer.phar --output /usr/bin/composer
RUN chown www-data /usr/bin/composer
RUN chown -R www-data /usr/bin
RUN chmod -R 0777 /usr/bin/composer

# Install cron
RUN apt-get update && apt-get -y install -qq --force-yes cron

# Mount dirs
VOLUME [ "/var/www" ]
VOLUME [ "/etc/apache2/docker-sites-config" ]

# Startup system
COPY start.sh /start.sh
CMD ["./start.sh"]

EXPOSE 80 443