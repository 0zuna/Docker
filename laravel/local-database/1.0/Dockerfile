FROM docker.io/bitnami/laravel:8
WORKDIR /app
COPY . .
COPY entrypoint.sh /usr/local/bin/
run chmod +x /usr/local/bin/entrypoint.sh
RUN composer install
RUN echo ". entrypoint.sh mysqld">>/opt/bitnami/scripts/php/setup.sh


#mariadb configs
RUN groupadd -r mysql && useradd -r -g mysql mysql

RUN set -ex; \
	apt-get update; \
	if ! which gpg; then \
		apt-get install -y --no-install-recommends gnupg; \
	fi; \
	if ! gpg --version | grep -q '^gpg (GnuPG) 1\.'; then \
		apt-get install -y --no-install-recommends dirmngr; \
	fi; \
	rm -rf /var/lib/apt/lists/*

# add gosu
# https://github.com/tianon/gosu/releases
ENV GOSU_VERSION 1.14
RUN set -eux; \
	apt-get update; \
	DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends ca-certificates; \
	savedAptMark="$(apt-mark showmanual)"; \
	apt-get install -y --no-install-recommends wget; \
	rm -rf /var/lib/apt/lists/*; \
	dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')"; \
	wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch"; \
	wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch.asc"; \
	export GNUPGHOME="$(mktemp -d)"; \
	gpg --batch --keyserver hkps://keys.openpgp.org --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4; \
	gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu; \
	gpgconf --kill all; \
	rm -rf "$GNUPGHOME" /usr/local/bin/gosu.asc; \
	apt-mark auto '.*' > /dev/null; \
	[ -z "$savedAptMark" ] || apt-mark manual $savedAptMark > /dev/null; \
	apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false; \
	chmod +x /usr/local/bin/gosu; \
	gosu --version; \
	gosu nobody true

RUN mkdir /docker-entrypoint-initdb.d

RUN set -ex; \
	apt-get update; \
	DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
		libjemalloc2 \
		pwgen \
		tzdata \
		xz-utils \
		zstd \
	; \
	rm -rf /var/lib/apt/lists/*

ARG GPG_KEYS=177F4010FE56CA3336300305F1656F24C74CD1D8

RUN set -ex; \
	export GNUPGHOME="$(mktemp -d)"; \
	for key in $GPG_KEYS; do \
		gpg --batch --keyserver keyserver.ubuntu.com --recv-keys "$key"; \
	done; \
	gpg --batch --export $GPG_KEYS > /etc/apt/trusted.gpg.d/mariadb.gpg; \
	command -v gpgconf > /dev/null && gpgconf --kill all || :; \
	rm -fr "$GNUPGHOME"; \
	apt-key list

ARG MARIADB_MAJOR=10.3
ENV MARIADB_MAJOR $MARIADB_MAJOR
ARG MARIADB_VERSION=1:10.3.32
ENV MARIADB_VERSION $MARIADB_VERSION

RUN set -ex; \
	apt-get update; \
	apt-get install -y \
		mariadb-server \
		mariadb-backup \
		socat \
	; \
	rm -rf /var/lib/apt/lists/*; \
	rm -rf /var/lib/mysql; \
	mkdir -p /var/lib/mysql /var/run/mysqld; \
	chown -R mysql:mysql /var/lib/mysql /var/run/mysqld; \
	chmod 777 /var/run/mysqld; \
	find /etc/mysql/ -name '*.cnf' -print0 \
		| xargs -0 grep -lZE '^(bind-address|log|user\s)' \
		| xargs -rt -0 sed -Ei 's/^(bind-address|log|user\s)/#&/'; \
	if [ ! -L /etc/mysql/my.cnf ]; then sed -i -e '/includedir/i[mariadb]\nskip-host-cache\nskip-name-resolve\n' /etc/mysql/my.cnf; \
	else sed -i -e '/includedir/ {N;s/\(.*\)\n\(.*\)/[mariadbd]\nskip-host-cache\nskip-name-resolve\n\n\2\n\1/}' \
	/etc/mysql/mariadb.cnf; fi

VOLUME /var/lib/mysql
