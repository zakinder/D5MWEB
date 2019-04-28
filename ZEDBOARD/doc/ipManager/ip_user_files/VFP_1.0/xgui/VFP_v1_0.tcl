# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  set C_rgb_s_axis_TDATA_WIDTH [ipgui::add_param $IPINST -name "C_rgb_s_axis_TDATA_WIDTH" -parent ${Page_0} -widget comboBox]
  set_property tooltip {AXI4Stream sink: Data Width} ${C_rgb_s_axis_TDATA_WIDTH}
  set C_vfpConfig_DATA_WIDTH [ipgui::add_param $IPINST -name "C_vfpConfig_DATA_WIDTH" -parent ${Page_0} -widget comboBox]
  set_property tooltip {Width of S_AXI data bus} ${C_vfpConfig_DATA_WIDTH}
  set C_vfpConfig_ADDR_WIDTH [ipgui::add_param $IPINST -name "C_vfpConfig_ADDR_WIDTH" -parent ${Page_0}]
  set_property tooltip {Width of S_AXI address bus} ${C_vfpConfig_ADDR_WIDTH}
  ipgui::add_param $IPINST -name "C_vfpConfig_BASEADDR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_vfpConfig_HIGHADDR" -parent ${Page_0}
  set C_rgb_m_axis_TDATA_WIDTH [ipgui::add_param $IPINST -name "C_rgb_m_axis_TDATA_WIDTH" -parent ${Page_0} -widget comboBox]
  set_property tooltip {Width of S_AXIS address bus. The slave accepts the read and write addresses of width C_M_AXIS_TDATA_WIDTH.} ${C_rgb_m_axis_TDATA_WIDTH}
  set C_rgb_m_axis_START_COUNT [ipgui::add_param $IPINST -name "C_rgb_m_axis_START_COUNT" -parent ${Page_0}]
  set_property tooltip {Start count is the numeber of clock cycles the master will wait before initiating/issuing any transaction.} ${C_rgb_m_axis_START_COUNT}
  set C_m_axis_mm2s_TDATA_WIDTH [ipgui::add_param $IPINST -name "C_m_axis_mm2s_TDATA_WIDTH" -parent ${Page_0} -widget comboBox]
  set_property tooltip {Width of S_AXIS address bus. The slave accepts the read and write addresses of width C_M_AXIS_TDATA_WIDTH.} ${C_m_axis_mm2s_TDATA_WIDTH}
  set C_m_axis_mm2s_START_COUNT [ipgui::add_param $IPINST -name "C_m_axis_mm2s_START_COUNT" -parent ${Page_0}]
  set_property tooltip {Start count is the numeber of clock cycles the master will wait before initiating/issuing any transaction.} ${C_m_axis_mm2s_START_COUNT}
  ipgui::add_param $IPINST -name "revision_number" -parent ${Page_0}
  ipgui::add_param $IPINST -name "i_data_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "s_data_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "b_data_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "i_precision" -parent ${Page_0}
  ipgui::add_param $IPINST -name "i_full_range" -parent ${Page_0}
  ipgui::add_param $IPINST -name "conf_data_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "conf_addr_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "img_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "p_data_width" -parent ${Page_0}


}

proc update_PARAM_VALUE.b_data_width { PARAM_VALUE.b_data_width } {
	# Procedure called to update b_data_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.b_data_width { PARAM_VALUE.b_data_width } {
	# Procedure called to validate b_data_width
	return true
}

proc update_PARAM_VALUE.conf_addr_width { PARAM_VALUE.conf_addr_width } {
	# Procedure called to update conf_addr_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.conf_addr_width { PARAM_VALUE.conf_addr_width } {
	# Procedure called to validate conf_addr_width
	return true
}

proc update_PARAM_VALUE.conf_data_width { PARAM_VALUE.conf_data_width } {
	# Procedure called to update conf_data_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.conf_data_width { PARAM_VALUE.conf_data_width } {
	# Procedure called to validate conf_data_width
	return true
}

proc update_PARAM_VALUE.i_data_width { PARAM_VALUE.i_data_width } {
	# Procedure called to update i_data_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.i_data_width { PARAM_VALUE.i_data_width } {
	# Procedure called to validate i_data_width
	return true
}

proc update_PARAM_VALUE.i_full_range { PARAM_VALUE.i_full_range } {
	# Procedure called to update i_full_range when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.i_full_range { PARAM_VALUE.i_full_range } {
	# Procedure called to validate i_full_range
	return true
}

