#!/bin/bash
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo -e "\033[34m==>\033[0m Use ZSH by default"
if [ "$SHELL" != "/bin/zsh" ]; then
  chsh -s /bin/zsh
fi

DOTFILES_PATH=$(pwd -P)

DOTFILES=(
  gemrc
  gitconfig
  gitignore
  zshrc
  vimrc
  tmux.conf
  irbrc
  psqlrc
  curlrc
  agignore
  pg_service.conf
)

create_symbolic_link() {
  for FILE in ${DOTFILES[@]} ; do
    ln -fs ${DOTFILES_PATH}/${FILE} ~/.${FILE}
  done
}

set -e

echo -e "\033[34m==>\033[0m check brew presence"
if test ! $(which brew) ; then
  echo -e "\033[32mInstalling Homebrew\033[0m"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  echo -e "\033[32mInstalling Cask\033[0m"
  brew install caskroom/cask/brew-cask
fi

echo -e "\033[34m==>\033[0m brew bundle"
brew bundle

echo -e "\033[34m==>\033[0m brew cleanup"
brew cleanup

echo -e "\033[34m==>\033[0m brew cask cleanup"
brew cask cleanup

echo -e "\033[34m==>\033[0m link configurations"
create_symbolic_link
