$(call inherit-product, vendor/lineage/config/common_full_phone.mk)
$(call inherit-product, vendor/lineage/config/BoardConfigLineage.mk)
$(call inherit-product, device/lineage/sepolicy/common/sepolicy.mk)
include vendor/lineage/build/core/config.mk
include build/make/target/product/aosp_arm64.mk

# Bootanimation (force 1080p - 1080x1920)
TARGET_BOOT_ANIMATION_RES := 1080

# Kernel
TARGET_NO_KERNEL_IMAGE := true
TARGET_NO_KERNEL_OVERRIDE := true

# Overlay
PRODUCT_PACKAGE_OVERLAYS += \
   $(LOCAL_PATH)/overlay-lineage

# Packages
PRODUCT_PACKAGES += \
  OpenEUICC \
  $(call subtract-product-packages, \
      $(PRODUCT_PACKAGES), \
      org.codeaurora.ims) 

# Ota
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.system.ota.json_url=https://raw.githubusercontent.com/kaii-lb/treble_everest/14/ota.json

# Everest Specific Build Flags
EVEREST_MAINTAINER := "kaii-lb"
EVEREST_BUILD_TYPE := OFFICIAL
TARGET_SUPPORTS_BLUR := true
TARGET_HAS_UDFPS := true
EXTRA_UDFPS_ANIMATIONS := true
TARGET_INCLUDE_LAUNCHER3 := true
TARGET_PREBUILT_LAWNCHAIR_LAUNCHER := true

# SELinux
SELINUX_IGNORE_NEVERALLOWS := true
TARGET_USES_PREBUILT_VENDOR_SEPOLICY := true
