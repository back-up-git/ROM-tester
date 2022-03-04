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

# Prepare the Build Environment
source build/envsetup.sh

# lunch the target
lunch ${LUNCH_COMBO} || { echo "ERROR: Failed to lunch the target!" && exit 1; }

#Never Allow Fix
export SELINUX_IGNORE_NEVERALLOWS=true

./rom-build.sh raphael

# Exit
exit 0
