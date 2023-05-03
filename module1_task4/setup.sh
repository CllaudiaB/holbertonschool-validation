docker run --rm --tty --interactive --volume=$(pwd):/app --workdir=/app ubuntu:18.04
wget https://github.com/gohugoio/hugo/releases/download/v0.84.0/hugo_0.84.0_Linux-64bit.tar.gz
tar -xvzf hugo_0.84.0_Linux-64bit.tar.gz
make build
