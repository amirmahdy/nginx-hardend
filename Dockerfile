FROM ubuntu:22.04

LABEL MAINTAINER Amirmahdy Malayjerdi

RUN apt-get update \
    && apt-get -y install build-essential libpcre3 libpcre3-dev zlib1g zlib1g-dev libssl-dev libgd-dev libxml2 libxml2-dev uuid-dev wget \
    && wget  http://nginx.org/download/nginx-1.20.0.tar.gz \
    && tar -zxvf nginx-1.20.0.tar.gz

WORKDIR nginx-1.20.0

RUN ./configure --prefix=/var/www/html --sbin-path=/usr/sbin/nginx --conf-path=/etc/nginx/nginx.conf --http-log-path=/var/log/nginx/access.log --error-log-path=/var/log/nginx/error.log --with-pcre  --lock-path=/var/lock/nginx.lock --pid-path=/var/run/nginx.pid --with-http_image_filter_module=dynamic --modules-path=/etc/nginx/modules --with-http_v2_module --with-stream=dynamic --with-http_addition_module

RUN  make && make install

RUN find /etc/nginx -type d | xargs chmod 750

RUN find /etc/nginx -type f | xargs chmod 640

COPY nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT ["nginx","-g", "daemon off;"]
