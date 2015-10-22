#!/bin/sh

# Root access
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

if test ! $(witch brew)
then
  echo "Installing Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install composant

brew install coreutils
brew install autoconf
brew install isl011
brew install libyaml
brew install pkg-config
brew install libevent
brew install libmpc08
brew install libtool
brew install cmake
brew install openssl


brew install caskroom/cask/brew-cask

brew install gnu-sed --with-default-names
brew install wget --with-iri

brew install zsh
brew install vim --override-system-vi
brew install git

brew install boot2docker
brew install docker

brew install redis
brew install postgresql

# Install mac app

brew cask install google-chrome
brew cask install virtualbox
brew cask install transmission
brew cask install iterm2
brew cask install google-chrome-canary
brew cask install vlc
brew cask install slack
brew cask install skype

# Clean brew
brew cleanup
brew cask cleanup
