################################################################################
#
# SNES9X2005 / CATSFC
#
################################################################################

LIBRETRO_SNES9X2005_VERSION = 71db1be367d780caa6128bc2a3c3bd33567baf5a
LIBRETRO_SNES9X2005_SITE = $(call github,libretro,snes9x2005,$(LIBRETRO_SNES9X2005_VERSION))
LIBRETRO_SNES9X2005_LICENSE = COPYRIGHT
LIBRETRO_SNES9X2005_LICENSE_FILES = copyright
LIBRETRO_SNES9X2005_NON_COMMERCIAL = y

# Dynarec on all boards
LIBRETRO_SNES9X2005_SUPP_OPT=USE_DYNAREC=1

# RPI1 has no neon
ifeq ($(BR2_PACKAGE_RECALBOX_TARGET_RPI1),y)
LIBRETRO_SNES9X2005_SUPP_CFLAGS+=-Wa,-mimplicit-it=thumb
LIBRETRO_SNES9X2005_SUPP_OPT+=ARCH=arm
endif

# Activate neon for other pi
ifeq ($(BR2_PACKAGE_RECALBOX_TARGET_RPI2)$(BR2_PACKAGE_RECALBOX_TARGET_RPI3)$(BR2_PACKAGE_RECALBOX_TARGET_RPI4),y)
LIBRETRO_SNES9X2005_SUPP_OPT+=HAVE_NEON=1 BUILTIN_GPU=neon ARCH=arm
LIBRETRO_SNES9X2005_SUPP_CFLAGS+=-Wa,-mimplicit-it=thumb
endif

define LIBRETRO_SNES9X2005_BUILD_CMDS
	$(SED) "s|-O2|-O3|g" $(@D)/Makefile
	CFLAGS="$(TARGET_CFLAGS) $(COMPILER_COMMONS_CFLAGS_SO) $(LIBRETRO_SNES9X2005_SUPP_CFLAGS)" \
		CXXFLAGS="$(TARGET_CXXFLAGS) $(COMPILER_COMMONS_CXXFLAGS_SO) $(LIBRETRO_SNES9X2005_SUPP_CFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS) $(COMPILER_COMMONS_LDFLAGS_SO)" \
		$(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) platform="$(RETROARCH_LIBRETRO_PLATFORM)" $(LIBRETRO_SNES9X2005_SUPP_OPT) USE_BLARGG_APU=1
endef

define LIBRETRO_SNES9X2005_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/snes9x2005_plus_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/snes9x2005_libretro.so
endef

$(eval $(generic-package))
