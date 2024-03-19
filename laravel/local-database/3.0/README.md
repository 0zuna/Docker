### Installation on you Laravel app [cd ..]

```sh
$ curl -LO https://raw.githubusercontent.com/0zuna/Docker/main/laravel/local-database/3.0/.dockerignore \
  -LO https://raw.githubusercontent.com/0zuna/Docker/main/laravel/local-database/3.0/Dockerfile \
  -LO https://raw.githubusercontent.com/0zuna/Docker/main/laravel/local-database/3.0/docker-compose.yml \
  -LO https://raw.githubusercontent.com/0zuna/Docker/main/laravel/local-database/3.0/entrypoint.sh
```

### Config
add kernel/Infrastructure/mysql/var/lib/mysql on you .gitignore
```sh
$ echo kernel/system/mysql/var/lib/mysql>>.gitignore
```
change permission on storage laravel
```sh
$ chmod -R 777 storage bootstrap/cache entrypoint.sh
```
### RUN
```sh
$ docker-compose up
```
