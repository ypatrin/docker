FROM ubuntu:22.04

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

RUN apt-get update \
    && apt-get install -y systemd systemd-sysv && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && cd /lib/systemd/system/sysinit.target.wants/ && ls | grep -v systemd-tmpfiles-setup | xargs rm -f $1 \
    rm -f /lib/systemd/system/multi-user.target.wants/* \
    && rm -f /etc/systemd/system/*.wants/* \
    && rm -f /lib/systemd/system/local-fs.target.wants/* \
    && rm -f /lib/systemd/system/sockets.target.wants/*udev* \
    && rm -f /lib/systemd/system/sockets.target.wants/*initctl* \
    && rm -f /lib/systemd/system/basic.target.wants/* \
    && rm -f /lib/systemd/system/anaconda.target.wants/* \
    && rm -f /lib/systemd/system/plymouth* \
    && rm -f /lib/systemd/system/systemd-update-utmp*

# UNMINIMIZE
RUN yes | unminimize

RUN apt-get update && apt-get install -y ubuntu-server landscape-common\
    && apt-get install -y apt-utils apt-doc aptitude synaptic wajig dpkg-dev gnupg gnupg2 gnupg1 \
    && apt-get -y upgrade \
    && apt-get install -y lsb-release ca-certificates apt-transport-https software-properties-common sudo \
    && update-ca-certificates \
    && apt-get install -y gcc g++ make autoconf dpkg-dev dpkg pkgconf xdg-utils net-tools curl wget vim nano tar man openssl openssh-server gettext bzip2 tar libtool \
    && systemctl enable ssh
    
RUN sh -c 'echo "\nThis service is hosted by ApplicationHubs.\nhttps://applicationhubs.com\n\nIf you have any questions or need help, \nplease contact us at support@applicationhubs.com \n" > /etc/motd'

VOLUME [ "/sys/fs/cgroup" ]

CMD ["/lib/systemd/systemd"]
