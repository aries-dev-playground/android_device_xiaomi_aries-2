#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# inherit from qcom-common
-include device/xiaomi/msm8960-common/BoardConfigCommon.mk

LOCAL_PATH := device/xiaomi/aries

TARGET_BOOTLOADER_NAME       := aries
TARGET_BOARD_INFO_FILE       := $(LOCAL_PATH)/board-info.txt

TARGET_RELEASETOOLS_EXTENSIONS := $(LOCAL_PATH)

TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_SOURCE := kernel/xiaomi/msm8960
TARGET_KERNEL_CONFIG := aries-perf_defconfig
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-linux-androideabi-

# Audio
BOARD_HAVE_AUDIENCE_ES310               := true

BOARD_HAVE_NEW_QCOM_CSDCLIENT := true
BOARD_HAVE_CSD_FAST_CALL_SWITCH := true

OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
HAVE_ADRENO_SOURCE := false

TARGET_RECOVERY_FSTAB            := $(LOCAL_PATH)/rootdir/ramdisk/fstab.qcom

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# Board specific SELinux policy variable definitions
BOARD_SEPOLICY_DIRS += \
    device/qcom/sepolicy/common \
    device/qcom/sepolicy/ssg \
    device/qcom/sepolicy/$(TARGET_BOARD_PLATFORM)

ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
BOARD_SEPOLICY_DIRS += \
    device/qcom/sepolicy/test
endif

BOARD_PLAT_PUBLIC_SEPOLICY_DIR += \
    device/qcom/sepolicy/public

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/qcom/sepolicy/private

BOARD_SEPOLICY_DIRS += \
       device/xiaomi/aries/sepolicy

-include vendor/xiaomi/aries/BoardConfigVendor.mk

