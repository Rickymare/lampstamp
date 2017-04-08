#!/usr/bin/env bash

# Run this script if data.sh or web.sh was unsuccessful. This script will remove the files that were added so we can try again with a fresh install.

# remove apache2
sudo apt -y remove apache2

# Remove MySql-server
sudo apt -y remove mysql-server

# Remove PHP and its dependencies
sudo apt -y remove php libapache2-mod-php php-mcrypt php-mysql

# Remove dependencies
sudo apt autoremove
