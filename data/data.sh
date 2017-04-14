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
 
# Edit the bind address with ip address
sed -i 's/bind-address/bind-address = 192.168.56.10/' /etc/mysql/mysql.conf.d/mysqld.cnf
