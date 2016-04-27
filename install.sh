#!/bin/sh
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

DOTFILES_ROOT=$(pwd -P)

DOTFILES=(
  gemrc
  gitconfig
  gitignore
  zshrc
  vimrc
  tmux.conf
)

SCRIPT_FILES=($(ls ./script))

create_symbolic_link() {
  for FILE in ${DOTFILES[@]} ; do
    ln -fs ${DOTFILES_ROOT}/${FILE} ~/.${FILE}
  done
}

run_all_script() {
  for FILE in ${SCRIPT_FILES[@]} ; do
    cat ${DOTFILES_ROOT}/script/${FILE} | while read installer ; do sh -c "${installer}" ; done
  done
}

set -e

echo "=> check brew presence"
if test ! $(which brew) ; then
  echo "=> install homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  echo "=> install brew cask"
  brew install caskroom/cask/brew-cask
fi

echo "=> brew bundle"
brew bundle

echo "=> brew cleanup"
brew cleanup

echo "=> brew cask cleanup"
brew cask cleanup

echo "=> create symbolic link"
create_symbolic_link

echo "=> Run all script"
run_all_script()
