##!/usr/bin/env bash

set -e
set -u

# Update the APT cache 
apt update

# Install Apache2
sudo apt install apache2

# Pre-seed debconf with MySQL server answers
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

# Testing PHP on the server
echo "<?php
phpinfo();


