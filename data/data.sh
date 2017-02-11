#!/usr/bin/env bash

set -e
set -u

# Update the APT cache 
apt update

# Pre-seed debconf with MySQL server answers
debconf-set-selections <<< "mysql-server mysql-server/root_password password bean"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password bean"

# Install mySql server
apt install mysql-server

# NOTE: potentially initialize database?

# Secure installation
mysql_secure_installation

# Edit the bind address with ip address
sed -i 's/bind-address.*/bind-address = 192.168.1.20' /etc/mysql/mysql.conf.d/mysql.cnf

# Create usernames and passwords



