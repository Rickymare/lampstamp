  1 #!/usr/bin/env bash
  2 
  3 set -e
  4 set -u
  5 
  6 # Update the APT cache 
  7 apt update -y
  8 
  9 # Pre-seed debconf with MySQL server answers
 10 sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password password'
 11 sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password password'
 12 
 13 # Install mySql server
 14 sudo apt -y install mysql-server
 15 
 16 # Edit the bind address with ip address
 17 sed -i 's/bind-address/bind-address = 10.154.31.192/' /etc/mysql/mysql.conf.d/mysqld.cnf
 18 
 21 # Install PHP and its dependencies
 22 sudo apt -y install php libapache2-mod-php php-mcrypt php-mysql
 23 
 24 # Edit dir.conf and prioritize index.php
 25 echo "
 26 <IfModule mod_dir.c>
 27     DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
 28 </IfModule>" >> /etc/apache2/mods-enabled/dir.conf
 29 
 30 # Restart the Apache2 server
 31 sudo systemctl restart apache2
 32 
 33 # Creating a file to test PHP on the server
 34 touch /var/www/html/info.php
 35 
 36 echo "<?php
 37 phpinfo();
 38 ?>" >> /var/www/html/info.php
~                                      
