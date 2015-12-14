#!/bin/bash
#
# Entrypoint script for the XnViewMP docker image.
#
# Robert Haines.
#
# BSD Licenced. See LICENCE for details.
#

trap 'exit' ERR

if [[ "$1" = 'xnview' || "$1" = 'xnviewmp' ]]; then
  exec /opt/XnView/xnview.sh /home/xnview/pics
fi

exec "$@"
