#!/bin/bash
set -o xtrace # show commands

sudo mysql -e "SET GLOBAL sql_mode='';"
sudo service apache2 restart