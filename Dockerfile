FROM php:7.1.0RC4-zts-alpine

MAINTAINER Luís Pitta Grós <luis.gros@olx.com>

USER root 

RUN apk --update add \
	  git && \
	  apk del build-base && \
	  rm -rf /var/cache/apk/*

# Based on official docker image composer/composer
RUN echo "memory_limit=-1" > $PHP_INI_DIR/conf.d/memory-limit.ini
RUN echo "date.timezone=${PHP_TIMEZONE:-UTC}" > $PHP_INI_DIR/conf.d/date_timezone.ini

ENV COMPOSER_HOME /composer
ENV PATH /composer/vendor/bin:$PATH
ENV COMPOSER_ALLOW_SUPERUSER 1

# Based on darh/php-essentials
ADD https://getcomposer.org/composer.phar /usr/local/bin/composer
ADD https://phar.phpunit.de/phpunit.phar  /usr/local/bin/phpunit
ADD https://phar.phpunit.de/phpcpd.phar   /usr/local/bin/phpcpd
ADD https://phar.phpunit.de/phpdcd.phar   /usr/local/bin/phpdcd
ADD https://phar.phpunit.de/phploc.phar   /usr/local/bin/phploc

RUN cd /usr/local/bin && \
  chmod +x composer phpunit phpcpd phpdcd phploc

# Use Pear to install phpcs when new release is available, uses half the space on disk.
RUN composer global require "squizlabs/PHP_CodeSniffer:3.0.x-dev" \ 
			    "phpmd/phpmd"
RUN composer clear-cache

WORKDIR /src
