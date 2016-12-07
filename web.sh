#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

PROFILE_PATH = ~/.profile

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash

# Set nvm version
VERSION=6.x
nvm install $VERSION
nvm alias default $VERSION
nvm use $VERSION

# Install yarn
brew install yarn
# Add to path
echo 'export PATH="$PATH:`yarn global bin`"' >> $PROFILE_PATH

# Setup eslint
yarn global add eslint

# TODO add other eslint things

# Remove outdated versions from the cellar.
brew cleanup

# npm install -g coffee-script
# npm install -g grunt-cli
# npm install -g jshint
# npm install -g less

#gem install jekyll
