#!/bin/bash
set -o xtrace # show commands


echo 'Install apps';
sudo apt-get update -y
sudo apt-get install -y mc
sudo apt-get install -y pv
sudo apt-get install -y php7.0 php7.0-cli php7.0-common
sudo apt-get install -y php-memcached php7.0-mbstring php7.0-gd php7.0-intl php7.0-xml php7.0-mysql php7.0-mcrypt php7.0-zip php7.0-json php7.0-opcache php7.0-phpdbg php7.0-imap php7.0-ldap php7.0-pgsql php7.0-pspell php7.0-recode php7.0-tidy php7.0-dev php7.0-gd php7.0-curl php7.0-xml php-redis php-xdebug
sudo apt-get install -y memcached
sudo apt-get install -y redis-server
sudo apt-get install -y lua5.2

echo 'Install Apache'
sudo apt-get install -y apache2
sudo apt-get install -y php libapache2-mod-php
sudo ln -sf /vagrant/apache2.conf /etc/apache2/sites-enabled/000-default.conf
sudo ln -sf /vagrant/php.ini /etc/php/7.0/apache2/php.ini
sudo a2enmod rewrite
sudo a2enmod vhost_alias
sudo a2enmod ssl
sudo chmod 0600 /vagrant/server.key
sudo service apache2 restart

echo "Install MySSQL"
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y -q mysql-server
sudo mysql -e "UPDATE mysql.user SET authentication_string = PASSWORD(''), plugin = 'mysql_native_password' WHERE User = 'root'; FLUSH PRIVILEGES; "
sudo mysql -e "SET GLOBAL sql_mode='';"
sudo mysql -e "SHOW DATABASES;"

sudo timedatectl set-timezone Europe/Moscow
sudo apt-get install -y ntp

grep -q -F "PS1='\e]2;" /home/ubuntu/.bashrc || echo "PS1='\e]2;[\u@\h]\a[\e[32;1m\t\e[0m] ${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]> '" >> /home/ubuntu/.bashrc
grep -q -F "errors.sh" /home/ubuntu/.bashrc || echo "alias errors='/vagrant/errors.sh'" >> /home/ubuntu/.bashrc