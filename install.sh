#!/bin/bash
set -e

# Load base utility functions like sunzi.mute() and sunzi.install()
source recipes/sunzi.sh

# This line is necessary for automated provisioning for Debian/Ubuntu.
# Remove if you're not on Debian/Ubuntu.
export DEBIAN_FRONTEND=noninteractive

# Add Dotdeb repository. Recommended if you're using Debian. See http://www.dotdeb.org/about/
# source recipes/dotdeb.sh
# source recipes/backports.sh

# Update apt catalog and upgrade installed packages
sunzi.mute "apt update"
sunzi.mute "apt-get -y upgrade"

# Set RAILS_ENV
environment=<%= @attributes.environment %>

if ! grep -Fq "RAILS_ENV" ~/.bash_profile; then
  echo 'Setting up RAILS_ENV...'
  echo "export RAILS_ENV=$environment" >> ~/.bash_profile
  source ~/.bash_profile
  echo 'gem: --no-ri --no-rdoc' > ~/.gemrc
fi

source recipes/build-essential.sh
source recipes/git.sh
source recipes/rbenv.sh <%= @attributes.ruby_version %>
source recipes/nginx.sh
source recipes/nodejs.sh
source recipes/postgres.sh
source recipes/adduser.sh
source recipes/ufw.sh
source recipes/sudonopassword.sh
source recipes/set_env_vars.sh