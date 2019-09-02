

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "Sine" "NUM_INSTANCES" "DEVICE_ID"  "C_ctrl_saxi_BASEADDR" "C_ctrl_saxi_HIGHADDR"
}
