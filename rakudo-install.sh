#!/bin/bash


# # # # # # # # # # # # # # # # # # # # # # # # # # #
# pulled from https://rakudo.org/files/star/source  #
# # # # # # # # # # # # # # # # # # # # # # # # # # #

# use source ./rakudo-install.sh to not need to restart bash/terminal

# WSL
sudo apt-get update
sudo apt-get install build-essential git execstack

mkdir ~/rakudo && cd $_
curl -LJO https://rakudo.org/latest/star/source
tar -xzf rakudo-star-*.tar.gz
mv rakudo-star-*/* .
rm -fr rakudo-star-*

RAK_INSTALL_DIR=$(pwd)/install
cd nqp
git clone https://github.com/MoarVM/MoarVM

cd MoarVM # build MoarVM
git checkout $(cat ../tools/build/MOAR_REVISION)
perl Configure.pl --prefix="$RAK_INSTALL_DIR"
make -j8

# Set execstack on libmoar.so; this is for NativeCall stuff
sudo execstack -c libmoar.so

# Install MoarVM
make install

cd ../ # then, build NQP
perl Configure.pl --prefix="$RAK_INSTALL_DIR"
make
make install

cd ../ # finally, build Rakudo
perl Configure.pl --prefix="$RAK_INSTALL_DIR"
make

# If you wish, you can run the tests
# Depending on your machine, they could take over half an hour to run
make rakudo-test
make rakudo-spectest

# Install Rakudo and all the modules
make install

echo "export PATH=$(pwd)/install/bin/:$(pwd)/install/share/perl6/site/bin:\$PATH" \
    >> ~/.bashrc
source ~/.bashrc


