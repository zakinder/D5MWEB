set_property SRC_FILE_INFO {cfile:c:/Users/GATE/Documents/GitHub/D5MWEB/ZEDBOARD/vivado/zynq_soc/ZEDBOARD.srcs/sources_1/bd/zynq_soc/ip/zynq_soc_CLK_GEN_148MHZ_0/zynq_soc_CLK_GEN_148MHZ_0.xdc rfile:../../../ZEDBOARD.srcs/sources_1/bd/zynq_soc/ip/zynq_soc_CLK_GEN_148MHZ_0/zynq_soc_CLK_GEN_148MHZ_0.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.1
