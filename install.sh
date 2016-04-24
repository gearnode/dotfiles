#!/bin/sh

DOTFILES_ROOT=$(pwd -P)

DOTFILES=(
  gemrc
  gitconfig
  gitignore
  zshrc
  vimrc
  tmux.conf
)
create_symbolic_link() {
  for FILE in ${DOTFILES[@]} ; do
    ln -fs ${DOTFILES_ROOT}/${FILE} ~/.${FILE}
  done
}

set -e

echo "=> brew bundle"
brew bundle

echo "=> create symbolic link"
create_symbolic_link
