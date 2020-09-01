FROM php:7.4.6-fpm-alpine as php-composer

RUN apk --update add \
        libpng \
        libzip-dev \
        libxml2-dev \
        libpng-dev \
        libjpeg-turbo \
        libjpeg-turbo-dev \
        freetype-dev \
        curl \
        git \
        bash \
        supervisor \
    && rm -rf /var/cache/apk/*

RUN docker-php-ext-configure gd --with-jpeg

RUN docker-php-ext-install \
        opcache \
        gd \
        pdo_mysql \
        soap \
        zip \
        bcmath

RUN curl -sS https://getcomposer.org/installer -o composer-setup.php
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN composer global require hirak/prestissimo