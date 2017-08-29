#!/usr/bin/env sh
#set -x
if [ -n "${RUNUSER_UID:-}" ]; then
    RUNUSER_HOME="${RUNUSER_HOME:-/home/runuser}"
    if [ -x /usr/sbin/useradd ]; then
        useradd -s /bin/false --no-create-home --home-dir "$RUNUSER_HOME" -u $RUNUSER_UID runuser
    else
        # For alpine linux and busybox
        adduser -s /bin/false -D -h $RUNUSER_HOME -H -u $RUNUSER_UID runuser
    fi
    # Insert commandline arguments
    set -- su-exec runuser "$@"
fi
exec "$@"
