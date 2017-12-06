#!/usr/bin/env bash

set -e

if [ "$1" = 'java' ]; then
	shift

	DEFAULT_MEM_JAVA_PERCENT=80

	if [ -z "$MEM_JAVA_PERCENT" ]; then
	    MEM_JAVA_PERCENT=$DEFAULT_MEM_JAVA_PERCENT
	fi

	# If MEM_TOTAL_MB is set, the heap is set to a percent of that
	# value equal to MEM_JAVA_PERCENT; otherwise it uses the default
	# memory settings.
	if [ ! -z "$MEM_TOTAL_MB" ]; then
	    MEM_JAVA_MB=$(($MEM_TOTAL_MB * $MEM_JAVA_PERCENT / 100))
	    MEM_JAVA_ARGS="-Xmx${MEM_JAVA_MB}m"
	else
		MEM_JAVA_ARGS=""
	fi

	java $MEM_JAVA_ARGS $@
else
	exec "$@"
fi
