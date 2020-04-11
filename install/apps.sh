#!/bin/bash
#
# Install Homebrew and applications
# Check out https://brew.sh for more details
# Comment (with #) what should not be installed and add the applications you want to install.

source ./install/utils.sh

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew upgrade

# Install Homebrew taps
brew tap heroku/brew
brew tap homebrew/cask-drivers
brew tap homebrew/cask-fonts
brew tap homebrew/cask-versions
brew tap homebrew/command-not-found

# Install Homebrew formulas
brew install curl
brew install git
brew install heroku
brew install nano
brew install node
brew install nvm
brew install postgresql
brew install python
brew install ruby
brew install tree
brew install unrar
brew install yarn
brew install zsh
brew install TomAnthony/brews/itermocil

# Install Homebrew casks
brew cask install figma
brew cask install font-jetbrains-mono
brew cask install google-chrome
brew cask install iina
brew cask install iterm2
brew cask install mumble
brew cask install postman
brew cask install slack
brew cask install visual-studio-code
brew cask install zoomus

# Install Homebrew Cask Upgrade
# Check out https://github.com/buo/homebrew-cask-upgrade for more details
brew tap buo/cask-upgrade
brew update
brew cu

# Finish
e_success "Finished applications installation."