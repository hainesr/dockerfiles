#!/bin/bash
#
# Entrypoint script for the Perforce Helix Clients docker image.
#
# Robert Haines.
#
# BSD Licenced. See LICENCE for details.
#

trap 'exit' ERR

if [ "$1" = 'p4admin' ]; then
  exec /opt/p4v/bin/p4admin
fi

if [ "$1" = 'p4merge' ]; then
  exec /opt/p4v/bin/p4merge "${@:2}"
fi

if [ "$1" = 'p4v' ]; then
  exec /opt/p4v/bin/p4v
fi

if [ "$1" = 'p4vc' ]; then
  export LD_LIBRARY_PATH=/opt/p4v/lib/icu:/opt/p4v/lib/openssl
  exec /opt/p4v/bin/p4vc "${@:2}"
fi

exec "$@"
