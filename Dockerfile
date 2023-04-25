ARG PHP_VERSION=8.0.28
FROM php:${PHP_VERSION}-cli-bullseye

ARG COMPOSER_VERSION=2.5.5

COPY install-composer.sh /

RUN /install-composer.sh $COMPOSER_VERSION \
    && mv composer.phar /usr/local/bin/composer \
    && apt update\
    && apt install git zip -y \
    && apt-get clean autoclean \
    && apt-get autoremove --yes \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/

WORKDIR /app
