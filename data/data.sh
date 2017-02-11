#!/usr/bin/env bash

set -e
set -u

# Update the APT cache 

# Pre-seed debconf with MySQL server answers
debconf-set-selections <<< "mysql-server mysql-server/root_password password bean"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password bean"

# Install mySQL

# NOTE: potentially initialize database?

# Secure installation

# Edit the bind address with ip address

# Create usernames and passwords



