#!/bin/bash
set -o xtrace # show commands

echo 'Install apps';
sudo apt-get update -y
sudo apt-get install -y nginx
sudo apt-get install -y mc
sudo apt-get install -y php7.0 php7.0-fpm php7.0-cli php7.0-common
sudo apt-get install -y php-memcached php7.0-mbstring php7.0-gd php7.0-intl php7.0-xml php7.0-mysql php7.0-mcrypt php7.0-zip php7.0-json php7.0-opcache php7.0-phpdbg php7.0-imap php7.0-ldap php7.0-pgsql php7.0-pspell php7.0-recode php7.0-snmp php7.0-tidy php7.0-dev php7.0-gd php7.0-curl php7.0-xml php-redis php-xdebug memcached
sudo apt-get install -y redis-server
sudo apt-get install -y lua5.2

echo 'External configs'
sudo ln -sf /vagrant/nginx.conf /etc/nginx/sites-enabled/default
sudo ln -sf /vagrant/php.ini /etc/php/7.0/fpm/php.ini

if ! grep 'memcache.so' /etc/php/7.0/fpm/php.ini; then
	echo 'Install php7 memcache'
	cd /tmp
	wget https://github.com/websupport-sk/pecl-memcache/archive/php7.zip
	unzip php7.zip
	cd pecl-memcache-php7
	phpize
	./configure
	sudo make
	sudo make install
	echo '' >> /etc/php/7.0/fpm/php.ini
	echo '[memcache]' >> /etc/php/7.0/fpm/php.ini
	echo 'extension = "memcache.so"' >> /etc/php/7.0/fpm/php.ini
fi

sudo systemctl restart php7.0-fpm
sudo nginx -s reload
echo 'Nginx started. Open on host machine: http://localhost:8080/'

echo "Install MySSQL"
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y -q mysql-server
sudo mysql -e "SHOW DATABASES;"

