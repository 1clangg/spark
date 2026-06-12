#!/bin/bash
# Spark 3.0 — Auto GPU detection and optimization

GPU=$(lspci | grep -i "vga\|3d\|display" | head -1 | tr '[:upper:]' '[:lower:]')

if echo "$GPU" | grep -q "intel"; then
    # Intel — detect gen for correct VA driver
    INTEL_GEN=$(cat /sys/class/drm/card*/device/uevent 2>/dev/null | grep -i "gen" | head -1)
    if echo "$GPU" | grep -qE "hd [456]|gen [678]|skylake|haswell|broadwell|ivybridge|sandybridge"; then
        export LIBVA_DRIVER_NAME=i965
        export VDPAU_DRIVER=va_gl
    else
        # Gen 11+ (Ice Lake, Tiger Lake, Alder Lake etc)
        export LIBVA_DRIVER_NAME=iHD
        export VDPAU_DRIVER=va_gl
    fi
    export ANV_QUEUE_OVERRIDE=2
    export ANV_ENABLE_PIPELINE_CACHE=1
    export INTEL_PRECISE_TRIG=1

elif echo "$GPU" | grep -q "amd\|radeon\|ati"; then
    export RADV_PERFTEST=aco,llvm,nggc
    export AMD_VULKAN_ICD=RADV
    export R600_DEBUG=hyperz
    export LIBVA_DRIVER_NAME=radeonsi
    export VDPAU_DRIVER=radeonsi

elif echo "$GPU" | grep -q "nvidia"; then
    export __GL_THREADED_OPTIMIZATIONS=1
    export __GL_YIELD=USLEEP
    export PROTON_ENABLE_NVAPI=1
    export LIBVA_DRIVER_NAME=nvidia
fi
