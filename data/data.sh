#!/usr/bin/env bash

set -e
set -u

# Update the APT cache 
apt update -y

# Upgrade
sudo apt upgrade -y
 
# Pre-seed debconf with MySQL server answers
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password password'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password password'
 
# Install mySql server
sudo apt install mysql-server -y
 
# Edit the bind address with data server ip address
sed -i "/bind-address/c\bind-address = 192.168.56.10/" /etc/mysql/mysql.conf.d/mysqld.cnf

# Create Database, User, password, and grant privileges in MySQL
mysql -uroot -ppassword -e "CREATE DATABASE wordpress;"
mysql -uroot -ppassword -e "CREATE USER wordpressuser@192.168.56.10 IDENTIFIED BY 'password';"
mysql -uroot -ppassword -e "GRANT ALL PRIVILEGES ON wordpress.* TO wordpressuser@192.168.56.10;"
mysql -uroot -ppassword -e "FLUSH PRIVILEGES;"
mysql -uroot -ppassword -e "exit"

echo "hey! I am at the end of the script"
