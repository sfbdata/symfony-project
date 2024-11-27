FROM php:8.3.12-bullseye

WORKDIR /var/www/html

COPY .. /var/www/html

RUN apt-get update && apt-get install -y curl \
    && docker-php-ext-install pdo_mysql \
    && rm -rf /var/lib/apt/lists/* \
    zip \
    unzip

COPY --from=composer/composer:latest-bin /composer /usr/bin/composer

EXPOSE 8080

CMD ["php", "-S", "0.0.0.0:8080", "-t", "public/"]