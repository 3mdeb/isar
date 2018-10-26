require isar-image-base.bb

IMAGER_INSTALL_append = " \
    tpm2-tools \
    xen-system-amd64 \
    xen-tools \
"
