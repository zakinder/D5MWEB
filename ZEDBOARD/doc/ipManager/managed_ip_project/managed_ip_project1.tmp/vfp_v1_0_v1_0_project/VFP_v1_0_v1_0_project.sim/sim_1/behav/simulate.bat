@echo off
set xv_path=C:\\Xilinx\\SDx\\2017.2\\Vivado\\bin
call %xv_path%/xsim videoProcess_tb_behav -key {Behavioral:sim_1:Functional:videoProcess_tb} -tclbatch videoProcess_tb.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
