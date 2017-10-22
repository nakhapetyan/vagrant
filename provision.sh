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

sudo systemctl restart php7.0-fpm
sudo nginx -s reload
echo 'Nginx started. Open on host machine: http://localhost:8080/'

echo "Install MySSQL"
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y -q mysql-server
sudo mysql -e "UPDATE mysql.user SET Password=PASSWORD('root') WHERE User='root'; FLUSH PRIVILEGES;"
mysql -uroot -proot -e "SHOW DATABASES;"

