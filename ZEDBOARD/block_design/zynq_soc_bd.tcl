puts "Info:(ZQ) This block design file has been exported with Reference-Design Scripts from zynq Electronic GmbH for Board Part:em.avnet.com:zed:part0:1.4 with FPGA xc7z020clg484-1 at 2019-09-08T18:50:49."

################################################################
# This is a generated script based on design: zynq_soc
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2017.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source zynq_soc_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7z020clg484-1
   set_property BOARD_PART em.avnet.com:zed:part0:1.4 [current_project]
}


# CHANGE DESIGN NAME HERE
set design_name zynq_soc

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: V_DMA
proc create_hier_cell_V_DMA { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_V_DMA() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI_MM2S
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI_S2MM
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS_S2MM
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_LITE

  # Create pins
  create_bd_pin -dir I -type rst aresetn150Mhz
  create_bd_pin -dir I -type clk s_axis_s2mm_aclk

  # Create instance: VDMA1, and set properties
  set VDMA1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_vdma:6.3 VDMA1 ]
  set_property -dict [ list \
CONFIG.c_include_mm2s_dre {1} \
CONFIG.c_include_s2mm_dre {1} \
CONFIG.c_m_axis_mm2s_tdata_width {16} \
CONFIG.c_mm2s_genlock_mode {1} \
CONFIG.c_mm2s_linebuffer_depth {512} \
CONFIG.c_mm2s_max_burst_length {32} \
CONFIG.c_num_fstores {1} \
CONFIG.c_s2mm_genlock_mode {0} \
CONFIG.c_s2mm_linebuffer_depth {2048} \
CONFIG.c_s2mm_max_burst_length {8} \
CONFIG.c_use_s2mm_fsync {2} \
 ] $VDMA1

  # Create interface connections
  connect_bd_intf_net -intf_net PS7_axi_periph_M03_AXI [get_bd_intf_pins S_AXI_LITE] [get_bd_intf_pins VDMA1/S_AXI_LITE]
  connect_bd_intf_net -intf_net VDMA1_M_AXIS_MM2S [get_bd_intf_pins M_AXIS] [get_bd_intf_pins VDMA1/M_AXIS_MM2S]
  connect_bd_intf_net -intf_net VDMA1_M_AXI_MM2S [get_bd_intf_pins M_AXI_MM2S] [get_bd_intf_pins VDMA1/M_AXI_MM2S]
  connect_bd_intf_net -intf_net VDMA1_M_AXI_S2MM [get_bd_intf_pins M_AXI_S2MM] [get_bd_intf_pins VDMA1/M_AXI_S2MM]
  connect_bd_intf_net -intf_net v_ccm_0_video_out [get_bd_intf_pins S_AXIS_S2MM] [get_bd_intf_pins VDMA1/S_AXIS_S2MM]

  # Create port connections
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins s_axis_s2mm_aclk] [get_bd_pins VDMA1/m_axi_mm2s_aclk] [get_bd_pins VDMA1/m_axi_s2mm_aclk] [get_bd_pins VDMA1/m_axis_mm2s_aclk] [get_bd_pins VDMA1/s_axi_lite_aclk] [get_bd_pins VDMA1/s_axis_s2mm_aclk]
  connect_bd_net -net rst_PS7_75M_peripheral_aresetn [get_bd_pins aresetn150Mhz] [get_bd_pins VDMA1/axi_resetn]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: TO_PS
