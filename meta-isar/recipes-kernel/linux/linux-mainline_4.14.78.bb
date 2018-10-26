# Example recipe for building the mainline kernel
#
# This software is a part of ISAR.
# Copyright (c) Siemens AG, 2018
#
# SPDX-License-Identifier: MIT

require recipes-kernel/linux/linux-custom.inc

SRC_URI += " \
    https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-${PV}.tar.xz \
    file://x86_64_defconfig"

SRC_URI[md5sum] = "23de7a544b95ec07f281be8b67223401"
SRC_URI[sha256sum] = "f4da4dc0f079e420e1c1b8c71312eaa5415b08be847aa224a61d8af6a6e74c6c"

S = "${WORKDIR}/linux-${PV}"

KERNEL_DEFCONFIG_qemuamd64 = "x86_64_defconfig"
