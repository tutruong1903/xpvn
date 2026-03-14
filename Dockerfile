FROM php:8.2-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    unzip \
    libzip-dev \
    libxml2-dev \
    libcurl4-openssl-dev \
    libonig-dev \
    libyaml-dev \
    libssl-dev \
    libgmp-dev \
    && pecl install redis yaml \
    && docker-php-ext-enable redis yaml \
    && docker-php-ext-install \
        bcmath \
        curl \
        fileinfo \
        gmp \
        mbstring \
        mysqli \
        pdo \
        pdo_mysql \
        posix \
        xml \
        zip \
        opcache \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

# Copy application files
COPY . .

# Install PHP dependencies
RUN composer install --no-dev --optimize-autoloader --no-interaction

# Ensure storage directories exist and are writable
RUN mkdir -p storage/framework/smarty/compile \
    && mkdir -p storage/framework/smarty/cache \
    && mkdir -p storage/framework/twig \
    && chown -R www-data:www-data storage

# Copy entrypoint
COPY docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 9000

ENTRYPOINT ["entrypoint.sh"]
