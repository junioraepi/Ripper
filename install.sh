#/bin/bash

# Makes sure the machine is setup

# Install libdvdcss see http://www.videolan.org/developers/libdvdcss.html
echo 'deb http://download.videolan.org/pub/debian/stable/ /' >> /etc/apt/sources.list
echo 'deb-src http://download.videolan.org/pub/debian/stable/ /' >> /etc/apt/sources.list
apt-get update
apt-get -y install libdvdcss2

# Install dvdbackup
apt-get -y install dvdbackup

# Setup destination
mkdir /data/
