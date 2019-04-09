@echo off
REM BATCH MODE PROJECT
REM SET VARIABLE
REM PROJECT NAME

set VPROJECTFOLDER=zynq_soc
setlocal enableextensions disabledelayedexpansion
REM SET THE NAME KEY WORD : worldcup
set "VAR_SEARCH=worldcup"
set "VAR_UPDATE_VALUE=%VPROJECTFOLDER%"
REM 2ND REPLACEMENT
set "SECONDSEARCH=NULL_SEARCH"
set "SET_SECOND_SEARCH=%SET_SECOND_SEARCH_VALUE%"
REM MASTER TCL SOURCE
set "THE_M_FILE=scripts/master_script_settings.tcl"
REM PROJECT TCL SOURCE
set "UPDATE_THE_FILE=scripts/script_settings.tcl"
(for /f "delims=" %%i in (%THE_M_FILE%) do (
    set "line=%%i"
    setlocal enabledelayedexpansion
    set "line=!line:%VAR_SEARCH%=%VAR_UPDATE_VALUE%!"
	set "line=!line:%SECONDSEARCH%=%SET_SECOND_SEARCH%!"
    echo(!line!
    endlocal
))>"%UPDATE_THE_FILE%"
REM VIVADO VERSION
set Version=2
setlocal enableextensions disabledelayedexpansion
REM SET THE NAME KEY WORD : umd
set "VAR_SEARCH=umd"
set "VAR_UPDATE_VALUE=%Version%"
REM SET THE NAME KEY WORD : atm
set "SECONDSEARCH=atm"
set "SECOND_SEARCH_ITEM=2017"
set "THE_M_FILE=M_SET.cmd"
set "UPDATE_THE_FILE=S_SET.cmd"
(for /f "delims=" %%i in (%THE_M_FILE%) do (
    set "line=%%i"
    setlocal enabledelayedexpansion
    set "line=!line:%VAR_SEARCH%=%VAR_UPDATE_VALUE%!"
	set "line=!line:%SECONDSEARCH%=%SECOND_SEARCH_ITEM%!"
    echo(!line!
    endlocal
))>"%UPDATE_THE_FILE%"
setlocal
REM PROJECT DIRECTORY
@set batchfile_name=%~n0
@set batchfile_drive=%~d0
@set batchfile_path=%~dp0
@%batchfile_drive%
@cd %batchfile_path%
@echo -- RUN DESIGN WITH: %batchfile_name%
@echo -- USE DESIGN PATH: %batchfile_path%
@call %mylocalpath%S_SET.cmd
@echo -- SET XILINX ENVIRONMENT VARIABLES
@set VIVADO_XSETTINGS=%XILDIR%\Vivado\%VIVADO_VERSION%\settings64.bat
@set SDK_XSETTINGS=%XILDIR%\SDK\%VIVADO_VERSION%\settings64.bat
@set LABTOOL_XSETTINGS=%XILDIR%\Vivado_Lab\%VIVADO_VERSION%\settings64.bat
REM ENABLE SDSOC
@if not defined ENABLE_SDSOC (
@set ENABLE_SDSOC=0
)
@if %ENABLE_SDSOC%==1 (
@echo -- INFO: SDSOC SETTINGS OVERWRITE SDK SETTINGS
@set SDSOC_XSETTINGS=%XILDIR%\SDSoC\%VIVADO_VERSION%\settings64.bat
)
REM VIVADO AVAILABLE
@if not defined VIVADO_AVAILABLE (
  @set VIVADO_AVAILABLE=0
)
REM SDK AVAILABLE
@if not defined SDK_AVAILABLE (
  @set SDK_AVAILABLE=0
)
REM LABTOOL AVAILABLE
@if not defined LABTOOL_AVAILABLE (
  @set LABTOOL_AVAILABLE=0
)
REM SDSOC AVAILABLE
@if not defined SDSOC_AVAILABLE (
  @set SDSOC_AVAILABLE=0
)
REM XILINX VERSION PRINT
@echo -- USE XILINX VERSION: %VIVADO_VERSION% --
@if not defined VIVADO_XSETTINGS_ISDONE ( @echo -- INFO: CONFIGURE XILINX VIVADO SETTINGS
  @if not exist %VIVADO_XSETTINGS% ( @echo -- INFO: %VIVADO_XSETTINGS% not found --
  ) else (
    @call %VIVADO_XSETTINGS%
    @set VIVADO_AVAILABLE=1
  )
  @set VIVADO_XSETTINGS_ISDONE=1
)
REM SDK SETTINGS IS DONE
@if not defined SDK_XSETTINGS_ISDONE ( @echo -- INFO: CONFIGURE XILINX SDK SETTINGS
  @if not exist %SDK_XSETTINGS% ( @echo -- INFO: %SDK_XSETTINGS% not found
  ) else (
    @call %SDK_XSETTINGS%
    @set SDK_AVAILABLE=1
  )
  @set SDK_XSETTINGS_ISDONE=1
)
REM LABTOOL SETTINGS_IS DONE
@if not defined LABTOOL_XSETTINGS_ISDONE ( @echo -- INFO: CONFIGURE XILINX LABTOOLS SETTINGS
  @if not exist %LABTOOL_XSETTINGS% ( @echo -- INFO: %LABTOOL_XSETTINGS% not found
  ) else (
    @call %LABTOOL_XSETTINGS%
    @set LABTOOL_AVAILABLE=1
  )
  @set LABTOOL_XSETTINGS_ISDONE=1
)
REM SDSOC SETTINGS IS DONE
@if not defined SDSOC_XSETTINGS_ISDONE ( @echo -- INFO: CONFIGURE XILINX SDSOC SETTINGS
  @if not exist %SDSOC_XSETTINGS% ( @echo -- INFO: %SDSOC_XSETTINGS% not found
  ) else (
    @call %SDSOC_XSETTINGS%
    @set SDSOC_AVAILABLE=1
  )
  @set SDSOC_XSETTINGS_ISDONE=1
)
REM VIVADO AVAILABLE THEN RUN
@if %VIVADO_AVAILABLE%==1 (
  @goto  RUN
)
@goto  ERROR
REM RUN
:RUN
REM CHANGE TO LOG FOLDER ****** vlog_folder ******
@set vlog_folder=%batchfile_path%v_log
@echo %vlog_folder%
@if not exist %vlog_folder% ( @mkdir %vlog_folder% )   
@cd %vlog_folder%
REM START VIVADO SCRIPTS CALL ****** SCRIPT_MAIN.TCL ******
REM 	-MODE BATCH 
REM 	-NOTRACE 
REM 	-TCLARGS 
REM 		--RUN 2 
REM 		--CLEAN 2 
REM 		--BOARDPART %PARTNUMBER%
call vivado -source ../scripts/script_main.tcl  -mode batch -notrace -tclargs --run 2 --clean 2 --boardpart %PARTNUMBER%
REM CHANGE TO DESIGN FOLDER
@cd..
REM DESIGN FINISHED
@if not defined DO_NOT_CLOSE_SHELL (
  @set DO_NOT_CLOSE_SHELL=0
)
@if %DO_NOT_CLOSE_SHELL%==1 (
  PAUSE
)
GOTO EOF
REM ERROR
:ERROR
@echo -- ERROR OCCURS
PAUSE
:EOF
