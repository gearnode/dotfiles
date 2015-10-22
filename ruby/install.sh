#!/bin/sh

if test ! $(which rvm)
then
    echo "Installing RVM"
    \curl -sSL https://get.rvm.io | bash -s stable
fi

# Install ruby version
echo "Installing requirements"
rvm requirements

echo "Installing ruby 2.2.x"
rvm install 2.2
