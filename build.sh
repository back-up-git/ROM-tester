#!/bin/bash

# Change to the Source Directory#
cd $SYNC_PATH

# Set-up ccache
if [ -z "$CCACHE_SIZE" ]; then
    ccache -M 10G
else
    ccache -M ${CCACHE_SIZE}
fi

# Run the Extra Command
# $EXTRA_CMD

#Never Allow Fix
export SELINUX_IGNORE_NEVERALLOWS=true

bash vendor/aospa/build.sh raphael

# Exit
exit 0
