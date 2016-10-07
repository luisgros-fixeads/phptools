FROM php:7.1-alpine

MAINTAINER Luis Pitta Grós <luis.gros@olx.com>

RUN apk --update add \
	  curl \
	  git && \
	  apk del build-base && \
	  rm -rf /var/cache/apk/*

# Memory Limit
RUN echo "memory_limit=-1" > $PHP_INI_DIR/conf.d/memory-limit.ini

# Time Zone
RUN echo "date.timezone=${PHP_TIMEZONE:-UTC}" > $PHP_INI_DIR/conf.d/date_timezone.ini

# Register the COMPOSER_HOME environment variable
ENV COMPOSER_HOME /composer

# Add global binary directory to PATH and make sure to re-export it
ENV PATH /composer/vendor/bin:$PATH

# Allow Composer to be run as root
ENV COMPOSER_ALLOW_SUPERUSER 1


RUN curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
  && curl -o /tmp/composer-setup.sig https://composer.github.io/installer.sig \
    && php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }"
RUN php /tmp/composer-setup.php --install-dir=bin --filename=composer
RUN php -r "unlink('/tmp/composer-setup.php');"

RUN composer global require phpunit/phpunit
RUN composer global require squizlabs/php_codesniffer=3.0.x-dev
RUN composer global require phpmd/phpmd
RUN composer global require sebastian/phpcpd
RUN composer global require phploc/phploc
RUN composer global require friendsofphp/php-cs-fixer

WORKDIR /src


