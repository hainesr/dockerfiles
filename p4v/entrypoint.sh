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
  exec /opt/p4v/bin/p4vc "${@:2}"
fi

exec "$@"
