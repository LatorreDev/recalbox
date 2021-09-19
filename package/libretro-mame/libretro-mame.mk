################################################################################
#
# MAME
#
################################################################################

# Romset 0.235
LIBRETRO_MAME_VERSION = 7b6d18f3d6b951954db9849137c018d8b00a70d5
LIBRETRO_MAME_SITE = $(call github,libretro,mame,$(LIBRETRO_MAME_VERSION))
LIBRETRO_MAME_LICENSE = MAME
LIBRETRO_MAME_NON_COMMERCIAL = y
LIBRETRO_MAME_DEPENDENCIES = alsa-lib

ifeq ($(BR2_x86_64),y)
LIBRETRO_MAME_OPTS += PTR64=1
LIBRETRO_MAME_OPTS += LIBRETRO_CPU=x86_64
LIBRETRO_MAME_OPTS += PLATFORM=x86_64
endif

ifeq ($(BR2_i386),y)
LIBRETRO_MAME_OPTS += PTR64=0
LIBRETRO_MAME_OPTS += LIBRETRO_CPU=x86
LIBRETRO_MAME_OPTS += PLATFORM=x86
LIBRETRO_MAME_OPTS += ARCHITECTURE=""
endif

ifeq ($(BR2_arm),y)
LIBRETRO_MAME_OPTS += PTR64=0
LIBRETRO_MAME_OPTS += LIBRETRO_CPU=arm
LIBRETRO_MAME_OPTS += PLATFORM=arm
LIBRETRO_MAME_OPTS += ARCHITECTURE=""
LIBRETRO_MAME_OPTS += NOASM=1
LIBRETRO_MAME_ARCHOPTS += -D__arm__
endif

LIBRETRO_MAME_OPTS += ARCHOPTS="$(LIBRETRO_MAME_ARCHOPTS)"

LIBRETRO_MAME_OPTS += PROJECT=""
LIBRETRO_MAME_OPTS += DISTRO=debian-stable
LIBRETRO_MAME_OPTS += TARGETOS=linux
LIBRETRO_MAME_OPTS += LIBRETRO_OS=unix
LIBRETRO_MAME_OPTS += CONFIG=libretro
LIBRETRO_MAME_OPTS += OSD=retro
LIBRETRO_MAME_OPTS += TARGET=mame
LIBRETRO_MAME_OPTS += SUBTARGET=arcade
LIBRETRO_MAME_OPTS += PYTHON_EXECUTABLE=python3
LIBRETRO_MAME_OPTS += OPENMP=1
LIBRETRO_MAME_OPTS += REGENIE=1
LIBRETRO_MAME_OPTS += VERBOSE=1
LIBRETRO_MAME_OPTS += NOWERROR=1
LIBRETRO_MAME_OPTS += RETRO=1
LIBRETRO_MAME_OPTS += DEBUG=0
LIBRETRO_MAME_OPTS += ARCH=""

LIBRETRO_MAME_OPTS += OPTIMIZE=3
#LIBRETRO_MAME_OPTS += LTO=1

LIBRETRO_MAME_OPTS += CROSS_BUILD=1
LIBRETRO_MAME_OPTS += OVERRIDE_CXX="$(TARGET_CXX)" OVERRIDE_CC="$(TARGET_CC)" OVERRIDE_LD="$(TARGET_LD)"
LIBRETRO_MAME_OPTS += RANLIB="$(TARGET_RANLIB)" AR="$(TARGET_AR)"

define LIBRETRO_MAME_BUILD_CMDS
	mkdir -p $(@D)/build/gmake/libretro/obj/x64/libretro/src/osd/retro
	mkdir -p $(@D)/3rdparty/genie/build/gmake.linux/obj/Release/src/host
	$(MAKE) -C $(@D)/ -f makefile $(LIBRETRO_MAME_OPTS)
endef

define LIBRETRO_MAME_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/mamearcade_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/mame_libretro.so
	mkdir -p $(TARGET_DIR)/recalbox/share_upgrade/bios/mame/samples
endef

$(eval $(generic-package))