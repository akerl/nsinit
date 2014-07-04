DIR=$(shell pwd)

.PHONY : default build_container manual container build push local

default: container

build_container:
	docker build -t nsinit meta

manual: build_container
	./meta/launch /bin/bash || true

container: build_container
	./meta/launch

build:
	GOPATH=$(DIR)/gopath go get -u github.com/docker/libcontainer/nsinit
	GOPATH=$(DIR)/gopath go build -o build/nsinit github.com/docker/libcontainer/nsinit/main

push:
	targit -a .github -c -f dock0/nsinit $$(./build/nsinit -v | awk '{print $$NF}') build/nsinit
	targit -a .github -c -f dock0/nsinit master build/nsinit

local: build push

