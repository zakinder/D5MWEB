

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "videoProcess" "NUM_INSTANCES" "DEVICE_ID"  "C_config_axis_BASEADDR" "C_config_axis_HIGHADDR"
}
