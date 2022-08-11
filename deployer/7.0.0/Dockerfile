FROM --platform=$BUILDPLATFORM ubuntu:22.04

ENV TZ=UTC
ARG DEBIAN_FRONTEND=noninteractive

#update system and install sofware
RUN apt update && apt -y upgrade
RUN apt install -y git lsb-release ca-certificates apt-transport-https software-properties-common && update-ca-certificates
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt install -y gcc g++ make autoconf dpkg-dev dpkg pkgconf tzdata file re2c xdg-utils net-tools curl wget nano \
    openssl openssh-client mysql-client gettext bzip2 zip tar llvm libtool

RUN add-apt-repository ppa:ondrej/php && apt update
RUN apt install -y php8.1-common php8.1-intl php8.1-cli php8.1-dev php8.1-pdo php8.1-pdo-mysql php8.1-mysql  \
    php8.1-mysqli php8.1-curl php8.1-xml php8.1-xsl php8.1-xmlrpc php8.1-simplexml php8.1-yaml php8.1-xmlwriter \
    php8.1-xmlreader php8.1-ctype php8.1-zip php8.1-mbstring php8.1-gd php8.1-memcached php8.1-sockets php8.1-soap \
    php8.1-iconv php8.1-ssh2

#deployer
RUN curl -o /usr/local/bin/dep -LO https://github.com/deployphp/deployer/releases/download/v7.0.0/deployer.phar && chmod +x /usr/local/bin/dep

## Composer
RUN curl https://getcomposer.org/download/2.2.5/composer.phar --output /usr/bin/composer
RUN chown www-data /usr/bin/composer
RUN chown -R www-data /usr/bin
RUN chmod -R 0777 /usr/bin/composer

RUN useradd --home-dir /home/deployer --groups sudo --create-home --shell /bin/bash deployer
USER deployer

RUN eval `ssh-agent -s`

WORKDIR /app
CMD ["/usr/local/bin/dep"]