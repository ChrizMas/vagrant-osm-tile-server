#!/usr/bin/env bash

cd ~/src

echo "export ENV vars"
export CXX="clang++-3.8" && export CC="clang-3.8"

echo "git clone https://github.com/mapnik/mapnik mapnik-3.x --depth 10"
git clone https://github.com/mapnik/mapnik mapnik-3.x --depth 10
cd mapnik-3.x

echo "git submodule update --init"
git submodule update --init

echo "source bootstrap.sh"
source bootstrap.sh

echo "/configure with EVN CXX=${CXX} CC=${CC}"
./configure CUSTOM_CXXFLAGS="-D_GLIBCXX_USE_CXX11_ABI=0" CXX=${CXX} CC=${CC}

echo "make"
make
make test

echo "sudo make install"
sudo make install

# Read: https://github.com/mapnik/mapnik/wiki/UbuntuInstallation
