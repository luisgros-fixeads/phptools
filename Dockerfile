FROM php:7.1-alpine

MAINTAINER Luis Pitta Grós <luis.gros@olx.com>

RUN pear install PHP_CodeSniffer

RUN phpcs -i
RUN phpcs --version

