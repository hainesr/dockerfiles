#!/bin/bash
#
# Entrypoint script for the Perforce Helix Clients docker image.
#
# Robert Haines.
#
# BSD Licenced. See LICENCE for details.
#

trap 'exit' ERR

if [ "$1" = 'p4merge' ]; then
  exec /opt/p4v/bin/p4merge "${@:2}"
fi

exec "$@"
