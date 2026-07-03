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

# Cài redis extension (tải source từ GitHub thay vì PECL để tránh lỗi DNS)
RUN cd /tmp \
    && curl -fsSL https://github.com/phpredis/phpredis/archive/6.0.2.tar.gz -o redis.tar.gz \
    && tar xzf redis.tar.gz \
    && cd phpredis-6.0.2 \
    && phpize \
    && ./configure \
    && make -j$(nproc) \
    && make install \
    && docker-php-ext-enable redis \
    && cd / && rm -rf /tmp/phpredis-6.0.2 /tmp/redis.tar.gz

# Cài yaml extension (tải source từ PECL bằng curl thay vì pecl command)
RUN cd /tmp \
    && curl -fsSL https://pecl.php.net/get/yaml-2.2.4.tgz -o yaml.tgz \
    && tar xzf yaml.tgz \
    && cd yaml-2.2.4 \
    && phpize \
    && ./configure \
    && make -j$(nproc) \
    && make install \
    && docker-php-ext-enable yaml \
    && cd / && rm -rf /tmp/yaml-2.2.4 /tmp/yaml.tgz

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
