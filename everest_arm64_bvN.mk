TARGET_GAPPS_ARCH := arm64
include build/make/target/product/aosp_arm64.mk
$(call inherit-product, device/phh/treble/base.mk)

$(call inherit-product, device/phh/treble/everest.mk)

PRODUCT_NAME := everest_arm64_bvN
PRODUCT_DEVICE := tdgsi_arm64_ab
PRODUCT_BRAND := google
PRODUCT_SYSTEM_BRAND := google
PRODUCT_MODEL := EverestOS Vanilla

WITH_GAPPS := false

TARGET_INCLUDE_LAUNCHER3 := true
TARGET_INCLUDE_PIXEL_LAUNCHER := false
TARGET_INCLUDE_LAWNCHAIR := false

EVEREST_BUILD_TYPE := OFFICIAL

# Overwrite the inherited "emulator" characteristics
PRODUCT_CHARACTERISTICS := device

PRODUCT_PACKAGES += \
  $(call subtract-product-packages, \
        $(PRODUCT_PACKAGES), \
        com.android.wallpaper)

PRODUCT_COPY_FILES += \
	vendor/gms/common/proprietary/system_ext/priv-app/WallpaperPickerGoogleRelease/WallpaperPickerGoogleRelease.apk:system/system_ext/priv-app/WallpaperPickerGoogleRelease/WallpaperPickerGoogleRelease.apk
	