proc update_PARAM_VALUE.i_precision { PARAM_VALUE.i_precision } {
	# Procedure called to update i_precision when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.i_precision { PARAM_VALUE.i_precision } {
	# Procedure called to validate i_precision
	return true
}

proc update_PARAM_VALUE.img_width { PARAM_VALUE.img_width } {
	# Procedure called to update img_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.img_width { PARAM_VALUE.img_width } {
	# Procedure called to validate img_width
	return true
}

proc update_PARAM_VALUE.p_data_width { PARAM_VALUE.p_data_width } {
	# Procedure called to update p_data_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.p_data_width { PARAM_VALUE.p_data_width } {
	# Procedure called to validate p_data_width
	return true
}

proc update_PARAM_VALUE.revision_number { PARAM_VALUE.revision_number } {
	# Procedure called to update revision_number when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.revision_number { PARAM_VALUE.revision_number } {
	# Procedure called to validate revision_number
	return true
}

proc update_PARAM_VALUE.s_data_width { PARAM_VALUE.s_data_width } {
	# Procedure called to update s_data_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.s_data_width { PARAM_VALUE.s_data_width } {
	# Procedure called to validate s_data_width
	return true
}

proc update_PARAM_VALUE.C_rgb_s_axis_TDATA_WIDTH { PARAM_VALUE.C_rgb_s_axis_TDATA_WIDTH } {
	# Procedure called to update C_rgb_s_axis_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_rgb_s_axis_TDATA_WIDTH { PARAM_VALUE.C_rgb_s_axis_TDATA_WIDTH } {
	# Procedure called to validate C_rgb_s_axis_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_vfpConfig_DATA_WIDTH { PARAM_VALUE.C_vfpConfig_DATA_WIDTH } {
	# Procedure called to update C_vfpConfig_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_vfpConfig_DATA_WIDTH { PARAM_VALUE.C_vfpConfig_DATA_WIDTH } {
	# Procedure called to validate C_vfpConfig_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_vfpConfig_ADDR_WIDTH { PARAM_VALUE.C_vfpConfig_ADDR_WIDTH } {
	# Procedure called to update C_vfpConfig_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_vfpConfig_ADDR_WIDTH { PARAM_VALUE.C_vfpConfig_ADDR_WIDTH } {
	# Procedure called to validate C_vfpConfig_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_vfpConfig_BASEADDR { PARAM_VALUE.C_vfpConfig_BASEADDR } {
	# Procedure called to update C_vfpConfig_BASEADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_vfpConfig_BASEADDR { PARAM_VALUE.C_vfpConfig_BASEADDR } {
	# Procedure called to validate C_vfpConfig_BASEADDR
	return true
}

proc update_PARAM_VALUE.C_vfpConfig_HIGHADDR { PARAM_VALUE.C_vfpConfig_HIGHADDR } {
	# Procedure called to update C_vfpConfig_HIGHADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_vfpConfig_HIGHADDR { PARAM_VALUE.C_vfpConfig_HIGHADDR } {
	# Procedure called to validate C_vfpConfig_HIGHADDR
	return true
}

proc update_PARAM_VALUE.C_rgb_m_axis_TDATA_WIDTH { PARAM_VALUE.C_rgb_m_axis_TDATA_WIDTH } {
	# Procedure called to update C_rgb_m_axis_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_rgb_m_axis_TDATA_WIDTH { PARAM_VALUE.C_rgb_m_axis_TDATA_WIDTH } {
	# Procedure called to validate C_rgb_m_axis_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_rgb_m_axis_START_COUNT { PARAM_VALUE.C_rgb_m_axis_START_COUNT } {
	# Procedure called to update C_rgb_m_axis_START_COUNT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_rgb_m_axis_START_COUNT { PARAM_VALUE.C_rgb_m_axis_START_COUNT } {
	# Procedure called to validate C_rgb_m_axis_START_COUNT
	return true
}

proc update_PARAM_VALUE.C_m_axis_mm2s_TDATA_WIDTH { PARAM_VALUE.C_m_axis_mm2s_TDATA_WIDTH } {
	# Procedure called to update C_m_axis_mm2s_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_m_axis_mm2s_TDATA_WIDTH { PARAM_VALUE.C_m_axis_mm2s_TDATA_WIDTH } {
	# Procedure called to validate C_m_axis_mm2s_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_m_axis_mm2s_START_COUNT { PARAM_VALUE.C_m_axis_mm2s_START_COUNT } {
	# Procedure called to update C_m_axis_mm2s_START_COUNT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_m_axis_mm2s_START_COUNT { PARAM_VALUE.C_m_axis_mm2s_START_COUNT } {
	# Procedure called to validate C_m_axis_mm2s_START_COUNT
	return true
}


