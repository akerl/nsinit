GOPATH="$(shell pwd)/gopath"

container:
	docker run -t -i -v $(pwd):/opt/nsinit dock0/nsinit

setup:
	mkdir -p gopath/{src,pkg,bin}

build:
	GOPATH=$(GOPATH) go get -u github.com/docker/libcontainer/nsinit
	GOPATH=$(GOPATH) go install -n github.com/docker/libcontainer/nsinit

install:
	cp gopath/src/github.com/docker/libcontainer/LICENSE .
	cp gopath/src/github.com/docker/libcontainer/NOTICE .
	cp gopath/bin/nsinit .

local: setup build install

