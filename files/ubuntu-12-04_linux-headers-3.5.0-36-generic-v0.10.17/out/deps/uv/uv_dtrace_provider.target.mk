# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := uv_dtrace_provider
### Rules for final target.
$(obj).target/deps/uv/uv_dtrace_provider.stamp: TOOLSET := $(TOOLSET)
$(obj).target/deps/uv/uv_dtrace_provider.stamp:  FORCE_DO_CMD
	$(call do_cmd,touch)

all_deps += $(obj).target/deps/uv/uv_dtrace_provider.stamp
# Add target alias
.PHONY: uv_dtrace_provider
uv_dtrace_provider: $(obj).target/deps/uv/uv_dtrace_provider.stamp

