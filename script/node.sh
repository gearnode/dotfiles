#!/bin/sh

NODE_VERSION=5.0

if test ! $(which nvm)
then
  echo "Installing NVM"
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
fi

nvm install ${NODE_VERSION}
nvm use ${NODE_VERSION}
