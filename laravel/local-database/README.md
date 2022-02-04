### Installation on you app [cd ..]

```sh
$ curl -LO https://raw.githubusercontent.com/0zuna/Docker/main/laravel/local-database/.dockerignore
$ curl -LO https://raw.githubusercontent.com/0zuna/Docker/main/laravel/local-database/Dockerfile
$ curl -LO https://raw.githubusercontent.com/0zuna/Docker/main/laravel/local-database/docker-compose.yml
$ curl -LO https://raw.githubusercontent.com/0zuna/Docker/main/laravel/local-database/entrypoint.sh
```

### Config
add kernel/Infrastructure/mysql/var/lib/mysql on you .gitignore
```sh
$ echo kernel/Infrastructure/mysql/var/lib/mysql>>.gitignore
```
change permission on storage laravel
```sh
$ chmod -R 777 storage
```
