#!/bin/bash

# Make the Directory if it doesn't exist
mkdir -p $SYNC_PATH

# Change to the Source Directory
cd $SYNC_PATH

# Init Repo
repo init --depth=1 -u $MANIFEST -b $MANIFEST_BRANCH

# Sync the Sources
repo sync -j$(nproc --all) --force-sync --no-tags --no-clone-bundle

# Clone Trees #
git clone --depth=1 $DT_LINK $DT_PATH || { echo "ERROR: Failed to Clone the Device Trees!" && exit 1; }
git clone --depth=1 $VT_LINK $VT_PATH
git clone --depth=1 $KT_LINK $KT_PATH
git clone --depth=1 $HW_LINK $HW_PATH
git clone --depth=1 $CM_LINK $CM_PATH

#rm -rf hardware/qcom-caf/sm8150/display
#rm -rf hardware/qcom-caf/sm8250/display
#rm -rf hardware/qcom-caf/sm8350/display
#rm -rf hardware/qcom-caf/sm8150/audio
#rm -rf hardware/qcom-caf/sm8250/audio
#rm -rf hardware/qcom-caf/sm8350/audio

git clone https://github.com/LineageOS/android_packages_resources_devicesettings.git -b lineage-19.1 packages/resources/devicesettings
git clone https://gitlab.com/Panchajanya1999/azure-clang.git -b main prebuilts/clang/host/linux-x86/clang-azure

# Exit
exit 0
