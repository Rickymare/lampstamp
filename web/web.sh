#!/usr/bin/env bash

set -e
set -u

# Update the APT cache
sudo apt update

# Install Apache2
sudo apt install apache2
