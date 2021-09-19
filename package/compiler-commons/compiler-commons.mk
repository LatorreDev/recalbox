################################################################################
#
# compiler-commons
#
################################################################################

COMPILER_COMMONS_LICENSE = MIT

# Board options
ifneq ($(BR2_GCC_TARGET_ABI),)
COMPILER_COMMONS_ABI += -mabi=$(BR2_GCC_TARGET_ABI)
endif
ifneq ($(BR2_GCC_TARGET_CPU),)
COMPILER_COMMONS_CPU += -mcpu=$(BR2_GCC_TARGET_CPU)
endif
ifneq ($(BR2_GCC_TARGET_FPU),)
COMPILER_COMMONS_FPU += -mfpu=$(BR2_GCC_TARGET_FPU)
endif
ifneq ($(BR2_GCC_TARGET_FLOAT_ABI),)
COMPILER_COMMONS_FLOAT_ABI += -mfloat-abi=$(BR2_GCC_TARGET_FLOAT_ABI)
endif
ifneq ($(BR2_GCC_TARGET_ARCH),)
COMPILER_COMMONS_ARCH += -march=$(BR2_GCC_TARGET_ARCH)
endif

# x86 options
ifneq ($(BR2_i386),)
COMPILER_COMMONS_BITS += -m32
endif
ifneq ($(BR2_x86_64),)
COMPILER_COMMONS_BITS += -m64
endif

# Build GCC board options
COMPILER_COMMONS_BOARD_OPTIONS += $(COMPILER_COMMONS_ARCH) $(COMPILER_COMMONS_ABI) $(COMPILER_COMMONS_CPU) $(COMPILER_COMMONS_FPU) $(COMPILER_COMMONS_FLOAT_ABI) $(COMPILER_COMMONS_BITS)

# Build GCC compiler
COMPILER_COMMONS_GCC_OPTIMIZATION_OPTIONS += -O3

# Build GCC compiler/linker link optimizations
COMPILER_COMMONS_GCC_LINKER_OPTIMIZATION_OPTIONS_SECTION += -fdata-sections -ffunction-sections -Wl,--gc-sections
ifeq ($(BR2_GCC_ENABLE_LTO),y)
COMPILER_COMMONS_GCC_LINKER_OPTIMIZATION_OPTIONS_LTO_EXECUTABLE += -flto=$(shell nproc) -fwhole-program -fuse-linker-plugin
COMPILER_COMMONS_GCC_LINKER_OPTIMIZATION_OPTIONS_LTO_LIBRARIES += -flto=$(shell nproc) -fuse-linker-plugin
endif
COMPILER_COMMONS_GCC_LINKER_OPTIMIZATION_EXECUTABLE += $(COMPILER_COMMONS_GCC_LINKER_OPTIMIZATION_OPTIONS_SECTION) $(COMPILER_COMMONS_GCC_LINKER_OPTIMIZATION_OPTIONS_LTO_EXECUTABLE)
COMPILER_COMMONS_GCC_LINKER_OPTIMIZATION_LIBRARIES += $(COMPILER_COMMONS_GCC_LINKER_OPTIMIZATION_OPTIONS_SECTION) $(COMPILER_COMMONS_GCC_LINKER_OPTIMIZATION_OPTIONS_LTO_LIBRARIES)
COMPILER_COMMONS_GCC_LINKER_OPTIMIZATION_NOLTO += $(COMPILER_COMMONS_GCC_LINKER_OPTIMIZATION_OPTIONS_SECTION)

# Compiler/linker flags for no LTO at all
COMPILER_COMMONS_CFLAGS_NOLTO = $(COMPILER_COMMONS_BOARD_OPTIONS) $(COMPILER_COMMONS_GCC_OPTIMIZATION_OPTIONS) $(COMPILER_COMMONS_GCC_LINKER_OPTIMIZATION_NOLTO)
COMPILER_COMMONS_CXXFLAGS_NOLTO = $(COMPILER_COMMONS_CFLAGS_NOLTO)
COMPILER_COMMONS_LDFLAGS_NOLTO = $(COMPILER_COMMONS_BOARD_OPTIONS) $(COMPILER_COMMONS_GCC_OPTIMIZATION_OPTIONS) $(COMPILER_COMMONS_GCC_LINKER_OPTIMIZATION_NOLTO)

# Compiler/linker flags for .so: do not use full LTO
COMPILER_COMMONS_CFLAGS_SO = $(COMPILER_COMMONS_BOARD_OPTIONS) $(COMPILER_COMMONS_GCC_OPTIMIZATION_OPTIONS) $(COMPILER_COMMONS_GCC_LINKER_OPTIMIZATION_LIBRARIES)
COMPILER_COMMONS_CXXFLAGS_SO = $(COMPILER_COMMONS_CFLAGS_SO)
COMPILER_COMMONS_LDFLAGS_SO = $(COMPILER_COMMONS_BOARD_OPTIONS) $(COMPILER_COMMONS_GCC_OPTIMIZATION_OPTIONS) $(COMPILER_COMMONS_GCC_LINKER_OPTIMIZATION_LIBRARIES)

# Compiler/linker flags for executables: use full optimizations
COMPILER_COMMONS_CFLAGS_EXE = $(COMPILER_COMMONS_BOARD_OPTIONS) $(COMPILER_COMMONS_GCC_OPTIMIZATION_OPTIONS) $(COMPILER_COMMONS_GCC_LINKER_OPTIMIZATION_EXECUTABLE)
COMPILER_COMMONS_CXXFLAGS_EXE = $(COMPILER_COMMONS_CFLAGS_EXE)
COMPILER_COMMONS_LDFLAGS_EXE = $(COMPILER_COMMONS_BOARD_OPTIONS) $(COMPILER_COMMONS_GCC_OPTIMIZATION_OPTIONS) $(COMPILER_COMMONS_GCC_LINKER_OPTIMIZATION_EXECUTABLE)
