docker run --rm --tty --interactive --volume=$(pwd):/app --workdir=/app ubuntu:18.04
apt-get install wget https://github.com/gohugoio/hugo/releases/download/v0.84.0/hugo_extended_0.84.0_Linux-64bit.deb
tar -xvzf hugo_0.84.0_Linux-64bit.tar.gz
sudo mv hugo /usr/local/bin/
make build
