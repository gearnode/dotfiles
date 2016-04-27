#!/bin/sh

if test ! $(which kiex) ; then
  echo "Installing Kiex"
  \curl -sSL https://raw.githubusercontent.com/taylor/kiex/master/install | bash -s
fi

