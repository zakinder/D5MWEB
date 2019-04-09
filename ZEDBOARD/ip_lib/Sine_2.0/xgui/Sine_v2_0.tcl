# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  set C_ctrl_saxi_DATA_WIDTH [ipgui::add_param $IPINST -name "C_ctrl_saxi_DATA_WIDTH" -parent ${Page_0} -widget comboBox]
  set_property tooltip {Width of S_AXI data bus} ${C_ctrl_saxi_DATA_WIDTH}
  set C_ctrl_saxi_ADDR_WIDTH [ipgui::add_param $IPINST -name "C_ctrl_saxi_ADDR_WIDTH" -parent ${Page_0}]
  set_property tooltip {Width of S_AXI address bus} ${C_ctrl_saxi_ADDR_WIDTH}
  ipgui::add_param $IPINST -name "C_ctrl_saxi_BASEADDR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_ctrl_saxi_HIGHADDR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "width_g" -parent ${Page_0}
  ipgui::add_param $IPINST -name "depth_g" -parent ${Page_0}
  ipgui::add_param $IPINST -name "cntampl_value_g" -parent ${Page_0}
  ipgui::add_param $IPINST -name "revision_number" -parent ${Page_0}


}

proc update_PARAM_VALUE.cntampl_value_g { PARAM_VALUE.cntampl_value_g } {
	# Procedure called to update cntampl_value_g when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.cntampl_value_g { PARAM_VALUE.cntampl_value_g } {
	# Procedure called to validate cntampl_value_g
	return true
}

proc update_PARAM_VALUE.depth_g { PARAM_VALUE.depth_g } {
	# Procedure called to update depth_g when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.depth_g { PARAM_VALUE.depth_g } {
	# Procedure called to validate depth_g
	return true
}

proc update_PARAM_VALUE.revision_number { PARAM_VALUE.revision_number } {
	# Procedure called to update revision_number when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.revision_number { PARAM_VALUE.revision_number } {
	# Procedure called to validate revision_number
	return true
}

proc update_PARAM_VALUE.width_g { PARAM_VALUE.width_g } {
	# Procedure called to update width_g when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.width_g { PARAM_VALUE.width_g } {
	# Procedure called to validate width_g
	return true
}

proc update_PARAM_VALUE.C_ctrl_saxi_DATA_WIDTH { PARAM_VALUE.C_ctrl_saxi_DATA_WIDTH } {
	# Procedure called to update C_ctrl_saxi_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_ctrl_saxi_DATA_WIDTH { PARAM_VALUE.C_ctrl_saxi_DATA_WIDTH } {
	# Procedure called to validate C_ctrl_saxi_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_ctrl_saxi_ADDR_WIDTH { PARAM_VALUE.C_ctrl_saxi_ADDR_WIDTH } {
	# Procedure called to update C_ctrl_saxi_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_ctrl_saxi_ADDR_WIDTH { PARAM_VALUE.C_ctrl_saxi_ADDR_WIDTH } {
	# Procedure called to validate C_ctrl_saxi_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_ctrl_saxi_BASEADDR { PARAM_VALUE.C_ctrl_saxi_BASEADDR } {
	# Procedure called to update C_ctrl_saxi_BASEADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_ctrl_saxi_BASEADDR { PARAM_VALUE.C_ctrl_saxi_BASEADDR } {
	# Procedure called to validate C_ctrl_saxi_BASEADDR
	return true
}

proc update_PARAM_VALUE.C_ctrl_saxi_HIGHADDR { PARAM_VALUE.C_ctrl_saxi_HIGHADDR } {
	# Procedure called to update C_ctrl_saxi_HIGHADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_ctrl_saxi_HIGHADDR { PARAM_VALUE.C_ctrl_saxi_HIGHADDR } {
	# Procedure called to validate C_ctrl_saxi_HIGHADDR
	return true
}


proc update_MODELPARAM_VALUE.C_ctrl_saxi_DATA_WIDTH { MODELPARAM_VALUE.C_ctrl_saxi_DATA_WIDTH PARAM_VALUE.C_ctrl_saxi_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_ctrl_saxi_DATA_WIDTH}] ${MODELPARAM_VALUE.C_ctrl_saxi_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_ctrl_saxi_ADDR_WIDTH { MODELPARAM_VALUE.C_ctrl_saxi_ADDR_WIDTH PARAM_VALUE.C_ctrl_saxi_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_ctrl_saxi_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_ctrl_saxi_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.revision_number { MODELPARAM_VALUE.revision_number PARAM_VALUE.revision_number } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.revision_number}] ${MODELPARAM_VALUE.revision_number}
}

proc update_MODELPARAM_VALUE.cntampl_value_g { MODELPARAM_VALUE.cntampl_value_g PARAM_VALUE.cntampl_value_g } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.cntampl_value_g}] ${MODELPARAM_VALUE.cntampl_value_g}
}

proc update_MODELPARAM_VALUE.depth_g { MODELPARAM_VALUE.depth_g PARAM_VALUE.depth_g } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.depth_g}] ${MODELPARAM_VALUE.depth_g}
}

proc update_MODELPARAM_VALUE.width_g { MODELPARAM_VALUE.width_g PARAM_VALUE.width_g } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.width_g}] ${MODELPARAM_VALUE.width_g}
}

