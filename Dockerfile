FROM ubuntu:16.04
RUN apt-get update && apt-get install build-essential curl wget git -y
RUN wget http://nginx.org/keys/nginx_signing.key && apt-key add nginx_signing.key
RUN echo "deb http://nginx.org/packages/ubuntu/ xenial nginx" >> /etc/apt/sources.list && echo "deb-src http://nginx.org/packages/ubuntu/ xenial nginx" >> /etc/apt/sources.list
RUN apt-get install apt-utils -y
RUN apt-get update && apt-get install nginx -y
RUN apt-get install supervisor -y
COPY ./deploy/nginx/config/web_dev.conf /etc/nginx/config/web_dev.conf
RUN service nginx restart
RUN git clone https://github.com/php/php-src.git php-src
COPY ./deploy/php/compile-php.sh php-src
RUN apt-get install autoconf automake libtool re2c flex bison libxml2-dev libcurl3 -y
RUN wget http://launchpadlibrarian.net/140087283/libbison-dev_2.7.1.dfsg-1_amd64.deb && wget http://launchpadlibrarian.net/140087282/bison_2.7.1.dfsg-1_amd64.deb && dpkg -i libbison-dev_2.7.1.dfsg-1_amd64.deb && dpkg -i bison_2.7.1.dfsg-1_amd64.deb
RUN apt-get install libssl-dev libcurl4-openssl-dev pkg-config libsslcommon2-dev -y
RUN apt-get install libbz2-dev -y
RUN apt-get install enchant libenchant-dev -y
RUN cd php-src && git checkout php-5.6.25 && ./compile-php.sh

ADD . /www/touris
WORKDIR /www/touris