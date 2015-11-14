# p4v
#

FROM debian:sid
MAINTAINER Robert Haines <robert.haines@manchester.ac.uk>

COPY p4v.tgz /tmp/p4v.tgz
RUN apt-get update -q \
  && DEBIAN_FRONTEND=noninteractive \
    apt-get install -qy \
    libgl1-mesa-dri \
    libgl1-mesa-glx \
    libxrender1 \
    libxi6 \
    xkb-data \
    libfontconfig1 \
    libfreetype6 \
    libdbus-1-3 \
    libxml2 \
    --no-install-recommends \
  && mkdir -p /opt/p4v \
  && mkdir -p /opt/work \
  && tar -xzf /tmp/p4v.tgz -C /opt/p4v --strip-components 1 \
  && rm -f /tmp/p4v.tgz \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/work
