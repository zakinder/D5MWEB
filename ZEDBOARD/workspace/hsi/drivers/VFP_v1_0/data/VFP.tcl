

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "VFP" "NUM_INSTANCES" "DEVICE_ID"  "C_vfpConfig_BASEADDR" "C_vfpConfig_HIGHADDR"
}
