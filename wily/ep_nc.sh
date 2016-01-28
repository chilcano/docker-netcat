#!/bin/bash
set -e

# Prepend "netcat" if the first argument is not an executable
if ! type -- "$1" &> /dev/null; then
	set -- /bin/netcat "$@"
fi
echo "->>>>>> (Executing '"$@"') <<<<<<-"

exec "$@"