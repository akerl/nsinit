#!/usr/bin/env bash

set -e

cd $(dirname $0)
export GOPATH="$(pwd)/deps"
cd libcontainer/nsinit
go get -d
go build --ldflags '-extldflags "-static"' &>/dev/null || echo 'Failed to build'
mv nsinit ../../nsinit