proc create_hier_cell_TO_PS { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_TO_PS() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR
  create_bd_intf_pin -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M00_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M02_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M03_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M04_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M05_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M06_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M07_AXI
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S01_AXI

  # Create pins
  create_bd_pin -dir O -type clk CLK_100MHZ
  create_bd_pin -dir O -type clk CLK_150MHZ
  create_bd_pin -dir O -type clk CLK_75MHZ
  create_bd_pin -dir I -type rst aresetn150Mhz
  create_bd_pin -dir I -type rst aresetn75Mhz
  create_bd_pin -dir I -type rst iaresetn150Mhz
  create_bd_pin -dir O -type rst master_aresetn

  # Create instance: PS7, and set properties
  set PS7 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 PS7 ]
  set_property -dict [ list \
CONFIG.PCW_ACT_APU_PERIPHERAL_FREQMHZ {666.666687} \
CONFIG.PCW_ACT_CAN_PERIPHERAL_FREQMHZ {10.000000} \
CONFIG.PCW_ACT_DCI_PERIPHERAL_FREQMHZ {10.158730} \
CONFIG.PCW_ACT_ENET0_PERIPHERAL_FREQMHZ {125.000000} \
CONFIG.PCW_ACT_ENET1_PERIPHERAL_FREQMHZ {125.000000} \
CONFIG.PCW_ACT_FPGA0_PERIPHERAL_FREQMHZ {142.857132} \
CONFIG.PCW_ACT_FPGA1_PERIPHERAL_FREQMHZ {100.000000} \
CONFIG.PCW_ACT_FPGA2_PERIPHERAL_FREQMHZ {76.923080} \
CONFIG.PCW_ACT_FPGA3_PERIPHERAL_FREQMHZ {10.000000} \
CONFIG.PCW_ACT_PCAP_PERIPHERAL_FREQMHZ {200.000000} \
CONFIG.PCW_ACT_QSPI_PERIPHERAL_FREQMHZ {200.000000} \
CONFIG.PCW_ACT_SDIO_PERIPHERAL_FREQMHZ {50.000000} \
CONFIG.PCW_ACT_SMC_PERIPHERAL_FREQMHZ {10.000000} \
CONFIG.PCW_ACT_SPI_PERIPHERAL_FREQMHZ {10.000000} \
CONFIG.PCW_ACT_TPIU_PERIPHERAL_FREQMHZ {200.000000} \
CONFIG.PCW_ACT_TTC0_CLK0_PERIPHERAL_FREQMHZ {111.111115} \
CONFIG.PCW_ACT_TTC0_CLK1_PERIPHERAL_FREQMHZ {111.111115} \
CONFIG.PCW_ACT_TTC0_CLK2_PERIPHERAL_FREQMHZ {111.111115} \
CONFIG.PCW_ACT_TTC1_CLK0_PERIPHERAL_FREQMHZ {111.111115} \
CONFIG.PCW_ACT_TTC1_CLK1_PERIPHERAL_FREQMHZ {111.111115} \
CONFIG.PCW_ACT_TTC1_CLK2_PERIPHERAL_FREQMHZ {111.111115} \
CONFIG.PCW_ACT_TTC_PERIPHERAL_FREQMHZ {50} \
CONFIG.PCW_ACT_UART_PERIPHERAL_FREQMHZ {50.000000} \
CONFIG.PCW_ACT_USB0_PERIPHERAL_FREQMHZ {60} \
CONFIG.PCW_ACT_USB1_PERIPHERAL_FREQMHZ {60} \
CONFIG.PCW_ACT_WDT_PERIPHERAL_FREQMHZ {111.111115} \
CONFIG.PCW_APU_CLK_RATIO_ENABLE {6:2:1} \
CONFIG.PCW_APU_PERIPHERAL_FREQMHZ {666.666667} \
CONFIG.PCW_ARMPLL_CTRL_FBDIV {40} \
CONFIG.PCW_CAN0_GRP_CLK_ENABLE {0} \
CONFIG.PCW_CAN0_PERIPHERAL_CLKSRC {External} \
CONFIG.PCW_CAN0_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_CAN1_GRP_CLK_ENABLE {0} \
CONFIG.PCW_CAN1_PERIPHERAL_CLKSRC {External} \
CONFIG.PCW_CAN1_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_CAN_PERIPHERAL_CLKSRC {IO PLL} \
CONFIG.PCW_CAN_PERIPHERAL_DIVISOR0 {1} \
CONFIG.PCW_CAN_PERIPHERAL_DIVISOR1 {1} \
CONFIG.PCW_CAN_PERIPHERAL_FREQMHZ {100} \
CONFIG.PCW_CAN_PERIPHERAL_VALID {0} \
CONFIG.PCW_CLK0_FREQ {142857132} \
CONFIG.PCW_CLK1_FREQ {100000000} \
CONFIG.PCW_CLK2_FREQ {76923080} \
CONFIG.PCW_CLK3_FREQ {10000000} \
CONFIG.PCW_CPU_CPU_6X4X_MAX_RANGE {667} \
CONFIG.PCW_CPU_CPU_PLL_FREQMHZ {1333.333} \
CONFIG.PCW_CPU_PERIPHERAL_CLKSRC {ARM PLL} \
CONFIG.PCW_CPU_PERIPHERAL_DIVISOR0 {2} \
CONFIG.PCW_CRYSTAL_PERIPHERAL_FREQMHZ {33.333333} \
CONFIG.PCW_DCI_PERIPHERAL_CLKSRC {DDR PLL} \
CONFIG.PCW_DCI_PERIPHERAL_DIVISOR0 {15} \
CONFIG.PCW_DCI_PERIPHERAL_DIVISOR1 {7} \
CONFIG.PCW_DCI_PERIPHERAL_FREQMHZ {10.159} \
CONFIG.PCW_DDRPLL_CTRL_FBDIV {32} \
CONFIG.PCW_DDR_DDR_PLL_FREQMHZ {1066.667} \
CONFIG.PCW_DDR_HPRLPR_QUEUE_PARTITION {HPR(0)/LPR(32)} \
CONFIG.PCW_DDR_HPR_TO_CRITICAL_PRIORITY_LEVEL {15} \
CONFIG.PCW_DDR_LPR_TO_CRITICAL_PRIORITY_LEVEL {2} \
CONFIG.PCW_DDR_PERIPHERAL_CLKSRC {DDR PLL} \
CONFIG.PCW_DDR_PERIPHERAL_DIVISOR0 {2} \
CONFIG.PCW_DDR_PORT0_HPR_ENABLE {0} \
CONFIG.PCW_DDR_PORT1_HPR_ENABLE {0} \
CONFIG.PCW_DDR_PORT2_HPR_ENABLE {0} \
CONFIG.PCW_DDR_PORT3_HPR_ENABLE {0} \
CONFIG.PCW_DDR_RAM_HIGHADDR {0x1FFFFFFF} \
CONFIG.PCW_DDR_WRITE_TO_CRITICAL_PRIORITY_LEVEL {2} \
CONFIG.PCW_ENET0_ENET0_IO {MIO 16 .. 27} \
CONFIG.PCW_ENET0_GRP_MDIO_ENABLE {1} \
CONFIG.PCW_ENET0_GRP_MDIO_IO {MIO 52 .. 53} \
CONFIG.PCW_ENET0_PERIPHERAL_CLKSRC {IO PLL} \
CONFIG.PCW_ENET0_PERIPHERAL_DIVISOR0 {8} \
CONFIG.PCW_ENET0_PERIPHERAL_DIVISOR1 {1} \
CONFIG.PCW_ENET0_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_ENET0_PERIPHERAL_FREQMHZ {1000 Mbps} \
CONFIG.PCW_ENET0_RESET_ENABLE {0} \
CONFIG.PCW_ENET1_GRP_MDIO_ENABLE {0} \
CONFIG.PCW_ENET1_PERIPHERAL_CLKSRC {External} \
CONFIG.PCW_ENET1_PERIPHERAL_DIVISOR0 {1} \
CONFIG.PCW_ENET1_PERIPHERAL_DIVISOR1 {1} \
CONFIG.PCW_ENET1_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_ENET1_PERIPHERAL_FREQMHZ {1000 Mbps} \
CONFIG.PCW_ENET1_RESET_ENABLE {0} \
CONFIG.PCW_ENET_RESET_ENABLE {1} \
CONFIG.PCW_ENET_RESET_POLARITY {Active Low} \
CONFIG.PCW_ENET_RESET_SELECT {Share reset pin} \
CONFIG.PCW_EN_4K_TIMER {0} \
CONFIG.PCW_EN_CAN0 {0} \
CONFIG.PCW_EN_CAN1 {0} \
CONFIG.PCW_EN_CLK0_PORT {1} \
CONFIG.PCW_EN_CLK1_PORT {1} \
CONFIG.PCW_EN_CLK2_PORT {1} \
CONFIG.PCW_EN_CLK3_PORT {0} \
CONFIG.PCW_EN_DDR {1} \
CONFIG.PCW_EN_EMIO_CAN0 {0} \
CONFIG.PCW_EN_EMIO_CAN1 {0} \
CONFIG.PCW_EN_EMIO_CD_SDIO0 {0} \
CONFIG.PCW_EN_EMIO_CD_SDIO1 {0} \
CONFIG.PCW_EN_EMIO_ENET0 {0} \
CONFIG.PCW_EN_EMIO_ENET1 {0} \
CONFIG.PCW_EN_EMIO_GPIO {0} \
CONFIG.PCW_EN_EMIO_I2C0 {0} \
CONFIG.PCW_EN_EMIO_I2C1 {0} \
CONFIG.PCW_EN_EMIO_MODEM_UART0 {0} \
CONFIG.PCW_EN_EMIO_MODEM_UART1 {0} \
CONFIG.PCW_EN_EMIO_PJTAG {0} \
CONFIG.PCW_EN_EMIO_SDIO0 {0} \
CONFIG.PCW_EN_EMIO_SDIO1 {0} \
CONFIG.PCW_EN_EMIO_SPI0 {0} \
CONFIG.PCW_EN_EMIO_SPI1 {0} \
CONFIG.PCW_EN_EMIO_SRAM_INT {0} \
CONFIG.PCW_EN_EMIO_TRACE {0} \
CONFIG.PCW_EN_EMIO_TTC0 {0} \
CONFIG.PCW_EN_EMIO_TTC1 {0} \
CONFIG.PCW_EN_EMIO_UART0 {0} \
CONFIG.PCW_EN_EMIO_UART1 {0} \
CONFIG.PCW_EN_EMIO_WDT {0} \
CONFIG.PCW_EN_EMIO_WP_SDIO0 {0} \
CONFIG.PCW_EN_EMIO_WP_SDIO1 {0} \
CONFIG.PCW_EN_ENET0 {1} \
CONFIG.PCW_EN_ENET1 {0} \
CONFIG.PCW_EN_GPIO {1} \
CONFIG.PCW_EN_I2C0 {0} \
CONFIG.PCW_EN_I2C1 {0} \
CONFIG.PCW_EN_MODEM_UART0 {0} \
CONFIG.PCW_EN_MODEM_UART1 {0} \
CONFIG.PCW_EN_PJTAG {0} \
CONFIG.PCW_EN_QSPI {1} \
CONFIG.PCW_EN_SDIO0 {1} \
CONFIG.PCW_EN_SDIO1 {0} \
CONFIG.PCW_EN_SMC {0} \
CONFIG.PCW_EN_SPI0 {0} \
CONFIG.PCW_EN_SPI1 {0} \
CONFIG.PCW_EN_TRACE {0} \
CONFIG.PCW_EN_TTC0 {0} \
CONFIG.PCW_EN_TTC1 {0} \
CONFIG.PCW_EN_UART0 {0} \
CONFIG.PCW_EN_UART1 {1} \
CONFIG.PCW_EN_USB0 {0} \
CONFIG.PCW_EN_USB1 {0} \
CONFIG.PCW_EN_WDT {0} \
CONFIG.PCW_FCLK0_PERIPHERAL_CLKSRC {IO PLL} \
CONFIG.PCW_FCLK0_PERIPHERAL_DIVISOR0 {7} \
CONFIG.PCW_FCLK0_PERIPHERAL_DIVISOR1 {1} \
CONFIG.PCW_FCLK1_PERIPHERAL_CLKSRC {IO PLL} \
CONFIG.PCW_FCLK1_PERIPHERAL_DIVISOR0 {5} \
CONFIG.PCW_FCLK1_PERIPHERAL_DIVISOR1 {2} \
CONFIG.PCW_FCLK2_PERIPHERAL_CLKSRC {IO PLL} \
CONFIG.PCW_FCLK2_PERIPHERAL_DIVISOR0 {13} \
CONFIG.PCW_FCLK2_PERIPHERAL_DIVISOR1 {1} \
CONFIG.PCW_FCLK3_PERIPHERAL_CLKSRC {IO PLL} \
CONFIG.PCW_FCLK3_PERIPHERAL_DIVISOR0 {1} \
CONFIG.PCW_FCLK3_PERIPHERAL_DIVISOR1 {1} \
CONFIG.PCW_FCLK_CLK0_BUF {TRUE} \
CONFIG.PCW_FCLK_CLK1_BUF {TRUE} \
CONFIG.PCW_FCLK_CLK2_BUF {TRUE} \
CONFIG.PCW_FCLK_CLK3_BUF {FALSE} \
CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {150.000000} \
CONFIG.PCW_FPGA1_PERIPHERAL_FREQMHZ {100.000000} \
CONFIG.PCW_FPGA2_PERIPHERAL_FREQMHZ {75.000000} \
CONFIG.PCW_FPGA3_PERIPHERAL_FREQMHZ {25} \
CONFIG.PCW_FPGA_FCLK0_ENABLE {1} \
CONFIG.PCW_FPGA_FCLK1_ENABLE {1} \
CONFIG.PCW_FPGA_FCLK2_ENABLE {1} \
CONFIG.PCW_FPGA_FCLK3_ENABLE {0} \
CONFIG.PCW_GPIO_EMIO_GPIO_ENABLE {0} \
CONFIG.PCW_GPIO_EMIO_GPIO_WIDTH {64} \
CONFIG.PCW_GPIO_MIO_GPIO_ENABLE {1} \
CONFIG.PCW_GPIO_MIO_GPIO_IO {MIO} \
CONFIG.PCW_GPIO_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_I2C0_GRP_INT_ENABLE {0} \
CONFIG.PCW_I2C0_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_I2C0_RESET_ENABLE {0} \
CONFIG.PCW_I2C1_GRP_INT_ENABLE {0} \
CONFIG.PCW_I2C1_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_I2C1_RESET_ENABLE {0} \
CONFIG.PCW_I2C_PERIPHERAL_FREQMHZ {25} \
CONFIG.PCW_I2C_RESET_ENABLE {1} \
CONFIG.PCW_I2C_RESET_POLARITY {Active Low} \
CONFIG.PCW_IOPLL_CTRL_FBDIV {30} \
CONFIG.PCW_IO_IO_PLL_FREQMHZ {1000.000} \
CONFIG.PCW_IRQ_F2P_INTR {1} \
CONFIG.PCW_IRQ_F2P_MODE {DIRECT} \
CONFIG.PCW_MIO_0_DIRECTION {inout} \
CONFIG.PCW_MIO_0_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_0_PULLUP {disabled} \
CONFIG.PCW_MIO_0_SLEW {slow} \
CONFIG.PCW_MIO_10_DIRECTION {inout} \
CONFIG.PCW_MIO_10_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_10_PULLUP {disabled} \
CONFIG.PCW_MIO_10_SLEW {slow} \
CONFIG.PCW_MIO_11_DIRECTION {inout} \
CONFIG.PCW_MIO_11_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_11_PULLUP {disabled} \
CONFIG.PCW_MIO_11_SLEW {slow} \
CONFIG.PCW_MIO_12_DIRECTION {inout} \
CONFIG.PCW_MIO_12_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_12_PULLUP {disabled} \
CONFIG.PCW_MIO_12_SLEW {slow} \
CONFIG.PCW_MIO_13_DIRECTION {inout} \
CONFIG.PCW_MIO_13_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_13_PULLUP {disabled} \
CONFIG.PCW_MIO_13_SLEW {slow} \
CONFIG.PCW_MIO_14_DIRECTION {inout} \
CONFIG.PCW_MIO_14_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_14_PULLUP {disabled} \
CONFIG.PCW_MIO_14_SLEW {slow} \
CONFIG.PCW_MIO_15_DIRECTION {inout} \
CONFIG.PCW_MIO_15_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_15_PULLUP {disabled} \
CONFIG.PCW_MIO_15_SLEW {slow} \
CONFIG.PCW_MIO_16_DIRECTION {out} \
CONFIG.PCW_MIO_16_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_16_PULLUP {disabled} \
CONFIG.PCW_MIO_16_SLEW {fast} \
CONFIG.PCW_MIO_17_DIRECTION {out} \
CONFIG.PCW_MIO_17_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_17_PULLUP {disabled} \
CONFIG.PCW_MIO_17_SLEW {fast} \
CONFIG.PCW_MIO_18_DIRECTION {out} \
CONFIG.PCW_MIO_18_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_18_PULLUP {disabled} \
CONFIG.PCW_MIO_18_SLEW {fast} \
CONFIG.PCW_MIO_19_DIRECTION {out} \
CONFIG.PCW_MIO_19_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_19_PULLUP {disabled} \
CONFIG.PCW_MIO_19_SLEW {fast} \
CONFIG.PCW_MIO_1_DIRECTION {out} \
CONFIG.PCW_MIO_1_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_1_PULLUP {disabled} \
CONFIG.PCW_MIO_1_SLEW {fast} \
CONFIG.PCW_MIO_20_DIRECTION {out} \
CONFIG.PCW_MIO_20_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_20_PULLUP {disabled} \
CONFIG.PCW_MIO_20_SLEW {fast} \
CONFIG.PCW_MIO_21_DIRECTION {out} \
CONFIG.PCW_MIO_21_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_21_PULLUP {disabled} \
CONFIG.PCW_MIO_21_SLEW {fast} \
CONFIG.PCW_MIO_22_DIRECTION {in} \
CONFIG.PCW_MIO_22_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_22_PULLUP {disabled} \
CONFIG.PCW_MIO_22_SLEW {fast} \
CONFIG.PCW_MIO_23_DIRECTION {in} \
CONFIG.PCW_MIO_23_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_23_PULLUP {disabled} \
CONFIG.PCW_MIO_23_SLEW {fast} \
CONFIG.PCW_MIO_24_DIRECTION {in} \
CONFIG.PCW_MIO_24_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_24_PULLUP {disabled} \
CONFIG.PCW_MIO_24_SLEW {fast} \
CONFIG.PCW_MIO_25_DIRECTION {in} \
CONFIG.PCW_MIO_25_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_25_PULLUP {disabled} \
CONFIG.PCW_MIO_25_SLEW {fast} \
CONFIG.PCW_MIO_26_DIRECTION {in} \
CONFIG.PCW_MIO_26_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_26_PULLUP {disabled} \
CONFIG.PCW_MIO_26_SLEW {fast} \
CONFIG.PCW_MIO_27_DIRECTION {in} \
CONFIG.PCW_MIO_27_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_27_PULLUP {disabled} \
CONFIG.PCW_MIO_27_SLEW {fast} \
CONFIG.PCW_MIO_28_DIRECTION {inout} \
CONFIG.PCW_MIO_28_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_28_PULLUP {disabled} \
CONFIG.PCW_MIO_28_SLEW {fast} \
CONFIG.PCW_MIO_29_DIRECTION {inout} \
CONFIG.PCW_MIO_29_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_29_PULLUP {disabled} \
CONFIG.PCW_MIO_29_SLEW {fast} \
CONFIG.PCW_MIO_2_DIRECTION {inout} \
CONFIG.PCW_MIO_2_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_2_PULLUP {disabled} \
CONFIG.PCW_MIO_2_SLEW {fast} \
CONFIG.PCW_MIO_30_DIRECTION {inout} \
CONFIG.PCW_MIO_30_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_30_PULLUP {disabled} \
CONFIG.PCW_MIO_30_SLEW {fast} \
CONFIG.PCW_MIO_31_DIRECTION {inout} \
CONFIG.PCW_MIO_31_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_31_PULLUP {disabled} \
CONFIG.PCW_MIO_31_SLEW {fast} \
CONFIG.PCW_MIO_32_DIRECTION {inout} \
CONFIG.PCW_MIO_32_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_32_PULLUP {disabled} \
CONFIG.PCW_MIO_32_SLEW {fast} \
CONFIG.PCW_MIO_33_DIRECTION {inout} \
CONFIG.PCW_MIO_33_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_33_PULLUP {disabled} \
CONFIG.PCW_MIO_33_SLEW {fast} \
CONFIG.PCW_MIO_34_DIRECTION {inout} \
CONFIG.PCW_MIO_34_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_34_PULLUP {disabled} \
CONFIG.PCW_MIO_34_SLEW {fast} \
CONFIG.PCW_MIO_35_DIRECTION {inout} \
CONFIG.PCW_MIO_35_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_35_PULLUP {disabled} \
CONFIG.PCW_MIO_35_SLEW {fast} \
CONFIG.PCW_MIO_36_DIRECTION {inout} \
CONFIG.PCW_MIO_36_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_36_PULLUP {disabled} \
CONFIG.PCW_MIO_36_SLEW {fast} \
CONFIG.PCW_MIO_37_DIRECTION {inout} \
CONFIG.PCW_MIO_37_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_37_PULLUP {disabled} \
CONFIG.PCW_MIO_37_SLEW {fast} \
CONFIG.PCW_MIO_38_DIRECTION {inout} \
CONFIG.PCW_MIO_38_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_38_PULLUP {disabled} \
CONFIG.PCW_MIO_38_SLEW {fast} \
CONFIG.PCW_MIO_39_DIRECTION {inout} \
CONFIG.PCW_MIO_39_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_39_PULLUP {disabled} \
CONFIG.PCW_MIO_39_SLEW {fast} \
CONFIG.PCW_MIO_3_DIRECTION {inout} \
CONFIG.PCW_MIO_3_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_3_PULLUP {disabled} \
CONFIG.PCW_MIO_3_SLEW {fast} \
CONFIG.PCW_MIO_40_DIRECTION {inout} \
CONFIG.PCW_MIO_40_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_40_PULLUP {disabled} \
CONFIG.PCW_MIO_40_SLEW {fast} \
CONFIG.PCW_MIO_41_DIRECTION {inout} \
CONFIG.PCW_MIO_41_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_41_PULLUP {disabled} \
CONFIG.PCW_MIO_41_SLEW {fast} \
CONFIG.PCW_MIO_42_DIRECTION {inout} \
CONFIG.PCW_MIO_42_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_42_PULLUP {disabled} \
CONFIG.PCW_MIO_42_SLEW {fast} \
CONFIG.PCW_MIO_43_DIRECTION {inout} \
CONFIG.PCW_MIO_43_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_43_PULLUP {disabled} \
CONFIG.PCW_MIO_43_SLEW {fast} \
CONFIG.PCW_MIO_44_DIRECTION {inout} \
CONFIG.PCW_MIO_44_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_44_PULLUP {disabled} \
CONFIG.PCW_MIO_44_SLEW {fast} \
CONFIG.PCW_MIO_45_DIRECTION {inout} \
CONFIG.PCW_MIO_45_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_45_PULLUP {disabled} \
CONFIG.PCW_MIO_45_SLEW {fast} \
CONFIG.PCW_MIO_46_DIRECTION {in} \
CONFIG.PCW_MIO_46_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_46_PULLUP {disabled} \
CONFIG.PCW_MIO_46_SLEW {slow} \
CONFIG.PCW_MIO_47_DIRECTION {in} \
CONFIG.PCW_MIO_47_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_47_PULLUP {disabled} \
CONFIG.PCW_MIO_47_SLEW {slow} \
CONFIG.PCW_MIO_48_DIRECTION {out} \
CONFIG.PCW_MIO_48_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_48_PULLUP {disabled} \
CONFIG.PCW_MIO_48_SLEW {slow} \
CONFIG.PCW_MIO_49_DIRECTION {in} \
CONFIG.PCW_MIO_49_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_49_PULLUP {disabled} \
CONFIG.PCW_MIO_49_SLEW {slow} \
CONFIG.PCW_MIO_4_DIRECTION {inout} \
CONFIG.PCW_MIO_4_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_4_PULLUP {disabled} \
CONFIG.PCW_MIO_4_SLEW {fast} \
CONFIG.PCW_MIO_50_DIRECTION {inout} \
CONFIG.PCW_MIO_50_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_50_PULLUP {disabled} \
CONFIG.PCW_MIO_50_SLEW {slow} \
CONFIG.PCW_MIO_51_DIRECTION {inout} \
CONFIG.PCW_MIO_51_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_51_PULLUP {disabled} \
CONFIG.PCW_MIO_51_SLEW {slow} \
CONFIG.PCW_MIO_52_DIRECTION {out} \
CONFIG.PCW_MIO_52_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_52_PULLUP {disabled} \
CONFIG.PCW_MIO_52_SLEW {slow} \
CONFIG.PCW_MIO_53_DIRECTION {inout} \
CONFIG.PCW_MIO_53_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_53_PULLUP {disabled} \
CONFIG.PCW_MIO_53_SLEW {slow} \
CONFIG.PCW_MIO_5_DIRECTION {inout} \
CONFIG.PCW_MIO_5_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_5_PULLUP {disabled} \
CONFIG.PCW_MIO_5_SLEW {fast} \
CONFIG.PCW_MIO_6_DIRECTION {out} \
CONFIG.PCW_MIO_6_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_6_PULLUP {disabled} \
CONFIG.PCW_MIO_6_SLEW {fast} \
CONFIG.PCW_MIO_7_DIRECTION {out} \
CONFIG.PCW_MIO_7_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_7_PULLUP {disabled} \
CONFIG.PCW_MIO_7_SLEW {slow} \
CONFIG.PCW_MIO_8_DIRECTION {out} \
CONFIG.PCW_MIO_8_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_8_PULLUP {disabled} \
CONFIG.PCW_MIO_8_SLEW {fast} \
CONFIG.PCW_MIO_9_DIRECTION {inout} \
CONFIG.PCW_MIO_9_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_9_PULLUP {disabled} \
CONFIG.PCW_MIO_9_SLEW {slow} \
CONFIG.PCW_MIO_TREE_PERIPHERALS {GPIO#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#SD 0#SD 0#SD 0#SD 0#SD 0#SD 0#SD 0#SD 0#UART 1#UART 1#GPIO#GPIO#Enet 0#Enet 0} \
CONFIG.PCW_MIO_TREE_SIGNALS {gpio[0]#qspi0_ss_b#qspi0_io[0]#qspi0_io[1]#qspi0_io[2]#qspi0_io[3]#qspi0_sclk#gpio[7]#gpio[8]#gpio[9]#gpio[10]#gpio[11]#gpio[12]#gpio[13]#gpio[14]#gpio[15]#tx_clk#txd[0]#txd[1]#txd[2]#txd[3]#tx_ctl#rx_clk#rxd[0]#rxd[1]#rxd[2]#rxd[3]#rx_ctl#gpio[28]#gpio[29]#gpio[30]#gpio[31]#gpio[32]#gpio[33]#gpio[34]#gpio[35]#gpio[36]#gpio[37]#gpio[38]#gpio[39]#clk#cmd#data[0]#data[1]#data[2]#data[3]#wp#cd#tx#rx#gpio[50]#gpio[51]#mdc#mdio} \
CONFIG.PCW_NAND_CYCLES_T_AR {1} \
CONFIG.PCW_NAND_CYCLES_T_CLR {1} \
CONFIG.PCW_NAND_CYCLES_T_RC {11} \
CONFIG.PCW_NAND_CYCLES_T_REA {1} \
CONFIG.PCW_NAND_CYCLES_T_RR {1} \
CONFIG.PCW_NAND_CYCLES_T_WC {11} \
CONFIG.PCW_NAND_CYCLES_T_WP {1} \
CONFIG.PCW_NAND_GRP_D8_ENABLE {0} \
CONFIG.PCW_NAND_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_NOR_CS0_T_CEOE {1} \
CONFIG.PCW_NOR_CS0_T_PC {1} \
CONFIG.PCW_NOR_CS0_T_RC {11} \
CONFIG.PCW_NOR_CS0_T_TR {1} \
CONFIG.PCW_NOR_CS0_T_WC {11} \
CONFIG.PCW_NOR_CS0_T_WP {1} \
CONFIG.PCW_NOR_CS0_WE_TIME {0} \
CONFIG.PCW_NOR_CS1_T_CEOE {1} \
CONFIG.PCW_NOR_CS1_T_PC {1} \
CONFIG.PCW_NOR_CS1_T_RC {11} \
CONFIG.PCW_NOR_CS1_T_TR {1} \
CONFIG.PCW_NOR_CS1_T_WC {11} \
CONFIG.PCW_NOR_CS1_T_WP {1} \
CONFIG.PCW_NOR_CS1_WE_TIME {0} \
CONFIG.PCW_NOR_GRP_A25_ENABLE {0} \
CONFIG.PCW_NOR_GRP_CS0_ENABLE {0} \
CONFIG.PCW_NOR_GRP_CS1_ENABLE {0} \
CONFIG.PCW_NOR_GRP_SRAM_CS0_ENABLE {0} \
CONFIG.PCW_NOR_GRP_SRAM_CS1_ENABLE {0} \
CONFIG.PCW_NOR_GRP_SRAM_INT_ENABLE {0} \
CONFIG.PCW_NOR_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_NOR_SRAM_CS0_T_CEOE {1} \
CONFIG.PCW_NOR_SRAM_CS0_T_PC {1} \
CONFIG.PCW_NOR_SRAM_CS0_T_RC {11} \
CONFIG.PCW_NOR_SRAM_CS0_T_TR {1} \
CONFIG.PCW_NOR_SRAM_CS0_T_WC {11} \
CONFIG.PCW_NOR_SRAM_CS0_T_WP {1} \
CONFIG.PCW_NOR_SRAM_CS0_WE_TIME {0} \
CONFIG.PCW_NOR_SRAM_CS1_T_CEOE {1} \
CONFIG.PCW_NOR_SRAM_CS1_T_PC {1} \
CONFIG.PCW_NOR_SRAM_CS1_T_RC {11} \
CONFIG.PCW_NOR_SRAM_CS1_T_TR {1} \
CONFIG.PCW_NOR_SRAM_CS1_T_WC {11} \
CONFIG.PCW_NOR_SRAM_CS1_T_WP {1} \
CONFIG.PCW_NOR_SRAM_CS1_WE_TIME {0} \
CONFIG.PCW_OVERRIDE_BASIC_CLOCK {0} \
CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY0 {0.063} \
CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY1 {0.062} \
CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY2 {0.065} \
CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY3 {0.083} \
CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_0 {-0.007} \
CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_1 {-0.010} \
CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_2 {-0.006} \
CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_3 {-0.048} \
CONFIG.PCW_PCAP_PERIPHERAL_CLKSRC {IO PLL} \
CONFIG.PCW_PCAP_PERIPHERAL_DIVISOR0 {5} \
CONFIG.PCW_PCAP_PERIPHERAL_FREQMHZ {200} \
CONFIG.PCW_PERIPHERAL_BOARD_PRESET {part0} \
CONFIG.PCW_PJTAG_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_PLL_BYPASSMODE_ENABLE {0} \
CONFIG.PCW_PRESET_BANK0_VOLTAGE {LVCMOS 3.3V} \
CONFIG.PCW_PRESET_BANK1_VOLTAGE {LVCMOS 1.8V} \
CONFIG.PCW_QSPI_GRP_FBCLK_ENABLE {0} \
CONFIG.PCW_QSPI_GRP_IO1_ENABLE {0} \
CONFIG.PCW_QSPI_GRP_SINGLE_SS_ENABLE {1} \
CONFIG.PCW_QSPI_GRP_SINGLE_SS_IO {MIO 1 .. 6} \
CONFIG.PCW_QSPI_GRP_SS1_ENABLE {0} \
CONFIG.PCW_QSPI_INTERNAL_HIGHADDRESS {0xFCFFFFFF} \
CONFIG.PCW_QSPI_PERIPHERAL_CLKSRC {IO PLL} \
CONFIG.PCW_QSPI_PERIPHERAL_DIVISOR0 {5} \
CONFIG.PCW_QSPI_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_QSPI_PERIPHERAL_FREQMHZ {200} \
CONFIG.PCW_QSPI_QSPI_IO {MIO 1 .. 6} \
CONFIG.PCW_SD0_GRP_CD_ENABLE {1} \
CONFIG.PCW_SD0_GRP_CD_IO {MIO 47} \
CONFIG.PCW_SD0_GRP_POW_ENABLE {0} \
CONFIG.PCW_SD0_GRP_WP_ENABLE {1} \
CONFIG.PCW_SD0_GRP_WP_IO {MIO 46} \
CONFIG.PCW_SD0_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_SD0_SD0_IO {MIO 40 .. 45} \
CONFIG.PCW_SD1_GRP_CD_ENABLE {0} \
CONFIG.PCW_SD1_GRP_POW_ENABLE {0} \
CONFIG.PCW_SD1_GRP_WP_ENABLE {0} \
CONFIG.PCW_SD1_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_SDIO_PERIPHERAL_CLKSRC {IO PLL} \
CONFIG.PCW_SDIO_PERIPHERAL_DIVISOR0 {20} \
CONFIG.PCW_SDIO_PERIPHERAL_FREQMHZ {50} \
CONFIG.PCW_SDIO_PERIPHERAL_VALID {1} \
CONFIG.PCW_SMC_PERIPHERAL_CLKSRC {IO PLL} \
CONFIG.PCW_SMC_PERIPHERAL_DIVISOR0 {1} \
CONFIG.PCW_SMC_PERIPHERAL_FREQMHZ {100} \
CONFIG.PCW_SMC_PERIPHERAL_VALID {0} \
CONFIG.PCW_SPI0_GRP_SS0_ENABLE {0} \
CONFIG.PCW_SPI0_GRP_SS1_ENABLE {0} \
CONFIG.PCW_SPI0_GRP_SS2_ENABLE {0} \
CONFIG.PCW_SPI0_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_SPI1_GRP_SS0_ENABLE {0} \
CONFIG.PCW_SPI1_GRP_SS1_ENABLE {0} \
CONFIG.PCW_SPI1_GRP_SS2_ENABLE {0} \
CONFIG.PCW_SPI1_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_SPI_PERIPHERAL_CLKSRC {IO PLL} \
CONFIG.PCW_SPI_PERIPHERAL_DIVISOR0 {1} \
CONFIG.PCW_SPI_PERIPHERAL_FREQMHZ {166.666666} \
CONFIG.PCW_SPI_PERIPHERAL_VALID {0} \
CONFIG.PCW_S_AXI_HP0_DATA_WIDTH {64} \
CONFIG.PCW_S_AXI_HP1_DATA_WIDTH {64} \
CONFIG.PCW_S_AXI_HP2_DATA_WIDTH {64} \
CONFIG.PCW_S_AXI_HP3_DATA_WIDTH {64} \
CONFIG.PCW_TPIU_PERIPHERAL_CLKSRC {External} \
CONFIG.PCW_TPIU_PERIPHERAL_DIVISOR0 {1} \
CONFIG.PCW_TPIU_PERIPHERAL_FREQMHZ {200} \
CONFIG.PCW_TRACE_GRP_16BIT_ENABLE {0} \
CONFIG.PCW_TRACE_GRP_2BIT_ENABLE {0} \
CONFIG.PCW_TRACE_GRP_32BIT_ENABLE {0} \
CONFIG.PCW_TRACE_GRP_4BIT_ENABLE {0} \
CONFIG.PCW_TRACE_GRP_8BIT_ENABLE {0} \
CONFIG.PCW_TRACE_INTERNAL_WIDTH {2} \
CONFIG.PCW_TRACE_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_TTC0_CLK0_PERIPHERAL_CLKSRC {CPU_1X} \
CONFIG.PCW_TTC0_CLK0_PERIPHERAL_DIVISOR0 {1} \
CONFIG.PCW_TTC0_CLK0_PERIPHERAL_FREQMHZ {133.333333} \
CONFIG.PCW_TTC0_CLK1_PERIPHERAL_CLKSRC {CPU_1X} \
CONFIG.PCW_TTC0_CLK1_PERIPHERAL_DIVISOR0 {1} \
CONFIG.PCW_TTC0_CLK1_PERIPHERAL_FREQMHZ {133.333333} \
CONFIG.PCW_TTC0_CLK2_PERIPHERAL_CLKSRC {CPU_1X} \
CONFIG.PCW_TTC0_CLK2_PERIPHERAL_DIVISOR0 {1} \
CONFIG.PCW_TTC0_CLK2_PERIPHERAL_FREQMHZ {133.333333} \
CONFIG.PCW_TTC0_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_TTC0_TTC0_IO {<Select>} \
CONFIG.PCW_TTC1_CLK0_PERIPHERAL_CLKSRC {CPU_1X} \
CONFIG.PCW_TTC1_CLK0_PERIPHERAL_DIVISOR0 {1} \
CONFIG.PCW_TTC1_CLK0_PERIPHERAL_FREQMHZ {133.333333} \
CONFIG.PCW_TTC1_CLK1_PERIPHERAL_CLKSRC {CPU_1X} \
CONFIG.PCW_TTC1_CLK1_PERIPHERAL_DIVISOR0 {1} \
CONFIG.PCW_TTC1_CLK1_PERIPHERAL_FREQMHZ {133.333333} \
CONFIG.PCW_TTC1_CLK2_PERIPHERAL_CLKSRC {CPU_1X} \
CONFIG.PCW_TTC1_CLK2_PERIPHERAL_DIVISOR0 {1} \
CONFIG.PCW_TTC1_CLK2_PERIPHERAL_FREQMHZ {133.333333} \
CONFIG.PCW_TTC1_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_TTC_PERIPHERAL_FREQMHZ {50} \
CONFIG.PCW_UART0_BAUD_RATE {115200} \
CONFIG.PCW_UART0_GRP_FULL_ENABLE {0} \
CONFIG.PCW_UART0_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_UART1_BAUD_RATE {115200} \
CONFIG.PCW_UART1_GRP_FULL_ENABLE {0} \
CONFIG.PCW_UART1_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_UART1_UART1_IO {MIO 48 .. 49} \
CONFIG.PCW_UART_PERIPHERAL_CLKSRC {IO PLL} \
CONFIG.PCW_UART_PERIPHERAL_DIVISOR0 {20} \
CONFIG.PCW_UART_PERIPHERAL_FREQMHZ {50} \
CONFIG.PCW_UART_PERIPHERAL_VALID {1} \
CONFIG.PCW_UIPARAM_ACT_DDR_FREQ_MHZ {533.333374} \
CONFIG.PCW_UIPARAM_DDR_ADV_ENABLE {0} \
CONFIG.PCW_UIPARAM_DDR_AL {0} \
CONFIG.PCW_UIPARAM_DDR_BANK_ADDR_COUNT {3} \
CONFIG.PCW_UIPARAM_DDR_BL {8} \
CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY0 {0.41} \
CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY1 {0.411} \
CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY2 {0.341} \
CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY3 {0.358} \
CONFIG.PCW_UIPARAM_DDR_BUS_WIDTH {32 Bit} \
CONFIG.PCW_UIPARAM_DDR_CL {7} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_0_LENGTH_MM {0} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_0_PACKAGE_LENGTH {61.0905} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_0_PROPOGATION_DELAY {160} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_1_LENGTH_MM {0} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_1_PACKAGE_LENGTH {61.0905} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_1_PROPOGATION_DELAY {160} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_2_LENGTH_MM {0} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_2_PACKAGE_LENGTH {61.0905} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_2_PROPOGATION_DELAY {160} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_3_LENGTH_MM {0} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_3_PACKAGE_LENGTH {61.0905} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_3_PROPOGATION_DELAY {160} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_STOP_EN {0} \
CONFIG.PCW_UIPARAM_DDR_COL_ADDR_COUNT {10} \
CONFIG.PCW_UIPARAM_DDR_CWL {6} \
CONFIG.PCW_UIPARAM_DDR_DEVICE_CAPACITY {2048 MBits} \
CONFIG.PCW_UIPARAM_DDR_DQS_0_LENGTH_MM {0} \
CONFIG.PCW_UIPARAM_DDR_DQS_0_PACKAGE_LENGTH {68.4725} \
CONFIG.PCW_UIPARAM_DDR_DQS_0_PROPOGATION_DELAY {160} \
CONFIG.PCW_UIPARAM_DDR_DQS_1_LENGTH_MM {0} \
CONFIG.PCW_UIPARAM_DDR_DQS_1_PACKAGE_LENGTH {71.086} \
CONFIG.PCW_UIPARAM_DDR_DQS_1_PROPOGATION_DELAY {160} \
CONFIG.PCW_UIPARAM_DDR_DQS_2_LENGTH_MM {0} \
CONFIG.PCW_UIPARAM_DDR_DQS_2_PACKAGE_LENGTH {66.794} \
CONFIG.PCW_UIPARAM_DDR_DQS_2_PROPOGATION_DELAY {160} \
CONFIG.PCW_UIPARAM_DDR_DQS_3_LENGTH_MM {0} \
CONFIG.PCW_UIPARAM_DDR_DQS_3_PACKAGE_LENGTH {108.7385} \
CONFIG.PCW_UIPARAM_DDR_DQS_3_PROPOGATION_DELAY {160} \
CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_0 {0.025} \
CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_1 {0.028} \
CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_2 {0.001} \
CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_3 {0.001} \
CONFIG.PCW_UIPARAM_DDR_DQ_0_LENGTH_MM {0} \
CONFIG.PCW_UIPARAM_DDR_DQ_0_PACKAGE_LENGTH {64.1705} \
CONFIG.PCW_UIPARAM_DDR_DQ_0_PROPOGATION_DELAY {160} \
CONFIG.PCW_UIPARAM_DDR_DQ_1_LENGTH_MM {0} \
CONFIG.PCW_UIPARAM_DDR_DQ_1_PACKAGE_LENGTH {63.686} \
CONFIG.PCW_UIPARAM_DDR_DQ_1_PROPOGATION_DELAY {160} \
CONFIG.PCW_UIPARAM_DDR_DQ_2_LENGTH_MM {0} \
CONFIG.PCW_UIPARAM_DDR_DQ_2_PACKAGE_LENGTH {68.46} \
CONFIG.PCW_UIPARAM_DDR_DQ_2_PROPOGATION_DELAY {160} \
CONFIG.PCW_UIPARAM_DDR_DQ_3_LENGTH_MM {0} \
CONFIG.PCW_UIPARAM_DDR_DQ_3_PACKAGE_LENGTH {105.4895} \
CONFIG.PCW_UIPARAM_DDR_DQ_3_PROPOGATION_DELAY {160} \
CONFIG.PCW_UIPARAM_DDR_DRAM_WIDTH {16 Bits} \
CONFIG.PCW_UIPARAM_DDR_ECC {Disabled} \
CONFIG.PCW_UIPARAM_DDR_ENABLE {1} \
CONFIG.PCW_UIPARAM_DDR_FREQ_MHZ {533.333313} \
CONFIG.PCW_UIPARAM_DDR_HIGH_TEMP {Normal (0-85)} \
CONFIG.PCW_UIPARAM_DDR_MEMORY_TYPE {DDR 3} \
CONFIG.PCW_UIPARAM_DDR_PARTNO {MT41J128M16 HA-15E} \
CONFIG.PCW_UIPARAM_DDR_ROW_ADDR_COUNT {14} \
CONFIG.PCW_UIPARAM_DDR_SPEED_BIN {DDR3_1066F} \
CONFIG.PCW_UIPARAM_DDR_TRAIN_DATA_EYE {1} \
CONFIG.PCW_UIPARAM_DDR_TRAIN_READ_GATE {1} \
CONFIG.PCW_UIPARAM_DDR_TRAIN_WRITE_LEVEL {1} \
CONFIG.PCW_UIPARAM_DDR_T_FAW {45.0} \
CONFIG.PCW_UIPARAM_DDR_T_RAS_MIN {36.0} \
CONFIG.PCW_UIPARAM_DDR_T_RC {49.5} \
CONFIG.PCW_UIPARAM_DDR_T_RCD {7} \
CONFIG.PCW_UIPARAM_DDR_T_RP {7} \
CONFIG.PCW_UIPARAM_DDR_USE_INTERNAL_VREF {1} \
CONFIG.PCW_USB0_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_USB0_PERIPHERAL_FREQMHZ {60} \
CONFIG.PCW_USB0_RESET_ENABLE {0} \
CONFIG.PCW_USB0_USB0_IO {<Select>} \
CONFIG.PCW_USB1_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_USB1_PERIPHERAL_FREQMHZ {60} \
CONFIG.PCW_USB1_RESET_ENABLE {0} \
CONFIG.PCW_USB_RESET_ENABLE {1} \
CONFIG.PCW_USB_RESET_POLARITY {Active Low} \
CONFIG.PCW_USB_RESET_SELECT {<Select>} \
CONFIG.PCW_USE_AXI_NONSECURE {0} \
CONFIG.PCW_USE_CROSS_TRIGGER {0} \
CONFIG.PCW_USE_FABRIC_INTERRUPT {0} \
CONFIG.PCW_USE_S_AXI_HP0 {1} \
CONFIG.PCW_WDT_PERIPHERAL_CLKSRC {CPU_1X} \
CONFIG.PCW_WDT_PERIPHERAL_DIVISOR0 {1} \
CONFIG.PCW_WDT_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_WDT_PERIPHERAL_FREQMHZ {133.333333} \
CONFIG.preset {ZedBoard} \
 ] $PS7

  # Create instance: PS7_axi_periph, and set properties
  set PS7_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 PS7_axi_periph ]
  set_property -dict [ list \
CONFIG.NUM_MI {8} \
 ] $PS7_axi_periph

  # Create instance: Sine_0, and set properties
  set Sine_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:Sine:2.0 Sine_0 ]

  # Create instance: axi_mem_intercon, and set properties
  set axi_mem_intercon [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_mem_intercon ]
  set_property -dict [ list \
CONFIG.NUM_MI {1} \
CONFIG.NUM_SI {2} \
 ] $axi_mem_intercon

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins M02_AXI] [get_bd_intf_pins PS7_axi_periph/M02_AXI]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins M03_AXI] [get_bd_intf_pins PS7_axi_periph/M03_AXI]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins M04_AXI] [get_bd_intf_pins PS7_axi_periph/M04_AXI]
  connect_bd_intf_net -intf_net Conn4 [get_bd_intf_pins M05_AXI] [get_bd_intf_pins PS7_axi_periph/M05_AXI]
  connect_bd_intf_net -intf_net Conn5 [get_bd_intf_pins M06_AXI] [get_bd_intf_pins PS7_axi_periph/M06_AXI]
  connect_bd_intf_net -intf_net Conn6 [get_bd_intf_pins M07_AXI] [get_bd_intf_pins PS7_axi_periph/M07_AXI]
  connect_bd_intf_net -intf_net PS7_M_AXI_GP0 [get_bd_intf_pins PS7/M_AXI_GP0] [get_bd_intf_pins PS7_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net PS7_axi_periph_M00_AXI [get_bd_intf_pins M00_AXI] [get_bd_intf_pins PS7_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net PS7_axi_periph_M01_AXI [get_bd_intf_pins PS7_axi_periph/M01_AXI] [get_bd_intf_pins Sine_0/ctrl_saxi]
  connect_bd_intf_net -intf_net PS_VIDEO_DDR [get_bd_intf_pins DDR] [get_bd_intf_pins PS7/DDR]
  connect_bd_intf_net -intf_net PS_VIDEO_FIXED_IO [get_bd_intf_pins FIXED_IO] [get_bd_intf_pins PS7/FIXED_IO]
  connect_bd_intf_net -intf_net VDMA1_M_AXI_MM2S [get_bd_intf_pins S00_AXI] [get_bd_intf_pins axi_mem_intercon/S00_AXI]
  connect_bd_intf_net -intf_net VDMA1_M_AXI_S2MM [get_bd_intf_pins S01_AXI] [get_bd_intf_pins axi_mem_intercon/S01_AXI]
  connect_bd_intf_net -intf_net axi_mem_intercon_M00_AXI [get_bd_intf_pins PS7/S_AXI_HP0] [get_bd_intf_pins axi_mem_intercon/M00_AXI]

  # Create port connections
  connect_bd_net -net M02_ARESETN_1 [get_bd_pins aresetn75Mhz] [get_bd_pins PS7_axi_periph/M02_ARESETN] [get_bd_pins PS7_axi_periph/M03_ARESETN]
  connect_bd_net -net PS7_FCLK_CLK2 [get_bd_pins CLK_75MHZ] [get_bd_pins PS7/FCLK_CLK2] [get_bd_pins PS7_axi_periph/M02_ACLK] [get_bd_pins PS7_axi_periph/M03_ACLK]
  connect_bd_net -net PS_VIDEO_FCLK_CLK1 [get_bd_pins CLK_100MHZ] [get_bd_pins PS7/FCLK_CLK1]
  connect_bd_net -net PS_VIDEO_FCLK_RESET0_N [get_bd_pins master_aresetn] [get_bd_pins PS7/FCLK_RESET0_N]
  connect_bd_net -net SYSTEM_RESETS_interconnect_aresetn [get_bd_pins iaresetn150Mhz] [get_bd_pins PS7_axi_periph/ARESETN] [get_bd_pins axi_mem_intercon/ARESETN]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins CLK_150MHZ] [get_bd_pins PS7/FCLK_CLK0] [get_bd_pins PS7/M_AXI_GP0_ACLK] [get_bd_pins PS7/S_AXI_HP0_ACLK] [get_bd_pins PS7_axi_periph/ACLK] [get_bd_pins PS7_axi_periph/M00_ACLK] [get_bd_pins PS7_axi_periph/M01_ACLK] [get_bd_pins PS7_axi_periph/M04_ACLK] [get_bd_pins PS7_axi_periph/M05_ACLK] [get_bd_pins PS7_axi_periph/M06_ACLK] [get_bd_pins PS7_axi_periph/M07_ACLK] [get_bd_pins PS7_axi_periph/S00_ACLK] [get_bd_pins Sine_0/ctrl_saxi_aclk] [get_bd_pins axi_mem_intercon/ACLK] [get_bd_pins axi_mem_intercon/M00_ACLK] [get_bd_pins axi_mem_intercon/S00_ACLK] [get_bd_pins axi_mem_intercon/S01_ACLK]
  connect_bd_net -net rst_PS7_150M_peripheral_aresetn [get_bd_pins aresetn150Mhz] [get_bd_pins PS7_axi_periph/M00_ARESETN] [get_bd_pins PS7_axi_periph/M01_ARESETN] [get_bd_pins PS7_axi_periph/M04_ARESETN] [get_bd_pins PS7_axi_periph/M05_ARESETN] [get_bd_pins PS7_axi_periph/M06_ARESETN] [get_bd_pins PS7_axi_periph/M07_ARESETN] [get_bd_pins PS7_axi_periph/S00_ARESETN] [get_bd_pins Sine_0/ctrl_saxi_aresetn] [get_bd_pins axi_mem_intercon/M00_ARESETN] [get_bd_pins axi_mem_intercon/S00_ARESETN] [get_bd_pins axi_mem_intercon/S01_ARESETN]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: PS
proc create_hier_cell_PS { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_PS() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR
  create_bd_intf_pin -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M02_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M03_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M04_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M05_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M06_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M07_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS_S2MM

  # Create pins
  create_bd_pin -dir O -type clk CLK_100MHZ
  create_bd_pin -dir O -type clk CLK_150MHZ
  create_bd_pin -dir O -type clk CLK_75MHZ
  create_bd_pin -dir I -type rst aresetn150Mhz
  create_bd_pin -dir I -type rst aresetn75Mhz
  create_bd_pin -dir I -type rst iaresetn150Mhz
  create_bd_pin -dir O -type rst master_aresetn

  # Create instance: TO_PS
  create_hier_cell_TO_PS $hier_obj TO_PS

  # Create instance: V_DMA
  create_hier_cell_V_DMA $hier_obj V_DMA

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins M02_AXI] [get_bd_intf_pins TO_PS/M02_AXI]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins M03_AXI] [get_bd_intf_pins TO_PS/M03_AXI]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins M04_AXI] [get_bd_intf_pins TO_PS/M04_AXI]
  connect_bd_intf_net -intf_net Conn4 [get_bd_intf_pins M05_AXI] [get_bd_intf_pins TO_PS/M05_AXI]
  connect_bd_intf_net -intf_net Conn5 [get_bd_intf_pins M06_AXI] [get_bd_intf_pins TO_PS/M06_AXI]
  connect_bd_intf_net -intf_net Conn6 [get_bd_intf_pins M07_AXI] [get_bd_intf_pins TO_PS/M07_AXI]
  connect_bd_intf_net -intf_net PS7_axi_periph_M00_AXI [get_bd_intf_pins TO_PS/M00_AXI] [get_bd_intf_pins V_DMA/S_AXI_LITE]
  connect_bd_intf_net -intf_net PS_VIDEO_DDR [get_bd_intf_pins DDR] [get_bd_intf_pins TO_PS/DDR]
  connect_bd_intf_net -intf_net PS_VIDEO_FIXED_IO [get_bd_intf_pins FIXED_IO] [get_bd_intf_pins TO_PS/FIXED_IO]
  connect_bd_intf_net -intf_net PS_VIDEO_M_AXIS [get_bd_intf_pins M_AXIS] [get_bd_intf_pins V_DMA/M_AXIS]
  connect_bd_intf_net -intf_net VDMA1_M_AXI_MM2S [get_bd_intf_pins TO_PS/S00_AXI] [get_bd_intf_pins V_DMA/M_AXI_MM2S]
  connect_bd_intf_net -intf_net VDMA1_M_AXI_S2MM [get_bd_intf_pins TO_PS/S01_AXI] [get_bd_intf_pins V_DMA/M_AXI_S2MM]
  connect_bd_intf_net -intf_net v_ccm_0_video_out [get_bd_intf_pins S_AXIS_S2MM] [get_bd_intf_pins V_DMA/S_AXIS_S2MM]

  # Create port connections
  connect_bd_net -net M02_ARESETN_1 [get_bd_pins aresetn75Mhz] [get_bd_pins TO_PS/aresetn75Mhz]
  connect_bd_net -net PS7_FCLK_CLK2 [get_bd_pins CLK_75MHZ] [get_bd_pins TO_PS/CLK_75MHZ]
  connect_bd_net -net PS_VIDEO_FCLK_CLK1 [get_bd_pins CLK_100MHZ] [get_bd_pins TO_PS/CLK_100MHZ]
  connect_bd_net -net PS_VIDEO_FCLK_RESET0_N [get_bd_pins master_aresetn] [get_bd_pins TO_PS/master_aresetn]
  connect_bd_net -net SYSTEM_RESETS_interconnect_aresetn [get_bd_pins iaresetn150Mhz] [get_bd_pins TO_PS/iaresetn150Mhz]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins CLK_150MHZ] [get_bd_pins TO_PS/CLK_150MHZ] [get_bd_pins V_DMA/s_axis_s2mm_aclk]
  connect_bd_net -net rst_PS7_150M_peripheral_aresetn [get_bd_pins aresetn150Mhz] [get_bd_pins TO_PS/aresetn150Mhz] [get_bd_pins V_DMA/aresetn150Mhz]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: D5M
