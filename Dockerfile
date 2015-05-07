# Debian wheezy with Oracle JDK 8 

FROM debian:wheezy
MAINTAINER João Antonio Ferreira <joao.parana@gmail.com>

# Update distro and install JDK 8 from Oracle
RUN echo "===> add webupd8 repository..."  && \
    echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list  && \
    echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list  && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886  && \
    apt-get update && \
    apt-get upgrade -y && \
    echo "===> install Java"  && \
    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections  && \
    echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections  && \
    DEBIAN_FRONTEND=noninteractive  apt-get install -y --force-yes oracle-java8-installer oracle-java8-set-default  && \
    apt-get clean all && \
    rm -rf /var/lib/apt/lists/*

RUN echo "===> installing locales..." && \
    apt-get install locales -y && \
    echo "===> update-locale to C.UTF-8 LC_MESSAGES=POSIX ..." && \
#   update-locale LANG=C.UTF-8 LC_MESSAGES=POSIX && \
    update-locale LANG=C.UTF-8 LC_MESSAGES=POSIX && \
    echo "===> locale-gen pt_BR.UTF-8 ..." && \
#   locale-gen en_US.UTF-8 && \
    locale-gen pt_BR.UTF-8 && \
    echo "===> dpkg-reconfigure locales ..." && \
    dpkg-reconfigure locales && \
    echo "===> clean-up ..." && \
    apt-get clean all && \
    rm -rf /var/lib/apt/lists/*
