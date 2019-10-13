onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/AxisExternalInst/mAxisInst/i_data_width
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/AxisExternalInst/mAxisInst/b_data_width
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/AxisExternalInst/mAxisInst/s_data_width
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/AxisExternalInst/mAxisInst/m_axis_mm2s_aclk
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/AxisExternalInst/mAxisInst/m_axis_mm2s_aresetn
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/AxisExternalInst/mAxisInst/aBusSelect
add wave -noupdate -expand -subitemconfig {/top/vfp_dut/dutVFP_v1Inst/AxisExternalInst/mAxisInst/iStreamData.eof {-color Red} /top/vfp_dut/dutVFP_v1Inst/AxisExternalInst/mAxisInst/iStreamData.ycbcr -expand} /top/vfp_dut/dutVFP_v1Inst/AxisExternalInst/mAxisInst/iStreamData
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/AxisExternalInst/mAxisInst/rx_axis_tready_o
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/AxisExternalInst/mAxisInst/rx_axis_tvalid
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/AxisExternalInst/mAxisInst/rx_axis_tuser
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/AxisExternalInst/mAxisInst/rx_axis_tlast
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/AxisExternalInst/mAxisInst/rx_axis_tdata
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/AxisExternalInst/mAxisInst/rgb_m_axis_tvalid
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/AxisExternalInst/mAxisInst/rgb_m_axis_tlast
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/AxisExternalInst/mAxisInst/rgb_m_axis_tuser
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/AxisExternalInst/mAxisInst/rgb_m_axis_tready
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/AxisExternalInst/mAxisInst/rgb_m_axis_tdata
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/AxisExternalInst/mAxisInst/rgb_s_axis_tready
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/AxisExternalInst/mAxisInst/rgb_s_axis_tvalid
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/AxisExternalInst/mAxisInst/rgb_s_axis_tuser
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/AxisExternalInst/mAxisInst/rgb_s_axis_tlast
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/AxisExternalInst/mAxisInst/rgb_s_axis_tdata
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/AxisExternalInst/mAxisInst/configReg4R
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/AxisExternalInst/mAxisInst/mpeg42XCR
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/AxisExternalInst/mAxisInst/mpeg42XBR
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/AxisExternalInst/mAxisInst/mpeg42XXX
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/AxisExternalInst/mAxisInst/tx_axis_tvalid
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/AxisExternalInst/mAxisInst/tx_axis_tlast
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/AxisExternalInst/mAxisInst/tx_axis_tuser
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/AxisExternalInst/mAxisInst/tx_axis_tready
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/AxisExternalInst/mAxisInst/pEofs1
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/AxisExternalInst/mAxisInst/tx_axis_tdata
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/AxisExternalInst/mAxisInst/axis_sof
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/AxisExternalInst/mAxisInst/VIDEO_STATES
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {81001 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {80800 ns} {81208 ns}
