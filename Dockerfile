FROM dock0/arch
MAINTAINER akerl <me@lesaker.org>
RUN pacman -Syu --needed --noconfirm go base-devel
WORKDIR /opt/nsinit
CMD ["make", "local"]
