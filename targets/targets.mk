$(eval $(call GluonTarget,ar71xx,generic))
$(eval $(call GluonTarget,ar71xx,nand))
$(eval $(call GluonTarget,mpc85xx,generic))
$(eval $(call GluonTarget,x86,generic))
$(eval $(call GluonTarget,x86,kvm_guest))
$(eval $(call GluonTarget,x86,64))
$(eval $(call GluonTarget,x86,xen_domu))
$(eval $(call GluonTarget,brcm2708,bcm2708)) # Raspberry PI A/B/B+ - more testing needed
$(eval $(call GluonTarget,brcm2708,bcm2709)) # Raspberry PI 2 - more testing needed

ifneq ($(BROKEN),)
$(eval $(call GluonTarget,ramips,rt305x)) # BROKEN: No AP+IBSS support
$(eval $(call GluonTarget,sunxi)) # BROKEN: Untested, no sysupgrade support
endif
