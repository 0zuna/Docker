### Installation on you Laravel app [cd ..]

```sh
$ curl -LO https://raw.githubusercontent.com/0zuna/Docker/main/laravel/local-database/2.0/.dockerignore \
  -LO https://raw.githubusercontent.com/0zuna/Docker/main/laravel/local-database/2.0/Dockerfile \
  -LO https://raw.githubusercontent.com/0zuna/Docker/main/laravel/local-database/2.0/docker-compose.yml \
  -LO https://raw.githubusercontent.com/0zuna/Docker/main/laravel/local-database/2.0/entrypoint.sh
```

### Config
add kernel/Infrastructure/mysql/var/lib/mysql on you .gitignore
```sh
$ echo kernel/Infrastructure/mysql/var/lib/mysql>>.gitignore
```
change permission on storage laravel
```sh
$ chmod -R 777 storage
$ chmod -R 777 bootstrap/cache
```
### Edit you .env database
```sh
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=app-api
DB_USERNAME=root
DB_PASSWORD=
```

### RUN
```sh
$ docker-compose up
```
