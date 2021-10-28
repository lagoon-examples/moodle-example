ARG CLI_IMAGE
FROM ${CLI_IMAGE:-builder} as builder

FROM uselagoon/php-8.0-fpm:latest

RUN apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS \
    && yes '' | pecl install -f xmlrpc \
    && docker-php-ext-enable xmlrpc \
    && rm -rf /var/cache/apk/* /tmp/pear/ \
    && apk del .phpize-deps

RUN docker-php-ext-install intl

ENV PHP_MAX_INPUT_VARS=5000

COPY --from=builder /app /app
