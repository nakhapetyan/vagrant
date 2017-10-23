#!/bin/bash
set -o xtrace # show commands


echo 'Install apps';
sudo apt-get update -y
sudo apt-get install -y mc
sudo apt-get install -y pv
sudo apt-get install -y php7.0 php7.0-cli php7.0-common
sudo apt-get install -y php-memcached php7.0-mbstring php7.0-gd php7.0-intl php7.0-xml php7.0-mysql php7.0-mcrypt php7.0-zip php7.0-json php7.0-opcache php7.0-phpdbg php7.0-imap php7.0-ldap php7.0-pgsql php7.0-pspell php7.0-recode php7.0-snmp php7.0-tidy php7.0-dev php7.0-gd php7.0-curl php7.0-xml php-redis php-xdebug memcached
sudo apt-get install -y redis-server
sudo apt-get install -y lua5.2

#sudo apt-get install -y nginx
#sudo apt-get install -y php7.0-fpm
#echo 'External configs'
#sudo ln -sf /vagrant/nginx.conf /etc/nginx/sites-enabled/default
#sudo ln -sf /vagrant/php.ini /etc/php/7.0/fpm/php.ini
#sudo systemctl restart php7.0-fpm
#sudo nginx -s reload
#echo 'Nginx started. Open on host machine: http://localhost:8080/'

sudo systemctl stop nginx
sudo systemctl stop php7.0-fpm
sudo apt-get install -y apache2
sudo apt-get install -y php libapache2-mod-php
sudo ln -sf /vagrant/apache2.conf /etc/apache2/sites-enabled/000-default.conf
sudo ln -sf /vagrant/php.ini /etc/php/7.0/apache2/php.ini
sudo a2enmod rewrite
sudo a2enmod vhost_alias
sudo service apache2 restart

echo "Install MySSQL"
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y -q mysql-server
sudo mysql -e "FLUSH PRIVILEGES; UPDATE mysql.user SET authentication_string = PASSWORD(''), plugin = 'mysql_native_password' WHERE User = 'root';"
sudo mysql -e "UPDATE mysql.user SET authentication_string=PASSWORD('') WHERE User = 'root';"
sudo mysql -e "SHOW DATABASES;"

