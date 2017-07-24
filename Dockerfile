# Phalcon
#
# VERSION               0.0.1

FROM     ubuntu:16.04
MAINTAINER Dreamsxin "dreamsxin@qq.com"

# make sure the package repository is up to date
RUN apt-get update

RUN apt-get install -y openssh-server vim
RUN mkdir /var/run/sshd
RUN echo 'root:phalcon' |chpasswd

RUN apt-get install -y apache2 libapache2-mod-php7.0 php7.0 php7.0-dev php7.0-pgsql re2c

ADD ./cphalcon7/ /var/www/cphalcon7/
RUN ls /var/www
RUN ls /var/www/cphalcon7/ext
RUN  cd /var/www/cphalcon7/ext && phpize && ./configure && make && make install
ADD phalcon.ini /etc/php/7.0/mods-available/phalcon.ini
RUN ln -s /etc/php/7.0/mods-available/phalcon.ini /etc/php/7.0/apache2/conf.d/

Add ./demo /var/www/demo/
ADD demo.conf /etc/apache2/sites-available/
RUN a2ensite demo
RUN a2enmod rewrite

EXPOSE 80 22
ENTRYPOINT /etc/init.d/apache2 start && /etc/init.d/ssh start && /bin/bash
