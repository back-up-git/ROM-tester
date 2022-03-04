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
#git clone --depth=1 $HW_LINK $HW_PATH
rm -rf vendor/aospa
git clone --depth=1 $VA_LINK $VA_PATH

rm -rf vendor/aospa
#rm -rf hardware/qcom-caf/sm8250/display
#rm -rf hardware/qcom-caf/sm8350/display
#rm -rf hardware/qcom-caf/sm8150/audio
#rm -rf hardware/qcom-caf/sm8250/audio
#rm -rf hardware/qcom-caf/sm8350/audio

#git clone https://github.com/ArrowOS-Devices/android_device_xiaomi_extras.git -b arrow-12.0 device/xiaomi/extras
#git clone https://github.com/ArrowOS/android_hardware_qcom_display.git -b arrow-12.0-caf-sm8150 hardware/qcom-caf/sm8150/display
#git clone https://github.com/ArrowOS/android_hardware_qcom_audio.git -b arrow-12.0-caf-sm8150 hardware/qcom-caf/sm8150/audio
#git clone https://github.com/LineageOS/android_packages_resources_devicesettings.git -b lineage-19.0 packages/resources/devicesettings

# Exit
exit 0
