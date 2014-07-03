DIR=$(shell pwd)

.PHONY : default build_container manual container build push local

default: container

build_container:
	docker build --no-cache -t nsinit meta

manual: build_container
	./meta/launch /bin/bash || true

container: build_container
	./meta/launch

build:
	GOPATH=$(DIR)/gopath go get -u github.com/docker/libcontainer/nsinit
	GOPATH=$(DIR)/gopath go install -n github.com/docker/libcontainer/nsinit
	cp gopath/src/github.com/docker/libcontainer/nsinit ./build/nsinit

push:
	ssh -oStrictHostKeyChecking=no git@github.com &>/dev/null || true
	targit -a .github -c -f dock0/nsinit $$(./build/nsinit -v | awk '{print $$NF}') build/nsinit

local: build push

