#!/bin/bash

#Inizialize variables
top_patches="$(cd `dirname $0`; pwd)"
top_build="$(dirname $top_patches)"

echo -e "Deleting old repos"
rm -rf $top_build/build
rm -rf $top_build/device/samsung/janice
rm -rf $top_build/packages/apps/Settings
rm -rf $top_build/vendor/pa

echo -e "Repo sync"
cd $top_build
repo sync

echo -e "Patching build.."
cd build
git fetch https://github.com/hastalafiesta-/android_build.git kitkat
git cherry-pick 3c71484c3efa476e66c05c7fe953d0948d779083
git cherry-pick 84a1d1672995a51bd7c6130b0cf7e6e6e2f5511d
git fetch https://github.com/t4n017/android_build.git kitkat
git cherry-pick dc0a6596eb93756b2768ed87525540a0eea9aacc
git cherry-pick 7b22bba3009d6b4ae34db645db290829bf887b61

echo -e "Patching vendor/pa.."
cd build
git fetch https://github.com/hastalafiesta-/android_vendor_pa.git kitkat
git cherry-pick 0c3769d0582f73785e7e3185afb3c8ebbdf24071

echo -e "Patching device/samsung/janice.."
cd $top_build
cd device/samsung/janice
git fetch https://github.com/hastalafiesta-/android_device_samsung_janice.git pa
git cherry-pick 9d048e654cedc98025c59f47cf0b24612b75dd92

echo -e "Patching device/samsung/u8500-common.."
cd $top_build
cd device/samsung/u8500-common
git fetch https://github.com/hastalafiesta-/android_device_samsung_u8500-common.git pa
git cherry-pick 05897d17faa6af5ce0ebc50b64670f1b84c9eb46
git cherry-pick d1ea13cc2bc5ed6976eb5df00e168e80b51a4f4f

echo -e "Patching Settings.."
cd $top_build
cd packages/apps/Settings
git fetch https://github.com/hastalafiesta-/android_packages_apps_Settings.git kitkat
git cherry-pick a80e3e831b0b19f4ee9cca6ef391fb489874da8c
git cherry-pick 9f6a454df763b7b85a4fd1d3936224676e62500f

echo -e "Patching frameworks/av.."
cd $top_build
cd frameworks/av
git fetch https://github.com/t4n017/android_frameworks_av.git kitkat
git cherry-pick 14ff212688a8407d9a27b7be7638a25a3e2958a9

echo -e "Patching frameworks/base.."
cd $top_build
cd frameworks/base
git fetch https://github.com/t4n017/android_frameworks_base.git kitkat
git cherry-pick 8c5558637e3b2d8b8516ba7c84154e05bb9bf9b4
git cherry-pick 8ad9220c2ae4b8f49d4e71c461e7d1edf5d1fe9f

echo -e "Patching frameworks/native.."
cd $top_build
cd frameworks/native
git fetch https://github.com/t4n017/android_frameworks_native.git kitkat
git cherry-pick 87a8c8ad15129e648757e487c45beecc70b553da

echo -e "Patching packages/apps/DeskClock.."
cd $top_build
cd packages/apps/DeskClock
git fetch https://github.com/t4n017/android_packages_apps_DeskClock.git kitkat
git cherry-pick f92e1c592b4580cb206f2c60312dcb94c0f2810b

echo -e "Patching system/core.."
cd $top_build
cd system/core
git fetch https://github.com/t4n017/android_system_core.git kitkat
git cherry-pick 4478c4a03f3195aa2fc4c634831651dfa65845b7
git cherry-pick 2ef56c91b0acc24ea009c41303446a661ecdb546

echo -e "Patching system/vold.."
cd $top_build
cd system/vold
git fetch https://github.com/t4n017/android_system_vold.git kitkat
git cherry-pick 61b66e643a1577c12abba880c4cf020d13cce741
