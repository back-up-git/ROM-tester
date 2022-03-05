#!/bin/bash

# Make the Directory if it doesn't exist
mkdir -p $SYNC_PATH

# Change to the Source Directoryb#
cd $SYNC_PATH

# Init Repo
repo init --depth=1 -u $MANIFEST -b $MANIFEST_BRANCH

# Sync the Sources
repo sync -j$(nproc --all) --force-sync --no-tags --no-clone-bundle

# Clone Trees #
git clone --depth=1 $DT_LINK $DT_PATH || { echo "ERROR: Failed to Clone the Device Trees!" && exit 1; }
git clone --depth=1 $VT_LINK $VT_PATH
git clone --depth=1 $KT_LINK $KT_PATH
rm -rf vendor/aospa
git clone --depth=1 $VA_LINK $VA_PATH

rm -rf art
rm -rf bionic
#rm -rf external/zlib-ng
#rm -rf hardware/qcom-caf/sm8250/audio
#rm -rf hardware/qcom-caf/sm8350/audio


git clone https://github.com/pa-vayu/android_art.git -b sapphire art
git clone https://github.com/pa-vayu/android_bionic.git -b sapphire bionic
git clone https://github.com/AzurE-007/android_device_xiaomi_raphael-sepolicy -b ruby device/xiaomi/raphael-sepolicy
#git clone https://github.com/LineageOS/android_packages_resources_devicesettings.git -b lineage-19.0 packages/resources/devicesettings

# Exit
exit 0
