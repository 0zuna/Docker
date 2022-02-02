FROM docker.io/bitnami/laravel:8
WORKDIR /app
COPY . .
COPY entrypoint.sh /opt/bitnami/scripts
RUN composer install
VOLUME /var/lib/mysql
RUN echo ". /opt/bitnami/scripts/entrypoint.sh">>/opt/bitnami/scripts/php/setup.sh
