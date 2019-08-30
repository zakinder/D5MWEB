set_property SRC_FILE_INFO {cfile:C:/Xilinx/Vivado/2017.2/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_handshake.tcl rfile:../../../../../../../../../../../Xilinx/Vivado/2017.2/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_handshake.tcl id:1 order:LATE scoped_inst:inst/gen_clock_conv.gen_async_lite_conv.r_handshake/handshake unmanaged:yes} [current_design]
set_property SRC_FILE_INFO {cfile:C:/Xilinx/Vivado/2017.2/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_handshake.tcl rfile:../../../../../../../../../../../Xilinx/Vivado/2017.2/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_handshake.tcl id:2 order:LATE scoped_inst:inst/gen_clock_conv.gen_async_lite_conv.b_handshake/handshake unmanaged:yes} [current_design]
set_property SRC_FILE_INFO {cfile:C:/Xilinx/Vivado/2017.2/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_handshake.tcl rfile:../../../../../../../../../../../Xilinx/Vivado/2017.2/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_handshake.tcl id:3 order:LATE scoped_inst:inst/gen_clock_conv.gen_async_lite_conv.w_handshake/handshake unmanaged:yes} [current_design]
set_property SRC_FILE_INFO {cfile:C:/Xilinx/Vivado/2017.2/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_handshake.tcl rfile:../../../../../../../../../../../Xilinx/Vivado/2017.2/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_handshake.tcl id:4 order:LATE scoped_inst:inst/gen_clock_conv.gen_async_lite_conv.aw_handshake/handshake unmanaged:yes} [current_design]
set_property SRC_FILE_INFO {cfile:C:/Xilinx/Vivado/2017.2/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_handshake.tcl rfile:../../../../../../../../../../../Xilinx/Vivado/2017.2/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_handshake.tcl id:5 order:LATE scoped_inst:inst/gen_clock_conv.gen_async_lite_conv.ar_handshake/handshake unmanaged:yes} [current_design]
current_instance inst/gen_clock_conv.gen_async_lite_conv.r_handshake/handshake
set_property src_info {type:SCOPED_XDC file:1 line:20 export:INPUT save:NONE read:READ} [current_design]
set_bus_skew -from [get_cells src_hsdata_ff_reg*] -to [get_cells dest_hsdata_ff_reg*] 14.000
current_instance
current_instance inst/gen_clock_conv.gen_async_lite_conv.b_handshake/handshake
set_property src_info {type:SCOPED_XDC file:2 line:20 export:INPUT save:NONE read:READ} [current_design]
set_bus_skew -from [get_cells src_hsdata_ff_reg*] -to [get_cells dest_hsdata_ff_reg*] 14.000
current_instance
current_instance inst/gen_clock_conv.gen_async_lite_conv.w_handshake/handshake
set_property src_info {type:SCOPED_XDC file:3 line:20 export:INPUT save:NONE read:READ} [current_design]
set_bus_skew -from [get_cells src_hsdata_ff_reg*] -to [get_cells dest_hsdata_ff_reg*] 26.000
current_instance
current_instance inst/gen_clock_conv.gen_async_lite_conv.aw_handshake/handshake
set_property src_info {type:SCOPED_XDC file:4 line:20 export:INPUT save:NONE read:READ} [current_design]
set_bus_skew -from [get_cells src_hsdata_ff_reg*] -to [get_cells dest_hsdata_ff_reg*] 26.000
current_instance
current_instance inst/gen_clock_conv.gen_async_lite_conv.ar_handshake/handshake
set_property src_info {type:SCOPED_XDC file:5 line:20 export:INPUT save:NONE read:READ} [current_design]
set_bus_skew -from [get_cells src_hsdata_ff_reg*] -to [get_cells dest_hsdata_ff_reg*] 26.000