proc create_hier_cell_D5M { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_D5M() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 config_axis
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 video_out

  # Create pins
  create_bd_pin -dir I -type clk CLK_150MHZ
  create_bd_pin -dir I -type rst aresetn150Mhz
  create_bd_pin -dir I -from 11 -to 0 idata
  create_bd_pin -dir I ifval
  create_bd_pin -dir I ilval
  create_bd_pin -dir I pixclk

  # Create instance: VFP, and set properties
  set VFP [ create_bd_cell -type ip -vlnv zakinder:DisplayIO:VFP:1.0 VFP ]
  set_property -dict [ list \
CONFIG.img_width {4096} \
CONFIG.revision_number {0x05032019} \
 ] $VFP

  # Create interface connections
  connect_bd_intf_net -intf_net VFP_0_m_axis_mm2s [get_bd_intf_pins video_out] [get_bd_intf_pins VFP/m_axis_mm2s]
  connect_bd_intf_net -intf_net VFP_0_rgb_m_axis [get_bd_intf_pins VFP/rgb_m_axis] [get_bd_intf_pins VFP/rgb_s_axis]
  connect_bd_intf_net -intf_net config_axis_1 [get_bd_intf_pins config_axis] [get_bd_intf_pins VFP/vfpConfig]

  # Create port connections
  connect_bd_net -net idata_1 [get_bd_pins idata] [get_bd_pins VFP/idata]
  connect_bd_net -net ifval_1 [get_bd_pins ifval] [get_bd_pins VFP/ifval]
  connect_bd_net -net ilval_1 [get_bd_pins ilval] [get_bd_pins VFP/ilval]
  connect_bd_net -net pixclk_1 [get_bd_pins pixclk] [get_bd_pins VFP/pixclk]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins CLK_150MHZ] [get_bd_pins VFP/m_axis_mm2s_aclk] [get_bd_pins VFP/rgb_m_axis_aclk] [get_bd_pins VFP/rgb_s_axis_aclk] [get_bd_pins VFP/vfpconfig_aclk]
  connect_bd_net -net rst_PS7_150M_peripheral_aresetn [get_bd_pins aresetn150Mhz] [get_bd_pins VFP/m_axis_mm2s_aresetn] [get_bd_pins VFP/rgb_m_axis_aresetn] [get_bd_pins VFP/rgb_s_axis_aresetn] [get_bd_pins VFP/vfpconfig_aresetn]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: VIDEO_PIPELINE
