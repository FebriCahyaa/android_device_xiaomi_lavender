#
# Copyright (C) 2022-2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

# Inherit from lavender device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

# Inherit some common Superior stuff.
$(call inherit-product, vendor/superior/config/common.mk)
SUPERIOR_EDITION := Vanilla
SPOS_MAINTAINER := FebriCahyaa

# Additional stuff for this product.
TARGET_INCLUDE_PIXEL_CHARGER := true
TARGET_GAPPS_ARCH := arm64
TARGET_INCLUDE_STOCK_ARCORE := false
TARGET_INCLUDE_LIVE_WALLPAPERS := false
TARGET_SUPPORTS_GOOGLE_RECORDER := false
TARGET_SUPPORTS_BLUR := false

# Additional stuff for this package
USE_AOSP_DIALER := true
USE_DOTGALLERY := true
USE_MOTO_CALCULATOR := true
TARGET_INCLUDE_MATLOG := true

# Target from device
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_SUPPORTS_QUICK_TAP := true

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := superior_lavender
PRODUCT_DEVICE := lavender
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Redmi Note 7

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

TARGET_VENDOR_PRODUCT_NAME := lavender

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="cheetah-user 13 TQ3A.230705.001 10216780 release-keys"

BUILD_FINGERPRINT := google/cheetah/cheetah:13/TQ3A.230705.001/10216780:user/release-keys