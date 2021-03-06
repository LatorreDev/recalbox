################################################################################
#
# rtl8189fs
#
################################################################################

RTL8189FS_VERSION = 930d3d7cfe3b25c0cf8a57ca4b79f6aef5b6de4b
RTL8189FS_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189FS_VERSION))
RTL8189FS_LICENSE = GPL-2.0

RTL8189FS_MODULE_MAKE_OPTS = \
	CONFIG_RTL8189FS=m \
	KVER=$(LINUX_VERSION_PROBED) \
	KSRC=$(LINUX_DIR)

$(eval $(kernel-module))
$(eval $(generic-package))
