################################################################################
#
# recalbox settings manager
#
################################################################################

RECALBOX_SETTINGS_SITE = https://gitlab.com/recalbox/recalbox-settings.git
RECALBOX_SETTINGS_VERSION = dfb46d122b4b87aa0cdd01ddf17c54dd982e3ee0
RECALBOX_SETTINGS_SITE_METHOD = git
RECALBOX_SETTINGS_LICENSE = MIT

define RECALBOX_SETTINGS_INSTALL_TARGET_CMDS
	cp $(@D)/recalbox_settings $(TARGET_DIR)/usr/bin/
	cp $(@D)/recallog $(TARGET_DIR)/usr/bin/
endef

RECALBOX_SETTINGS_CONF_OPTS += -DCMAKE_C_ARCHIVE_CREATE="<CMAKE_AR> qcs <TARGET> <LINK_FLAGS> <OBJECTS>"
RECALBOX_SETTINGS_CONF_OPTS += -DCMAKE_C_ARCHIVE_FINISH=true
RECALBOX_SETTINGS_CONF_OPTS += -DCMAKE_CXX_ARCHIVE_CREATE="<CMAKE_AR> qcs <TARGET> <LINK_FLAGS> <OBJECTS>"
RECALBOX_SETTINGS_CONF_OPTS += -DCMAKE_CXX_ARCHIVE_FINISH=true
RECALBOX_SETTINGS_CONF_OPTS += -DCMAKE_AR="$(TARGET_CC)-ar"
RECALBOX_SETTINGS_CONF_OPTS += -DCMAKE_C_COMPILER="$(TARGET_CC)"
RECALBOX_SETTINGS_CONF_OPTS += -DCMAKE_CXX_COMPILER="$(TARGET_CXX)"
RECALBOX_SETTINGS_CONF_OPTS += -DCMAKE_LINKER="$(TARGET_LD)"
RECALBOX_SETTINGS_CONF_OPTS += -DCMAKE_C_FLAGS="$(COMPILER_COMMONS_CFLAGS_EXE)"
RECALBOX_SETTINGS_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(COMPILER_COMMONS_CXXFLAGS_EXE)"
RECALBOX_SETTINGS_CONF_OPTS += -DCMAKE_LINKER_EXE_FLAGS="$(COMPILER_COMMONS_LDFLAGS_EXE)"

$(eval $(cmake-package))
