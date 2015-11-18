#Squisher Choosing
DHO_VENDOR := vanir

KERNEL_SPAM := AOSP 3.10.0 Prebuilt

# Run these first or they will not stick
PRODUCT_PROPERTY_OVERRIDES += \
    ro.goo.rom=vanir-FLOUNDER

# Tablet Overlays no radios
PRODUCT_PACKAGE_OVERLAYS += vendor/vanir/overlay/tab_no_radio

# Boot Animation
PRODUCT_COPY_FILES += \
    vendor/vanir/proprietary/boot_animations/832x520.zip:system/media/bootanimation.zip

# Enhanced NFC
$(call inherit-product, vendor/vanir/config/nfc_enhanced.mk)

# Inherit AOSP device configuration for grouper
$(call inherit-product, device/htc/flounder/full_flounder.mk)

# Inherit common product files.
$(call inherit-product, vendor/vanir/products/common_tabs.mk)

# Inline kernel building
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/aarch64/aarch64-linux-android-4.9/bin
KERNEL_TOOLCHAIN_PREFIX := aarch64-linux-android-
TARGET_KERNEL_SOURCE := kernel/htc/flounder
TARGET_KERNEL_CONFIG := flounder_defconfig
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_CMDLINE := androidboot.selinux=enforcing
TARGET_PREBUILT_KERNEL := false

# Extra Packages
PRODUCT_PACKAGES += \
    com.android.nfc_extras

# CM Overlays
DEVICE_PACKAGE_OVERLAYS += device/htc/flounder/overlay-cm

# Enable USB OTG (CAF commit to Settings)
ADDITIONAL_BUILD_PROPERTIES += \
    persist.sys.isUsbOtgEnabled=true

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=flounder BUILD_FINGERPRINT=google/volantis/flounder:5.1.1/LMY48I/2074855:user/release-keys PRIVATE_BUILD_DESC="volantis-user 5.1.1 LMY48I 2074855 release-keys"

# Setup device specific product configuration.
PRODUCT_NAME := vanir_flounder
PRODUCT_BRAND := google
PRODUCT_DEVICE := flounder
PRODUCT_MODEL := Nexus 9
PRODUCT_MANUFACTURER := HTC
