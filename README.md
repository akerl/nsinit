nsinit
=======

[![Apache Licensed](http://img.shields.io/badge/license-MIT-green.svg)](https://tldrlegal.com/license/apache-license-2.0-(apache-2.0))

Build script and container for [nsinit](https://github.com/docker/libcontainer/tree/master/nsinit). I didn't write nsinit, the fine folks who contribute to the libcontainer project did. I just wrote these couple commands to build nsinit out of their repo for my use.

## Usage

To use, just symlink/copy/whatever `./build/nsinit` into your $PATH.

To build, run `make` and then commit the new nsinit binary.

## License

The nsinit code is released under the Apache License. See the bundled `./build/LICENSE` file for details.

The Dockerfile and Makefile are released under the MIT License. See the bundled LICENSE file for details.

