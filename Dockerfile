FROM php:7.4-fpm-alpine as php-fpm-composer

RUN apk --update add \
        libpng \
        libpng-dev \
        libjpeg-turbo \
        libjpeg-turbo-dev \
        php-mysql \
        freetype-dev \
        curl \
        git \
        bash \
    && rm -rf /var/cache/apk/*

RUN curl -sS https://getcomposer.org/installer -o composer-setup.php
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN composer global require hirak/prestissimo