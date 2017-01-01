#/bin/bash

# Makes sure the machine is setup

# Install libdvdcss see http://www.videolan.org/developers/libdvdcss.html
echo 'deb http://download.videolan.org/pub/debian/stable/ /' >> /etc/apt/sources.list
echo 'deb-src http://download.videolan.org/pub/debian/stable/ /' >> /etc/apt/sources.list

apt-get update
apt-get install libdvdcss2
apt-get -y install dvdbackup handbrake-cli libavcodec-extra

# Setup destination
mkdir /data/
mkdir /data/DVD_RIPS