DIR=$(shell pwd)

.PHONY : container setup build install local

container:
	docker run -t -i -v $(DIR):/opt/nsinit dock0/nsinit

setup:
	mkdir -p gopath/{src,pkg,bin}

build:
	GOPATH=$(DIR)/gopath go get -u github.com/docker/libcontainer/nsinit
	GOPATH=$(DIR)/gopath go install -n github.com/docker/libcontainer/nsinit

install:
	cp gopath/src/github.com/docker/libcontainer/LICENSE .
	cp gopath/src/github.com/docker/libcontainer/NOTICE .
	cp gopath/bin/nsinit .

local: setup build install

