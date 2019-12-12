FROM php:7.3.0-fpm-alpine3.8 as php-fpm-composer

RUN apk upgrade --update && apk --no-cache add \
    icu-dev \
    supervisor \
    libpng \
    libjpeg-turbo \
    freetype-dev \
    libpng-dev \
    libjpeg-turbo-dev \
    autoconf make g++ gcc postgresql-dev

RUN docker-php-ext-install -j$(nproc) \
    iconv \
    intl \
    mbstring \
    opcache \
    pdo \
    pdo_pgsql \
    gd

RUN rm -rf /var/cache/apk/*

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
RUN composer global require hirak/prestissimo