proc create_hier_cell_VIDEO_PIPELINE { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_VIDEO_PIPELINE() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 ctrl
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:vid_io_rtl:1.0 vid_io_out
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 video_in

  # Create pins
  create_bd_pin -dir I -type clk CLK_148MHZ
  create_bd_pin -dir I -type clk CLK_150MHZ
  create_bd_pin -dir I -type rst s_axi_aresetn

  # Create instance: GND, and set properties
  set GND [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 GND ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
 ] $GND

  # Create instance: TIMMING_CONTROLELR, and set properties
  set TIMMING_CONTROLELR [ create_bd_cell -type ip -vlnv xilinx.com:ip:v_tc:6.1 TIMMING_CONTROLELR ]
  set_property -dict [ list \
CONFIG.GEN_F0_VBLANK_HEND {1920} \
CONFIG.GEN_F0_VBLANK_HSTART {1920} \
CONFIG.GEN_F0_VFRAME_SIZE {1125} \
CONFIG.GEN_F0_VSYNC_HEND {1920} \
CONFIG.GEN_F0_VSYNC_HSTART {1920} \
CONFIG.GEN_F0_VSYNC_VEND {1088} \
CONFIG.GEN_F0_VSYNC_VSTART {1083} \
CONFIG.GEN_F1_VBLANK_HEND {1920} \
CONFIG.GEN_F1_VBLANK_HSTART {1920} \
CONFIG.GEN_F1_VFRAME_SIZE {1125} \
CONFIG.GEN_F1_VSYNC_HEND {1920} \
CONFIG.GEN_F1_VSYNC_HSTART {1920} \
CONFIG.GEN_F1_VSYNC_VEND {1088} \
CONFIG.GEN_F1_VSYNC_VSTART {1083} \
CONFIG.GEN_HACTIVE_SIZE {1920} \
CONFIG.GEN_HFRAME_SIZE {2200} \
CONFIG.GEN_HSYNC_END {2052} \
CONFIG.GEN_HSYNC_START {2008} \
CONFIG.GEN_VACTIVE_SIZE {1080} \
CONFIG.HAS_INTC_IF {false} \
CONFIG.INTERLACE_EN {false} \
CONFIG.VIDEO_MODE {1080p} \
CONFIG.enable_detection {false} \
CONFIG.enable_generation {true} \
 ] $TIMMING_CONTROLELR

  # Create instance: VCC, and set properties
  set VCC [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 VCC ]
  set_property -dict [ list \
CONFIG.CONST_VAL {1} \
 ] $VCC

  # Create instance: VIDEO_OUT, and set properties
  set VIDEO_OUT [ create_bd_cell -type ip -vlnv xilinx.com:ip:v_axi4s_vid_out:4.0 VIDEO_OUT ]
  set_property -dict [ list \
CONFIG.C_HAS_ASYNC_CLK {1} \
CONFIG.C_S_AXIS_VIDEO_DATA_WIDTH {8} \
CONFIG.C_S_AXIS_VIDEO_FORMAT {0} \
CONFIG.C_VTG_MASTER_SLAVE {1} \
 ] $VIDEO_OUT

  # Create interface connections
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins vid_io_out] [get_bd_intf_pins VIDEO_OUT/vid_io_out]
  connect_bd_intf_net -intf_net TIMMING_CONTROLELR_vtiming_out [get_bd_intf_pins TIMMING_CONTROLELR/vtiming_out] [get_bd_intf_pins VIDEO_OUT/vtiming_in]
  connect_bd_intf_net -intf_net ctrl_1 [get_bd_intf_pins ctrl] [get_bd_intf_pins TIMMING_CONTROLELR/ctrl]
  connect_bd_intf_net -intf_net video_in_1 [get_bd_intf_pins video_in] [get_bd_intf_pins VIDEO_OUT/video_in]

  # Create port connections
  connect_bd_net -net GND_dout [get_bd_pins GND/dout] [get_bd_pins VIDEO_OUT/vid_io_out_reset]
  connect_bd_net -net VCC_dout [get_bd_pins TIMMING_CONTROLELR/clken] [get_bd_pins TIMMING_CONTROLELR/resetn] [get_bd_pins TIMMING_CONTROLELR/s_axi_aclken] [get_bd_pins VCC/dout] [get_bd_pins VIDEO_OUT/aclken] [get_bd_pins VIDEO_OUT/aresetn] [get_bd_pins VIDEO_OUT/vid_io_out_ce]
  connect_bd_net -net VIDEO_OUT_vtg_ce [get_bd_pins TIMMING_CONTROLELR/gen_clken] [get_bd_pins VIDEO_OUT/vtg_ce]
  connect_bd_net -net aclk_1 [get_bd_pins CLK_150MHZ] [get_bd_pins TIMMING_CONTROLELR/s_axi_aclk] [get_bd_pins VIDEO_OUT/aclk]
  connect_bd_net -net s_axi_aresetn_1 [get_bd_pins s_axi_aresetn] [get_bd_pins TIMMING_CONTROLELR/s_axi_aresetn]
  connect_bd_net -net vid_io_out_clk_1 [get_bd_pins CLK_148MHZ] [get_bd_pins TIMMING_CONTROLELR/clk] [get_bd_pins VIDEO_OUT/vid_io_out_clk]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: SYSTEM_RESETS
