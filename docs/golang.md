# Go

### download and install
    $ export GOVERSION=1.15.3 && mkdir tmp && cd tmp
    $ wget "https://dl.google.com/go/go${GOVERSION}.linux-amd64.tar.gz"
    $ sudo tar -xvf "go${GOVERSION}.linux-amd64.tar.gz" -C /usr/local/

### gopath

    $ mkdir -p ~/go{bin,src,pkg}

### path
add these to your bashrc

    export GOPATH=$HOME/go
    export GOROOT=/usr/local/go/bin
    export PATH=$PATH:$GOROOT:$GOROOT/bin:$GOPATH/bin
