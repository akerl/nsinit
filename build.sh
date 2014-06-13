#!/usr/bin/env bash

set -e
cd $(dirname $0)

mkdir -p gopath/{src,pkg,bin}
export GOPATH="$(pwd)/gopath"

go get -u github.com/docker/libcontainer/nsinit
go install -n github.com/docker/libcontainer/nsinit

cp gopath/src/github.com/docker/libcontainer/LICENSE .
cp gopath/src/github.com/docker/libcontainer/NOTICE .
cp gopath/bin/nsinit .

