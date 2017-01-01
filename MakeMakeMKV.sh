#install the prereqs
apt-get install build-essential pkg-config libc6-dev libssl-dev libexpat1-dev libavcodec-dev libgl1-mesa-dev libqt4-dev git

#get the source
mkdir makemkv.source
cd makemkv.source

# Compile fdk
wget http://downloads.sourceforge.net/opencore-amr/fdk-aac-0.1.4.tar.gz
tar xvf fdk-aac-0.1.4.tar.gz
cd fdk-aac-0.1.4
./configure --prefix=/usr --disable-static
make
sudo make install
cd ..

# Compile ffmpeg
git clone git://source.ffmpeg.org/ffmpeg.git ffmpeg
cd ffmpeg
./configure --prefix=/tmp/ffmpeg --enable-static --disable-shared --enable-pic --disable-yasm --enable-libfdk-aac
make
sudo make install
cd ..

# Compile MakeMKV
wget http://www.makemkv.com/download/makemkv-bin-1.9.9.tar.gz
wget http://www.makemkv.com/download/makemkv-oss-1.9.9.tar.gz
tar xvf makemkv-bin-1.9.9.tar.gz
tar xvf makemkv-oss-1.9.9.tar.gz

# Compile MakeMKV-oss
cd makemkv-oss-1.9.9
PKG_CONFIG_PATH=/tmp/ffmpeg/lib/pkgconfig ./configure
make
sudo make install

# Compile MakeMKV-bin
cd ../makemkv-bin-1.9.9
make
sudo make install