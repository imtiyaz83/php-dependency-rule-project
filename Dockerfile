# Use the PHP 8.1 CLI image
FROM php:8.1-cli

# Install necessary system packages
RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip \
    libzip-dev \
    && docker-php-ext-install zip

# Set the working directory
WORKDIR /app

# Copy composer.json and composer.lock
COPY composer.json composer.lock ./

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install dependencies
RUN composer install

# Copy the rest of the application files
COPY . .

# Set the command to run your application with a built-in PHP server
CMD ["php", "-S", "0.0.0.0:8000", "-t", "src"]

