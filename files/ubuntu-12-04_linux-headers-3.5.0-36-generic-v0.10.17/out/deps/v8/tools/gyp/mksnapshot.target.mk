# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := mksnapshot
DEFS_Debug := \
	'-DENABLE_DEBUGGER_SUPPORT' \
	'-DENABLE_EXTRA_CHECKS' \
	'-DV8_TARGET_ARCH_X64' \
	'-DDEBUG' \
	'-D_DEBUG' \
	'-DENABLE_DISASSEMBLER' \
	'-DV8_ENABLE_CHECKS' \
	'-DOBJECT_PRINT' \
	'-DVERIFY_HEAP'

# Flags passed to all source files.
CFLAGS_Debug := \
	-Wall \
	-Wextra \
	-Wno-unused-parameter \
	-pthread \
	-m64 \
	-fno-strict-aliasing \
	-g \
	-O0 \
	-Wall \
	-Werror \
	-W \
	-Wno-unused-parameter \
	-Wnon-virtual-dtor \
	-Woverloaded-virtual

# Flags passed to only C files.
CFLAGS_C_Debug :=

# Flags passed to only C++ files.
CFLAGS_CC_Debug := \
	-fno-rtti \
	-fno-exceptions

INCS_Debug := \
	-I$(srcdir)/deps/v8/src

DEFS_Release := \
	'-DENABLE_DEBUGGER_SUPPORT' \
	'-DENABLE_EXTRA_CHECKS' \
	'-DV8_TARGET_ARCH_X64'

# Flags passed to all source files.
CFLAGS_Release := \
	-Wall \
	-Wextra \
	-Wno-unused-parameter \
	-pthread \
	-m64 \
	-fno-strict-aliasing \
	-O2 \
	-fno-strict-aliasing \
	-fno-tree-vrp

# Flags passed to only C files.
CFLAGS_C_Release :=

# Flags passed to only C++ files.
CFLAGS_CC_Release := \
	-fno-rtti \
	-fno-exceptions

INCS_Release := \
	-I$(srcdir)/deps/v8/src

OBJS := \
	$(obj).target/$(TARGET)/deps/v8/src/mksnapshot.o

# Add to the list of files we specially track dependencies for.
all_deps += $(OBJS)

# Make sure our dependencies are built before any of us.
$(OBJS): | $(builddir)/libv8_base.a $(builddir)/libv8_nosnapshot.a $(obj).target/deps/v8/tools/gyp/js2c.stamp $(obj).target/deps/v8/tools/gyp/libv8_base.a $(obj).target/deps/v8/tools/gyp/libv8_nosnapshot.a

# CFLAGS et al overrides must be target-local.
# See "Target-specific Variable Values" in the GNU Make manual.
$(OBJS): TOOLSET := $(TOOLSET)
$(OBJS): GYP_CFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_C_$(BUILDTYPE))
$(OBJS): GYP_CXXFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_CC_$(BUILDTYPE))

# Suffix rules, putting all outputs into $(obj).

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(srcdir)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# Try building from generated source, too.

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj).$(TOOLSET)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# End of this set of suffix rules
### Rules for final target.
LDFLAGS_Debug := \
	-pthread \
	-rdynamic \
	-m64

LDFLAGS_Release := \
	-pthread \
	-rdynamic \
	-m64

LIBS :=

$(builddir)/mksnapshot: GYP_LDFLAGS := $(LDFLAGS_$(BUILDTYPE))
$(builddir)/mksnapshot: LIBS := $(LIBS)
$(builddir)/mksnapshot: LD_INPUTS := $(OBJS) $(obj).target/deps/v8/tools/gyp/libv8_base.a $(obj).target/deps/v8/tools/gyp/libv8_nosnapshot.a
$(builddir)/mksnapshot: TOOLSET := $(TOOLSET)
$(builddir)/mksnapshot: $(OBJS) $(obj).target/deps/v8/tools/gyp/libv8_base.a $(obj).target/deps/v8/tools/gyp/libv8_nosnapshot.a FORCE_DO_CMD
	$(call do_cmd,link)

all_deps += $(builddir)/mksnapshot
# Add target alias
.PHONY: mksnapshot
mksnapshot: $(builddir)/mksnapshot

# Add executable to "all" target.
.PHONY: all
all: $(builddir)/mksnapshot

