#!/usr/bin/env bash

test -d ~/src || mkdir  ~/src ; cd ~/src

echo "git clone"
git clone git://github.com/SomeoneElseOSM/mod_tile.git

cd mod_tile

echo "autogen.sh"
./autogen.sh

echo "configure"
./configure

echo "make"
make

echo "sudo make install"
sudo make install

echo "sudo make install-mod_tile"
sudo make install-mod_tile

echo "sudo ldconfig"
sudo ldconfig

# Read more: https://github.com/openstreetmap/mod_tile
