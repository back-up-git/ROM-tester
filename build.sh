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

# Build the Code
if [ -z "$J_VAL" ]; then
    ./rom-build.sh DEVICE || { echo "ERROR: Build Failed!" && exit 1; }
elif [ "$J_VAL"="0" ]; then
    ./rom-build.sh DEVICE || { echo "ERROR: Build Failed!" && exit 1; }
else
    ./rom-build.sh DEVICE || { echo "ERROR: Build Failed!" && exit 1; }
fi

# Exit
exit 0
