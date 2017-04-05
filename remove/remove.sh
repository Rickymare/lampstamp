#!/usr/bin/env bash

# Run this script if data.sh or web.sh was unsuccessful. This script will remove the files that were added so we can try again with a fresh install.

# Check if apache2 was installed, if so remove it
if ! hash <apache2>
  echo "it dont exist"


