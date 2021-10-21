FROM uselagoon/php-8.0-cli:latest

# COPY composer.* /app/
# RUN composer install --no-dev --prefer-dist

COPY . /app

ENV WEBROOT=/app
ENV PAGER=less
