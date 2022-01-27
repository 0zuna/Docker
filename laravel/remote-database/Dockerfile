FROM docker.io/bitnami/laravel:8
WORKDIR /app
COPY . .
RUN composer install
RUN apt update && apt upgrade
RUN apt install -y default-mysql-client
RUN mysql -h{$host} -uroot -p{$password} -e 'DROP DATABASE IF EXISTS `{$databaseName}`;CREATE DATABASE `{$databaseName}`'
RUN php artisan migrate --seed
RUN php artisan passport:install --force
