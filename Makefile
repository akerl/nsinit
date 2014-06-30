DIR=$(shell pwd)

.PHONY : container setup build push local

container:
	docker build -t nsinit .
	docker run --rm -t -i -v $$SSH_AUTH_SOCK:/auth.sock -e SSH_AUTH_SOCK=/auth.sock -v $(DIR):/opt/nsinit nsinit

setup:
	mkdir -p gopath/{src,pkg,bin}

build:
	GOPATH=$(DIR)/gopath go get -u github.com/docker/libcontainer/nsinit
	GOPATH=$(DIR)/gopath go install -n github.com/docker/libcontainer/nsinit

push:
	./push gopath/src/github.com/docker/libcontainer/nsinit
	cp gopath/src/github.com/docker/libcontainer/LICENSE build/
	cp gopath/src/github.com/docker/libcontainer/NOTICE build/

local: setup build push

