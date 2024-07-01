$(call inherit-product, vendor/everest/config/common_full_phone.mk)
$(call inherit-product, vendor/everest/config/BoardConfigEverest.mk)
$(call inherit-product, device/everest/sepolicy/common/sepolicy.mk)
-include vendor/everest/build/core/config.mk

# Bootanimation (force 1080p - 1080x1920)
TARGET_BOOT_ANIMATION_RES := 1080

# Kernel
TARGET_NO_KERNEL_IMAGE := true
TARGET_NO_KERNEL_OVERRIDE := true

# Overlay
PRODUCT_PACKAGE_OVERLAYS += \
   $(LOCAL_PATH)/overlay-everest

# Packages
PRODUCT_PACKAGES += \
  # AuroraStorePrivilegedExtension \
  # F-DroidPrivilegedExtension \
  # OpenEUICC

# Everest Specific Build Flags
EVEREST_MAINTAINER := "kaii-lb"
TARGET_SUPPORTS_BLUR := true
TARGET_HAS_UDFPS := false
EXTRA_UDFPS_ANIMATIONS := false
WITH_GAPPS := true
TARGET_INCLUDE_PIXEL_LAUNCHER := true

# SELinux
SELINUX_IGNORE_NEVERALLOWS := true
TARGET_USES_PREBUILT_VENDOR_SEPOLICY := true
