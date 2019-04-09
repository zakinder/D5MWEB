setlocal
@echo Set design paths----
@set batchfile_name=%~n0
@set batchfile_drive=%~d0
@set batchfile_path=%~dp0
@%batchfile_drive%
@cd %batchfile_path%
@echo -- Run Design with: %batchfile_name%
@echo -- Use Design Path: %batchfile_path%
@echo ----Load basic design settings----
@call %mylocalpath%S_SET.cmd
@echo ----
@echo ----Set Xilinx environment variables----
@set VIVADO_XSETTINGS=%XILDIR%\Vivado\%VIVADO_VERSION%\settings64.bat
@set SDK_XSETTINGS=%XILDIR%\SDK\%VIVADO_VERSION%\settings64.bat
  REM @set LABTOOL_XSETTINGS=%XILDIR%\Vivado_Lab\%VIVADO_VERSION%\settings64.bat
  REM @if not defined ENABLE_SDSOC (
  REM   @set ENABLE_SDSOC=0
  REM )
  REM @if %ENABLE_SDSOC%==1 (
  REM   @echo --Info: SDSOC Settings are disabled for this cmd file --
  REM @set SDSOC_XSETTINGS=%XILDIR%\SDSoC\%VIVADO_VERSION%\settings64.bat
  REM )
@if not defined VIVADO_AVAILABLE (
  @set VIVADO_AVAILABLE=0
)
@if not defined SDK_AVAILABLE (
  @set SDK_AVAILABLE=0
)
@if not defined LABTOOL_AVAILABLE (
  @set LABTOOL_AVAILABLE=0
)
@if not defined SDSOC_AVAILABLE (
  @set SDSOC_AVAILABLE=0
)
@echo -- Use Xilinx Version: %VIVADO_VERSION% --
@if not defined VIVADO_XSETTINGS_ISDONE ( @echo --Info: Configure Xilinx Vivado Settings --
  @if not exist %VIVADO_XSETTINGS% ( @echo -- Info: %VIVADO_XSETTINGS% not found --
  ) else (
    @call %VIVADO_XSETTINGS%
    @set VIVADO_AVAILABLE=1
  )
  @set VIVADO_XSETTINGS_ISDONE=1
)
@if not defined SDK_XSETTINGS_ISDONE ( @echo --Info: Configure Xilinx SDK Settings --
  @if not exist %SDK_XSETTINGS% ( @echo -- Info: %SDK_XSETTINGS% not found --
  ) else (
    @call %SDK_XSETTINGS%
    @set SDK_AVAILABLE=1
  )
  @set SDK_XSETTINGS_ISDONE=1
)
@if not defined LABTOOL_XSETTINGS_ISDONE ( @echo --Info: Configure Xilinx LabTools Settings --
  @if not exist %LABTOOL_XSETTINGS% ( @echo -- Info: %LABTOOL_XSETTINGS% not found --
  ) else (
    @call %LABTOOL_XSETTINGS%
    @set LABTOOL_AVAILABLE=1
  )
  @set LABTOOL_XSETTINGS_ISDONE=1
)
@if not defined SDSOC_XSETTINGS_ISDONE ( @echo --Info: Configure Xilinx SDSoC Settings --
  @if not exist %SDSOC_XSETTINGS% ( @echo -- Info: %SDSOC_XSETTINGS% not found --
  ) else (
    @call %SDSOC_XSETTINGS%
    @set SDSOC_AVAILABLE=1
  )
  @set SDSOC_XSETTINGS_ISDONE=1
)
@echo ----
@set SCRIPTSHELL=0
@if %VIVADO_AVAILABLE%==1 (
  @set SCRIPTSHELL=1
)
@if %LABTOOL_AVAILABLE%==1 (
  @set SCRIPTSHELL=1
 )
@if "%SDK_AVAILABLE%;%SCRIPTSHELL%"=="1;1" (
  @goto  RUN
)
@echo -- Error: Need SDK and vivado or labtools to run. --
@goto  ERROR
:RUN
@echo ----Change to log folder----
@set vlog_folder=%batchfile_path%v_log
@echo %vlog_folder%
@if not exist %vlog_folder% ( @mkdir %vlog_folder% )   
@cd %vlog_folder%
@echo ----
@echo -Start VIVADO scripts ----
@if %VIVADO_AVAILABLE%==1 (
  call vivado -source ../scripts/script_main.tcl  -mode batch -notrace -tclargs --run_prebuild_sdk --boardpart %PARTNUMBER%
) else (
  call vivado_lab -source ../scripts/script_main.tcl  -mode batch -notrace -tclargs --run_prebuild_sdk --boardpart %PARTNUMBER% --labtools
)
@echo -scripts finished----
@echo ----
@echo ----Change to design folder----
@cd..
@echo Design finished----
@if not defined DO_NOT_CLOSE_SHELL (
  @set DO_NOT_CLOSE_SHELL=0
)
@if %DO_NOT_CLOSE_SHELL%==1 (
  PAUSE
)
GOTO EOF
:ERROR
@echo ---Error occurs----
@echo ----
PAUSE
:EOF
