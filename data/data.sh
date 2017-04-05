#!/usr/bin/env bash

set -e
set -u

# Update the APT cache 
apt update

# Pre-seed debconf with MySQL server answers PASSWORD DID NOT WORK
debconf-set-selections <<< "mysql-server mysql-server/root_password password bean"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password bean"

# Install mySql server
apt install mysql-server

# NOTE: potentially initialize database?

# Secure installation
mysql_secure_installation

# Edit the bind address with ip address
sed -i 's/bind-address.*/bind-address = 97.120.234.128' /etc/mysql/mysql.conf.d/mysql.cnf

# Create usernames and passwords

# Install PHP and its dependencies
sudo apt install php libapache2-mod-php php-mcrypt php-mysql

# Open dir.conf and prioritize index.php
echo "
<IfModule mod_dir.c>
    DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
</IfModule>" >> /etc/apache2/mods-enabled/dir.conf

# Restart the Apache2 server
sudo systemctl restart apache2

# Creating a file to test PHP on the server
touch /var/www/html/info.php

echo "<?php
phpinfo();
?>" >> /var/www/html/info.php
