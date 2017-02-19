X86_64_NETWORK_MODULES := kmod-3c59x kmod-8139too kmod-e100 kmod-e1000 kmod-e1000e kmod-forcedeth kmod-igb kmod-natsemi kmod-ne2k-pci kmod-pcnet32 kmod-r8169 kmod-sis900 kmod-sky2 kmod-tg3 kmod-tulip kmod-via-rhine kmod-via-velocity


$(eval $(call GluonProfile,GENERIC,$(X86_64_NETWORK_MODULES)))
$(eval $(call GluonProfileFactorySuffix,GENERIC,-ext4,.img.gz))
$(eval $(call GluonProfileSysupgradeSuffix,GENERIC,-ext4,.img.gz))
$(eval $(call GluonModel,GENERIC,combined,x86-64))

$(eval $(call GluonProfile,VDI,$(X86_64_NETWORK_MODULES)))
$(eval $(call GluonProfileFactorySuffix,VDI,-ext4,.vdi))
$(eval $(call GluonProfileSysupgradeSuffix,VDI))
$(eval $(call GluonModel,VDI,combined,x86-64-virtualbox))

$(eval $(call GluonProfile,VMDK,$(X86_64_NETWORK_MODULES)))
$(eval $(call GluonProfileFactorySuffix,VMDK,-ext4,.vmdk))
$(eval $(call GluonProfileSysupgradeSuffix,VMDK))
$(eval $(call GluonModel,VMDK,combined,x86-64-vmware))
