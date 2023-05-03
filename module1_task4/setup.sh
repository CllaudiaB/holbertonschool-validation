docker run --rm --tty --interactive --volume=$(pwd):/app --workdir=/app ubuntu:18.04 /bin/bash
apt-get update && apt-get install -y hugo make

apt-get install wget

wget https://github.com/gohugoio/hugo/releases/download/v0.84.0/hugo_extended_0.84.0_Linux-64bit.tar.gz
tar -zxvf hugo_extended_0.84.0_Linux-64bit.tar.gz
mv hugo /usr/local/bin

make build
