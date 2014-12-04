**Inactive:** Now that Docker includes `docker exec`, I'm no longer actively packaging nsinit

nsinit
=======

[![Apache Licensed](http://img.shields.io/badge/license-MIT-green.svg)](https://tldrlegal.com/license/apache-license-2.0-(apache-2.0))

Build script and container for [nsinit](https://github.com/docker/libcontainer/tree/master/nsinit). I didn't write nsinit, the fine folks who contribute to the libcontainer project did. I just wrote these couple commands to build nsinit out of their repo for my use.

## To build

Run `make`. To start a shell in the build environment for manual actions, run `make manual`.

## License

The nsinit code is released under the Apache License. See the bundled `./build/LICENSE` file for details.

The Dockerfile and Makefile are released under the MIT License. See the bundled LICENSE file for details.

