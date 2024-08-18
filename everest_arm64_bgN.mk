TARGET_GAPPS_ARCH := arm64
include build/make/target/product/aosp_arm64.mk
$(call inherit-product, device/phh/treble/base.mk)

$(call inherit-product, device/phh/treble/gapps.mk)
$(call inherit-product, device/phh/treble/everest.mk)

PRODUCT_NAME := everest_arm64_bgN
PRODUCT_DEVICE := tdgsi_arm64_ab
PRODUCT_BRAND := google
PRODUCT_SYSTEM_BRAND := google
PRODUCT_MODEL := EverestOS with GApps

WITH_GAPPS := true

TARGET_INCLUDE_LAUNCHER3 := true
TARGET_INCLUDE_PIXEL_LAUNCHER := false
TARGET_INCLUDE_LAWNCHAIR := false

EVEREST_BUILD_TYPE := OFFICIAL

# Overwrite the inherited "emulator" characteristics
PRODUCT_CHARACTERISTICS := device

PRODUCT_PACKAGES += 
