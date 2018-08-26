FROM ubuntu:16.04

RUN \
    DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y \
        build-essential \
        apt-utils \
        ssl-cert \
        apache2 \
        apache2-utils \
        apache2-dev \
        libapache2-mod-perl2 \
        libapache2-mod-perl2-dev \
        libcgi-pm-perl \
        liblocal-lib-perl \
        cpanminus \
        libexpat1-dev \
        libssl-dev \
        mysql-client \
        libmysqlclient-dev \
        libapreq2-dev \
        zip && \
    cpanm DBD::mysql && \
    cpanm JSON && \
    a2enmod cgid && \
    a2enmod rewrite && \
    a2dissite 000-default && \
    apt-get update -y && \
    apt-get upgrade -y && \
    apt-get -y clean

COPY localhost.conf /etc/apache2/sites-enabled/localhost.conf
COPY cgi-bin/ /var/www/cgi-bin
COPY html2/ /var/www/html2
RUN chmod 777 /var/www/cgi-bin/*
RUN ls -lR /var/www/

RUN ls -lrt /bin/

RUN ls -lRt /var/log/

RUN find / -type f -name CGI.pm
RUN find / -type f -name LWP.pm
RUN find / -type f -name JSON.pm

RUN env

VOLUME ["/var/www/html2"]

EXPOSE 80
EXPOSE 11151
EXPOSE 11152

