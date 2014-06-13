DIR=$(shell pwd)

.PHONY : container setup build install local

container:
	docker build -t nsinit .
	docker run -t -i -v $(DIR):/opt/nsinit nsinit

setup:
	mkdir -p gopath/{src,pkg,bin}

build:
	GOPATH=$(DIR)/gopath go get -u github.com/docker/libcontainer/nsinit
	GOPATH=$(DIR)/gopath go install -n github.com/docker/libcontainer/nsinit

install:
	cp gopath/src/github.com/docker/libcontainer/LICENSE build/
	cp gopath/src/github.com/docker/libcontainer/NOTICE build/
	cp gopath/bin/nsinit build/

local: setup build install

