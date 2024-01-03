#
# Copyright (C) 2018 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/lavender
BOARD_VENDOR := xiaomi

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a73
TARGET_CPU_VARIANT_RUNTIME := cortex-a73

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a73
TARGET_2ND_CPU_VARIANT_RUNTIME := kryo

# Audio
BOARD_USES_ALSA_AUDIO := true
BOARD_SUPPORTS_SOUND_TRIGGER := true
AUDIO_FEATURE_ENABLED_GEF_SUPPORT := true
AUDIO_FEATURE_ENABLED_EXT_AMPLIFIER := false

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "qualcomm-hidl"

# Bootloader / Platform
TARGET_BOOTLOADER_BOARD_NAME := sdm660
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := sdm660

# Build
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
RELAX_USES_LIBRARY_CHECK := true
BUILD_BROKEN_ENFORCE_SYSPROP_OWNER := true

# Camera
TARGET_USES_QTI_CAMERA_DEVICE := true

# Display
TARGET_SCREEN_DENSITY := 420

# DRM
TARGET_ENABLE_MEDIADRM_64 := true

# DT2W
TARGET_TAP_TO_WAKE_NODE := "/sys/touchpanel/double_tap"

# Filesystem
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/configs/config.fs
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_COPY_OUT_VENDOR := vendor

# FM
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true
BOARD_HAS_QCA_FM_SOC := cherokee

# Graphics
BOARD_USES_ADRENO := true
TARGET_USES_HWC2 := true
TARGET_USES_GRALLOC1 := true
TARGET_USES_ION := true

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := default
LOC_HIDL_VERSION := 3.0

# HIDL
DEVICE_FRAMEWORK_MANIFEST_FILE := $(DEVICE_PATH)/configs/hidl/framework_manifest.xml
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/configs/hidl/manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/configs/hidl/compatibility_matrix.xml

# HALS
USE_DEVICE_SPECIFIC_AUDIO := true
DEVICE_SPECIFIC_AUDIO_PATH := $(DEVICE_PATH)/qcom-caf/audio
USE_DEVICE_SPECIFIC_DISPLAY := true
DEVICE_SPECIFIC_DISPLAY_PATH := $(DEVICE_PATH)/qcom-caf/display
USE_DEVICE_SPECIFIC_MEDIA := true
DEVICE_SPECIFIC_MEDIA_PATH := $(DEVICE_PATH)/qcom-caf/media

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_lavender
TARGET_RECOVERY_DEVICE_MODULES := libinit_lavender

# Kernel
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 sched_enable_power_aware=1 service_locator.enable=1 androidboot.configfs=true androidboot.usbcontroller=a800000.dwc3
BOARD_KERNEL_CMDLINE += loop.max_part=7
BOARD_KERNEL_CMDLINE += printk.devkmsg=on
BOARD_KERNEL_CMDLINE += usbcore.autosuspend=7
BOARD_KERNEL_CMDLINE += androidboot.init_fatal_reboot_target=recovery
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_CONFIG := lavender_defconfig
BOARD_KERNEL_SEPARATED_DTBO := true
TARGET_KERNEL_LLVM_BINUTILS := false
TARGET_KERNEL_SOURCE := kernel/xiaomi/lavender
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_ADDITIONAL_FLAGS := \
    HOSTCFLAGS="-fuse-ld=lld -Wno-unused-command-line-argument"

# Partitions
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3758096384 # 3580 MB
BOARD_VENDORIMAGE_PARTITION_SIZE := 2147483648 # 2048 MB
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x04000000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x04000000
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456 # 256 MB
BOARD_USERDATAIMAGE_PARTITION_SIZE := 116748414464
BOARD_DTBOIMG_PARTITION_SIZE := 8388608 # 8 MB
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_ROOT_EXTRA_SYMLINKS := \
    /vendor/dsp:/dsp \
    /vendor/firmware_mnt:/firmware \
    /vendor/bt_firmware:/bt_firmware \
    /mnt/vendor/persist:/persist

# Properties
TARGET_ODM_PROP += $(DEVICE_PATH)/props/odm.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/props/product.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/props/system_ext.prop
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/props/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/props/vendor.prop

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# Security patch level
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# SELinux
include device/qcom/sepolicy-legacy-um/SEPolicy.mk
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/public
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/private

# Treble
BOARD_VNDK_VERSION := current

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA2048
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_AP := "ap"
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_P2P := "p2p"
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WPA_SUPPLICANT_VERSION := VER_0_8_X

# Inherit the proprietary files
include vendor/xiaomi/lavender/BoardConfigVendor.mk
