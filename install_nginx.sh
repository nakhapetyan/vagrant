sudo systemctl stop apache2
sudo apt-get install -y nginx
sudo apt-get install -y php7.0-fpm
echo 'External configs'
sudo ln -sf /vagrant/nginx.conf /etc/nginx/sites-enabled/default
sudo ln -sf /vagrant/php.ini /etc/php/7.0/fpm/php.ini
sudo systemctl restart php7.0-fpm
sudo nginx -s reload
echo 'Nginx started. Open on host machine: http://localhost:8080/'