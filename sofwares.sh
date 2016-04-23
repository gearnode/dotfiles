#!/bin/sh
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

SOFTWARES=(
  zsh
  git
  vim
  neovim
  redis
  postgresql
  curl
  docker
  jq # JSON parser
  erlang
  elixir
  tmux
  gcc49
  tree
  python3
  imagemagick
  wget
  openssl
)

APPLICATIONS=(
  google-chrome
  google-chrome-canary
  transmission
  iterm2
  vlc
  slack
  skype
)

if test ! $(witch brew)
then
  echo "Installing Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install caskroom/cask/brew-cask

for SOFTWARE in ${SOFTWARES[@]} ; do
  brew install ${SOFTWARE}
  brew link ${SOFTWARE} --force
done

for APPLICATION in ${APPLICATIONS[@]} ; do
  brew cask install ${APPLICATION}
done

brew cleanup
brew cask cleanup