proc create_hier_cell_SYSTEM_RESETS { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_SYSTEM_RESETS() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk CLK_150MHZ
  create_bd_pin -dir I -type clk CLK_75MHZ
  create_bd_pin -dir O -from 0 -to 0 -type rst aresetn150Mhz
  create_bd_pin -dir O -from 0 -to 0 -type rst aresetn75Mhz
  create_bd_pin -dir O -from 0 -to 0 -type rst iaresetn150Mhz
  create_bd_pin -dir I -type rst master_aresetn

  # Create instance: rst_PS7_150M, and set properties
  set rst_PS7_150M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_PS7_150M ]

  # Create instance: rst_PS7_75M, and set properties
  set rst_PS7_75M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_PS7_75M ]

  # Create port connections
  connect_bd_net -net PS7_FCLK_CLK2 [get_bd_pins CLK_75MHZ] [get_bd_pins rst_PS7_75M/slowest_sync_clk]
  connect_bd_net -net PS_VIDEO_FCLK_RESET0_N [get_bd_pins master_aresetn] [get_bd_pins rst_PS7_150M/ext_reset_in] [get_bd_pins rst_PS7_75M/ext_reset_in]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins CLK_150MHZ] [get_bd_pins rst_PS7_150M/slowest_sync_clk]
  connect_bd_net -net rst_PS7_150M_interconnect_aresetn [get_bd_pins iaresetn150Mhz] [get_bd_pins rst_PS7_150M/interconnect_aresetn]
  connect_bd_net -net rst_PS7_150M_peripheral_aresetn [get_bd_pins aresetn150Mhz] [get_bd_pins rst_PS7_150M/peripheral_aresetn]
  connect_bd_net -net rst_PS7_75M_peripheral_aresetn [get_bd_pins aresetn75Mhz] [get_bd_pins rst_PS7_75M/peripheral_aresetn]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: PS_VIDEO
