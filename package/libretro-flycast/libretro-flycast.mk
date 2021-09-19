################################################################################
#
# FLYCAST
#
################################################################################

# Commit of 17/05/2021
LIBRETRO_FLYCAST_VERSION = 8e4fa54e26232d6d54d3b0adca163ae7e617b9bd
LIBRETRO_FLYCAST_SITE = $(call github,libretro,flycast,$(LIBRETRO_FLYCAST_VERSION))
LIBRETRO_FLYCAST_LICENSE = GPL-2.0

ifeq ($(BR2_PACKAGE_RECALBOX_TARGET_X86),y)
LIBRETRO_FLYCAST_PLATFORM = $(RETROARCH_LIBRETRO_PLATFORM)
LIBRETRO_FLYCAST_SUPP_OPT += ARCH=x86 LDFLAGS=-lrt
else ifeq ($(BR2_PACKAGE_RECALBOX_TARGET_X86_64),y)
LIBRETRO_FLYCAST_PLATFORM = $(RETROARCH_LIBRETRO_PLATFORM)
LIBRETRO_FLYCAST_SUPP_OPT += ARCH=x86_64 LDFLAGS=-lrt
else ifeq ($(BR2_PACKAGE_RECALBOX_TARGET_ODROIDXU4),y)
LIBRETRO_FLYCAST_PLATFORM = odroid
LIBRETRO_FLYCAST_SUPP_OPT += BOARD=ODROID-XU4 ARCH=arm FORCE_GLES=1 CC_AS="$(TARGET_CC)"
else ifeq ($(BR2_PACKAGE_RECALBOX_TARGET_ODROIDGO2),y)
LIBRETRO_FLYCAST_PLATFORM = odroid-go2
LIBRETRO_FLYCAST_SUPP_OPT += CC_AS="$(TARGET_CC)" LDFLAGS=-lrt
else ifeq ($(BR2_PACKAGE_RECALBOX_TARGET_RPI3),y)
LIBRETRO_FLYCAST_PLATFORM = rpi3
LIBRETRO_FLYCAST_SUPP_OPT += ARCH=arm FORCE_GLES=1 CC_AS="$(TARGET_CC)" LDFLAGS=-lrt
else ifeq ($(BR2_PACKAGE_RECALBOX_TARGET_RPI4),y)
LIBRETRO_FLYCAST_PLATFORM = rpi4
LIBRETRO_FLYCAST_SUPP_OPT += ARCH=arm FORCE_GLES=1 HAVE_LTCG=0 CC_AS="$(TARGET_CC)" LDFLAGS=-lrt
else
LIBRETRO_FLYCAST_PLATFORM = $(RETROARCH_LIBRETRO_PLATFORM)
LIBRETRO_FLYCAST_SUPP_OPT =
endif

LIBRETRO_FLYCAST_MAKE_ARGS = platform="$(LIBRETRO_FLYCAST_PLATFORM)" $(LIBRETRO_FLYCAST_SUPP_OPT)

define LIBRETRO_FLYCAST_BUILD_CMDS
	$(SED) "s|-O2|-O3|g" $(@D)/Makefile
	CFLAGS="$(TARGET_CFLAGS) $(COMPILER_COMMONS_CFLAGS_SO)" \
		CXXFLAGS="$(TARGET_CXXFLAGS) $(COMPILER_COMMONS_CXXFLAGS_SO)" \
		LDFLAGS="$(TARGET_LDFLAGS) $(COMPILER_COMMONS_LDFLAGS_SO)" \
		$(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" AR="$(TARGET_AR)" -C $(@D)/ -f Makefile $(LIBRETRO_FLYCAST_MAKE_ARGS)
endef

define LIBRETRO_FLYCAST_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/flycast_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/flycast_libretro.so
endef

$(eval $(generic-package))
