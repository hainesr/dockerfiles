#
# Dockerfile for the Perforce Helix Clients.
#
# Robert Haines.
#
# BSD Licenced. See LICENCE for details.
#

FROM debian:sid
MAINTAINER Robert Haines <robert.haines@manchester.ac.uk>

COPY p4v.tgz /tmp/p4v.tgz
RUN apt-get update -q \
  && DEBIAN_FRONTEND=noninteractive \
    apt-get install -qy \
    libdbus-1-3 \
    libfontconfig1 \
    libfreetype6 \
    libgl1-mesa-dri \
    libgl1-mesa-glx \
    libxi6 \
    libxml2 \
    libxrender1 \
    xkb-data \
    --no-install-recommends \
  && mkdir -p /opt/p4v \
  && mkdir -p /opt/work \
  && tar -xzf /tmp/p4v.tgz -C /opt/p4v --strip-components 1 \
  && rm -f /tmp/p4v.tgz \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ENV HOME /home/p4v
RUN useradd --create-home --home-dir $HOME --gid users p4v \
	&& chown -R p4v:users $HOME \
  && chown -R p4v:users /opt

WORKDIR /opt/work
USER p4v

COPY entrypoint.sh /opt/p4v/bin/

ENTRYPOINT ["/opt/p4v/bin/entrypoint.sh"]