proc create_hier_cell_PS_VIDEO { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_PS_VIDEO() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR
  create_bd_intf_pin -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M00_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M01_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M02_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M06_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M07_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS

  # Create pins
  create_bd_pin -dir O -type clk CLK_100MHZ
  create_bd_pin -dir O -type clk CLK_150MHZ
  create_bd_pin -dir O -type clk CLK_75MHZ
  create_bd_pin -dir I -type rst aresetn150Mhz
  create_bd_pin -dir I -type rst aresetn75Mhz
  create_bd_pin -dir I -type rst iaresetn150Mhz
  create_bd_pin -dir I -from 11 -to 0 idata
  create_bd_pin -dir I ifval
  create_bd_pin -dir I ilval
  create_bd_pin -dir O -type rst master_aresetn
  create_bd_pin -dir I pixclk

  # Create instance: D5M
  create_hier_cell_D5M $hier_obj D5M

  # Create instance: PS
  create_hier_cell_PS $hier_obj PS

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins M06_AXI] [get_bd_intf_pins PS/M06_AXI]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins M07_AXI] [get_bd_intf_pins PS/M07_AXI]
  connect_bd_intf_net -intf_net PS7_axi_periph_M00_AXI [get_bd_intf_pins M00_AXI] [get_bd_intf_pins PS/M05_AXI]
  connect_bd_intf_net -intf_net PS7_axi_periph_M01_AXI [get_bd_intf_pins M01_AXI] [get_bd_intf_pins PS/M02_AXI]
  connect_bd_intf_net -intf_net PS7_axi_periph_M02_AXI [get_bd_intf_pins M02_AXI] [get_bd_intf_pins PS/M03_AXI]
  connect_bd_intf_net -intf_net PS_M04_AXI [get_bd_intf_pins D5M/config_axis] [get_bd_intf_pins PS/M04_AXI]
  connect_bd_intf_net -intf_net PS_VIDEO_DDR [get_bd_intf_pins DDR] [get_bd_intf_pins PS/DDR]
  connect_bd_intf_net -intf_net PS_VIDEO_FIXED_IO [get_bd_intf_pins FIXED_IO] [get_bd_intf_pins PS/FIXED_IO]
  connect_bd_intf_net -intf_net PS_VIDEO_M_AXIS [get_bd_intf_pins M_AXIS] [get_bd_intf_pins PS/M_AXIS]
  connect_bd_intf_net -intf_net v_ccm_0_video_out [get_bd_intf_pins D5M/video_out] [get_bd_intf_pins PS/S_AXIS_S2MM]

  # Create port connections
  connect_bd_net -net PS7_FCLK_CLK2 [get_bd_pins CLK_75MHZ] [get_bd_pins PS/CLK_75MHZ]
  connect_bd_net -net PS_VIDEO_FCLK_CLK1 [get_bd_pins CLK_100MHZ] [get_bd_pins PS/CLK_100MHZ]
  connect_bd_net -net PS_VIDEO_FCLK_RESET0_N [get_bd_pins master_aresetn] [get_bd_pins PS/master_aresetn]
  connect_bd_net -net SYSTEM_RESETS_interconnect_aresetn [get_bd_pins iaresetn150Mhz] [get_bd_pins PS/iaresetn150Mhz]
  connect_bd_net -net aresetn75Mhz_1 [get_bd_pins aresetn75Mhz] [get_bd_pins PS/aresetn75Mhz]
  connect_bd_net -net idata_1 [get_bd_pins idata] [get_bd_pins D5M/idata]
  connect_bd_net -net ifval_1 [get_bd_pins ifval] [get_bd_pins D5M/ifval]
  connect_bd_net -net ilval_1 [get_bd_pins ilval] [get_bd_pins D5M/ilval]
  connect_bd_net -net pixclk_1 [get_bd_pins pixclk] [get_bd_pins D5M/pixclk]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins CLK_150MHZ] [get_bd_pins D5M/CLK_150MHZ] [get_bd_pins PS/CLK_150MHZ]
  connect_bd_net -net rst_PS7_150M_peripheral_aresetn [get_bd_pins aresetn150Mhz] [get_bd_pins D5M/aresetn150Mhz] [get_bd_pins PS/aresetn150Mhz]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: HDMI_OUTPUT
