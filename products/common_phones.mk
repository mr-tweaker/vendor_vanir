# Vanir common
$(call inherit-product, vendor/vanir/products/common.mk)

# World APN list
PRODUCT_COPY_FILES += \
    vendor/vanir/proprietary/common/etc/apns-conf.xml:system/etc/apns-conf.xml

# Selective SPN list for operator number who has the problem. 
PRODUCT_COPY_FILES += \
    vendor/vanir/proprietary/common/etc/selective-spn-conf.xml:system/etc/selective-spn-conf.xml

# SIM Toolkit
PRODUCT_PACKAGES += \
    Stk

PRODUCT_PACKAGES += \
    LatinIME \
    SpeakerProximity \
    CellBroadcastReceiver \
    messaging

# Audio Packages
include frameworks/base/data/sounds/AudioPackage7.mk

PRODUCT_PACKAGE_OVERLAYS += vendor/vanir/overlay/dictionaries
