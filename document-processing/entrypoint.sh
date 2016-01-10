#!/bin/bash
#
# Entrypoint script for the document-processing image. This seemingly noop
# script appears to be needed to override the ENTRYPOINT of the docker image
# from which this one is derived.
#
# Robert Haines.
#
# BSD Licenced. See LICENCE for details.
#

trap 'exit' ERR

exec "$@"
