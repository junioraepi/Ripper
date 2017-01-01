#/bin/bash

# Makes sure the machine is setup

# Install libdvdcss see http://www.videolan.org/developers/libdvdcss.html
echo 'deb http://download.videolan.org/pub/debian/stable/ /' >> /etc/apt/sources.list
echo 'deb-src http://download.videolan.org/pub/debian/stable/ /' >> /etc/apt/sources.list

apt-get update
apt-get install -y software-properties-common

add-apt-repository ppa:heyarje/makemkv-beta
add-apt-repository ppa:stebbins/handbrake-releases
apt-get update

apt-get -y install libdvdcss2 dvdbackup handbrake-cli libavcodec-extra

# Setup destination
mkdir /data/
mkdir /data/DVD_RIPS