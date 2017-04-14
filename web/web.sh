#!/usr/bin/env bash

set -e
set -u

# Update the APT cache
sudo apt update

# Upgrade
sudo apt upgrade -y

# Install Apache2
sudo apt install apache2 -y

# Adding ServerName and IP
echo "ServerName 192.168.56.10" >> /etc/apache2/apache2.conf

# Edit dir.conf and prioritize index.php
echo "
<IfModule mod_dir.c>
     DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
</IfModule>" > /etc/apache2/mods-enabled/dir.conf

# Restarting apache2
sudo systemctl restart apache2

# Install PHP and its dependencies
sudo apt install php libapache2-mod-php php-mcrypt php-mysql php-ssh2 -y
  
# Creating a file to test PHP on the server
echo "<?php
phpinfo();
?>" >> /var/www/html/info.php

# Download Wordpress
wget http://wordpress.org/latest.tar.gz -O /tmp/latest.tar.gz

# Unzip the WordPress file
tar xzvf /tmp/latest.tar.gz -C /

# Copy file
cp /wordpress/wp-config-sample.php /wordpress/wp-config.php

# Edit the wp-config file to include user, database, and password
sed -i "/DB_NAME/c\define('DB_NAME', 'wordpress');/" /wordpress/wp-config.php

sed -i "/DB_USER/c\define('DB_USER', 'wordpressuser');" /wordpress/wp-config.php

sed -i "/DB_PASSWORD/c\define('DB_PASSWORD', 'password');/" /wordpress/wp-config.php

sed -i "/DB_HOST/c\define('DB_HOST', '10.154.31.45');" /wordpress/wp-config.php

# Copy WordPress folder into document root
rsync -avP /wordpress/ /var/www/html/