proc create_hier_cell_HDMI_OUTPUT { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_HDMI_OUTPUT() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 HDMI_IIC
  create_bd_intf_pin -mode Master -vlnv avnet.com:interface:avnet_hdmi_rtl:1.0 IO_HDMIO
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:vid_io_rtl:1.0 VID_IO_IN

  # Create pins
  create_bd_pin -dir I CLK_148MHZ
  create_bd_pin -dir I -type clk CLK_75MHZ
  create_bd_pin -dir I -type rst s_axi_aresetn

  # Create instance: GND, and set properties
  set GND [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 GND ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
 ] $GND

  # Create instance: HDMI, and set properties
  set HDMI [ create_bd_cell -type ip -vlnv ProjectTollgate:ProjectTollgate:fmc_imageon_hdmi_out:2.0 HDMI ]
  set_property -dict [ list \
CONFIG.C_DEBUG_PORT {false} \
 ] $HDMI

  # Create instance: HDMI_IIC, and set properties
  set HDMI_IIC [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_iic:2.0 HDMI_IIC ]

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins IO_HDMIO] [get_bd_intf_pins HDMI/IO_HDMIO]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins HDMI_IIC] [get_bd_intf_pins HDMI_IIC/IIC]
  connect_bd_intf_net -intf_net S_AXI_1 [get_bd_intf_pins S_AXI] [get_bd_intf_pins HDMI_IIC/S_AXI]
  connect_bd_intf_net -intf_net VIDEO_PIPELINE_vid_io_out [get_bd_intf_pins VID_IO_IN] [get_bd_intf_pins HDMI/VID_IO_IN]

  # Create port connections
  connect_bd_net -net GND_dout [get_bd_pins GND/dout] [get_bd_pins HDMI/audio_spdif]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins CLK_148MHZ] [get_bd_pins HDMI/clk]
  connect_bd_net -net s_axi_aclk_1 [get_bd_pins CLK_75MHZ] [get_bd_pins HDMI_IIC/s_axi_aclk]
  connect_bd_net -net s_axi_aresetn_1 [get_bd_pins s_axi_aresetn] [get_bd_pins HDMI_IIC/s_axi_aresetn]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: D5M_OUTPUT
