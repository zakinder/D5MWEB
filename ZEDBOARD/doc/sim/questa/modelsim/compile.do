vlib work
vlib msim

vlib msim/xbip_utils_v3_0_7
vlib msim/axi_utils_v2_0_3
vlib msim/xbip_pipe_v3_0_3
vlib msim/xbip_dsp48_wrapper_v3_0_4
vlib msim/xbip_dsp48_addsub_v3_0_3
vlib msim/xbip_dsp48_multadd_v3_0_3
vlib msim/xbip_bram18k_v3_0_3
vlib msim/mult_gen_v12_0_12
vlib msim/floating_point_v7_1_4
vlib msim/xil_defaultlib

vmap xbip_utils_v3_0_7 msim/xbip_utils_v3_0_7
vmap axi_utils_v2_0_3 msim/axi_utils_v2_0_3
vmap xbip_pipe_v3_0_3 msim/xbip_pipe_v3_0_3
vmap xbip_dsp48_wrapper_v3_0_4 msim/xbip_dsp48_wrapper_v3_0_4
vmap xbip_dsp48_addsub_v3_0_3 msim/xbip_dsp48_addsub_v3_0_3
vmap xbip_dsp48_multadd_v3_0_3 msim/xbip_dsp48_multadd_v3_0_3
vmap xbip_bram18k_v3_0_3 msim/xbip_bram18k_v3_0_3
vmap mult_gen_v12_0_12 msim/mult_gen_v12_0_12
vmap floating_point_v7_1_4 msim/floating_point_v7_1_4
vmap xil_defaultlib msim/xil_defaultlib

vcom -work xbip_utils_v3_0_7 -64 -93 \
"srcs/ip/squareRoot/xbip_utils_v3_0_7/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_3 -64 -93 \
"srcs/ip/squareRoot/axi_utils_v2_0_3/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_3 -64 -93 \
"srcs/ip/squareRoot/xbip_pipe_v3_0_3/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_4 -64 -93 \
"srcs/ip/squareRoot/xbip_dsp48_wrapper_v3_0_4/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_3 -64 -93 \
"srcs/ip/squareRoot/xbip_dsp48_addsub_v3_0_3/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_multadd_v3_0_3 -64 -93 \
"srcs/ip/squareRoot/xbip_dsp48_multadd_v3_0_3/xbip_dsp48_multadd_v3_0_vh_rfs.vhd" \

vcom -work xbip_bram18k_v3_0_3 -64 -93 \
"srcs/ip/squareRoot/xbip_bram18k_v3_0_3/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_12 -64 -93 \
"srcs/ip/squareRoot/mult_gen_v12_0_12/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work floating_point_v7_1_4 -64 -93 \
"srcs/ip/squareRoot/floating_point_v7_1_4/floating_point_v7_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"srcs/ip/squareRoot/xil_defaultlib/squareRoot.vhd" \
"srcs/constantspackage.vhd" \
"srcs/fixed_float_types_c.vhd" \
"srcs/fixed_pkg_c.vhd" \
"srcs/float_pkg_c.vhd" \
"srcs/vpfRecords.vhd" \
"srcs/portspackage.vhd" \
"srcs/AxisExternal.vhd" \
"srcs/CameraRawData.vhd" \
"srcs/CameraRawToRgb.vhd" \
"srcs/ColorTrim.vhd" \
"srcs/Filters.vhd" \
"srcs/FontRom.vhd" \
"srcs/FrameMask.vhd" \
"srcs/Kernel.vhd" \
"srcs/KernelCore.vhd" \
"srcs/LumValue.vhd" \
"srcs/PixelOnDisplay.vhd" \
"srcs/tbPackage.vhd" \
"srcs/ReadCoeffFile.vhd" \
"srcs/SegmentColors.vhd" \
"srcs/SyncFrames.vhd" \
"srcs/TapsController.vhd" \
"srcs/TestPattern.vhd" \
"srcs/TextGen.vhd" \
"srcs/VideoStream.vhd" \
"srcs/dataTaps.vhd" \
"srcs/detect.vhd" \
"srcs/digiClk.vhd" \
"srcs/dutPortsPackage.vhd" \
"srcs/frameProcess.vhd" \
"srcs/frameTestPattern.vhd" \
"srcs/gridLockFifo.vhd" \
"srcs/hsl.vhd" \
"srcs/hsv.vhd" \
"srcs/imageRead.vhd" \
"srcs/imageWrite.vhd" \
"srcs/mWrRd.vhd" \
"srcs/pixelCord.vhd" \
"srcs/pointOfInterest.vhd" \
"srcs/raw2rgb.vhd" \
"srcs/squareRootTop.vhd" \
"srcs/tap_buffer.vhd" \
"srcs/vfpConfig.vhd" \
"srcs/vfpMSaxisRGB.vhd" \
"srcs/vfpMaxisMM2s.vhd" \
"srcs/vfpTop.vhd" \
"srcs/videoSelect.vhd" \
"srcs/videoProcess_tb.vhd" \

