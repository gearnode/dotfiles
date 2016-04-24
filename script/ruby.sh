#!/bin/sh
RUBY_VERSION=2.3.0

GEMS=(
  bundler
  pry
  rack
  redis
  sequel
)

if test ! $(which rvm)
then
    echo "Installing RVM"
    \curl -sSL https://get.rvm.io | bash -s stable
fi
# TODO: Fix issue for this command
# rvm get stable --auto-dotfiles
rvm requirements
rvm install ${RUBY_VERSION}

for GEM in ${GEMS[@]} ; do
  gem install ${GEM}
done
