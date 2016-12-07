#!/usr/bin/env bash

# Ask for administrator password upfront
sudo -v

# Install phabricator
mkdir ~/phabricator
git clone https://github.com/phacility/libphutil.git ~/phabricator/libphutil
git clone https://github.com/phacility/arcanist.git ~/phabricator/arcanist

# Add arcanist to path
echo 'export PATH=$PATH:~/phabricator/arcanist/bin' >> ~/.profile

# configure filevault
echo 'Remember to save the recovery key to 1Password'
fdesetup enable