proc create_hier_cell_D5M_OUTPUT { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_D5M_OUTPUT() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 D5M_IIC
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI

  # Create pins
  create_bd_pin -dir I -type clk CLK_75MHZ
  create_bd_pin -dir O -from 0 -to 0 reseto
  create_bd_pin -dir I -type rst s_axi_aresetn
  create_bd_pin -dir O -from 0 -to 0 trigger

  # Create instance: D5M_IIC, and set properties
  set D5M_IIC [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_iic:2.0 D5M_IIC ]
  set_property -dict [ list \
CONFIG.IIC_FREQ_KHZ {400} \
 ] $D5M_IIC

  # Create instance: VCC, and set properties
  set VCC [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 VCC ]
  set_property -dict [ list \
CONFIG.CONST_VAL {1} \
 ] $VCC

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins S_AXI] [get_bd_intf_pins D5M_IIC/S_AXI]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins D5M_IIC] [get_bd_intf_pins D5M_IIC/IIC]

  # Create port connections
  connect_bd_net -net VCC_dout [get_bd_pins reseto] [get_bd_pins trigger] [get_bd_pins VCC/dout]
  connect_bd_net -net s_axi_aclk_1 [get_bd_pins CLK_75MHZ] [get_bd_pins D5M_IIC/s_axi_aclk]
  connect_bd_net -net s_axi_aresetn_1 [get_bd_pins s_axi_aresetn] [get_bd_pins D5M_IIC/s_axi_aresetn]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set DDR [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR ]
  set FIXED_IO [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO ]
  set d5m_iic [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 d5m_iic ]
  set hdmi_iic [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 hdmi_iic ]
  set io_hdmio [ create_bd_intf_port -mode Master -vlnv avnet.com:interface:avnet_hdmi_rtl:1.0 io_hdmio ]
  set leds_8bits [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 leds_8bits ]
  set sws_8bits [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 sws_8bits ]

  # Create ports
  set idata [ create_bd_port -dir I -from 11 -to 0 idata ]
  set ifval [ create_bd_port -dir I ifval ]
  set ilval [ create_bd_port -dir I ilval ]
  set o_xclkin [ create_bd_port -dir O o_xclkin ]
  set pixclk [ create_bd_port -dir I pixclk ]
  set reseto [ create_bd_port -dir O -from 0 -to 0 reseto ]
  set trigger [ create_bd_port -dir O -from 0 -to 0 trigger ]

  # Create instance: CLK_GEN_148MHZ, and set properties
  set CLK_GEN_148MHZ [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.4 CLK_GEN_148MHZ ]
  set_property -dict [ list \
CONFIG.CLKOUT1_JITTER {202.854} \
CONFIG.CLKOUT1_PHASE_ERROR {235.784} \
CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {148.500} \
CONFIG.CLKOUT2_JITTER {299.004} \
CONFIG.CLKOUT2_PHASE_ERROR {235.784} \
CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {24.000} \
CONFIG.CLKOUT2_USED {true} \
CONFIG.CLK_IN1_BOARD_INTERFACE {Custom} \
CONFIG.CLK_IN2_BOARD_INTERFACE {Custom} \
CONFIG.ENABLE_CLOCK_MONITOR {false} \
CONFIG.MMCM_CLKFBOUT_MULT_F {24.500} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {5.500} \
CONFIG.MMCM_CLKOUT1_DIVIDE {34} \
CONFIG.MMCM_DIVCLK_DIVIDE {3} \
CONFIG.NUM_OUT_CLKS {2} \
CONFIG.PRIMITIVE {MMCM} \
CONFIG.RESET_BOARD_INTERFACE {Custom} \
CONFIG.USE_LOCKED {false} \
CONFIG.USE_RESET {false} \
 ] $CLK_GEN_148MHZ

  # Create instance: D5M_OUTPUT
  create_hier_cell_D5M_OUTPUT [current_bd_instance .] D5M_OUTPUT

  # Create instance: DIP_SWITCHES_8BITS, and set properties
  set DIP_SWITCHES_8BITS [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 DIP_SWITCHES_8BITS ]
  set_property -dict [ list \
CONFIG.C_ALL_INPUTS {1} \
CONFIG.C_GPIO_WIDTH {8} \
CONFIG.GPIO_BOARD_INTERFACE {sws_8bits} \
CONFIG.USE_BOARD_FLOW {true} \
 ] $DIP_SWITCHES_8BITS

  # Create instance: HDMI_OUTPUT
  create_hier_cell_HDMI_OUTPUT [current_bd_instance .] HDMI_OUTPUT

  # Create instance: LEDS_8BITS, and set properties
  set LEDS_8BITS [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 LEDS_8BITS ]
  set_property -dict [ list \
CONFIG.GPIO_BOARD_INTERFACE {leds_8bits} \
CONFIG.USE_BOARD_FLOW {true} \
 ] $LEDS_8BITS

  # Create instance: PS_VIDEO
  create_hier_cell_PS_VIDEO [current_bd_instance .] PS_VIDEO

  # Create instance: SYSTEM_RESETS
  create_hier_cell_SYSTEM_RESETS [current_bd_instance .] SYSTEM_RESETS

  # Create instance: VIDEO_PIPELINE
  create_hier_cell_VIDEO_PIPELINE [current_bd_instance .] VIDEO_PIPELINE

  # Create interface connections
  connect_bd_intf_net -intf_net D5M_OUTPUT_IIC [get_bd_intf_ports d5m_iic] [get_bd_intf_pins D5M_OUTPUT/D5M_IIC]
  connect_bd_intf_net -intf_net DIP_SWITCHES_8BITS_GPIO [get_bd_intf_ports sws_8bits] [get_bd_intf_pins DIP_SWITCHES_8BITS/GPIO]
  connect_bd_intf_net -intf_net HDMI_OUTPUT_IIC [get_bd_intf_ports hdmi_iic] [get_bd_intf_pins HDMI_OUTPUT/HDMI_IIC]
  connect_bd_intf_net -intf_net HDMI_OUTPUT_IO_HDMIO [get_bd_intf_ports io_hdmio] [get_bd_intf_pins HDMI_OUTPUT/IO_HDMIO]
  connect_bd_intf_net -intf_net PS7_axi_periph_M00_AXI [get_bd_intf_pins PS_VIDEO/M00_AXI] [get_bd_intf_pins VIDEO_PIPELINE/ctrl]
  connect_bd_intf_net -intf_net PS7_axi_periph_M01_AXI [get_bd_intf_pins D5M_OUTPUT/S_AXI] [get_bd_intf_pins PS_VIDEO/M01_AXI]
  connect_bd_intf_net -intf_net PS7_axi_periph_M02_AXI [get_bd_intf_pins HDMI_OUTPUT/S_AXI] [get_bd_intf_pins PS_VIDEO/M02_AXI]
  connect_bd_intf_net -intf_net PS_VIDEO_DDR [get_bd_intf_ports DDR] [get_bd_intf_pins PS_VIDEO/DDR]
  connect_bd_intf_net -intf_net PS_VIDEO_FIXED_IO [get_bd_intf_ports FIXED_IO] [get_bd_intf_pins PS_VIDEO/FIXED_IO]
  connect_bd_intf_net -intf_net PS_VIDEO_M06_AXI [get_bd_intf_pins DIP_SWITCHES_8BITS/S_AXI] [get_bd_intf_pins PS_VIDEO/M06_AXI]
  connect_bd_intf_net -intf_net PS_VIDEO_M07_AXI [get_bd_intf_pins LEDS_8BITS/S_AXI] [get_bd_intf_pins PS_VIDEO/M07_AXI]
  connect_bd_intf_net -intf_net PS_VIDEO_M_AXIS [get_bd_intf_pins PS_VIDEO/M_AXIS] [get_bd_intf_pins VIDEO_PIPELINE/video_in]
  connect_bd_intf_net -intf_net VIDEO_PIPELINE_vid_io_out [get_bd_intf_pins HDMI_OUTPUT/VID_IO_IN] [get_bd_intf_pins VIDEO_PIPELINE/vid_io_out]
  connect_bd_intf_net -intf_net axi_gpio_0_GPIO [get_bd_intf_ports leds_8bits] [get_bd_intf_pins LEDS_8BITS/GPIO]

  # Create port connections
  connect_bd_net -net CLK_GEN_148MHZ_clk_out2 [get_bd_ports o_xclkin] [get_bd_pins CLK_GEN_148MHZ/clk_out2]
  connect_bd_net -net D5M_OUTPUT_reseto [get_bd_ports reseto] [get_bd_pins D5M_OUTPUT/reseto]
  connect_bd_net -net D5M_OUTPUT_trigger [get_bd_ports trigger] [get_bd_pins D5M_OUTPUT/trigger]
  connect_bd_net -net PS7_FCLK_CLK2 [get_bd_pins D5M_OUTPUT/CLK_75MHZ] [get_bd_pins HDMI_OUTPUT/CLK_75MHZ] [get_bd_pins PS_VIDEO/CLK_75MHZ] [get_bd_pins SYSTEM_RESETS/CLK_75MHZ]
  connect_bd_net -net PS_VIDEO_FCLK_CLK1 [get_bd_pins CLK_GEN_148MHZ/clk_in1] [get_bd_pins PS_VIDEO/CLK_100MHZ]
  connect_bd_net -net PS_VIDEO_FCLK_RESET0_N [get_bd_pins PS_VIDEO/master_aresetn] [get_bd_pins SYSTEM_RESETS/master_aresetn]
  connect_bd_net -net SYSTEM_RESETS_interconnect_aresetn [get_bd_pins PS_VIDEO/iaresetn150Mhz] [get_bd_pins SYSTEM_RESETS/iaresetn150Mhz]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins CLK_GEN_148MHZ/clk_out1] [get_bd_pins HDMI_OUTPUT/CLK_148MHZ] [get_bd_pins VIDEO_PIPELINE/CLK_148MHZ]
  connect_bd_net -net idata_1 [get_bd_ports idata] [get_bd_pins PS_VIDEO/idata]
  connect_bd_net -net ifval_1 [get_bd_ports ifval] [get_bd_pins PS_VIDEO/ifval]
  connect_bd_net -net ilval_1 [get_bd_ports ilval] [get_bd_pins PS_VIDEO/ilval]
  connect_bd_net -net pixclk_1 [get_bd_ports pixclk] [get_bd_pins PS_VIDEO/pixclk]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins DIP_SWITCHES_8BITS/s_axi_aclk] [get_bd_pins LEDS_8BITS/s_axi_aclk] [get_bd_pins PS_VIDEO/CLK_150MHZ] [get_bd_pins SYSTEM_RESETS/CLK_150MHZ] [get_bd_pins VIDEO_PIPELINE/CLK_150MHZ]
  connect_bd_net -net rst_PS7_150M_peripheral_aresetn [get_bd_pins DIP_SWITCHES_8BITS/s_axi_aresetn] [get_bd_pins LEDS_8BITS/s_axi_aresetn] [get_bd_pins PS_VIDEO/aresetn150Mhz] [get_bd_pins SYSTEM_RESETS/aresetn150Mhz] [get_bd_pins VIDEO_PIPELINE/s_axi_aresetn]
  connect_bd_net -net rst_PS7_75M_peripheral_aresetn [get_bd_pins D5M_OUTPUT/s_axi_aresetn] [get_bd_pins HDMI_OUTPUT/s_axi_aresetn] [get_bd_pins PS_VIDEO/aresetn75Mhz] [get_bd_pins SYSTEM_RESETS/aresetn75Mhz]

  # Create address segments
  create_bd_addr_seg -range 0x00010000 -offset 0x41600000 [get_bd_addr_spaces PS_VIDEO/PS/TO_PS/PS7/Data] [get_bd_addr_segs D5M_OUTPUT/D5M_IIC/S_AXI/Reg] SEG_D5M_IIC_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x41210000 [get_bd_addr_spaces PS_VIDEO/PS/TO_PS/PS7/Data] [get_bd_addr_segs DIP_SWITCHES_8BITS/S_AXI/Reg] SEG_DIP_SWITCHES_8BITS_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x41610000 [get_bd_addr_spaces PS_VIDEO/PS/TO_PS/PS7/Data] [get_bd_addr_segs HDMI_OUTPUT/HDMI_IIC/S_AXI/Reg] SEG_HDMI_IIC_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x43C20000 [get_bd_addr_spaces PS_VIDEO/PS/TO_PS/PS7/Data] [get_bd_addr_segs PS_VIDEO/PS/TO_PS/Sine_0/ctrl_saxi/ctrl_saxi_reg] SEG_Sine_0_ctrl_saxi_reg
  create_bd_addr_seg -range 0x00010000 -offset 0x43C00000 [get_bd_addr_spaces PS_VIDEO/PS/TO_PS/PS7/Data] [get_bd_addr_segs VIDEO_PIPELINE/TIMMING_CONTROLELR/ctrl/Reg] SEG_TIMMING_CONTROLELR_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x43000000 [get_bd_addr_spaces PS_VIDEO/PS/TO_PS/PS7/Data] [get_bd_addr_segs PS_VIDEO/PS/V_DMA/VDMA1/S_AXI_LITE/Reg] SEG_VDMA1_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x43C10000 [get_bd_addr_spaces PS_VIDEO/PS/TO_PS/PS7/Data] [get_bd_addr_segs PS_VIDEO/D5M/VFP/vfpConfig/vfpConfig_reg] SEG_VFP_vfpConfig_reg
  create_bd_addr_seg -range 0x00010000 -offset 0x41200000 [get_bd_addr_spaces PS_VIDEO/PS/TO_PS/PS7/Data] [get_bd_addr_segs LEDS_8BITS/S_AXI/Reg] SEG_axi_gpio_0_Reg
  create_bd_addr_seg -range 0x20000000 -offset 0x00000000 [get_bd_addr_spaces PS_VIDEO/PS/V_DMA/VDMA1/Data_MM2S] [get_bd_addr_segs PS_VIDEO/PS/TO_PS/PS7/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_PS7_HP0_DDR_LOWOCM
  create_bd_addr_seg -range 0x20000000 -offset 0x00000000 [get_bd_addr_spaces PS_VIDEO/PS/V_DMA/VDMA1/Data_S2MM] [get_bd_addr_segs PS_VIDEO/PS/TO_PS/PS7/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_PS7_HP0_DDR_LOWOCM


  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""



