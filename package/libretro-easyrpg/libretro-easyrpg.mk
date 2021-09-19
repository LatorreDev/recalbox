################################################################################
#
# EasyRPG Player
#
################################################################################

LIBRETRO_EASYRPG_VERSION = 0799b06790d83f0d62ece88cebb842454f8468a9
LIBRETRO_EASYRPG_SITE = git://github.com/EasyRPG/Player.git
LIBRETRO_EASYRPG_DEPENDENCIES = pixman libpng zlib fmt freetype mpg123 wildmidi libvorbis libogg opusfile libsndfile libxmp-lite liblcf speexdsp
LIBRETRO_EASYRPG_GIT_SUBMODULES=y
LIBRETRO_EASYRPG_LICENSE = GPL-3.0
LIBRETRO_EASYRPG_LICENSE_FILES = COPYING

LIBRETRO_EASYRPG_CONF_OPTS=-DPLAYER_TARGET_PLATFORM=libretro -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release

define LIBRETRO_EASYRPG_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/easyrpg_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/easyrpg_libretro.so
endef

LIBRETRO_EASYRPG_CONF_OPTS += -DCMAKE_C_ARCHIVE_CREATE="<CMAKE_AR> qcs <TARGET> <LINK_FLAGS> <OBJECTS>"
LIBRETRO_EASYRPG_CONF_OPTS += -DCMAKE_C_ARCHIVE_FINISH=true
LIBRETRO_EASYRPG_CONF_OPTS += -DCMAKE_CXX_ARCHIVE_CREATE="<CMAKE_AR> qcs <TARGET> <LINK_FLAGS> <OBJECTS>"
LIBRETRO_EASYRPG_CONF_OPTS += -DCMAKE_CXX_ARCHIVE_FINISH=true
LIBRETRO_EASYRPG_CONF_OPTS += -DCMAKE_AR="$(TARGET_CC)-ar"
LIBRETRO_EASYRPG_CONF_OPTS += -DCMAKE_C_COMPILER="$(TARGET_CC)"
LIBRETRO_EASYRPG_CONF_OPTS += -DCMAKE_CXX_COMPILER="$(TARGET_CXX)"
LIBRETRO_EASYRPG_CONF_OPTS += -DCMAKE_LINKER="$(TARGET_LD)"
LIBRETRO_EASYRPG_CONF_OPTS += -DCMAKE_C_FLAGS="$(COMPILER_COMMONS_CFLAGS_SO)"
LIBRETRO_EASYRPG_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(COMPILER_COMMONS_CXXFLAGS_SO)"
LIBRETRO_EASYRPG_CONF_OPTS += -DCMAKE_LINKER_EXE_FLAGS="$(COMPILER_COMMONS_LDFLAGS_SO)"

$(eval $(cmake-package))