proc update_MODELPARAM_VALUE.C_rgb_s_axis_TDATA_WIDTH { MODELPARAM_VALUE.C_rgb_s_axis_TDATA_WIDTH PARAM_VALUE.C_rgb_s_axis_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_rgb_s_axis_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_rgb_s_axis_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_vfpConfig_DATA_WIDTH { MODELPARAM_VALUE.C_vfpConfig_DATA_WIDTH PARAM_VALUE.C_vfpConfig_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_vfpConfig_DATA_WIDTH}] ${MODELPARAM_VALUE.C_vfpConfig_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_vfpConfig_ADDR_WIDTH { MODELPARAM_VALUE.C_vfpConfig_ADDR_WIDTH PARAM_VALUE.C_vfpConfig_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_vfpConfig_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_vfpConfig_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.C_rgb_m_axis_TDATA_WIDTH { MODELPARAM_VALUE.C_rgb_m_axis_TDATA_WIDTH PARAM_VALUE.C_rgb_m_axis_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_rgb_m_axis_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_rgb_m_axis_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_rgb_m_axis_START_COUNT { MODELPARAM_VALUE.C_rgb_m_axis_START_COUNT PARAM_VALUE.C_rgb_m_axis_START_COUNT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_rgb_m_axis_START_COUNT}] ${MODELPARAM_VALUE.C_rgb_m_axis_START_COUNT}
}

proc update_MODELPARAM_VALUE.C_m_axis_mm2s_TDATA_WIDTH { MODELPARAM_VALUE.C_m_axis_mm2s_TDATA_WIDTH PARAM_VALUE.C_m_axis_mm2s_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_m_axis_mm2s_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_m_axis_mm2s_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_m_axis_mm2s_START_COUNT { MODELPARAM_VALUE.C_m_axis_mm2s_START_COUNT PARAM_VALUE.C_m_axis_mm2s_START_COUNT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_m_axis_mm2s_START_COUNT}] ${MODELPARAM_VALUE.C_m_axis_mm2s_START_COUNT}
}

proc update_MODELPARAM_VALUE.revision_number { MODELPARAM_VALUE.revision_number PARAM_VALUE.revision_number } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.revision_number}] ${MODELPARAM_VALUE.revision_number}
}

proc update_MODELPARAM_VALUE.i_data_width { MODELPARAM_VALUE.i_data_width PARAM_VALUE.i_data_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.i_data_width}] ${MODELPARAM_VALUE.i_data_width}
}

proc update_MODELPARAM_VALUE.s_data_width { MODELPARAM_VALUE.s_data_width PARAM_VALUE.s_data_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.s_data_width}] ${MODELPARAM_VALUE.s_data_width}
}

proc update_MODELPARAM_VALUE.b_data_width { MODELPARAM_VALUE.b_data_width PARAM_VALUE.b_data_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.b_data_width}] ${MODELPARAM_VALUE.b_data_width}
}

proc update_MODELPARAM_VALUE.i_precision { MODELPARAM_VALUE.i_precision PARAM_VALUE.i_precision } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.i_precision}] ${MODELPARAM_VALUE.i_precision}
}

proc update_MODELPARAM_VALUE.i_full_range { MODELPARAM_VALUE.i_full_range PARAM_VALUE.i_full_range } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.i_full_range}] ${MODELPARAM_VALUE.i_full_range}
}

proc update_MODELPARAM_VALUE.conf_data_width { MODELPARAM_VALUE.conf_data_width PARAM_VALUE.conf_data_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.conf_data_width}] ${MODELPARAM_VALUE.conf_data_width}
}

proc update_MODELPARAM_VALUE.conf_addr_width { MODELPARAM_VALUE.conf_addr_width PARAM_VALUE.conf_addr_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.conf_addr_width}] ${MODELPARAM_VALUE.conf_addr_width}
}

proc update_MODELPARAM_VALUE.img_width { MODELPARAM_VALUE.img_width PARAM_VALUE.img_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.img_width}] ${MODELPARAM_VALUE.img_width}
}

proc update_MODELPARAM_VALUE.p_data_width { MODELPARAM_VALUE.p_data_width PARAM_VALUE.p_data_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.p_data_width}] ${MODELPARAM_VALUE.p_data_width}
}

