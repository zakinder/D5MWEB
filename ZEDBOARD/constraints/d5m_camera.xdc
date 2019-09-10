set_property PACKAGE_PIN Y11 [get_ports {idata[0]}]
set_property PACKAGE_PIN AA11 [get_ports {idata[1]}]
set_property PACKAGE_PIN Y10 [get_ports {idata[2]}]
set_property PACKAGE_PIN AA9 [get_ports {idata[3]}]
set_property PACKAGE_PIN AB11 [get_ports {idata[4]}]
set_property PACKAGE_PIN AB10 [get_ports {idata[5]}]
set_property PACKAGE_PIN AB9 [get_ports {idata[6]}]
set_property PACKAGE_PIN AA8 [get_ports {idata[7]}]
set_property PACKAGE_PIN W12 [get_ports {idata[8]}]
set_property PACKAGE_PIN W11 [get_ports {idata[9]}]
set_property PACKAGE_PIN V10 [get_ports {idata[10]}]
set_property PACKAGE_PIN W8 [get_ports {idata[11]}]
set_property PACKAGE_PIN V12 [get_ports pixclk]
set_property PACKAGE_PIN W10 [get_ports o_xclkin]
set_property PACKAGE_PIN V9 [get_ports ifval]
set_property PACKAGE_PIN V8 [get_ports ilval]
set_property PACKAGE_PIN Y4 [get_ports {trigger[0]}]
set_property PACKAGE_PIN R6 [get_ports {reseto[0]}]


set_property PACKAGE_PIN AB7 [get_ports d5m_iic_sda_io]
set_property SLEW SLOW [get_ports d5m_iic_sda_io]
set_property DRIVE 8 [get_ports d5m_iic_sda_io]
set_property IOSTANDARD LVCMOS33 [get_ports d5m_iic_sda_io]


set_property PACKAGE_PIN AB6 [get_ports d5m_iic_scl_io]
set_property SLEW SLOW [get_ports d5m_iic_scl_io]
set_property DRIVE 8 [get_ports d5m_iic_scl_io]
set_property PULLUP true [get_ports d5m_iic_scl_io]
set_property IOSTANDARD LVCMOS33 [get_ports d5m_iic_scl_io]



set_property IOSTANDARD LVCMOS33 [get_ports {trigger[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {reseto[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {idata[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {idata[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {idata[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {idata[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {idata[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {idata[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {idata[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {idata[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {idata[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {idata[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {idata[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {idata[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports ifval]
set_property IOSTANDARD LVCMOS33 [get_ports ilval]
set_property IOSTANDARD LVCMOS33 [get_ports o_xclkin]
set_property IOSTANDARD LVCMOS33 [get_ports pixclk]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets pixclk]





