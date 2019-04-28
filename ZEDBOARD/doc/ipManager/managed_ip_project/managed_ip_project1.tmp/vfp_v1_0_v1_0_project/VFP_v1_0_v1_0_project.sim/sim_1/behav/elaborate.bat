@echo off
set xv_path=C:\\Xilinx\\SDx\\2017.2\\Vivado\\bin
call %xv_path%/xelab  -wto 71e067e607104bc6b4635ea185038116 -m64 --debug typical --relax --mt 2 -L xbip_utils_v3_0_7 -L axi_utils_v2_0_3 -L xbip_pipe_v3_0_3 -L xbip_dsp48_wrapper_v3_0_4 -L xbip_dsp48_addsub_v3_0_3 -L xbip_bram18k_v3_0_3 -L mult_gen_v12_0_12 -L floating_point_v7_0_13 -L xbip_dsp48_mult_v3_0_3 -L xbip_dsp48_multadd_v3_0_3 -L div_gen_v5_1_11 -L xil_defaultlib -L floating_point_v7_1_4 -L secureip -L xpm --snapshot videoProcess_tb_behav xil_defaultlib.videoProcess_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
