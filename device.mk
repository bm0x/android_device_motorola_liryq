#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Include GSI keys
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-impl.recovery \
    android.hardware.boot@1.2-service

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Partitions
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Product characteristics
PRODUCT_CHARACTERISTICS := nosdcard

# Rootdir
PRODUCT_PACKAGES += \
    apanic_annotate.sh \
    apanic_copy.sh \
    apanic_mtk.sh \
    apanic_save.sh \
    hardware_revisions.sh \
    init.insmod.sh \
    init.mmi.backup.trustlet.sh \
    init.mmi.block_perm.sh \
    init.mmi.boot.sh \
    init.mmi.modem-rfs.sh \
    init.mmi.modules.sh \
    init.mmi.shutdown.sh \
    init.mmi.touch.sh \
    init.mmi.usb.sh \
    init.oem.hw.sh \
    pstore_annotate.sh \

PRODUCT_PACKAGES += \
    fstab.mt6893 \
    apanic.rc \
    factory_init.connectivity.common.rc \
    factory_init.connectivity.rc \
    factory_init.project.rc \
    factory_init.rc \
    init.aee.rc \
    init.ago.rc \
    init.cgroup.rc \
    init.connectivity.common.rc \
    init.connectivity.rc \
    init.mmi.backup.trustlet.rc \
    init.mmi.chipset.rc \
    init.mmi.overlay.rc \
    init.mmi.rc \
    init.mmi.sec.rc \
    init.mmi.tcmd.rc \
    init.modem.rc \
    init.mt6893.rc \
    init.mt6893.usb.rc \
    init.project.rc \
    init.sensor_2_0.rc \
    init_conninfra.rc \
    meta_init.connectivity.common.rc \
    meta_init.connectivity.rc \
    meta_init.modem.rc \
    meta_init.project.rc \
    meta_init.rc \
    meta_init.vendor.rc \
    multi_init.rc \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.mt6893:$(TARGET_VENDOR_RAMDISK_OUT)/first_stage_ramdisk/fstab.mt6893

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 33

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/motorola/lyriq/lyriq-vendor.mk)
